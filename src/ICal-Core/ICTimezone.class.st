"
I am the representation of a VTIMEZONE ical's object.

According to RFC 2445,
The purpose of this object is to ""provide a grouping of component properties that defines a time zone.""
"
Class {
	#name : #ICTimezone,
	#superclass : #ICComponent,
	#instVars : [
		'lastModified',
		'url',
		'id',
		'standardTimes',
		'daylightSavingTimes'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #accessing }
ICTimezone class >> iCalType [
	^'VTIMEZONE'
]

{ #category : #accessing }
ICTimezone >> addDaylightSavingTime: aDaylightSavingTime [
	self daylightSavingTimes add: aDaylightSavingTime
]

{ #category : #accessing }
ICTimezone >> addStandardTime: aStandardTime [
	self standardTimes add: aStandardTime
]

{ #category : #'double-dispatch' }
ICTimezone >> addToCalendar: aCalendar [
	aCalendar addTimezone: self
]

{ #category : #accessing }
ICTimezone >> daylightSavingTimes [
	^daylightSavingTimes
]

{ #category : #accessing }
ICTimezone >> daylightSavingTimes: aCollection [
	daylightSavingTimes := aCollection
]

{ #category : #accessing }
ICTimezone >> daylightSavingTimesDo: aBlock [
	self daylightSavingTimes do: aBlock
]

{ #category : #exporting }
ICTimezone >> exportOn: anExporter [
	anExporter exportTzid: self id.
	anExporter exportLastModified: self lastModified.
	anExporter exportTzurl: self url.
	self standardTimesDo: [ :each |
		anExporter export: each ].
	self daylightSavingTimesDo: [ :each |
		anExporter export: each ]
]

{ #category : #accessing }
ICTimezone >> id [
	^id
]

{ #category : #accessing }
ICTimezone >> id: aString [
	id := aString
]

{ #category : #'initialize-release' }
ICTimezone >> initialize [
	super initialize.
	self standardTimes: OrderedCollection new.
	self daylightSavingTimes: OrderedCollection new
]

{ #category : #testing }
ICTimezone >> isGloballyUnique [
	| solidus |
	solidus := Character value: 47.
	^self id includes: solidus
]

{ #category : #accessing }
ICTimezone >> lastModified [
	^lastModified
]

{ #category : #accessing }
ICTimezone >> lastModified: aDateAndTime [ 
	lastModified := aDateAndTime
]

{ #category : #printing }
ICTimezone >> printOn: aStream [
	super printOn: aStream.
	self id isNil ifFalse: [
		aStream
			nextPut: $(;
			nextPutAll: self id;
			nextPut: $) ]
]

{ #category : #accessing }
ICTimezone >> standardTimes [
	^standardTimes
]

{ #category : #accessing }
ICTimezone >> standardTimes: aCollection [
	standardTimes := aCollection
]

{ #category : #accessing }
ICTimezone >> standardTimesDo: aBlock [
	self standardTimes do: aBlock
]

{ #category : #accessing }
ICTimezone >> url [
	^url
]

{ #category : #accessing }
ICTimezone >> url: anUrl [
	url := anUrl
]
