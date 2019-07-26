Extension { #name : #Integer }

{ #category : #'*ICal-Core' }
Integer >> asICalString [
	^self asString
]

{ #category : #'*ICal-Core' }
Integer class >> fromICalString: aString [
	^aString asNumber
]

{ #category : #'*ICal-Core' }
Integer class >> iCalType [
	^'INTEGER'
]
