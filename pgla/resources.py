from import_export import resources
from import_export.fields import Field
from .models import Link, ProvisionTime

class LinkResource(resources.ModelResource):

    class Meta:
        model = Link


class ProvisionTimeResource(resources.ModelResource):

    class Meta:
        model = ProvisionTime
        fields = ('state', 'site_name', 'pgla', 'nsr', 'cnr')