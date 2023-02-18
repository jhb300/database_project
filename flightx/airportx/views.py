from airportx.models import Airport
from django.views.generic import ListView

# Create your views here.
class AirportListView(ListView):
    model = Airport