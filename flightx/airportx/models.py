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
