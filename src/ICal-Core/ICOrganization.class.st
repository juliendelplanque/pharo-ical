Class {
	#name : #ICOrganization,
	#superclass : #Object,
	#instVars : [
		'name',
		'unitNames'
	],
	#category : 'ICal-Core-VCard-Model'
}

{ #category : #'instance creation' }
ICOrganization class >> fromICalString: aString parameters: aDictionary [
	| instance parts |
	instance := self new.
	parts := aString subStringsFull: #($;).
	instance name: (parts isEmpty ifTrue: [ '' ] ifFalse: [ String fromICalString: parts first  parameters: aDictionary ]).
	instance unitNames: (
		parts allButFirst
			collect: [ :each | String fromICalString: each parameters: aDictionary ]
			thenSelect: [ :each | each notEmpty ]).
	^instance
]

{ #category : #accessing }
ICOrganization class >> iCalType [
	^ 'TEXT'
]

{ #category : #adding }
ICOrganization >> addUnitName: aString [
	^self unitNames add: aString
]

{ #category : #converting }
ICOrganization >> asVCardString [
	^String streamContents: [ :stream |
		stream nextPutAll: self name asVCardString.
		self unitNames isEmpty ifFalse: [
			stream nextPut: $; ].
		self unitNames
			do: [ :each | stream nextPutAll: each asVCardString ]
			separatedBy: [ stream nextPut: $; ] ]
]

{ #category : #'initialize-release' }
ICOrganization >> initialize [
	super initialize.
	self unitNames: OrderedCollection new
]

{ #category : #accessing }
ICOrganization >> name [
	^name
]

{ #category : #accessing }
ICOrganization >> name: aString [ 
	name := aString
]

{ #category : #accessing }
ICOrganization >> unitNames [
	^unitNames
]

{ #category : #accessing }
ICOrganization >> unitNames: aCollection [ 
	unitNames := aCollection
]
