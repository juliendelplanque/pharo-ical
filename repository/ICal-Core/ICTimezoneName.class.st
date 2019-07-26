"
This object is used to define the name of a Timezone.
"
Class {
	#name : #ICTimezoneName,
	#superclass : #Object,
	#instVars : [
		'language',
		'text'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #'instance creation' }
ICTimezoneName class >> fromICalString: aString parameters: aDictionary [
	^self new
		language: (aDictionary at: 'LANGUAGE' ifAbsent: [ nil ]);
		text: aString;
		yourself
]

{ #category : #accessing }
ICTimezoneName class >> iCalType [
	^ 'TEXT'
]

{ #category : #converting }
ICTimezoneName >> asICalString [
	^self name asICalString
]

{ #category : #exporting }
ICTimezoneName >> exportICalParametersOn: anExpoter [
	super exportICalParametersOn: anExpoter.
	self language isNil ifFalse: [
		anExpoter exportParameter: 'LANGUAGE' value: self language ]
]

{ #category : #accessing }
ICTimezoneName >> language [
	^language
]

{ #category : #accessing }
ICTimezoneName >> language: aString [
	language := aString
]

{ #category : #printing }
ICTimezoneName >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	
	self language isNil ifFalse: [
		aStream
			nextPutAll: self language;
			nextPut: $: ].
	
	aStream
		nextPutAll: self text;
		nextPut: $)
]

{ #category : #accessing }
ICTimezoneName >> text [
	^text
]

{ #category : #accessing }
ICTimezoneName >> text: aString [
	text := aString
]
