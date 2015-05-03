private
parseTypes: aDictionary
	^((aDictionary includesKey: 'TYPE')
		ifTrue: [ ((aDictionary at: 'TYPE') collect: [ :each | each asLowercase]) asSet ]
		ifFalse: [ self defaultTypes ]).