rfc2445-rules
every20MinsBetween9AMAnd440PM
	^ ICRecurrenceRule fromICalString: 'FREQ=MINUTELY;INTERVAL=20;BYHOUR=9,10,11,12,13,14,15,16'