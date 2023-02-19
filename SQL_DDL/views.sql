CREATE MATERIALIZED VIEW airport_and_based_crew 
AS SELECT airportx_airport.*, COUNT(airlinex_employee.based_in_id) AS num_employees
FROM airportx_airport
LEFT JOIN airlinex_employee ON airportx_airport.icao_code = airlinex_employee.based_in_id
GROUP BY airportx_airport.icao_code