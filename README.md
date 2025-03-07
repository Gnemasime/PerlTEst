# PerlTEst
perl assessment from invisible technologies
# Perl Test:
Create a Perl script that processes a log file and provides a summary of a specific events.

Requirements:

1. Read a Log File

The script should read from a given log file
2. Count Specific Events:

Count how many times specific events occur (i.e. "ERROR", "WARNING", "INFO")
Print the count of each event type
3. Extract and Display Event Details:

Extract and display details for the most recent event of each type (e.g. the timestamp and message for the latest "ERROR")


Example Input:



	2024-09-01 12:00:01 ERROR Failed to connect to the database

	2024-09-01 12:01:15 INFO User logged in: user_id=1234

	2024-09-01 12:02:37 WARNING Disk space low: 5% remaining

	2024-09-01 12:03:45 INFO Data synchronization completed

	2024-09-01 12:05:21 ERROR Unable to read configuration file

	2024-09-01 12:06:12 INFO User logged out: user_id=1234

	2024-09-01 12:07:48 WARNING Memory usage high: 85%

	2024-09-01 12:08:54 INFO Scheduled backup started

	2024-09-01 12:10:00 ERROR Backup failed: disk full

	2024-09-01 12:11:13 INFO Scheduled backup completed with errors





Example Output:



	INFO: 5 occurrences

	ERROR: 3 occurrences

	WARNING: 2 occurrences



	Most Recent INFO:

	Timestamp: 2024-09-01 12:11:13

	Message: INFO Scheduled backup completed with errors



	Most Recent WARNING:

	Timestamp: 2024-09-01 12:07:48	

	Message: WARNING: Memory usage high: 85%



	Most Recent ERROR:

	Timestamp: 2024-09-01 12:10:00

	Message: ERROR Backup failed: disk full

