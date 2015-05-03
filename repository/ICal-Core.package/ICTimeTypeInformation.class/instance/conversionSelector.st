accessing
conversionSelector
	^self needsUtc
		ifFalse: [ super conversionSelector ]
		ifTrue: [ #asICalUtcString ]