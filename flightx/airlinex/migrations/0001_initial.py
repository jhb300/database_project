# Generated by Django 4.1.6 on 2023-02-19 13:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('airportx', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='Aircraft',
            fields=[
                ('registration', models.CharField(max_length=10, primary_key=True, serialize=False, verbose_name='Unique aircraft registration')),
                ('type_series', models.CharField(choices=[('A388', 'A380-800'), ('A358', 'A350-800'), ('A359', 'A350-900'), ('A3501', 'A350-1000'), ('A3201', 'A320-100'), ('A3202', 'A320-200'), ('A320n', 'A320neo'), ('B772', 'B777-200'), ('B773', 'B777-300'), ('B788', 'B787-8'), ('B789', 'B787-9'), ('B744', 'B747-400'), ('B748', 'B747-8I'), ('B73710', 'B737-MAX10')], max_length=10, verbose_name='Aircraft type series')),
                ('passenger_capacity', models.IntegerField(verbose_name='Number of passenger seats')),
            ],
        ),
        migrations.CreateModel(
            name='Assignment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Employee',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=100, verbose_name='First name')),
                ('last_name', models.CharField(max_length=100, verbose_name='Last name')),
                ('email', models.EmailField(max_length=254, verbose_name='Employee mail')),
                ('role', models.CharField(choices=[('C', 'Captain'), ('FO', 'First Officer'), ('SO', 'Second Officer'), ('CC', 'Cabin Crew')], max_length=2, verbose_name='Employee role:')),
                ('based_in', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='based_in', to='airportx.airport')),
            ],
        ),
        migrations.CreateModel(
            name='Passenger',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=100, verbose_name='First name')),
                ('last_name', models.CharField(max_length=100, verbose_name='Last name')),
                ('status', models.CharField(choices=[('B', 'Bronze'), ('S', 'Silver'), ('G', 'Gold'), ('P', 'Platinum')], default='B', max_length=20, verbose_name='Customer status')),
                ('notes', models.TextField(blank=True, max_length=2000, verbose_name='Extra notes')),
            ],
        ),
        migrations.CreateModel(
            name='Flight',
            fields=[
                ('number', models.CharField(max_length=10, primary_key=True, serialize=False, verbose_name='Flight number')),
                ('departure_time', models.DateTimeField(verbose_name='Departure Date & Time')),
                ('arrival_time', models.DateTimeField(verbose_name='Arrival Date & Time')),
                ('delay', models.PositiveIntegerField(default=0, verbose_name='Delay in minutes')),
                ('canceled', models.BooleanField(default=False, verbose_name='Cancelation status')),
                ('aircraft', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='aircraft', to='airlinex.aircraft')),
                ('departure_airport', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='departure_airport', to='airportx.airport')),
                ('destination_airport', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='arrival_airport', to='airportx.airport')),
                ('employees', models.ManyToManyField(through='airlinex.Assignment', to='airlinex.employee')),
            ],
        ),
        migrations.CreateModel(
            name='Booking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time', models.DateTimeField(auto_now_add=True, verbose_name='Creation time of booking')),
                ('canceled', models.BooleanField(default=False, verbose_name='Cancelation status')),
                ('flight', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='airlinex.flight')),
                ('passenger', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='airlinex.passenger')),
            ],
        ),
        migrations.AddField(
            model_name='assignment',
            name='employee',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='airlinex.employee'),
        ),
        migrations.AddField(
            model_name='assignment',
            name='flight',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='airlinex.flight'),
        ),
        migrations.AddConstraint(
            model_name='booking',
            constraint=models.UniqueConstraint(fields=('flight', 'passenger'), name='flight_passenger_unique'),
        ),
    ]
