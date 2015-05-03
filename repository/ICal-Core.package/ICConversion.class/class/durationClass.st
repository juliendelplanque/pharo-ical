accessing
durationClass
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: 'ScientificDuration' ]
		ifFalse: [ Duration ]