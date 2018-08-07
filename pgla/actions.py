
def duplicate_service(modeladmin, request, queryset):
    for link in queryset:
        link.pk = None
        link.save()
duplicate_service.short_description = "Duplicate selected services"