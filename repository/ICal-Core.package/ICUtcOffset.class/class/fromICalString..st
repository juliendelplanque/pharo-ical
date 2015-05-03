instance creation
fromICalString: aString
	| totalSeconds |
	totalSeconds := aString size = 5
		ifTrue: [ aString allButFirst asInteger * 100 ] 
		ifFalse: [ aString allButFirst asInteger ].
	^self new
		hours: (totalSeconds quo: 10000);
		minutes: (totalSeconds quo: 100) \\ 100;
		seconds: totalSeconds \\ 100;
		positive: aString first = $+;
		yourself