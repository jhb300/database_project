-- SQL Table Definitions - Not sufficient to setup the entire DB as procedures etc are excluded here.
-- Use the final SQL dump for that.


-- Aircraft table
CREATE TABLE airlinex_aircraft (
    registration character varying(10) NOT NULL PRIMARY KEY,
    type_series character varying(10) NOT NULL,
    passenger_capacity integer NOT NULL
);


-- Assignemnt table for employees on flights
CREATE TABLE airlinex_assignment (
    id bigint NOT NULL PRIMARY KEY,
    employee_id bigint NOT NULL,
    flight_id character varying(10) NOT NULL,
    CONSTRAINT airlinex_assignment_employee_id_1b62b316_fk_airlinex_ FOREIGN KEY (employee_id) REFERENCES airlinex_employee(id),
    CONSTRAINT airlinex_assignment_flight_id_1d95d3bb_fk_airlinex_ FOREIGN KEY (flight_id) REFERENCES airlinex_flight(number)
);


-- Booking of a passenger on a flight
CREATE TABLE airlinex_booking (
    id bigint NOT NULL PRIMARY KEY,
    "time" timestamp with time zone NOT NULL,
    cancelled boolean NOT NULL,
    flight_id character varying(10) NOT NULL,
    passenger_id bigint NOT NULL,
    CONSTRAINT airlinex_booking_flight_id_084d83f2_fk_airlinex_flight_number FOREIGN KEY (flight_id) REFERENCES airlinex_flight(number),
    CONSTRAINT airlinex_booking_passenger_id_da0d1fa1_fk_airlinex_passenger_id FOREIGN KEY (passenger_id) REFERENCES airlinex_passenger(id)
);


-- Employee table
CREATE TABLE airlinex_employee (
    id bigint NOT NULL PRIMARY KEY,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    role character varying(2) NOT NULL,
    based_in_id character varying(4)
);


-- Flight table
CREATE TABLE airlinex_flight (
    number character varying(10) NOT NULL PRIMARY KEY,
    departure_time timestamp with time zone NOT NULL,
    arrival_time timestamp with time zone NOT NULL,
    delay integer NOT NULL,
    cancelled boolean NOT NULL,
    aircraft_id character varying(10) NOT NULL,
    departure_airport_id character varying(4) NOT NULL,
    destination_airport_id character varying(4) NOT NULL,
    CONSTRAINT airlinex_flight_delay_check CHECK ((delay >= 0)),
    CONSTRAINT airlinex_flight_aircraft_id_d51880de_fk_airlinex_ FOREIGN KEY (aircraft_id) REFERENCES airlinex_aircraft(registration),
    CONSTRAINT airlinex_flight_departure_airport_id_f4ea3b0d_fk_airportx_ FOREIGN KEY (departure_airport_id) REFERENCES airportx_airport(icao_code),
    CONSTRAINT airlinex_flight_destination_airport__85ec5ad1_fk_airportx_ FOREIGN KEY (destination_airport_id) REFERENCES airportx_airport(icao_code)
);


-- Passenger table
CREATE TABLE airlinex_passenger (
    id bigint NOT NULL PRIMARY KEY,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    notes text NOT NULL
);


-- Airport table
CREATE TABLE airportx_airport (
    icao_code character varying(4) NOT NULL,
    name character varying(100) NOT NULL,
    CONSTRAINT airlinex_employee_based_in_id_3cb1b962_fk_airportx_ FOREIGN KEY (based_in_id) REFERENCES airportx_airport(icao_code)
);


ALTER TABLE ONLY public.airlinex_booking
    ADD CONSTRAINT flight_passenger_unique UNIQUE (flight_id, passenger_id);
    