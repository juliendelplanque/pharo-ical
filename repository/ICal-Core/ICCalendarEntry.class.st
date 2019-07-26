Class {
	#name : #ICCalendarEntry,
	#superclass : #ICComponent,
	#instVars : [
		'comments',
		'url',
		'uid',
		'stamp'
	],
	#classVars : [
		'UidStrategy'
	],
	#category : 'ICal-Core-Abstract'
}

{ #category : #'class initialization' }
ICCalendarEntry class >> initialize [
	"self initialize"
	self uidStrategy: self selectStrategy
]

{ #category : #'class initialization' }
ICCalendarEntry class >> selectStrategy [
	^ICSqueakUUIDStrategy new
]

{ #category : #accessing }
ICCalendarEntry class >> uidStrategy [
	^UidStrategy
]

{ #category : #accessing }
ICCalendarEntry class >> uidStrategy: aStrategy [
	UidStrategy := aStrategy
]

{ #category : #comparing }
ICCalendarEntry >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ uid = anObject uid
]

{ #category : #accessing }
ICCalendarEntry >> addComment: aString [
	^self comments add: aString
]

{ #category : #accessing }
ICCalendarEntry >> comments [
	^comments
]

{ #category : #accessing }
ICCalendarEntry >> comments: aCollection [ 
	comments := aCollection
]

{ #category : #exporting }
ICCalendarEntry >> exportOn: anExporter [
	anExporter exportUid: self uid.
	anExporter exportUrl: self url.
	anExporter exportComments: self comments.
	anExporter exportStamp: self stamp
]

{ #category : #private }
ICCalendarEntry >> generateUid [
	^self uidStrategy generateUid
]

{ #category : #comparing }
ICCalendarEntry >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ uid hash
]

{ #category : #'initialize-release' }
ICCalendarEntry >> initialize [
	super initialize.
	self uid: self generateUid.
	self comments: OrderedCollection new
]

{ #category : #accessing }
ICCalendarEntry >> stamp [
	^stamp
]

{ #category : #accessing }
ICCalendarEntry >> stamp: aDateAndTime [ 
	stamp := aDateAndTime
]

{ #category : #accessing }
ICCalendarEntry >> uid [
	^uid
]

{ #category : #accessing }
ICCalendarEntry >> uid: aString [ 
	uid := aString
]

{ #category : #accessing }
ICCalendarEntry >> uidStrategy [
	^UidStrategy
]

{ #category : #accessing }
ICCalendarEntry >> uidStrategy: aStrategy [
	UidStrategy := aStrategy
]

{ #category : #accessing }
ICCalendarEntry >> url [
	^url
]

{ #category : #accessing }
ICCalendarEntry >> url: aUrl [ 
	url := aUrl
]
