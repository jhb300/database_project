from django.http import HttpResponse
from django.views import View
from django.views.generic import ListView
from django.views.generic.base import TemplateView
from .models import Aircraft, Assignment, Booking, Employee, Flight, Passenger
from airportx.models import Airport
import pandas as pd

# Create your views here.

class StartpageView(TemplateView):
    template_name = "base.html"

class AircraftListView(ListView):
    model = Aircraft

class AirportListView(ListView):
    model = Airport

class AirportSICheck(View):
    def get(self, request):
        # Data from: https://datahub.io/core/airport-codes#resource-airport-codes
        df = pd.read_csv("airlinex/airport_codes.csv", index_col=0, low_memory=False)
        drop_list = ["type", "elevation_ft", "continent", "iso_country", "iso_region", "municipality", "gps_code", "iata_code", "coordinates"]
        df.drop(drop_list, axis=1, inplace=True)
        df.reset_index(inplace=True, drop=True)
        print(df.head(), df.shape)
        
        Airport.objects.all().delete()

        # Add Number of Airports
        desired_airport_count = 5
        if desired_airport_count > Airport.objects.all().count():
            for i in range(desired_airport_count):
                name = df.iloc[i]["name"]
                code = str(df.iloc[i]["local_code"])[:4] # Not a ICAO code but sufficient for this purpose
                Airport(name=name, icao_code=code).save()


        explanation = Airport.objects.filter(name="Epps Airpark").explain(verbose=True, analyze=True)
        print(explanation)
        num_airports = Airport.objects.all().count()
        return HttpResponse(f'The explan for lookup out of {num_airports} airports: \n{explanation}')


class AssignmentListView(ListView):
    model = Assignment

class BookingListView(ListView):
    model = Booking

class EmployeeListView(ListView):
    model = Employee

class FlightListView(ListView):
    model = Flight

class PassengerListView(ListView):
    model = Passenger