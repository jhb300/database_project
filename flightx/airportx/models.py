from django.db import models


class Airport(models.Model):
    icao_code = models.CharField("Unique ICAO airport code", max_length=4, primary_key=True)
    name = models.CharField("Airport name", max_length=100)

    def __str__(self) -> str:
        return f"{self.name} ({self.icao_code})"