Class {
	#name : #ICTypeInformation,
	#superclass : #Object,
	#instVars : [
		'name',
		'defaultType',
		'multipleValuesPerLine'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #'instance creation' }
ICTypeInformation class >> name: aString type: aClass multivalued: aBoolean [
	^self new
		name: aString;
		defaultType: aClass;
		multipleValuesPerLine: aBoolean;
		yourself
]

{ #category : #accessing }
ICTypeInformation >> conversionSelector [
	^#asICalString
]

{ #category : #converting }
ICTypeInformation >> convert: anObject [
	^anObject perform: self conversionSelector
]

{ #category : #accessing }
ICTypeInformation >> defaultType [
	^defaultType
]

{ #category : #accessing }
ICTypeInformation >> defaultType: aClass [ 
	defaultType := aClass
]

{ #category : #accessing }
ICTypeInformation >> multipleValuesPerLine [
	^multipleValuesPerLine
]

{ #category : #accessing }
ICTypeInformation >> multipleValuesPerLine: aBoolean [ 
	multipleValuesPerLine := aBoolean
]

{ #category : #accessing }
ICTypeInformation >> name [
	^name
]

{ #category : #accessing }
ICTypeInformation >> name: aString [ 
	name := aString
]

{ #category : #accessing }
ICTypeInformation >> needsUtc [
	^false
]
