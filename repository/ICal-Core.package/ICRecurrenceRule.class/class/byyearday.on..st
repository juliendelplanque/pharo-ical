parsing
byyearday: aString on: aRule
	aRule addYearday: (Integer fromICalString: aString)