Class {
	#name : #ICTime,
	#superclass : #ICComponent,
	#instVars : [
		'recurrenceRules',
		'recurrenceDates',
		'start',
		'names',
		'comments',
		'offsetFrom',
		'offsetTo'
	],
	#category : 'ICal-Core-Abstract'
}

{ #category : #adding }
ICTime >> addComment: aString [
	^self comments add: aString
]

{ #category : #adding }
ICTime >> addName: aString [
	^self names add: aString
]

{ #category : #adding }
ICTime >> addRecurrenceDate: aDateAndTime [
	^self recurrenceDates add: aDateAndTime
]

{ #category : #adding }
ICTime >> addRecurrenceRule: aRecurrenceRule [
	^self recurrenceRules add: aRecurrenceRule
]

{ #category : #accessing }
ICTime >> comments [
	^comments
]

{ #category : #accessing }
ICTime >> comments: aCollection [ 
	comments := aCollection
]

{ #category : #exporting }
ICTime >> exportOn: anExporter [
	anExporter exportStart: self start.
	anExporter exportRecurrenceRules: self recurrenceRules.
	anExporter exportRecurrenceDates: self recurrenceDates.
	anExporter exportOffsetFrom: self offsetFrom.
	anExporter exportOffsetTo: self offsetTo.
	anExporter exportComments: self comments.
	anExporter exportTimezoneNames: self names.
]

{ #category : #'initialize-release' }
ICTime >> initialize [
	super initialize.
	self comments: OrderedCollection new.
	self names: OrderedCollection new.
	self recurrenceRules: OrderedCollection new.
	self recurrenceDates: OrderedCollection new.
]

{ #category : #accessing }
ICTime >> names [
	^names
]

{ #category : #accessing }
ICTime >> names: aCollection [
	names := aCollection
]

{ #category : #accessing }
ICTime >> offsetFrom [
	^offsetFrom
]

{ #category : #accessing }
ICTime >> offsetFrom: aUtcOffset [
	offsetFrom := aUtcOffset
]

{ #category : #accessing }
ICTime >> offsetTo [
	^offsetTo
]

{ #category : #accessing }
ICTime >> offsetTo: aUtcOffset [
	offsetTo := aUtcOffset
]

{ #category : #accessing }
ICTime >> recurrenceDates [
	^recurrenceDates
]

{ #category : #accessing }
ICTime >> recurrenceDates: aCollection [ 
	recurrenceDates := aCollection
]

{ #category : #accessing }
ICTime >> recurrenceRules [
	^recurrenceRules
]

{ #category : #accessing }
ICTime >> recurrenceRules: aCollection [ 
	recurrenceRules := aCollection
]

{ #category : #accessing }
ICTime >> start [
	^start
]

{ #category : #accessing }
ICTime >> start: aDateAndTime [ 
	start := aDateAndTime
]
