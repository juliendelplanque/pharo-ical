"
I am the representation of a DURATION ical's object.

According to RFC 2445, the purpose of this object is: ""This value type is used to identify properties that contain a duration of time"".
"
Class {
	#name : #ICTrigger,
	#superclass : #Object,
	#instVars : [
		'related',
		'value'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #'instance creation' }
ICTrigger class >> fromICalString: aString parameters: aDictionary [
	| related valueType value |
	related := aDictionary at: 'RELATED' ifAbsent: [ self relatedToStart ].
	valueType := aDictionary at: 'VALUE' ifAbsent: [ Duration iCalType ].
	value := (ICConversion propertyClassFor: valueType) fromICalString: aString.
	^self new
		related: related;
		value: value;
		yourself
]

{ #category : #accessing }
ICTrigger class >> iCalType [
	^ 'DURATION'
]

{ #category : #'accessing-related' }
ICTrigger class >> relatedToEnd [
	^'END'
]

{ #category : #'accessing-related' }
ICTrigger class >> relatedToStart [
	^'START'
]

{ #category : #converting }
ICTrigger >> asICalString [
	^self value asICalString
]

{ #category : #testing }
ICTrigger >> beRelatedToEnd [
	self related: self class relatedToEnd
]

{ #category : #testing }
ICTrigger >> beRelatedToStart [
	self related: self class relatedToStart
]

{ #category : #exporting }
ICTrigger >> exportICalParametersOn: anExpoter [
	super exportICalParametersOn: anExpoter.
	self related isNil ifFalse: [
		anExpoter exportParameter: 'RELATED' value: self related ]
]

{ #category : #accessing }
ICTrigger >> iCalType [
	^self value isNil
		ifTrue: [ self class iCalType ]
		ifFalse: [ self value iCalType ]
]

{ #category : #testing }
ICTrigger >> isRelatedToEnd [
	^self related = self class relatedToEnd
]

{ #category : #testing }
ICTrigger >> isRelatedToStart [
	^self related = self class relatedToStart
		or: [ self related isNil ]
]

{ #category : #accessing }
ICTrigger >> related [
	^related
]

{ #category : #accessing }
ICTrigger >> related: aString [ 
	related := aString
]

{ #category : #accessing }
ICTrigger >> value [
	^value
]

{ #category : #accessing }
ICTrigger >> value: aDurationOrDateAndTime [ 
	value := aDurationOrDateAndTime
]
