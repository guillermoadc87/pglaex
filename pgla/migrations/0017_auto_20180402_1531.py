# Generated by Django 2.0.3 on 2018-04-02 19:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pgla', '0016_auto_20180402_1529'),
    ]

    operations = [
        migrations.AlterField(
            model_name='link',
            name='country',
            field=models.CharField(blank=True, max_length=120, null=True),
        ),
    ]
