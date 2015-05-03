accessing
iCalType
	^self value isNil
		ifTrue: [ self class iCalType ]
		ifFalse: [ self value iCalType ]