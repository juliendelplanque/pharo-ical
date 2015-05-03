accessing
propertyClassFor: anICalType
	^self supportedClasses detect: [ :each |
		each iCalType = anICalType ]