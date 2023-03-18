from django.urls import reverse_lazy
from django.db import transaction, connection
from django.shortcuts import get_object_or_404, render
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from airportx.models import Airport, AirportEmployees, AirportStats
from django.views.generic import ListView

@transaction.atomic
def refresh_materialized():
    with connection.cursor() as cursor:
        cursor.execute("REFRESH MATERIALIZED VIEW airport_and_based_crew")

# Create your views here.
class AirportListView(ListView):
    model = Airport


class AirportEmployeesListView(ListView):
    model = AirportEmployees


class AirportCreateView(CreateView):
    model = Airport
    fields = ['icao_code', 'name']
    success_url = reverse_lazy('Airports')
    object_change = refresh_materialized()

class AirportUpdateView(UpdateView):
    model = Airport
    # form_class = AirportUpdateForm
    fields = ['name']
    success_url = reverse_lazy('Airports')
    object_change = refresh_materialized()

class AirportDeleteView(DeleteView):
    model = Airport
    success_url = reverse_lazy('Airports')
    object_change = refresh_materialized()

def AirportDetailView(request, pk):
    airport_info = "Number of Employees not available"
    airport_stats = {
        'average_delay': 0,
        'number_flights': 0,
        'number_bookings': 0,
    }
    try:
        airport_info = get_object_or_404(AirportEmployees, pk=pk)
        airport_stats = get_object_or_404(AirportStats, pk=pk)
        print(airport_stats)
    except Exception:
        pass
    return render(
        request, 
        'airportx/airportemployees_list.html', 
        {'airport_info': airport_info, 'airport_stats': airport_stats}
    )