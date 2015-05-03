parsing
bymonth: aString on: aRule
	aRule addMonthnumber: (Integer fromICalString: aString)