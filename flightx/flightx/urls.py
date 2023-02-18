"""flightx URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from airlinex.views import FlightListView, AircraftListView, AssignmentListView, BookingListView, PassengerListView, EmployeeListView, StartpageView
from airportx.views import AirportListView, AirportCreateView, AirportUpdateView, AirportDeleteView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', StartpageView.as_view(), name='Home'),
    path('startpage/', StartpageView.as_view(), name='Home'),
    path('aircrafts/', AircraftListView.as_view(), name='Aircrafts'),
    path('airports/', AirportListView.as_view(template_name='airportx/airport_list.html'), name='Airports'),
    path('airports/add', AirportCreateView.as_view(), name='AddAirports'),
    path('airports/<slug:pk>/', AirportUpdateView.as_view(), name='UpdateAirports'),
    path('airports/<slug:pk>/delete/', AirportDeleteView.as_view(), name='DeleteAirports'),
    path('assignments/', AssignmentListView.as_view(), name='Assignments'),
    path('bookings/', BookingListView.as_view(), name='Bookings'),
    path('employees/', EmployeeListView.as_view(), name='Employees'),
    path('flights/', FlightListView.as_view(), name='Flights'),
    path('passengers/', PassengerListView.as_view(), name='Passengers'),
]