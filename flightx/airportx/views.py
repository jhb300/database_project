from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from airportx.models import Airport, AirportEmployees
from django.views.generic import ListView

# Create your views here.
class AirportListView(ListView):
    model = Airport

class AirportEmployeesListView(ListView):
    model = AirportEmployees    

class AirportCreateView(CreateView):
    model = Airport
    fields = ['icao_code', 'name']
    success_url = reverse_lazy('Airports')

class AirportUpdateView(UpdateView):
    model = Airport
    fields = ['icao_code', 'name']
    success_url = reverse_lazy('Airports')

class AirportDeleteView(DeleteView):
    model = Airport
    success_url = reverse_lazy('Airports')