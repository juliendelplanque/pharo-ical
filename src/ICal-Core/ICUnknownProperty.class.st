"
This class represents an unknown property that is to say a custom property not defined in the RFC.
"
Class {
	#name : #ICUnknownProperty,
	#superclass : #Object,
	#instVars : [
		'name',
		'value',
		'parameters'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #'initialize-release' }
ICUnknownProperty >> initialize [
	super initialize.
	self parameters: Dictionary new
]

{ #category : #accessing }
ICUnknownProperty >> name [
	^name
]

{ #category : #accessing }
ICUnknownProperty >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ICUnknownProperty >> parameters [
	^parameters
]

{ #category : #accessing }
ICUnknownProperty >> parameters: aCollection [ 
	parameters := aCollection
]

{ #category : #printing }
ICUnknownProperty >> printOn: aStream [
	super printOn: aStream.
	self name ifNotNil: [
		aStream
			nextPut: $(;
			nextPutAll: self name;
			nextPut: $) ]
]

{ #category : #accessing }
ICUnknownProperty >> value [
	^value
]

{ #category : #accessing }
ICUnknownProperty >> value: anObject [
	value := anObject
]
