import xlsxwriter
from openpyxl.styles import Border, Side, PatternFill, Font, GradientFill, Alignment, NamedStyle
from io import BytesIO
from django.http import StreamingHttpResponse
from wsgiref.util import FileWrapper

def duplicate_service(modeladmin, request, queryset):
    for link in queryset:
        link.pk = None
        link.save()
duplicate_service.short_description = "Duplicate selected services"

def export_to_excel(modeladmin, request, queryset):
    report_state = {
        'INSTALACION SUSPENDIDA': 'CUSTOMER HOLD',
        'ACCESO SOLICITADO (ACSO)': 'PROVISIONING W/FOC',
        'ACCESO LISTO (ACLI)': 'PROVISIONING W/FOC',
        'DESCONEXION SOLICITADA (DXSO)': 'PROVISIONING W/FOC',
        'DESCONEXION LISTA (DXLI)': 'PROVISIONING W/FOC',
        'PRUEBAS CON EL CLIENTE': 'COMPLETED',
        'ACTIVO SIN FACTURACION': 'COMPLETED',
    }

    if queryset:
        output = BytesIO()

        highlight = NamedStyle(name="highlight")
        highlight.font = Font(bold=True, size=20)
        bd = Side(style='thick', color="000000")
        highlight.border = Border(left=bd, top=bd, right=bd, bottom=bd)

        wb = xlsxwriter.Workbook(output)
        format1 = wb.add_format(
            {'text_wrap': True, 'bold': 1, 'border': 1, 'border_color': 'black', 'bg_color': 'blue',
             'font_color': 'white', 'align': 'center'})
        format2 = wb.add_format({'text_wrap': True, 'border': 1, 'border_color': 'black'})
        ws = wb.add_worksheet("Report")

        ws.write(0, 0, 'STATUS', format1)
        ws.write(0, 1, 'NAME', format1)
        ws.write(0, 2, 'PGLA', format1)
        ws.write(0, 3, 'NSR', format1)
        ws.write(0, 4, 'TYPE', format1)
        ws.write(0, 5, 'EORDER DAYS', format1)
        ws.write(0, 6, 'LOCAL ORDER DAYS', format1)
        ws.write(0, 7, 'TOTAL', format1)
        ws.write(0, 8, 'CNR', format1)
        ws.write(0, 9, 'CYCLE TIME', format1)
        for row, link in enumerate(queryset):
            ws.write(row+1, 0, report_state.get(link.state, 'None'), format2)
            ws.write(row + 1, 1, link.site_name, format2)
            ws.write(row + 1, 2, link.pgla, format2)
            ws.write(row + 1, 3, link.nsr, format2)
            ws.write(row + 1, 4, link.movement.name, format2)
            ws.write(row + 1, 5, link.eorder_days, format2)
            ws.write(row + 1, 6, link.local_order_days, format2)
            ws.write(row + 1, 7, link.total, format2)
            ws.write(row + 1, 8, link.cnr, format2)
            ws.write(row + 1, 9, link.cycle_time, format2)

        wb.close()

        output.seek(0)

        response = StreamingHttpResponse(FileWrapper(output), content_type="application/vnd.ms-excel")
        response['Content-Disposition'] = "attachment; filename=report.xlsx"

        return response

export_to_excel.short_description = "Export to excel"