Before the code:
this example must be tested immediatly after the previous one

NOTE:
you can only check that this query works. The results depend on what you did before it

sql:
CREATE TABLE tmp.g_log ENGINE = MEMORY
	SELECT thread_id, command_type, COUNT(*)
		FROM mysql.general_log
		WHERE event_time > NOW() - INTERVAL 1 DAY
		AND command_type IN ('Connect', 'Quit')
		GROUP BY thread_id, command_type
		ORDER BY thread_id, command_type;
