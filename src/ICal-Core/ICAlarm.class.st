"
I am the representation of a VALARM ical's object.

According to RFC 2445,
The purpose of this object is to: ""Provide a grouping of component properties that define an alarm"".
"
Class {
	#name : #ICAlarm,
	#superclass : #ICComponent,
	#instVars : [
		'action',
		'attachments',
		'delay',
		'repetitions',
		'textualDescription',
		'trigger',
		'attendees',
		'summary'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #'accessing-actions' }
ICAlarm class >> actionAudio [
	^'AUDIO'
]

{ #category : #'accessing-actions' }
ICAlarm class >> actionDisplay [
	^'DISPLAY'
]

{ #category : #'accessing-actions' }
ICAlarm class >> actionEmail [
	^'EMAIL'
]

{ #category : #'accessing-actions' }
ICAlarm class >> actionProcedure [
	^'PROCEDURE'
]

{ #category : #accessing }
ICAlarm class >> iCalType [
	^'VALARM'
]

{ #category : #'accessing-actions' }
ICAlarm class >> possibleActions [
	^Array
		with: self actionAudio
		with: self actionDisplay
		with: self actionEmail
		with: self actionProcedure
]

{ #category : #actions }
ICAlarm >> action [
	^action
]

{ #category : #actions }
ICAlarm >> action: anObject [
	action := anObject
]

{ #category : #accessing }
ICAlarm >> addAttachment: anAttachment [
	^self attachments add: anAttachment
]

{ #category : #accessing }
ICAlarm >> addAttendee: anAttendee [
	self attendees add: anAttendee
]

{ #category : #accessing }
ICAlarm >> addAttendees: someAttendees [
	self attendees addAll: someAttendees
]

{ #category : #accessing }
ICAlarm >> attachments [
	^attachments
]

{ #category : #accessing }
ICAlarm >> attachments: aCollection [ 
	attachments := aCollection
]

{ #category : #accessing }
ICAlarm >> attendees [
	^ attendees
]

{ #category : #accessing }
ICAlarm >> attendees: aCollectionOfAttendees [
	attendees := aCollectionOfAttendees
]

{ #category : #actions }
ICAlarm >> beAudio [
	self action: self class actionAudio
]

{ #category : #actions }
ICAlarm >> beDisplay [
	self action: self class actionDisplay
]

{ #category : #actions }
ICAlarm >> beEmail [
	self action: self class actionEmail
]

{ #category : #actions }
ICAlarm >> beProcedure [
	self action: self class actionProcedure
]

{ #category : #accessing }
ICAlarm >> delay [
	^delay
]

{ #category : #accessing }
ICAlarm >> delay: aDuration [ 
	delay := aDuration
]

{ #category : #accessing }
ICAlarm >> duration [
	^self delay
]

{ #category : #accessing }
ICAlarm >> duration: aDuration [ 
	self delay: aDuration
]

{ #category : #exporting }
ICAlarm >> exportOn: anExporter [	
	anExporter exportAction: self action.
	anExporter exportTrigger: self trigger.
	anExporter exportDuration: self delay.
	anExporter exportRepetition: self repetitions.		
	anExporter exportAttachments: self attachments.
	anExporter exportDescription: self textualDescription.
]

{ #category : #'initialize-release' }
ICAlarm >> initialize [
	super initialize.
	self attachments: OrderedCollection new.
	self attendees: OrderedCollection new
]

{ #category : #actions }
ICAlarm >> isAudio [
	^self action = self class actionAudio
]

{ #category : #actions }
ICAlarm >> isDisplay [
	^self action = self class actionDisplay
]

{ #category : #actions }
ICAlarm >> isEmail [
	^self action = self class actionEmail
]

{ #category : #actions }
ICAlarm >> isProcedure [
	^self action = self class actionProcedure
]

{ #category : #testing }
ICAlarm >> isValid [
	self notYetImplemented
]

{ #category : #accessing }
ICAlarm >> repetitions [
	^repetitions
]

{ #category : #accessing }
ICAlarm >> repetitions: anInteger [ 
	repetitions := anInteger
]

{ #category : #accessing }
ICAlarm >> summary [
	^ summary
]

{ #category : #accessing }
ICAlarm >> summary: anObject [
	summary := anObject
]

{ #category : #accessing }
ICAlarm >> textualDescription [
	^textualDescription
]

{ #category : #accessing }
ICAlarm >> textualDescription: aString [ 
	textualDescription := aString
]

{ #category : #accessing }
ICAlarm >> trigger [
	^trigger
]

{ #category : #accessing }
ICAlarm >> trigger: aTrigger [ 
	trigger := aTrigger
]
