Class {
	#name : #ICTimeTypeInformation,
	#superclass : #ICTypeInformation,
	#instVars : [
		'needsUtc'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #'instance creation' }
ICTimeTypeInformation class >> name: aString type: aClass multivalued: aBoolean [
	^self
		name: aString
		type: aClass
		multivalued: aBoolean
		utc: false
]

{ #category : #'instance creation' }
ICTimeTypeInformation class >> name: aString type: aClass multivalued: aBoolean utc: anotherBoolean [
	^self new
		name: aString;
		defaultType: aClass;
		multipleValuesPerLine: aBoolean;
		needsUtc: anotherBoolean;
		yourself
]

{ #category : #accessing }
ICTimeTypeInformation >> conversionSelector [
	^self needsUtc
		ifFalse: [ super conversionSelector ]
		ifTrue: [ #asICalUtcString ]
]

{ #category : #accessing }
ICTimeTypeInformation >> needsUtc [
	^needsUtc
]

{ #category : #accessing }
ICTimeTypeInformation >> needsUtc: anObject [
	needsUtc := anObject
]
