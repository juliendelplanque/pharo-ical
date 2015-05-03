parsing
until: aString on: aRule
	aRule until: (self dateAndTimeClass fromICalString: aString)