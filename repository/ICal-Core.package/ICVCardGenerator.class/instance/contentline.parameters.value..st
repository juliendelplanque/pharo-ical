productions
contentline: aName parameters: aCollection value: aString
	self currentCard isNil
		ifFalse: [
			ICCardVersion
				use: self currentCard version
				during: [ super contentline: aName parameters: aCollection value: aString ] ]
		ifTrue: [ super contentline: aName parameters: aCollection value: aString ]