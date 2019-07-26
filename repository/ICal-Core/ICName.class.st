Class {
	#name : #ICName,
	#superclass : #Object,
	#instVars : [
		'familyname',
		'givenname',
		'additionalnames',
		'honorificprefixes',
		'honorificsuffixes'
	],
	#category : 'ICal-Core-VCard-Model'
}

{ #category : #'instance creation' }
ICName class >> fromICalString: aString parameters: aDictionary [
	| instance parts |
	instance := self new.
	parts := aString  subStringsFull: #($;).
	instance familyName: (String fromICalString: parts first parameters: aDictionary).
	instance givenName: (String fromICalString: parts second parameters: aDictionary).
	
	"there should be no need to do these checks, but VB programmers are idiots"
	parts size >= 3 ifTrue: [
		instance additionalNames: (self unsplit: parts third parameters: aDictionary) ].
	parts size >= 4 ifTrue: [
		instance honorificPrefixes: (self unsplit: parts fourth parameters: aDictionary) ].
	parts size >= 5 ifTrue: [
		instance honorificSuffixes: (self unsplit: parts fifth parameters: aDictionary) ].
	^instance
]

{ #category : #accessing }
ICName class >> iCalType [
	^ 'TEXT'
]

{ #category : #private }
ICName class >> unsplit: aString parameters: aDictionary [
	^aString splitAtCommas
		collect: [ :each | String fromICalString: each parameters: aDictionary ]
		thenSelect: [ :each | each isEmptyOrNil not ]
]

{ #category : #adding }
ICName >> addAdditionalName: aString [
	^self additionalNames add: aString
]

{ #category : #adding }
ICName >> addHonorificPrefix: aString [
	^self honorificPrefixes add: aString
]

{ #category : #adding }
ICName >> addHonorificSuffix: aString [
	^self honorificSuffixes add: aString
]

{ #category : #accessing }
ICName >> additionalNames [
	^additionalnames
]

{ #category : #accessing }
ICName >> additionalNames: aCollection [ 
	additionalnames := aCollection
]

{ #category : #converting }
ICName >> asVCardString [
	^String streamContents: [ :stream |
		self familyName isNil ifFalse: [
			stream nextPutAll: self familyName asVCardString ].
		stream nextPut: $; .

		self givenName isNil ifFalse: [
			stream nextPutAll: self givenName asVCardString ].
		stream nextPut: $; .

		self additionalNames
			do: [ :each | stream nextPutAll: each asVCardString ]
			separatedBy: [ stream nextPut: $, ].
		stream nextPut: $; .

		self honorificPrefixes
			do: [ :each | stream nextPutAll: each asVCardString ]
			separatedBy: [ stream nextPut: $, ].
		stream nextPut: $; .

		self honorificSuffixes
			do: [ :each | stream nextPutAll: each asVCardString ]
			separatedBy: [ stream nextPut: $, ] ]
]

{ #category : #converting }
ICName >> displayString [
	^String streamContents: [ :stream |
		| writeBlock |
		writeBlock := [ :each | stream nextPutAll: each; space ].
		self honorificPrefixes do: writeBlock.
		self givenName isNil ifFalse: [
			writeBlock value: self givenName ].
		self additionalNames do: writeBlock.
		self familyName isNil ifFalse: [
			writeBlock value: self familyName ].
		self honorificSuffixes do: writeBlock ]
	
]

{ #category : #accessing }
ICName >> familyName [
	^familyname
]

{ #category : #accessing }
ICName >> familyName: aString [ 
	familyname := aString
]

{ #category : #accessing }
ICName >> givenName [
	^givenname
]

{ #category : #accessing }
ICName >> givenName: aString [ 
	givenname := aString
]

{ #category : #accessing }
ICName >> honorificPrefixes [
	^honorificprefixes
]

{ #category : #accessing }
ICName >> honorificPrefixes: aCollection [ 
	honorificprefixes := aCollection
]

{ #category : #accessing }
ICName >> honorificSuffixes [
	^honorificsuffixes
]

{ #category : #accessing }
ICName >> honorificSuffixes: aCollection [ 
	honorificsuffixes := aCollection
]

{ #category : #'initialize-release' }
ICName >> initialize [
	super initialize.
	self additionalNames: OrderedCollection new.
	self honorificPrefixes: OrderedCollection new.
	self honorificSuffixes: OrderedCollection new.
]
