import os
from django.conf import settings

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

MEDIA_ROOT = getattr(settings, 'MEDIA_ROOT', os.path.join(BASE_DIR, 'media'))

CONFIG_PATH = os.path.join(settings.MEDIA_ROOT, 'configs')

