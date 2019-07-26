"
I am the representation of a VTODO ical's object.

According to RFC 2445,
The purpose of this object is to ""provide a grouping of calendar properties that describe a to-do"".

Description: A ""VTODO"" calendar component is a grouping of component
properties and possibly ""VALARM"" calendar components that represent
an action-item or assignment. For example, it can be used to
represent an item of work assigned to an individual; such as ""turn in
travel expense today"".

The ""VTODO"" calendar component cannot be nested within another
calendar component. However, ""VTODO"" calendar components can be
related to each other or to a ""VTODO"" or to a ""VJOURNAL"" calendar
component with the ""RELATED-TO"" property.

"
Class {
	#name : #ICTodo,
	#superclass : #ICJob,
	#instVars : [
		'completed',
		'due',
		'percentComplete'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #accessing }
ICTodo class >> iCalType [
	^'VTODO'
]

{ #category : #accessing }
ICTodo class >> possibleStati [
	^super possibleStati
		add: self statusInProcess;
		add: self statusNeedsAction;
		add: self statusCompleted;
		yourself
]

{ #category : #accessing }
ICTodo class >> statusCompleted [
	^'COMPLETED'
]

{ #category : #accessing }
ICTodo class >> statusInProcess [
	^'IN-PROCESS'
]

{ #category : #accessing }
ICTodo class >> statusNeedsAction [
	^'NEEDS-ACTION'
]

{ #category : #'double-dispatch' }
ICTodo >> addToCalendar: aCalendar [
	aCalendar addTodo: self
]

{ #category : #status }
ICTodo >> beCompleted [
	self status: self class statusCompleted
]

{ #category : #status }
ICTodo >> beInProcess [
	self status: self class statusInProcess 
]

{ #category : #status }
ICTodo >> beNeedsAction [
	self status: self class statusNeedsAction
]

{ #category : #accessing }
ICTodo >> completed [
	^completed
]

{ #category : #accessing }
ICTodo >> completed: aDateAndTime [ 
	completed := aDateAndTime.
	aDateAndTime ifNotNil: [
		self beCompleted ]
]

{ #category : #accessing }
ICTodo >> due [
	^due
]

{ #category : #accessing }
ICTodo >> due: aDateAndTime [
	
	due := aDateAndTime
]

{ #category : #exporting }
ICTodo >> exportOn: anExporter [
	super exportOn: anExporter.
	anExporter exportCompleted: self completed.
	anExporter exportPercentComplete: self percentComplete.
	anExporter exportDue: self due	
	
]

{ #category : #status }
ICTodo >> isCompleted [
	^self status = self class statusCompleted.
	
]

{ #category : #status }
ICTodo >> isInProcess [
	^self status = self class statusInProcess 
]

{ #category : #status }
ICTodo >> isNeedsAction [
	^self status = self class statusNeedsAction
]

{ #category : #testing }
ICTodo >> isValidForDate: aDate [
	^self due asDate = aDate.
]

{ #category : #accessing }
ICTodo >> percentComplete [
	^percentComplete
]

{ #category : #accessing }
ICTodo >> percentComplete: anInteger [ 
	"anInteger is an integer between 0 and 100
	e.g 70 means 70% complete"

	percentComplete := anInteger
]

{ #category : #testing }
ICTodo >> startsInHour: aDateAndTime [
	^ self due between: aDateAndTime and: aDateAndTime + (self durationClass seconds: 3600)
]

{ #category : #actions }
ICTodo >> updateEventWith: anEventOrCommand [ 
	super updateEventWith: anEventOrCommand.
	self due: anEventOrCommand due.

	anEventOrCommand isCompleted
		ifTrue: [
			self beCompleted.
			anEventOrCommand completed isNil
				ifTrue: [ self completed: self dateAndTimeClass now ]
				ifFalse: [ self completed: anEventOrCommand completed ]
		]
]
