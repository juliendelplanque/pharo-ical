"
An ICCategory has a title, a description and a color.

Every category is associated with a calendar and every event can be assoicated with a category. 
Default categories have the title: 'private' or  'buissness' and are stored on the class side.
"
Class {
	#name : #ICCategory,
	#superclass : #Object,
	#instVars : [
		'summary',
		'textualDescription',
		'color'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #'instance creation' }
ICCategory class >> fromICalString: aString parameters: aDictionary [
	self flag: #todo. "look up in calendar or something like that"
	^self summary: (String fromICalString: aString parameters: aDictionary)
]

{ #category : #'instance creation' }
ICCategory class >> fromVCardString: aString parameters: aDictionary [
	^self fromICalString: aString parameters: aDictionary
]

{ #category : #'instance creation' }
ICCategory class >> summary: aString [
	^self new
		summary: aString;
		yourself
]

{ #category : #comparing }
ICCategory >> = aCategory [
	^(aCategory isKindOf: ICCategory)
		and: [ self summary = aCategory summary ]
]

{ #category : #converting }
ICCategory >> asICalString [
	^self summary asICalString
]

{ #category : #accessing }
ICCategory >> color [
	^color
]

{ #category : #accessing }
ICCategory >> color: aColor [ 
	color := aColor
]

{ #category : #testing }
ICCategory >> hasColor [
	^self color notNil
]

{ #category : #testing }
ICCategory >> hasSummary [
	^self summary notNil
]

{ #category : #comparing }
ICCategory >> hash [
	^self summary hash
]

{ #category : #printing }
ICCategory >> printOn: aStream [
	super printOn: aStream.
	self hasSummary ifTrue: [
		aStream
			nextPut: $(;
			nextPutAll: self summary;
			nextPut: $) ]
]

{ #category : #accessing }
ICCategory >> summary [
	^summary
]

{ #category : #accessing }
ICCategory >> summary: anObject [
	summary := anObject
]

{ #category : #accessing }
ICCategory >> textualDescription [
	^textualDescription
]

{ #category : #accessing }
ICCategory >> textualDescription: aString [ 
	textualDescription := aString
]
