parsing
byhour: aString on: aRule
	aRule addHour: (Integer fromICalString: aString)