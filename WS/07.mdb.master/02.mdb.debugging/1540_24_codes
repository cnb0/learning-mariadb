Immediatly after the previous example, just execute this:

CREATE EVENT `event_db`.`rotate_general_log`
	ON SCHEDULE
		EVERY 1 WEEK
		STARTS '2014-01-05 00:00:00'
	COMMENT 'Rotates general_log'
DO BEGIN
	CALL `_`.`rotate_general_log`();
END;

If no error appears, it should work. The code is executed on midnight between sunday and monday, so to test properly you should replace the '2014-01-05 00:00:00' part with another date/time.
