from import_export import resources
from import_export.fields import Field
from .models import Link

class LinkResource(resources.ModelResource):

    class Meta:
        model = Link