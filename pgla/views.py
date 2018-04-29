import os
import json
from io import StringIO
from django.http import HttpResponse, StreamingHttpResponse
from wsgiref.util import FileWrapper
from .helper_functions import placeholderReplace
from .models import Link
from .serializers import LinkSerializer

# Create your views here.
def links(request):
    links = Link.objects.all()
    #if pm:
    #    links = links.filter(pm=pm)
    serializer = LinkSerializer(links, many=True)

    return HttpResponse(json.dumps(serializer.data), content_type="application/json")

def connect_to_pe(request, hostname):
    replacements = {
        '[HOSTNAME]': hostname,
    }
    file_path = os.path.join('pgla', 'telmex_glass.py')
    file_content = placeholderReplace(file_path, replacements)
    file = StringIO(file_content)
    response = StreamingHttpResponse(FileWrapper(file), content_type="application/py")
    response['Content-Disposition'] = "attachment; filename=telmex_glass.py"

    return response