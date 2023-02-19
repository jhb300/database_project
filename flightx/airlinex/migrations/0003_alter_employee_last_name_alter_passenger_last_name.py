# Generated by Django 4.1.6 on 2023-02-19 16:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('airlinex', '0002_rename_canceled_booking_cancelled_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='last_name',
            field=models.CharField(db_index=True, max_length=100, verbose_name='Last name'),
        ),
        migrations.AlterField(
            model_name='passenger',
            name='last_name',
            field=models.CharField(db_index=True, max_length=100, verbose_name='Last name'),
        ),
    ]
