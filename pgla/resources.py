from import_export import resources
from import_export.fields import Field
from .models import Link, ProvisionTime

class LinkResource(resources.ModelResource):

    class Meta:
        model = Link


class ProvisionTimeResource(resources.ModelResource):

    class Meta:
        model = ProvisionTime
        fields = ('site_name', 'pgla', 'nsr', 'state', 'movement__name', 'eorder_date', 'reception_ciap', 'eorder_days', 'local_order_date', 'local_order_days', 'billing_date', 'total', 'cnr', 'cycle_time')