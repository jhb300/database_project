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
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    flight_id character varying(10) NOT NULL
);


-- Booking of a passenger on a flight
CREATE TABLE airlinex_booking (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    cancelled boolean NOT NULL,
    flight_id character varying(10) NOT NULL,
    passenger_id bigint NOT NULL
);


-- Employee table
CREATE TABLE airlinex_employee (
    id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    role character varying(2) NOT NULL,
    based_in_id character varying(4)
);


-- Flight table
CREATE TABLE airlinex_flight (
    number character varying(10) NOT NULL,
    departure_time timestamp with time zone NOT NULL,
    arrival_time timestamp with time zone NOT NULL,
    delay integer NOT NULL,
    cancelled boolean NOT NULL,
    aircraft_id character varying(10) NOT NULL,
    departure_airport_id character varying(4) NOT NULL,
    destination_airport_id character varying(4) NOT NULL,
    CONSTRAINT airlinex_flight_delay_check CHECK ((delay >= 0))
);


-- Passenger table
CREATE TABLE airlinex_passenger (
    id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    notes text NOT NULL
);


-- Airport table
CREATE TABLE airportx_airport (
    icao_code character varying(4) NOT NULL,
    name character varying(100) NOT NULL
);




--
-- TOC entry 3316 (class 2606 OID 66211)
-- Name: airlinex_assignment airlinex_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_assignment
    ADD CONSTRAINT airlinex_assignment_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 66237)
-- Name: airlinex_booking airlinex_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_booking
    ADD CONSTRAINT airlinex_booking_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 66217)
-- Name: airlinex_employee airlinex_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_employee
    ADD CONSTRAINT airlinex_employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 66231)
-- Name: airlinex_flight airlinex_flight_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_flight
    ADD CONSTRAINT airlinex_flight_pkey PRIMARY KEY (number);


--
-- TOC entry 3326 (class 2606 OID 66225)
-- Name: airlinex_passenger airlinex_passenger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_passenger
    ADD CONSTRAINT airlinex_passenger_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 66302)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3279 (class 2606 OID 66130)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3282 (class 2606 OID 66099)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 66091)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 66121)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3271 (class 2606 OID 66085)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 66113)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 66145)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3284 (class 2606 OID 66105)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 66119)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 66159)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3287 (class 2606 OID 66297)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3302 (class 2606 OID 66180)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 66079)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3266 (class 2606 OID 66077)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 66071)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3345 (class 2606 OID 66310)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3342 (class 2606 OID 66249)
-- Name: airlinex_booking flight_passenger_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_booking
    ADD CONSTRAINT flight_passenger_unique UNIQUE (flight_id, passenger_id);


--
-- TOC entry 3311 (class 1259 OID 66250)
-- Name: airlinex_aircraft_registration_e1d865b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_aircraft_registration_e1d865b7_like ON public.airlinex_aircraft USING btree (registration varchar_pattern_ops);


--
-- TOC entry 3312 (class 1259 OID 66293)
-- Name: airlinex_assignment_employee_id_1b62b316; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_assignment_employee_id_1b62b316 ON public.airlinex_assignment USING btree (employee_id);


--
-- TOC entry 3313 (class 1259 OID 66294)
-- Name: airlinex_assignment_flight_id_1d95d3bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_assignment_flight_id_1d95d3bb ON public.airlinex_assignment USING btree (flight_id);


--
-- TOC entry 3314 (class 1259 OID 66295)
-- Name: airlinex_assignment_flight_id_1d95d3bb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_assignment_flight_id_1d95d3bb_like ON public.airlinex_assignment USING btree (flight_id varchar_pattern_ops);


--
-- TOC entry 3336 (class 1259 OID 66290)
-- Name: airlinex_booking_flight_id_084d83f2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_booking_flight_id_084d83f2 ON public.airlinex_booking USING btree (flight_id);


--
-- TOC entry 3337 (class 1259 OID 66291)
-- Name: airlinex_booking_flight_id_084d83f2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_booking_flight_id_084d83f2_like ON public.airlinex_booking USING btree (flight_id varchar_pattern_ops);


--
-- TOC entry 3338 (class 1259 OID 66292)
-- Name: airlinex_booking_passenger_id_da0d1fa1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_booking_passenger_id_da0d1fa1 ON public.airlinex_booking USING btree (passenger_id);


--
-- TOC entry 3317 (class 1259 OID 66256)
-- Name: airlinex_employee_based_in_id_3cb1b962; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_employee_based_in_id_3cb1b962 ON public.airlinex_employee USING btree (based_in_id);


--
-- TOC entry 3318 (class 1259 OID 66257)
-- Name: airlinex_employee_based_in_id_3cb1b962_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_employee_based_in_id_3cb1b962_like ON public.airlinex_employee USING btree (based_in_id varchar_pattern_ops);


--
-- TOC entry 3319 (class 1259 OID 66335)
-- Name: airlinex_employee_last_name_d771ddd0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_employee_last_name_d771ddd0 ON public.airlinex_employee USING btree (last_name);


--
-- TOC entry 3320 (class 1259 OID 66336)
-- Name: airlinex_employee_last_name_d771ddd0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_employee_last_name_d771ddd0_like ON public.airlinex_employee USING btree (last_name varchar_pattern_ops);


--
-- TOC entry 3327 (class 1259 OID 66274)
-- Name: airlinex_flight_aircraft_id_d51880de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_flight_aircraft_id_d51880de ON public.airlinex_flight USING btree (aircraft_id);


--
-- TOC entry 3328 (class 1259 OID 66275)
-- Name: airlinex_flight_aircraft_id_d51880de_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_flight_aircraft_id_d51880de_like ON public.airlinex_flight USING btree (aircraft_id varchar_pattern_ops);


--
-- TOC entry 3329 (class 1259 OID 66276)
-- Name: airlinex_flight_departure_airport_id_f4ea3b0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_flight_departure_airport_id_f4ea3b0d ON public.airlinex_flight USING btree (departure_airport_id);


--
-- TOC entry 3330 (class 1259 OID 66277)
-- Name: airlinex_flight_departure_airport_id_f4ea3b0d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_flight_departure_airport_id_f4ea3b0d_like ON public.airlinex_flight USING btree (departure_airport_id varchar_pattern_ops);


--
-- TOC entry 3331 (class 1259 OID 66278)
-- Name: airlinex_flight_destination_airport_id_85ec5ad1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_flight_destination_airport_id_85ec5ad1 ON public.airlinex_flight USING btree (destination_airport_id);


--
-- TOC entry 3332 (class 1259 OID 66279)
-- Name: airlinex_flight_destination_airport_id_85ec5ad1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_flight_destination_airport_id_85ec5ad1_like ON public.airlinex_flight USING btree (destination_airport_id varchar_pattern_ops);


--
-- TOC entry 3333 (class 1259 OID 66273)
-- Name: airlinex_flight_number_7f01238e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_flight_number_7f01238e_like ON public.airlinex_flight USING btree (number varchar_pattern_ops);


--
-- TOC entry 3323 (class 1259 OID 66337)
-- Name: airlinex_passenger_last_name_75af25a0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_passenger_last_name_75af25a0 ON public.airlinex_passenger USING btree (last_name);


--
-- TOC entry 3324 (class 1259 OID 66338)
-- Name: airlinex_passenger_last_name_75af25a0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airlinex_passenger_last_name_75af25a0_like ON public.airlinex_passenger USING btree (last_name varchar_pattern_ops);


--
-- TOC entry 3304 (class 1259 OID 66198)
-- Name: airportx_airport_icao_code_6ea576a0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airportx_airport_icao_code_6ea576a0_like ON public.airportx_airport USING btree (icao_code varchar_pattern_ops);


--
-- TOC entry 3305 (class 1259 OID 66199)
-- Name: airportx_airport_name_ade6ba46; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airportx_airport_name_ade6ba46 ON public.airportx_airport USING btree (name);


--
-- TOC entry 3306 (class 1259 OID 66200)
-- Name: airportx_airport_name_ade6ba46_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX airportx_airport_name_ade6ba46_like ON public.airportx_airport USING btree (name varchar_pattern_ops);


--
-- TOC entry 3272 (class 1259 OID 66303)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3277 (class 1259 OID 66141)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3280 (class 1259 OID 66142)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3267 (class 1259 OID 66127)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3288 (class 1259 OID 66157)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3291 (class 1259 OID 66156)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3294 (class 1259 OID 66171)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3297 (class 1259 OID 66170)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3285 (class 1259 OID 66298)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3300 (class 1259 OID 66191)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3303 (class 1259 OID 66192)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3343 (class 1259 OID 66312)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3346 (class 1259 OID 66311)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3364 (class 2620 OID 66329)
-- Name: airlinex_flight cancel_flight_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER cancel_flight_trigger AFTER UPDATE ON public.airlinex_flight FOR EACH ROW EXECUTE FUNCTION public.cancel_flight_trigger_function();


--
-- TOC entry 3356 (class 2606 OID 66238)
-- Name: airlinex_assignment airlinex_assignment_employee_id_1b62b316_fk_airlinex_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_assignment
    ADD CONSTRAINT airlinex_assignment_employee_id_1b62b316_fk_airlinex_ FOREIGN KEY (employee_id) REFERENCES public.airlinex_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3357 (class 2606 OID 66243)
-- Name: airlinex_assignment airlinex_assignment_flight_id_1d95d3bb_fk_airlinex_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_assignment
    ADD CONSTRAINT airlinex_assignment_flight_id_1d95d3bb_fk_airlinex_ FOREIGN KEY (flight_id) REFERENCES public.airlinex_flight(number) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3362 (class 2606 OID 66280)
-- Name: airlinex_booking airlinex_booking_flight_id_084d83f2_fk_airlinex_flight_number; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_booking
    ADD CONSTRAINT airlinex_booking_flight_id_084d83f2_fk_airlinex_flight_number FOREIGN KEY (flight_id) REFERENCES public.airlinex_flight(number) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3363 (class 2606 OID 66285)
-- Name: airlinex_booking airlinex_booking_passenger_id_da0d1fa1_fk_airlinex_passenger_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_booking
    ADD CONSTRAINT airlinex_booking_passenger_id_da0d1fa1_fk_airlinex_passenger_id FOREIGN KEY (passenger_id) REFERENCES public.airlinex_passenger(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3358 (class 2606 OID 66330)
-- Name: airlinex_employee airlinex_employee_based_in_id_3cb1b962_fk_airportx_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_employee
    ADD CONSTRAINT airlinex_employee_based_in_id_3cb1b962_fk_airportx_ FOREIGN KEY (based_in_id) REFERENCES public.airportx_airport(icao_code) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3359 (class 2606 OID 66258)
-- Name: airlinex_flight airlinex_flight_aircraft_id_d51880de_fk_airlinex_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_flight
    ADD CONSTRAINT airlinex_flight_aircraft_id_d51880de_fk_airlinex_ FOREIGN KEY (aircraft_id) REFERENCES public.airlinex_aircraft(registration) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3360 (class 2606 OID 66263)
-- Name: airlinex_flight airlinex_flight_departure_airport_id_f4ea3b0d_fk_airportx_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_flight
    ADD CONSTRAINT airlinex_flight_departure_airport_id_f4ea3b0d_fk_airportx_ FOREIGN KEY (departure_airport_id) REFERENCES public.airportx_airport(icao_code) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3361 (class 2606 OID 66268)
-- Name: airlinex_flight airlinex_flight_destination_airport__85ec5ad1_fk_airportx_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlinex_flight
    ADD CONSTRAINT airlinex_flight_destination_airport__85ec5ad1_fk_airportx_ FOREIGN KEY (destination_airport_id) REFERENCES public.airportx_airport(icao_code) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3348 (class 2606 OID 66136)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3349 (class 2606 OID 66131)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3347 (class 2606 OID 66122)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3350 (class 2606 OID 66151)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3351 (class 2606 OID 66146)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3352 (class 2606 OID 66165)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3353 (class 2606 OID 66160)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3354 (class 2606 OID 66181)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3355 (class 2606 OID 66186)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3539 (class 0 OID 66314)
-- Dependencies: 244 3541
-- Name: airport_and_based_crew; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: postgres
--

REFRESH MATERIALIZED VIEW public.airport_and_based_crew;


-- Completed on 2023-03-18 14:59:42

--
-- PostgreSQL database dump complete
--

