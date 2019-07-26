Class {
	#name : #ICEmailAddress,
	#superclass : #ICTypedObject,
	#instVars : [
		'address'
	],
	#category : 'ICal-Core-VCard-Model'
}

{ #category : #'accessing-types' }
ICEmailAddress class >> defaultTypes [
	^Set with: self typeInternet
]

{ #category : #'instance creation' }
ICEmailAddress class >> fromICalString: aString parameters: aDictionary [
	| instance |
	instance := self new.
	instance types: (self parseTypes: aDictionary).
	instance address: (String fromICalString: aString parameters: aDictionary).
	^instance
]

{ #category : #'accessing-types' }
ICEmailAddress class >> possibleTypes [
	^super possibleTypes
		add: self typeInternet;
		add: self typeX400;
		yourself
]

{ #category : #'accessing-types' }
ICEmailAddress class >> typeInternet [
	^'internet'
]

{ #category : #'accessing-types' }
ICEmailAddress class >> typeX400 [
	^'x400'
]

{ #category : #accessing }
ICEmailAddress >> address [
	^address
]

{ #category : #accessing }
ICEmailAddress >> address: aString [ 
	address := aString
]

{ #category : #converting }
ICEmailAddress >> asVCardString [
	^self address asVCardString
]

{ #category : #'accessing-types' }
ICEmailAddress >> beInternet [
	self internet: true
]

{ #category : #'accessing-types' }
ICEmailAddress >> beX400 [
	self x400: true
]

{ #category : #'accessing-types' }
ICEmailAddress >> internet [
	^self types includes: self class typeInternet
]

{ #category : #'accessing-types' }
ICEmailAddress >> internet: aBoolean [
	^self
		setType: self class typeInternet
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICEmailAddress >> isInternet [
	^self internet
]

{ #category : #'accessing-types' }
ICEmailAddress >> isX400 [
	^self x400
]

{ #category : #'accessing-types' }
ICEmailAddress >> x400 [
	^self types includes: self class typeX400
]

{ #category : #'accessing-types' }
ICEmailAddress >> x400: aBoolean [
	^self
		setType: self class typeX400
		toValue: aBoolean
]
