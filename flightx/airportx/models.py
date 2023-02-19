from django.db import models
from django.urls import reverse

class Airport(models.Model):
    icao_code = models.CharField("Unique ICAO airport code", max_length=4, primary_key=True)
    name = models.CharField("Airport name", max_length=100, db_index=True)

    def get_absolute_url(self):
        return reverse('UpdateAirports', kwargs={'pk': self.pk})

# Materialized View
class AirportEmployees(models.Model):
    icao_code = models.CharField("Unique ICAO airport code", max_length=4, primary_key=True)
    name = models.CharField("Airport name", max_length=100, db_index=True)
    num_employees = models.IntegerField("Number of Employees")

    class Meta:
        managed = False
        db_table = 'airport_and_based_crew'

    def __str__(self):
        return f"{self.name} Airport has {self.num_employees} Employees"
    
class AirportStats(models.Model):
    icao_code = models.CharField("Unique ICAO airport code", max_length=4, primary_key=True)
    average_delay = models.FloatField("Average Delay")
    number_flights = models.IntegerField("Number of Flights")
    number_bookings = models.IntegerField("Number of Passengers")

    class Meta:
        managed = False
        db_table = 'airport_stats'

    def __str__(self):
        return f"ICAO: {self.icao_code}, Delay: {self.average_delay}, Flights: {self.number_flights}, Bookings: {self.number_bookings}"


