import json
from django.http import HttpResponse, StreamingHttpResponse
from wsgiref.util import FileWrapper
from .helper_functions import placeholderReplace, get_config_from
from .models import Link
from .serializers import LinkSerializer

# Create your views here.
def links(request):
    links = Link.objects.all()
    #if pm:
    #    links = links.filter(pm=pm)
    serializer = LinkSerializer(links, many=True)

    return HttpResponse(json.dumps(serializer.data), content_type="application/json")

def exec_command(request, pk, command):
    try:
        link = Link.objects.get(pk=pk)
    except Link.DoesNotExist:
        return HttpResponse('Link Does not exist')

    if not link.config:
        return HttpResponse('Download Link Config')

    output = get_config_from(link.country, link.config.hostname.name, command=" ".join(command.split("_")), l=False)

    return HttpResponse(output)