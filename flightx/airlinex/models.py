from django.db import models
from django.urls import reverse

from airportx.models import Airport


class Aircraft(models.Model):
    TYPE_SERIES_CHOICES = [
        ("A388", "A380-800"),
        ("A358", "A350-800"),
        ("A359", "A350-900"),
        ("A3501", "A350-1000"),
        ("A3201", "A320-100"),
        ("A3202", "A320-200"),
        ("A320n", "A320neo"),
        ("B772", "B777-200"),
        ("B773", "B777-300"),
        ("B788", "B787-8"),
        ("B789", "B787-9"),
        ("B744", "B747-400"),
        ("B748", "B747-8I"),
        ("B73710", "B737-MAX10"),
    ]

    # TODO: Implement check whether Registration is like D-A___
    registration = models.CharField("Unique aircraft registration", max_length=10, primary_key=True)
    type_series = models.CharField("Aircraft type series", max_length=10, choices=TYPE_SERIES_CHOICES)
    passenger_capacity = models.IntegerField("Number of passenger seats")

    def __str__(self) -> str:
        return f"{self.get_type_series_display()} ({self.registration})"

    def get_absolute_url(self):
        return reverse('UpdateAircraft', kwargs={'pk': self.pk})


class Passenger(models.Model):
    CUSTOMER_STATUS_CHOICES = [
        ("B", "Bronze"),
        ("S", "Silver"),
        ("G", "Gold"),
        ("P", "Platinum"),
    ]

    first_name = models.CharField("First name", max_length=100)
    last_name = models.CharField("Last name", max_length=100)
    status = models.CharField("Customer status", max_length=20, choices=CUSTOMER_STATUS_CHOICES, default="B")
    notes = models.TextField("Extra notes", max_length=2000, blank=True)

    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"

    def get_absolute_url(self):
        return reverse('UpdatePassengers', kwargs={'pk': self.pk})


class Employee(models.Model):
    EMPLOYEE_ROLE_CHOICES = [
        ("C", "Captain"),
        ("FO", "First Officer"),
        ("SO", "Second Officer"),
        ("CC", "Cabin Crew"),
    ]

    first_name = models.CharField("First name", max_length=100)
    last_name = models.CharField("Last name", max_length=100)
    email = models.EmailField("Employee mail")
    role = models.CharField("Employee role:", max_length=2, choices=EMPLOYEE_ROLE_CHOICES)
    based_in = models.ForeignKey(Airport, on_delete=models.CASCADE, related_name="based_in")

    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"

    def get_absolute_url(self):
        return reverse('UpdateEmployees', kwargs={'pk': self.pk})


class Flight(models.Model):
    number = models.CharField("Flight number", max_length=10, primary_key=True)
    departure_airport = models.ForeignKey(Airport, on_delete=models.CASCADE, related_name="departure_airport")
    destination_airport = models.ForeignKey(Airport, on_delete=models.CASCADE, related_name="arrival_airport")
    aircraft = models.ForeignKey(Aircraft, on_delete=models.PROTECT, related_name="aircraft")

    departure_time = models.DateTimeField("Departure Date & Time")
    arrival_time = models.DateTimeField("Arrival Date & Time")
    delay = models.PositiveIntegerField("Delay in minutes", default=0)
    canceled = models.BooleanField("Cancelation status", default=False)

    # No deletion if there are still flights assigned
    # TODO: Implement check if the Employees on the flight are sufficient (e.g. one captain, one FO etc)
    employees = models.ManyToManyField(Employee, through='Assignment')

    def get_duration(self) -> int:
        """Return flight duration in minutes"""

        return self.arrival_time - self.departure_time
    
    def __str__(self) -> str:
        return f"Flight {self.number} from {self.departure_airport} to {self.destination_airport}"

    def get_absolute_url(self):
        return reverse('UpdateFlights', kwargs={'pk': self.pk})


class Assignment(models.Model):
    # Cannot delete Employee without replacement for assigments
    employee = models.ForeignKey(Employee, on_delete=models.PROTECT)
    flight = models.ForeignKey(Flight, on_delete=models.CASCADE)

    def __str__(self) -> str:
        return f"Employee {self.employee.first_name} {self.employee.last_name} on flight {self.flight.number}"

    def get_absolute_url(self):
        return reverse('UpdateAssignments', kwargs={'pk': self.pk})


class Booking(models.Model):
    flight = models.ForeignKey(Flight, on_delete=models.CASCADE)
    passenger = models.ForeignKey(Passenger, on_delete=models.CASCADE)
    time = models.DateTimeField("Creation time of booking", auto_now_add=True)
    canceled = models.BooleanField("Cancelation status", default=False)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['flight', 'passenger'], name='flight_passenger_unique')
        ]
        
    def __str__(self) -> str:
        return f"Passenger {self.passenger.first_name} {self.passenger.last_name} on flight {self.flight.number}"

    def get_absolute_url(self):
        return reverse('UpdateBookings', kwargs={'pk': self.pk})


# ------------ SQL for bookings weak entity type definition ------------
# Create table airlinex_booking (
# 	"time" timestamp with time zone NOT NULL,
#     flight_id character varying(10) NOT NULL,
#     passenger_id bigint NOT NULL
# );

# ALTER TABLE ONLY public.airlinex_booking
#     ADD CONSTRAINT airlinex_booking_pkey PRIMARY KEY (flight_id, passenger_id);

# ALTER TABLE ONLY public.airlinex_booking
#     ADD CONSTRAINT airlinex_booking_flight_id_084d83f2_fk_airlinex_flight_number FOREIGN KEY (flight_id) REFERENCES public.airlinex_flight(number) DEFERRABLE INITIALLY DEFERRED;

# ALTER TABLE ONLY public.airlinex_booking
#     ADD CONSTRAINT airlinex_booking_passenger_id_da0d1fa1_fk_airlinex_passenger_id FOREIGN KEY (passenger_id) REFERENCES public.airlinex_passenger(id) DEFERRABLE INITIALLY DEFERRED;
    
