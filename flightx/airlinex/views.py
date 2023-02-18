from django.views.generic import ListView
from django.views.generic.base import TemplateView
from .models import Aircraft, Assignment, Booking, Employee, Flight, Passenger
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, DeleteView, UpdateView

# Create your views here.

class StartpageView(TemplateView):
    template_name = "base.html"

class AircraftListView(ListView):
    model = Aircraft

class AircraftCreateView(CreateView):
    model = Aircraft
    fields = ['registration', 'type_series', 'passenger_capacity']
    success_url = reverse_lazy('Aircrafts')

class AircraftUpdateView(UpdateView):
    model = Aircraft
    fields = ['registration', 'type_series', 'passenger_capacity']
    success_url = reverse_lazy('Aircrafts')

class AircraftDeleteView(DeleteView):
    model = Aircraft
    success_url = reverse_lazy('Aircrafts')   

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