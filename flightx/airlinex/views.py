from django.views.generic import ListView
from django.views.generic.base import TemplateView
from .models import Aircraft, Assignment, Booking, Employee, Flight, Passenger

# Create your views here.

class StartpageView(TemplateView):
    template_name = "base.html"

class AircraftListView(ListView):
    model = Aircraft

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