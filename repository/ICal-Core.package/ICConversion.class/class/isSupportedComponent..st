accessing
isSupportedComponent: anICalComponentName
	^self supportedComponents anySatisfy: [ :each |
		each iCalType sameAs: anICalComponentName ]