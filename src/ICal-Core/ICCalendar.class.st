"
I am the representation of a iCalendar.

I contain:
- categories
- journals
- timezones
- todos
- events
- users
- free busy

It's possible to iterate over my events using
ICCalendar>>enventsDo: aBlock

You can do similar things with my others collections (todos, free busy, etc...).

You can instanciate me using:
- My class message name: 

Or get an instance of me generate from a file using ICCalendarHandParser>>parseCalendarFile: aFilePath
"
Class {
	#name : #ICCalendar,
	#superclass : #ICComponent,
	#instVars : [
		'categories',
		'events',
		'freeBusy',
		'journals',
		'method',
		'productId',
		'textualDescription',
		'timezones',
		'todos',
		'users',
		'version',
		'name'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #accessing }
ICCalendar class >> iCalType [
	^'VCALENDAR'
]

{ #category : #constants }
ICCalendar class >> methodAdd [
	^'ADD'
]

{ #category : #constants }
ICCalendar class >> methodCancel [
	^'CANCEL'
]

{ #category : #constants }
ICCalendar class >> methodCounter [
	^'COUNTER'
]

{ #category : #constants }
ICCalendar class >> methodDeclineCounter [
	^'DECLINE-COUNTER'
]

{ #category : #constants }
ICCalendar class >> methodPublish [
	^'PUBLISH'
]

{ #category : #constants }
ICCalendar class >> methodRefresh [
	^'REFRESH'
]

{ #category : #constants }
ICCalendar class >> methodReply [
	^'REPLY'
]

{ #category : #constants }
ICCalendar class >> methodRequest [
	^'REQUEST'
]

{ #category : #'instance creation' }
ICCalendar class >> name: aString [
	^self new
		name: aString;
		yourself
]

{ #category : #accessing }
ICCalendar class >> productId [
	^'-//Squeak-iCalendar//-'
]

{ #category : #categories }
ICCalendar >> addCategory: aCategory [
	self categories add: aCategory
]

{ #category : #actions }
ICCalendar >> addComponent: aComponent [
	aComponent addToCalendar: self
]

{ #category : #events }
ICCalendar >> addEvent: anEvent [ 
	self events add: anEvent
]

{ #category : #freebusy }
ICCalendar >> addFreeBusy: aFreeBusy [
	self freeBusy add: aFreeBusy
]

{ #category : #journals }
ICCalendar >> addJournal: aJournal [
	self journals add: aJournal
]

{ #category : #timezones }
ICCalendar >> addTimezone: aTimezone [
	self timezones add: aTimezone
]

{ #category : #todos }
ICCalendar >> addTodo: aTodo [
	self todos add: aTodo
]

{ #category : #users }
ICCalendar >> addUser: aUser [
	self users add: aUser
]

{ #category : #actions }
ICCalendar >> beICalendar [
	self version: self iCalendarVersion 
]

{ #category : #actions }
ICCalendar >> beVCalendar [
	self version: self vCalendarVersion 
]

{ #category : #categories }
ICCalendar >> categories [
	^categories
]

{ #category : #categories }
ICCalendar >> categories: aCollection [
	categories := aCollection
]

{ #category : #categories }
ICCalendar >> categoryWithSummary: aString [
	^self categories detect: [ :each | each summary = aString]
]

{ #category : #accessing }
ICCalendar >> componentForDate: aDate [
	^Array streamContents: [ :array |
		array
			nextPutAll: (self eventsForDate: aDate);
			nextPutAll: (self todosForDate: aDate) ]
]

{ #category : #accessing }
ICCalendar >> components [
	^Array streamContents: [ :stream |
		stream
			nextPutAll: self events;
			nextPutAll: self todos;
			nextPutAll: self journals;
			nextPutAll: self timezones;
			nextPutAll: self freeBusy ]
]

{ #category : #accessing }
ICCalendar >> componentsDo: aBlock [
	self eventsDo: aBlock.
	self todosDo: aBlock.
	self journalsDo: aBlock.
	self timezonesDo: aBlock.
	self freeBusyDo: aBlock
]

{ #category : #events }
ICCalendar >> eventWithUid: anUid [
	^self events detect: [ :each | each uid = anUid ]
]

{ #category : #events }
ICCalendar >> events [
	^events
]

{ #category : #events }
ICCalendar >> events: aCollection [
	events := aCollection
]

{ #category : #events }
ICCalendar >> eventsDo: aBlock [
	self events do: aBlock
]

{ #category : #events }
ICCalendar >> eventsForDate: aDate [ 
	^self events select: [ :each | each isValidForDate: aDate]
]

{ #category : #events }
ICCalendar >> eventsForDateAndTime: aDateAndTime [ 
	^self events select: [ :each | each startsInHour: aDateAndTime]
]

{ #category : #exporting }
ICCalendar >> exportOn: anExporter [
	anExporter exportProductId: self productId.
	anExporter exportVersion: self version.
	anExporter exportCalendarName: self name.
	anExporter exportMethod: self method.
	self componentsDo: [ :each |
		anExporter export: each ]
]

{ #category : #freebusy }
ICCalendar >> freeBusy [
	^freeBusy
]

{ #category : #freebusy }
ICCalendar >> freeBusy: aCollection [ 
	freeBusy := aCollection
]

{ #category : #freebusy }
ICCalendar >> freeBusyDo: aBlock [
	self freeBusy do: aBlock
]

{ #category : #'accessing-constants' }
ICCalendar >> iCalendarVersion [
	^2.0
]

{ #category : #testing }
ICCalendar >> includesComponentWithUid: aString [ 
	^(self includesEventWithUid: aString)
		or: [ (self includesTodoWithUid: aString)
		or: [ (self includesJournalWithUid: aString)
		or: [ (self includesFreeBusyWithUid: aString)
		or: [ self includesTimezoneWithUid: aString ] ] ] ]
]

{ #category : #events }
ICCalendar >> includesEventWithUid: aString [ 
	^self events anySatisfy: [:each | each uid = aString]
]

{ #category : #freebusy }
ICCalendar >> includesFreeBusyWithUid: aString [ 
	^self freeBusy anySatisfy: [:each | each uid = aString]
]

{ #category : #journals }
ICCalendar >> includesJournalWithUid: aString [ 
	^self journals anySatisfy: [:each | each uid = aString]
]

{ #category : #timezones }
ICCalendar >> includesTimezoneWithUid: aString [
	^self timezones anySatisfy: [ :each | each uid = aString ]
]

{ #category : #todos }
ICCalendar >> includesTodoWithUid: aString [ 
	^self todos anySatisfy: [:each | each uid = aString]
]

{ #category : #'initialize-release' }
ICCalendar >> initialize [
	super initialize.

	self beICalendar.
	self categories: OrderedCollection new.
	self journals: OrderedCollection new.
	self timezones: OrderedCollection new.
	self todos: (SortedCollection sortBlock: [:td1 :td2 | td1 due < td2 due ]).
	self events: (SortedCollection sortBlock: [:e1 :e2 | e1 start < e2 start ]).
	self users: OrderedCollection new.
	self freeBusy: (SortedCollection sortBlock: [:fb1 :fb2 | fb1 start < fb2 start ]).
	self productId: self class productId.
	self method: self class methodPublish
]

{ #category : #journals }
ICCalendar >> journals [
	^journals
]

{ #category : #journals }
ICCalendar >> journals: aCollection [ 
	journals := aCollection
]

{ #category : #journals }
ICCalendar >> journalsDo: aBlock [
	self journals do: aBlock
]

{ #category : #accessing }
ICCalendar >> method [
	^method
]

{ #category : #accessing }
ICCalendar >> method: aString [ 
	method := aString
]

{ #category : #accessing }
ICCalendar >> name [
	^name
]

{ #category : #accessing }
ICCalendar >> name: aString [
	name := aString
]

{ #category : #printing }
ICCalendar >> printOn: aStream [
	super printOn: aStream.
	self name isNil ifFalse: [
		aStream
			nextPut: $(;
			nextPutAll: self name;
			nextPut: $) ]
]

{ #category : #accessing }
ICCalendar >> productId [
	^productId
]

{ #category : #accessing }
ICCalendar >> productId: anObject [
	productId := anObject
]

{ #category : #categories }
ICCalendar >> removeCategory: aCategory [
	^self categories remove: aCategory
]

{ #category : #testing }
ICCalendar >> removeComponentWithUid: aString [
	(self includesEventWithUid: aString)
		ifTrue: [ ^self removeEventWithUid: aString ].
	(self includesTodoWithUid: aString)
		ifTrue: [ ^self removeTodoWithUid: aString ].
	(self includesJournalWithUid: aString)
		ifTrue: [ ^self removeJournalWithUid: aString  ].
	(self includesFreeBusyWithUid: aString)
		ifTrue: [ ^self removeJournalWithUid: aString ].
	(self includesTimezoneWithUid: aString)
		ifTrue: [ ^self removeTimezoneWithUid: aString ]
]

{ #category : #events }
ICCalendar >> removeEvent: anEvent [ 
	^self events remove: anEvent
]

{ #category : #events }
ICCalendar >> removeEventWithUid: aString [
	| event |
	event := self events detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeEvent: event.
	
]

{ #category : #freebusy }
ICCalendar >> removeFreeBusy: aFreebusy [
	^self freeBusy remove: aFreebusy
]

{ #category : #freebusy }
ICCalendar >> removeFreeBusyWithUid: aString [
	| freebusy |
	freebusy := self freeBusy detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeFreeBusy: freebusy.
	
]

{ #category : #journals }
ICCalendar >> removeJournal: aJournal [
	^self journals remove: aJournal
]

{ #category : #journals }
ICCalendar >> removeJournalWithUid: aString [
	| journal |
	journal := self journals detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeEvent: journal.
	
]

{ #category : #timezones }
ICCalendar >> removeTimezone: aTimezone [
	^self timezones remove: aTimezone
]

{ #category : #timezones }
ICCalendar >> removeTimezoneWithUid: aString [
	| timezone |
	timezone := self timezones detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeTimezone: timezone.
	
]

{ #category : #todos }
ICCalendar >> removeTodo: aTodo [
	^self todos remove: aTodo
]

{ #category : #todos }
ICCalendar >> removeTodoWithUid: aString [
	| todo |
	todo := self todos detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeTodo: todo.
]

{ #category : #accessing }
ICCalendar >> textualDescription [
	^textualDescription
]

{ #category : #accessing }
ICCalendar >> textualDescription: aString [ 
	textualDescription := aString
]

{ #category : #timezones }
ICCalendar >> timezoneAt: aTzid [
	^self timezones
		detect: [ :each |
			(each id compare: aTzid caseSensitive: false) = 2 ]
		ifNone: [ nil ]
]

{ #category : #timezones }
ICCalendar >> timezones [
	^timezones
]

{ #category : #timezones }
ICCalendar >> timezones: aTimezone [ 
	timezones := aTimezone
]

{ #category : #timezones }
ICCalendar >> timezonesDo: aBlock [
	self timezones do: aBlock
]

{ #category : #todos }
ICCalendar >> todoWithUid: anUid [
	^self todos detect: [ :each | each uid = anUid ]
]

{ #category : #todos }
ICCalendar >> todos [
	^todos
]

{ #category : #todos }
ICCalendar >> todos: aCollection [ 
	todos := aCollection
]

{ #category : #todos }
ICCalendar >> todosDo: aBlock [
	self todos do: aBlock
]

{ #category : #todos }
ICCalendar >> todosForDate: aDate [ 
	^self todos select: [ :each | each isValidForDate: aDate]
]

{ #category : #todos }
ICCalendar >> todosForDateAndTime: aDateAndTime [ 
	^self todos select: [ :each | each startsInHour: aDateAndTime]
]

{ #category : #users }
ICCalendar >> users [
	^users
]

{ #category : #users }
ICCalendar >> users: aCollection [ 
	users := aCollection
]

{ #category : #users }
ICCalendar >> usersDo: aBlock [
	self users do: aBlock
]

{ #category : #'accessing-constants' }
ICCalendar >> vCalendarVersion [
	^2.0
]

{ #category : #accessing }
ICCalendar >> version [
	^version
]

{ #category : #accessing }
ICCalendar >> version: aFloat [ 
	version := aFloat
]
