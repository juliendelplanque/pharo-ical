*ICal-Core
< comparand
	"comparand conforms to protocol DateAndTime,
	or can be converted into something that conforms."

	| other |
	other := comparand asDate.
	^ start year = other start year
		ifTrue: [ 
			start month = other start month
				ifTrue: [ start dayOfMonth  < other start dayOfMonth ]
				ifFalse: [ start month  < other start month ] ]
		ifFalse: [ start year < other start year  ]