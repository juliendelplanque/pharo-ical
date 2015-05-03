*ICal-Core
fromICalString: aString
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