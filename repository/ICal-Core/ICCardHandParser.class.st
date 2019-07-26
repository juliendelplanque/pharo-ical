Class {
	#name : #ICCardHandParser,
	#superclass : #ICCalendarHandParser,
	#instVars : [
		'group'
	],
	#category : 'ICal-Core-VCard-Parser'
}

{ #category : #'instance creation' }
ICCardHandParser class >> parseVCardFile: aPath [
	^self parseVCardString: (FileStream readOnlyFileNamed: aPath) contentsOfEntireFile
]

{ #category : #'instance creation' }
ICCardHandParser class >> parseVCardStream: aStream [
	"don't ask it's Squeak"
	| string |
	string := String streamContents: [ :stream |
			[ aStream atEnd ]
				whileFalse: [ stream nextPut: aStream next ] ].
	aStream close.
	^self parseVCardString: string
]

{ #category : #'instance creation' }
ICCardHandParser class >> parseVCardString: aString [
	| parser |
	parser := self on: (ReadStream on: aString).
	parser generator: ICVCardGenerator new.
	parser parse.
	^parser product
]

{ #category : #parsing }
ICCardHandParser >> addParameter: paramName value: paramValue [
	| values |
	(self needsHackForOldFormat: paramName value: paramValue)
		ifTrue: [ ^ self parseHackForOldFormat: paramName value: paramValue ].
	(self isMultivalued: paramName)
		ifFalse: [ super addParameter: paramName value: paramValue ]
		ifTrue: [ values := self parameters
				at: paramName
				ifAbsentPut: [ OrderedCollection new ].
			(paramValue includes: $,)
				ifFalse: [ values add: paramValue ]
				ifTrue: [ values addAll: (paramValue substrings: #($,)) ] ]
]

{ #category : #accessing }
ICCardHandParser >> group [
	^group
]

{ #category : #accessing }
ICCardHandParser >> group: aString [ 
	group := aString
]

{ #category : #testing }
ICCardHandParser >> isMultivalued: aParameterName [
	^aParameterName = 'TYPE'
]

{ #category : #accessing }
ICCardHandParser >> name: aString [
	(aString includes: $.)
		ifFalse: [
			name := aString]
		ifTrue: [
			name := aString copyAfter: $. .
			self group: (aString copyUpTo: $.) ]
	
]

{ #category : #testing }
ICCardHandParser >> needsHackForOldFormat: aParameterName value: aParameterValue [
	^aParameterValue isEmptyOrNil
]

{ #category : #parsing }
ICCardHandParser >> parseHackForOldFormat: paramName value: paramValue [	
	paramName = 'BASE64'
		ifTrue: [
			self parameters at: 'ENCODING'put: 'B'.
			self parameters at: 'VALUE' put: ByteArray iCalType ]
		ifFalse: [
			self addParameter: 'TYPE' value: paramName ]
	
]

{ #category : #accessing }
ICCardHandParser >> parseName [
	self group: nil.
	super parseName
]

{ #category : #testing }
ICCardHandParser >> unfoldEquals [
	^ICCalendarVersion value < 3.0
]
