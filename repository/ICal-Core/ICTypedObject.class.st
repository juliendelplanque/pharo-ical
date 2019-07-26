Class {
	#name : #ICTypedObject,
	#superclass : #Object,
	#instVars : [
		'types'
	],
	#category : 'ICal-Core-VCard-Model'
}

{ #category : #'accessing-types' }
ICTypedObject class >> defaultTypes [
	self subclassResponsibility 
]

{ #category : #accessing }
ICTypedObject class >> iCalType [
	^ 'TEXT'
]

{ #category : #private }
ICTypedObject class >> parseTypes: aDictionary [
	^((aDictionary includesKey: 'TYPE')
		ifTrue: [ ((aDictionary at: 'TYPE') collect: [ :each | each asLowercase]) asSet ]
		ifFalse: [ self defaultTypes ]).
]

{ #category : #'accessing-types' }
ICTypedObject class >> possibleTypes [
	^OrderedCollection
		with: self typeHome
		with: self typePreferred
		with: self typeWork
]

{ #category : #'accessing-types' }
ICTypedObject class >> typeHome [
	^'home'
]

{ #category : #'accessing-types' }
ICTypedObject class >> typePreferred [
	^'pref'
]

{ #category : #'accessing-types' }
ICTypedObject class >> typeWork [
	^'work'
]

{ #category : #'accessing-types' }
ICTypedObject >> addType: aString [
	^self types add: aString
]

{ #category : #'accessing-types' }
ICTypedObject >> beHome [
	self home: true
]

{ #category : #'accessing-types' }
ICTypedObject >> bePreferred [
	self preferred: true
]

{ #category : #'accessing-types' }
ICTypedObject >> beWork [
	self work: true
]

{ #category : #exporting }
ICTypedObject >> exportICalParametersOn: anExpoter [
	super exportICalParametersOn: anExpoter.
	self types sorted do: [ :each |
		anExpoter exportParameter: 'TYPE' value: each ]
]

{ #category : #'accessing-types' }
ICTypedObject >> home [
	^self types includes: self class typeHome
]

{ #category : #'accessing-types' }
ICTypedObject >> home: aBoolean [
	^self
		setType: self class typeHome
		toValue: aBoolean
]

{ #category : #'initialize-release' }
ICTypedObject >> initialize [
	super initialize.
	self types: self class defaultTypes
]

{ #category : #'accessing-types' }
ICTypedObject >> isHome [
	^self home
]

{ #category : #'accessing-types' }
ICTypedObject >> isPreferred [
	^self preferred
]

{ #category : #'accessing-types' }
ICTypedObject >> isWork [
	^self work
]

{ #category : #'accessing-types' }
ICTypedObject >> preferred [
	^self types includes: self class typePreferred
]

{ #category : #'accessing-types' }
ICTypedObject >> preferred: aBoolean [
	^self
		setType: self class typePreferred
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICTypedObject >> removeType: aString [
	^self types remove: aString ifAbsent: [ "ignore silentyl" ]
]

{ #category : #private }
ICTypedObject >> setType: aString toValue: aBoolean [
	^aBoolean
		ifTrue: [ self addType: aString ]
		ifFalse: [ self removeType: aString ]
]

{ #category : #accessing }
ICTypedObject >> types [
	^types
]

{ #category : #accessing }
ICTypedObject >> types: aCollection [ 
	types := aCollection
]

{ #category : #'accessing-types' }
ICTypedObject >> work [
	^self types includes: self class typeWork
]

{ #category : #'accessing-types' }
ICTypedObject >> work: aBoolean [
	^self
		setType: self class typeWork
		toValue: aBoolean
]
