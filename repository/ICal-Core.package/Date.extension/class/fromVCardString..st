*ICal-Core
fromVCardString: aString
	^ (aString includesSubstring: '-')
		ifFalse: [ self fromICalString: aString ]
		ifTrue: [ 
			self
				year: (aString first: 4) asInteger
				month: (aString copyFrom: 6 to: 7) asInteger
				day: (aString copyFrom: 9 to: 10) asInteger ]