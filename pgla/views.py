import json
import urllib
from django.http import HttpResponse
from .helper_functions import placeholderReplace, get_config_from
from .models import Link, LookingGlass, Country
from .serializers import LinkSerializer

# Create your views here.
def links(request):
    links = Link.objects.all()
    #if pm:
    #    links = links.filter(pm=pm)
    serializer = LinkSerializer(links, many=True)

    return HttpResponse(json.dumps(serializer.data), content_type="application/json")

def exec_command(request, pk, command, cpe=False):
    try:
        link = Link.objects.get(pk=pk)
    except Link.DoesNotExist:
        return HttpResponse('Link Does not exist')

    if not link.config:
        return HttpResponse('Download Link Config')

    if not cpe:
        output = get_config_from(link.country, link.config.hostname.name, command=urllib.parse.unquote_plus(command), l=False)
    else:
        country = Country.objects.get(name='CPE')
        output = get_config_from(country, link.config.ce_ip, command=urllib.parse.unquote_plus(command), l=False)

    return HttpResponse(output)