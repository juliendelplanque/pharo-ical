*ICal-Core
fromICalString: aString
	| coords |
	coords := aString subStringsFull: #($;).
	^self
		x: (Float fromICalString: coords first)
		y: (Float fromICalString: coords second)