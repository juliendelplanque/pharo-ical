parsing
bysecond: aString on: aRule
	aRule addSecond: (Integer fromICalString: aString)