# Generated by Django 4.1.6 on 2023-02-04 18:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('airlinex', '0002_flight_aircraft'),
    ]

    operations = [
        migrations.AlterField(
            model_name='flight',
            name='aircraft',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='aircraft', to='airlinex.aircraft'),
        ),
    ]