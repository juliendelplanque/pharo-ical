instance creation
fromICalString: aString
	| inst parts key values |
	inst := self new.
	(aString substrings: ';')
		do: [ :property | 
			parts := property substrings: '='.
			key := parts first.
			values := parts second substrings: ','.
			values
				do: [ :each | 
					self
						perform: (key asLowercase , ':on:') asSymbol
						withArguments: (Array with: each with: inst) ] ].
	^ inst