Extension { #name : #ScaledDecimal }

{ #category : #'*ICal-Core' }
ScaledDecimal >> asICalString [
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
]

{ #category : #'*ICal-Core' }
ScaledDecimal class >> fromICalString: aString [
	| beforeComma afterComma number beforeCommaScale beforeCommaNumber afterCommaNumber |
	beforeComma := aString copyUpTo: $. .
	afterComma := aString copyAfter: $. .
	beforeCommaScale := 10 raisedTo: afterComma size.
	beforeCommaNumber := beforeComma asNumber * beforeCommaScale
			/ beforeCommaScale.
	afterCommaNumber := ((afterComma isEmpty ifFalse: [ afterComma asNumber ] ifTrue: [ 0 ])
			/  beforeCommaScale).
	number := beforeCommaNumber negative
		ifFalse: [ beforeCommaNumber + afterCommaNumber ]
		ifTrue: [ beforeCommaNumber - afterCommaNumber ].
	^self newFromNumber: number scale: afterComma size
]
