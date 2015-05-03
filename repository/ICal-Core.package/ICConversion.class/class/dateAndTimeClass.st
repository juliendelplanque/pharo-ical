accessing
dateAndTimeClass
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: 'Timepoint' ]
		ifFalse: [ DateAndTime ]