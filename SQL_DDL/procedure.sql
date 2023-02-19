-- Stored procedure
CREATE PROCEDURE cancel_flight (@flight_id CHAR VARYING)
AS
BEGIN
  BEGIN TRANSACTION;
	-- Update bookings
  UPDATE airlinex_booking SET canceled = true WHERE number = @flight_id;
  -- Remove crew assignments for the flight
  DELETE FROM airlinex_assignment WHERE number = @flight_id;
  COMMIT;
END;

-- Corresponding trigger
CREATE TRIGGER cancel_flight_trigger
AFTER UPDATE ON airlinex_flight
FOR EACH ROW
WHEN (NEW.canceled = true)
BEGIN
  CALL cancel_flight(NEW.number);
END;