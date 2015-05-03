instance creation
fromICalString: aString
	| inst parts key values |
	inst := self new.
	(aString  subStrings: #($;)) do: [ :property | 
		parts := property subStrings: #($=).
		key := parts first.
		values := parts second subStrings: #($,).
		values do: [ :each |
			self
				perform: (key asLowercase , ':on:') asSymbol
				withArguments: (Array with: each with: inst) ] ].
	^inst