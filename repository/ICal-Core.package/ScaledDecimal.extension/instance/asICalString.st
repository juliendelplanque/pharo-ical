*ICal-Core
asICalString
	"copy pasted from #printOn:"
	^String streamContents: [ :stream |
		| fractionPart |
		scale = 0
			ifTrue: [self rounded printOn: stream ]
			ifFalse: [self integerPart printOn: stream.
				stream nextPut: $..
				fractionPart := (self abs fractionPart * (10 raisedToInteger: scale)) rounded.
				stream nextPutAll: (String new: scale - (fractionPart numberOfDigitsInBase: 10) withAll: $0).
				fractionPart printOn: stream]. ]