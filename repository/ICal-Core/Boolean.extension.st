Extension { #name : #Boolean }

{ #category : #'*ICal-Core' }
Boolean >> asICalBooleanString [
	self subclassResponsibility 
]

{ #category : #'*ICal-Core' }
Boolean >> asICalString [
	^self asICalBooleanString 
]

{ #category : #'*ICal-Core' }
Boolean class >> fromICalString: aString [
	(aString sameAs: true asICalString)
		ifTrue: [ ^true ].
	(aString sameAs: false asICalString)
		ifTrue: [ ^false ].
	self error: 'invalid argument'
]

{ #category : #'*ICal-Core' }
Boolean class >> iCalType [
	^'BOOLEAN'
]
