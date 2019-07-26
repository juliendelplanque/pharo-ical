Class {
	#name : #ICAddress,
	#superclass : #ICTypedObject,
	#instVars : [
		'poBox',
		'extended',
		'street',
		'locality',
		'region',
		'postalcode',
		'country'
	],
	#category : 'ICal-Core-VCard-Model'
}

{ #category : #'accessing-types' }
ICAddress class >> defaultTypes [
	^Set
		with: self typeInternational 
		with: self typePostal 
		with: self typeParcel 
		with: self typeWork
]

{ #category : #'instance creation' }
ICAddress class >> fromVCardString: aString parameters: aDictionary [
	| instance parts |
	instance := self new.
	instance types: (self parseTypes: aDictionary).
	parts := aString  subStringsFull: #($;).
	instance poBox: (String fromVCardString: parts first parameters: aDictionary).
	instance extended: (String fromVCardString: parts second parameters: aDictionary).
	instance street: (String fromVCardString: parts third parameters: aDictionary).
	
	parts size >= 4 ifTrue: [
		instance locality: (String fromVCardString: parts fourth parameters: aDictionary) ].
	parts size >= 5 ifTrue: [
		instance region: (String fromVCardString: parts fifth parameters: aDictionary) ].
	parts size >= 6 ifTrue: [
		instance postalcode: (String fromVCardString: parts sixth parameters: aDictionary) ].
	parts size >= 7 ifTrue: [
		instance country: (String fromVCardString: parts seventh parameters: aDictionary) ].
	^instance
]

{ #category : #'accessing-types' }
ICAddress class >> possibleTypes [
	^super possibleTypes
		add: self typeDomestic;
		add: self typeInternational;
		add: self typeParcel;
		add: self typePostal;
		yourself
]

{ #category : #'accessing-types' }
ICAddress class >> typeDomestic [
	^'dom'
]

{ #category : #'accessing-types' }
ICAddress class >> typeInternational [
	^'intl'
]

{ #category : #'accessing-types' }
ICAddress class >> typeParcel [
	^'parcel'
]

{ #category : #'accessing-types' }
ICAddress class >> typePostal [
	^'postal'
]

{ #category : #converting }
ICAddress >> asVCardString [
	^String streamContents: [ :stream |
		self poBox isNil ifFalse: [
			stream nextPutAll: self poBox asVCardString ].
		stream nextPut: $;.

		self extended isNil ifFalse: [
			stream nextPutAll: self extended asVCardString ].
		stream nextPut: $;.

		self street isNil ifFalse: [
			stream nextPutAll: self street asVCardString ].
		stream nextPut: $;.

		self locality isNil ifFalse: [
			stream nextPutAll: self locality asVCardString ].
		stream nextPut: $;.

		self region isNil ifFalse: [
			stream nextPutAll: self region asVCardString ].
		stream nextPut: $;.

		self postalcode isNil ifFalse: [
			stream nextPutAll: self postalcode asVCardString ].
		stream nextPut: $;.

		self country isNil ifFalse: [
			stream nextPutAll: self country asVCardString ] ]
]

{ #category : #'accessing-types' }
ICAddress >> beDomestic [
	self domestic: true
]

{ #category : #'accessing-types' }
ICAddress >> beInternational [
	self international: true
]

{ #category : #'accessing-types' }
ICAddress >> beParcel [
	self parcel: true
]

{ #category : #'accessing-types' }
ICAddress >> bePostal [
	self postal: true
]

{ #category : #accessing }
ICAddress >> country [
	^country
]

{ #category : #accessing }
ICAddress >> country: aString [ 
	country := aString
]

{ #category : #'accessing-types' }
ICAddress >> domestic [
	^self types includes: self class typeDomestic
]

{ #category : #'accessing-types' }
ICAddress >> domestic: aBoolean [
	^self
		setType: self class typeDomestic
		toValue: aBoolean
]

{ #category : #accessing }
ICAddress >> extended [
	^extended
]

{ #category : #accessing }
ICAddress >> extended: aString [ 
	extended := aString
]

{ #category : #'accessing-types' }
ICAddress >> international [
	^self types includes: self class typeInternational
]

{ #category : #'accessing-types' }
ICAddress >> international: aBoolean [
	^self
		setType: self class typeInternational
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICAddress >> isDomestic [
	^self domestic
]

{ #category : #'accessing-types' }
ICAddress >> isInternational [
	^self international
]

{ #category : #'accessing-types' }
ICAddress >> isParcel [
	^self parcel
]

{ #category : #'accessing-types' }
ICAddress >> isPostal [
	^self postal
]

{ #category : #accessing }
ICAddress >> locality [
	^locality
]

{ #category : #accessing }
ICAddress >> locality: aString [ 
	locality := aString
]

{ #category : #'accessing-types' }
ICAddress >> parcel [
	^self types includes: self class typeParcel
]

{ #category : #'accessing-types' }
ICAddress >> parcel: aBoolean [
	^self
		setType: self class typeParcel
		toValue: aBoolean
]

{ #category : #accessing }
ICAddress >> poBox [
	^poBox
]

{ #category : #accessing }
ICAddress >> poBox: aString [ 
	poBox := aString
]

{ #category : #'accessing-types' }
ICAddress >> postal [
	^self types includes: self class typePostal
]

{ #category : #'accessing-types' }
ICAddress >> postal: aBoolean [
	^self
		setType: self class typePostal
		toValue: aBoolean
]

{ #category : #accessing }
ICAddress >> postalcode [
	^postalcode
]

{ #category : #accessing }
ICAddress >> postalcode: aString [ 
	postalcode := aString
]

{ #category : #accessing }
ICAddress >> region [
	^region
]

{ #category : #accessing }
ICAddress >> region: aString [ 
	region := aString
]

{ #category : #accessing }
ICAddress >> street [
	^street
]

{ #category : #accessing }
ICAddress >> street: aString [ 
	street := aString
]
