from import_export import resources
from import_export.fields import Field
from .models import Link

class LinkResource(resources.ModelResource):

    class Meta:
        model = Link

    def before_import(self, dataset, dry_run):
        print(dataset)
        super(LinkResource, self).__init__(dataset, dry_run)