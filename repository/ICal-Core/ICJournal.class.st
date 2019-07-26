"
I am the representation of a VJOURNAL ical's object.

According to RFC 2445,
The purpose of this object is to: ""Provide a grouping of component properties that describe a journal entry.""
"
Class {
	#name : #ICJournal,
	#superclass : #ICViewableCalendarEntry,
	#instVars : [
		'textualDescriptions'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #accessing }
ICJournal class >> iCalType [
	^'VJOURNAL'
]

{ #category : #'accessing-stati' }
ICJournal class >> possibleStati [
	^super possibleStati
		add: self statusDraft;
		add: self statusFinal;
		yourself
]

{ #category : #'accessing-stati' }
ICJournal class >> statusDraft [
	^'DRAFT'
]

{ #category : #'accessing-stati' }
ICJournal class >> statusFinal [
	^'FINAL'
]

{ #category : #adding }
ICJournal >> addTextualDescription: aString [
	self textualDescriptions add: aString
]

{ #category : #'double-dispatch' }
ICJournal >> addToCalendar: aCalendar [
	aCalendar addJournal: self
]

{ #category : #status }
ICJournal >> beDraft [
	self status: self class statusDraft
]

{ #category : #status }
ICJournal >> beFinal [
	self status: self class statusFinal
]

{ #category : #exporting }
ICJournal >> exportOn: anExporter [
	super exportOn: anExporter.
	anExporter exportDescription: self textualDescriptions
]

{ #category : #'initialize-release' }
ICJournal >> initialize [
	super initialize.
	self textualDescriptions: OrderedCollection new
]

{ #category : #status }
ICJournal >> isDraft [
	^self status = self class statusDraft
]

{ #category : #status }
ICJournal >> isFinal [
	^self status = self class statusFinal
]

{ #category : #accessing }
ICJournal >> textualDescriptions [
	^textualDescriptions
]

{ #category : #accessing }
ICJournal >> textualDescriptions: aCollection [ 
	textualDescriptions := aCollection
]
