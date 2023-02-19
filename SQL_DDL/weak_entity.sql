
-- Doesnt work with Django as it does not support composite primary keys.
Create table airlinex_booking (
	"time" timestamp with time zone NOT NULL,
    flight_id character varying(10) NOT NULL,
    passenger_id bigint NOT NULL
);

ALTER TABLE ONLY public.airlinex_booking
    ADD CONSTRAINT airlinex_booking_pkey PRIMARY KEY (flight_id, passenger_id);

ALTER TABLE ONLY public.airlinex_booking
    ADD CONSTRAINT airlinex_booking_flight_id_084d83f2_fk_airlinex_flight_number FOREIGN KEY (flight_id) REFERENCES public.airlinex_flight(number) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.airlinex_booking
    ADD CONSTRAINT airlinex_booking_passenger_id_da0d1fa1_fk_airlinex_passenger_id FOREIGN KEY (passenger_id) REFERENCES public.airlinex_passenger(id) DEFERRABLE INITIALLY DEFERRED;