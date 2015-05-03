productions
contentline: aName parameters: aCollection value: aString
	| selector |
	selector := self asSelector: aName.
	(self noParameterSelectors includes: selector)
		ifTrue: [
			self
				perform: selector asSymbol
				withArguments: (Array with: aString) ]
		ifFalse: [
			self
				perform: (selector , 'parameters:') asSymbol
				withArguments: (Array with: aString with: aCollection) ]