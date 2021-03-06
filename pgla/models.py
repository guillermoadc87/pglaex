from datetime import timedelta
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.postgres.fields import ArrayField, HStoreField

from .helper_functions import totalTimeSpan, reactivar, suspender, subtract_days
from . slackAPI import create_channel_with, invite_user

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, blank=True, null=True)
    slack_id = models.CharField(max_length=120, blank=True, null=True)
    report = ArrayField(models.CharField(max_length=120), blank=True, null=True)
    company = models.CharField(max_length=120, blank=True, null=True)
    number = models.CharField(max_length=120, blank=True, null=True)
    position = models.CharField(max_length=120, blank=True, null=True)

@receiver(post_save, sender=User)
def create_or_update_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
    instance.profile.save()

class Client(models.Model):
    name = models.CharField(max_length=120)
    #nsr_id = models.CharField(max_length=120, blank=True, null=True)
    vrf = ArrayField(models.CharField(max_length=120), default=[])
    routes = HStoreField(blank=True, null=True)

    def add_vrf(self, vrf):
        if vrf and vrf not in self.vrf:
            self.vrf.append(vrf)
            self.save()

    def get_vrf(self):
        return '|'.join(self.vrf)

    def __str__(self):
        return self.name

    #@classmethod
    #def create(self, name, nsr_id=None):
    #    client, created = Client.objects.get_or_create(name=name, nsr_id=nsr_id)
    #    if not created:
    #        return client
    #    else:
    #        if client.nsr_id != nsr_id:
    #            client = Client.objects.create(name=name, nsr_id=nsr_id)
    #            return client

class Link(models.Model):
    states_alta = (
        ('INSTALACION SUSPENDIDA', 'INSTALACION SUSPENDIDA'),
        ('ACCESO SOLICITADO (ACSO)', 'ACCESO SOLICITADO (ACSO)'),
        ('ACCESO LISTO (ACLI)', 'ACCESO LISTO (ACLI)'),
        ('PRUEBAS CON EL CLIENTE', 'PRUEBAS CON EL CLIENTE'),
        ('ACTIVO SIN FACTURACION', 'ACTIVO SIN FACTURACION'),
    )

    states_baja = (
        ('INSTALACION SUSPENDIDA', 'INSTALACION SUSPENDIDA'),
        ('DESCONEXION SOLICITADA (DXSO)', 'DESCONEXION SOLICITADA (DXSO)'),
        ('DESCONEXION LISTA (DXLI)', 'DESCONEXION LISTA (DXLI)'),
        ('PRUEBAS CON EL CLIENTE', 'PRUEBAS CON EL CLIENTE'),
        ('ACTIVO SIN FACTURACION', 'ACTIVO SIN FACTURACION'),
    )

    interfaces = (
        ('Ethernet', 'Ethernet'),
        ('V.35', 'V.35'),
        ('G703', 'G703'),
    )

    circuit_id = models.CharField(max_length=120, editable=False, blank=True, null=True)
    channel_id = models.CharField(max_length=120, editable=False, blank=True, null=True)
    pgla = models.IntegerField('PGLA', blank=True, null=True)
    nsr = models.CharField('NSR', max_length=120, blank=True, null=True)
    site_name = models.CharField(max_length=200, blank=True, null=True)
    customer = models.ForeignKey('Client', on_delete=models.CASCADE)
    client_segment = models.CharField(max_length=120, blank=True,null=True)
    pm = models.CharField(max_length=120, blank=True, null=True)
    imp = models.CharField(max_length=120, blank=True, null=True)
    ise = models.CharField(max_length=120, blank=True, null=True)
    capl = models.CharField(max_length=120, blank=True, null=True)
    service = models.CharField(max_length=120, blank=True, null=True)
    movement = models.ForeignKey('Movement', on_delete=models.PROTECT, blank=True, null=True)
    country = models.ForeignKey('Country', on_delete=models.CASCADE)
    local_id = models.CharField('Local-ID', max_length=120, blank=True, null=True)
    interface = models.CharField(max_length=120, choices=interfaces, blank=True, null=True)
    profile = models.CharField(max_length=120, blank=True, null=True)
    speed = models.CharField(max_length=120, blank=True, null=True)
    state = models.CharField(max_length=120, blank=True, null=True)
    motive = models.CharField(max_length=120, null=True)
    eorder_date = models.DateField(blank=True, null=True)
    local_order_date = models.DateField(blank=True, null=True)
    duedate_acc = models.DateField(blank=True, null=True)
    entraga_ciap = models.DateField(blank=True, null=True)
    reception_ciap = models.DateField('PGLA Date', blank=True, null=True)
    loop_ready = models.DateField(blank=True, null=True)
    billing_date = models.DateField(blank=True, null=True)
    duedate_ciap = models.DateField(blank=True, null=True)
    activation_date = models.DateField(blank=True, null=True)
    cnr = models.IntegerField('CNR', blank=True, null=True)
    ddr = models.CharField(max_length=120, null=True)
    daf = models.CharField(max_length=120, null=True)
    duration = models.CharField(max_length=120, null=True)
    duration_contract = models.CharField(max_length=120, null=True)
    participants = models.ManyToManyField(User)
    address = models.CharField(max_length=200, blank=True, null=True)
    nrc = models.FloatField(blank=True, null=True)
    mrc = models.FloatField(blank=True, null=True)
    relatedLink = models.ForeignKey('Link', on_delete=models.CASCADE, blank=True, null=True)
    special_project = models.BooleanField(default=False)

    def __init__(self, *args, **kwargs):
        super(Link, self).__init__(*args, **kwargs)
        self.old_state = self.state
        if self.movement and self.movement.name == 'BAJA':
            self._meta.get_field('state').choices = self.states_baja
        else:
            self._meta.get_field('state').choices = self.states_alta

    @property
    def eorder_days(self):
        return subtract_days(self.reception_ciap, self.eorder_date)

    @property
    def local_order_days(self):
        return subtract_days(self.local_order_date, self.reception_ciap)

    @property
    def activation_days(self):
        return subtract_days(self.activation_date, self.billing_date)

    @property
    def total(self):
        return subtract_days(self.billing_date, self.reception_ciap)

    @property
    def total_with_activation_days(self):
        return subtract_days(self.activation_date, self.reception_ciap)

    @property
    def cycle_time(self):
        total = self.total

        if self.cnr:
            total -= self.cnr

        return total

    @property
    def adjusted_due_date(self):
        if self.cnr and self.duedate_ciap:
            return self.duedate_ciap + timedelta(days=self.cnr)
        return self.duedate_ciap

    @property
    def otp(self):
        if self.billing_date > self.adjusted_due_date:
            return True
        return False

    @property
    def channel_name(self):
        if self.pgla and self.nsr:
            if self.nsr.count('-') > 1:
                nsr = self.nsr[self.nsr.find('-') + 1:self.nsr.replace('-', 'x', 1).find('-')]
            else:
                nsr = self.nsr[:self.nsr.rfind('-')]

            return '%s-%s' % (self.pgla, nsr)

    @property
    def billing_date_as_string(self):
        if self.billing_date:
            return self.billing_date.strftime("%Y-%m-%d")
        return ""

    def duedate_ciap_as_string(self):
        if self.duedate_ciap:
            return self.duedate_ciap.strftime('%Y-%m-%d')
        return ""

    @property
    def reception_ciap_as_string(self):
        if self.reception_ciap:
            return self.reception_ciap.strftime('%Y-%m-%d')
        return ""

    def update_cnr(self):
        self.cnr = totalTimeSpan(str(self.pgla), self.nsr)
        self.save()

    def history(self, historyList=[]):

        if self.relatedLink:
            historyList.append(self.relatedLink)
            self.relatedLink.history(historyList)

        return historyList

    def invite_users_to_slack(self):
        [invite_user(user, self.channel_id) for user in self.participants.all()]

    def saveMod(self):
        try:
            links = Link.objects.filter(pgla=self.pgla, nsr=self.nsr)

            for link in links:
                if self.local_id:
                    link.local_id = self.local_id

                link.state = self.state
                link.billing_date = self.billing_date
                link.loop_ready = self.loop_ready
                link.save()
            return links[0], False
        except:
            relatedLinks = Link.objects.filter(pgla__lt=self.pgla, nsr=self.nsr).order_by('-pgla')
            if relatedLinks:
                self.relatedLink = relatedLinks[0]

            #self.channel_id = create_channel_with(self.channel_name)
            #self.invite_users_to_slack()

            print(self.nsr, self.pgla, self.mrc, self.nrc)
            self.save()
            return self, True

    def save(self, *args, **kwargs):
        if self.old_state == 'INSTALACION SUSPENDIDA' and self.state != 'INSTALACION SUSPENDIDA':
            #reactivar(self)
            print('reactivar')
        elif self.old_state != 'INSTALACION SUSPENDIDA' and self.state == 'INSTALACION SUSPENDIDA':
            #suspender(self)
            print('suspender')
        super(Link, self).save(*args, **kwargs)

    def __str__(self):
        return "PGLA: %d | NSR: %s" % (self.pgla, self.nsr)

class Movement(models.Model):
    name = models.CharField(max_length=120, blank=True, null=True)
    days = models.IntegerField('Delivery Days', default=0)

    def __str__(self):
        return self.name

class ProvisionTime(Link):

    class Meta:
        proxy = True
        verbose_name = 'Provisioning Time'
        verbose_name_plural = 'Provisioning Times'

def user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return '{0}/{1}/{2}'.format(instance.link.pgla, instance.link.nsr, filename)

class Photo(models.Model):
    link = models.ForeignKey('Link', on_delete=models.CASCADE, related_name='photos')
    image = models.FileField(upload_to=user_directory_path)


class Configuration(models.Model):
    link = models.OneToOneField('Link', on_delete=models.CASCADE, related_name='config')
    hostname = models.ForeignKey('Hostname', on_delete=models.SET_NULL, blank=True, null=True)
    mgnt_ip = models.GenericIPAddressField("MGNT IP", blank=True, null=True)
    pe_ip = models.GenericIPAddressField("PE IP", blank=True, null=True)
    ce_ip = models.GenericIPAddressField("CE IP", max_length=120, blank=True, null=True)
    mask = models.CharField(max_length=120, blank=True, null=True)
    rp = models.CharField("RP", max_length=120, blank=True, null=True)
    speed = models.FloatField(blank=True, null=True)
    interface = models.CharField(max_length=120, blank=True, null=True)
    profile = models.IntegerField(max_length=120, blank=True, null=True)
    encap = models.CharField("Encapsulation", max_length=120, blank=True, null=True)
    encapID = models.CharField("Encapsulation ID", max_length=120, blank=True, null=True)
    vrf = models.CharField("VRF", max_length=120, blank=True, null=True)
    client_as = models.CharField(max_length=120, blank=True, null=True)
    telmex_as = models.CharField(max_length=120, blank=True, null=True)
    managed = models.BooleanField(default=False)

    def update(self, dic):
        [setattr(self, key, value) for key, value in dic.items()]
        self.save()

    def __str__(self):
        return "PE: %s\nCE:%s\nMask:%s\nEncap:%s\nEncapID:%s" % (
            self.pe_ip, self.ce_ip, self.mask, self.encap, self.encapID)

class Country(models.Model):
    name = models.CharField(max_length=120)
    lg = models.ForeignKey('LookingGlass', on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Countries'

class Credentials(models.Model):
    lg = models.ForeignKey('LookingGlass', on_delete=models.CASCADE, related_name='credentials')
    username = models.CharField(max_length=120)
    password = models.CharField(max_length=120)

class LookingGlass(models.Model):
    protocols = (
        ('ssh', 'SSH'),
        ('telnet', 'TELNET'),
        ('url', 'URL'),
    )
    name = models.CharField(max_length=120)
    path = models.CharField(max_length=120, blank=True, null=True)
    username = models.CharField(max_length=120)
    password = models.CharField(max_length=120)
    protocol = models.CharField(max_length=120, choices=protocols)
    port = models.IntegerField(default=80)
    vrf = models.CharField('VRF', max_length=120, blank=True, null=True)
    source_interface = models.CharField('Source Interface', max_length=120, blank=True, null=True)
    lg = models.ForeignKey('LookingGlass', on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.name

class Note(models.Model):
    text = models.CharField(max_length=120)
    created = models.DateField(auto_now=True)
    link = models.ForeignKey('Link', on_delete=models.CASCADE)

    def __str__(self):
        return self.text

class Ticket(models.Model):
    number = models.CharField(max_length=120)
    opener = models.CharField(max_length=120)
    link = models.ForeignKey('Link', on_delete=models.CASCADE)

    def __str__(self):
        return self.text


class Hostname(models.Model):
    oSystems = (
        ('ios', 'IOS'),
        ('xr', 'IOS XR'),
        ('junos', 'Junos OS'),
    )
    name = models.CharField(max_length=120)
    mtime = models.DateField(blank=True, null=True)
    local_ids = ArrayField(models.CharField(max_length=120), blank=True, null=True)
    os = models.CharField(max_length=120, choices=oSystems)

    def __str__(self):
        return "%s (%s)" % (self.name, self.mtime)

class Report(models.Model):
    states = (
        ('INSTALACION SUSPENDIDA', 'INSTALACION SUSPENDIDA'),
        ('ACCESO SOLICITADO (ACSO)', 'ACCESO SOLICITADO (ACSO)'),
        ('ACCESO LISTO (ACLI)', 'ACCESO LISTO (ACLI)'),
        ('DESCONEXION SOLICITADA (DXSO)', 'DESCONEXION SOLICITADA (DXSO)'),
        ('DESCONEXION LISTA (DXLI)', 'DESCONEXION LISTA (DXLI)'),
        ('PRUEBAS CON EL CLIENTE', 'PRUEBAS CON EL CLIENTE'),
        ('ACTIVO SIN FACTURACION', 'ACTIVO SIN FACTURACION'),
    )

    user = models.ManyToManyField(User, related_name='reports')
    fields = ArrayField(models.CharField(max_length=120))
    from_date = models.DateField(blank=True, null=True)
    to_date = models.DateField(blank=True, null=True)
    schedule = models.TextField(max_length=1000)
