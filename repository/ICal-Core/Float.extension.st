Extension { #name : #Float }

{ #category : #'*ICal-Core' }
Float >> asICalString [
	^self asString
]

{ #category : #'*ICal-Core' }
Float class >> fromICalString: aString [
	| float |
	float := aString asNumber.
	^float asICalString ~= aString
		ifFalse: [ float ]
		ifTrue: [ ScaledDecimal fromICalString: aString ]
]

{ #category : #'*ICal-Core' }
Float class >> iCalType [
	^'FLOAT'
]
