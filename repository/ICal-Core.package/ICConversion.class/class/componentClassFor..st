accessing
componentClassFor: anICalComponentName
	^self supportedComponents detect: [ :each |
		each iCalType sameAs: anICalComponentName ]