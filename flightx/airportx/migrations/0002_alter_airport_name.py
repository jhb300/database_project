# Generated by Django 4.1.6 on 2023-02-18 21:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('airportx', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='airport',
            name='name',
            field=models.CharField(db_index=True, max_length=100, verbose_name='Airport name'),
        ),
    ]