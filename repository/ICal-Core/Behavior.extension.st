Extension { #name : #Behavior }

{ #category : #'*ICal-Core' }
Behavior >> fromICalString: aString parameters: aDictionary [
	^self fromICalString: aString
]

{ #category : #'*ICal-Core' }
Behavior >> fromICalString: aString parameters: aDictionary timezone: anICTimezone [
	^self fromICalString: aString parameters: aDictionary
]

{ #category : #'*ICal-Core' }
Behavior >> fromVCardString: aString [
	^self fromICalString: aString
]

{ #category : #'*ICal-Core' }
Behavior >> fromVCardString: aString parameters: aDictionary [
	^self fromVCardString: aString
]
