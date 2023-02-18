from django.views.generic import ListView
from django.views.generic.base import TemplateView
from .models import Aircraft, Assignment, Booking, Employee, Flight, Passenger
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, DeleteView, UpdateView

# Create your views here.

class StartpageView(TemplateView):
    template_name = "base.html"

# Aircraft
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

# Assignment
class AssignmentListView(ListView):
    model = Assignment

class AssignmentCreateView(CreateView):
    model = Assignment
    fields = ['employee', 'flight']
    success_url = reverse_lazy('Assignments')

class AssignmentUpdateView(UpdateView):
    model = Assignment
    fields = ['employee', 'flight']
    success_url = reverse_lazy('Assignments')

class AssignmentDeleteView(DeleteView):
    model = Assignment
    success_url = reverse_lazy('Assignments')  

# Booking
class BookingListView(ListView):
    model = Booking

class BookingCreateView(CreateView):
    model = Booking
    fields = ['flight', 'passenger']
    success_url = reverse_lazy('Bookings')

class BookingUpdateView(UpdateView):
    model = Booking
    fields = ['flight', 'passenger']
    success_url = reverse_lazy('Bookings')

class BookingDeleteView(DeleteView):
    model = Booking
    success_url = reverse_lazy('Bookings')  

# Employee
class EmployeeListView(ListView):
    model = Employee

class EmployeeCreateView(CreateView):
    model = Employee
    fields = ['first_name', 'last_name', 'email', 'role']
    success_url = reverse_lazy('Employees')

class EmployeeUpdateView(UpdateView):
    model = Employee
    fields = ['first_name', 'last_name', 'email', 'role']
    success_url = reverse_lazy('Employees')

class EmployeeDeleteView(DeleteView):
    model = Employee
    success_url = reverse_lazy('Employees')  
    
# Flights
class FlightListView(ListView):
    model = Flight

class FlightsCreateView(CreateView):
    model = Flight
    fields = ['number', 'departure_airport', 'destination_airport', 'aircraft', 'departure_time', 'arrival_time', 'delay']
    success_url = reverse_lazy('Flights')

class FlightsUpdateView(UpdateView):
    model = Flight
    fields = ['number', 'departure_airport', 'destination_airport', 'aircraft', 'departure_time', 'arrival_time', 'delay']
    success_url = reverse_lazy('Flights')

class FlightsDeleteView(DeleteView):
    model = Flight
    success_url = reverse_lazy('Flights')  

# Passenger  
class PassengerListView(ListView):
    model = Passenger

class PassengerCreateView(CreateView):
    model = Passenger
    fields = ['first_name', 'last_name', 'status', 'notes']
    success_url = reverse_lazy('Passengers')

class PassengerUpdateView(UpdateView):
    model = Passenger
    fields = ['first_name', 'last_name', 'status', 'notes']
    success_url = reverse_lazy('Passengers')

class PassengerDeleteView(DeleteView):
    model = Passenger
    success_url = reverse_lazy('Passengers')  