from django.shortcuts import render
from django.views.generic import ListView
from .models import Flight

# Create your views here.

class FlightListView(ListView):
    model = Flight