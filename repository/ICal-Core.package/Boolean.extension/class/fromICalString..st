*ICal-Core
fromICalString: aString
	(aString sameAs: true asICalString)
		ifTrue: [ ^true ].
	(aString sameAs: false asICalString)
		ifTrue: [ ^false ].
	self error: 'invalid argument'