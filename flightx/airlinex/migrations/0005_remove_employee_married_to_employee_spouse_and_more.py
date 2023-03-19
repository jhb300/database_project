# Generated by Django 4.1.6 on 2023-03-19 12:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('airportx', '0006_runway'),
        ('airlinex', '0004_employee_married_to'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='employee',
            name='married_to',
        ),
        migrations.AddField(
            model_name='employee',
            name='spouse',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='spouse_of', to='airlinex.employee'),
        ),
        migrations.AlterField(
            model_name='employee',
            name='based_in',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='airportx.airport'),
        ),
    ]
