Class {
	#name : #ICInstantMessageId,
	#superclass : #ICTypedObject,
	#instVars : [
		'id'
	],
	#category : 'ICal-Core-VCard-Model'
}

{ #category : #'accessing-types' }
ICInstantMessageId class >> defaultTypes [
	^#()
]

{ #category : #'instance creation' }
ICInstantMessageId class >> fromICalString: aString parameters: aDictionary [
	| instance |
	instance := self new.
	instance types: (self parseTypes: aDictionary).
	instance id: (String fromICalString: aString  parameters: aDictionary).
	^instance
]

{ #category : #converting }
ICInstantMessageId >> asVCardString [
	^self id asVCardString
]

{ #category : #accessing }
ICInstantMessageId >> id [
	^id
]

{ #category : #accessing }
ICInstantMessageId >> id: aString [ 
	id := aString
]
