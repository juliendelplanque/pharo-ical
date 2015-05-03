instance creation
fromVCardString: aString
	| hours minutes |
	hours := (aString copyFrom: 2 to: 3) asInteger.
	minutes := (aString copyFrom: 5 to: 6) asInteger.
	^self new
		hours: hours;
		minutes: minutes;
		seconds: 0;
		positive: aString first = $+;
		yourself