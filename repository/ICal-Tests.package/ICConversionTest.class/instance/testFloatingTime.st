testing
testFloatingTime
	| dateAndTime |
	ICConversion hasChronosLoaded
		ifTrue: [ 
			dateAndTime := (Smalltalk classNamed: #Timepoint) fromICalString: '19501122T223344' parameters: Dictionary new.
			self assert: dateAndTime isInvariantToNominalTime.
			dateAndTime := (Smalltalk classNamed: #Timepoint) fromICalString: '19501122T223344Z' parameters: Dictionary new.
			self deny: dateAndTime isInvariantToNominalTime. ]
		ifFalse: [
			"not yet implemented"]