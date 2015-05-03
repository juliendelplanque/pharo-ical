accessing
timespanClass
	^ self hasChronosLoaded
		ifTrue: [ self environment classNamed: #Timeperiod ]
		ifFalse: [ Timespan ]