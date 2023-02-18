from django.db import models
from django.urls import reverse
from django.forms import ModelForm

class Airport(models.Model):
    icao_code = models.CharField("Unique ICAO airport code", max_length=4, primary_key=True)
    name = models.CharField("Airport name", max_length=100)

    def get_absolute_url(self):
        return reverse('UpdateAirports', kwargs={'pk': self.pk})