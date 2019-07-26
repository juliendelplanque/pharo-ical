Class {
	#name : #ICEventTest,
	#superclass : #ICTest,
	#instVars : [
		'appointment1',
		'appointment2',
		'todo',
		'eventSerie',
		'calendar'
	],
	#category : 'ICal-Tests-Core'
}

{ #category : #running }
ICEventTest >> setUp [
	| category |
	calendar := ICCalendar new.
	appointment1 := ICEvent summary: 'diner'.
	category := ICCategory summary: 'friends'.
	appointment1 addCategory: category.
	appointment1 uid: 'app1'.
	appointment1
		start: (self dateAndTimeClass 
					year: 2005
					month: 5
					day: 18
					hour: 17
					minute: 0
					second: 0);
		end: (self dateAndTimeClass 
					year: 2005
					month: 5
					day: 18
					hour: 20
					minute: 0
					second: 0).
	appointment1 beLowPriority.
	appointment1 location: 'in nature'.
	appointment2 := ICEvent summary: 'running'.
	appointment2 uid: 'app2'.
	appointment2
		start: (self dateAndTimeClass 
					year: 2005
					month: 6
					day: 12
					hour: 8
					minute: 30
					second: 0);
		end: (self dateAndTimeClass 
					year: 2005
					month: 6
					day: 12
					hour: 9
					minute: 40
					second: 0).
	todo := ICTodo summary: 'clean the living-room'.
	todo uid: 'todo1'.
	todo due: (self dateAndTimeClass now + (self durationClass days: 4 hours: 0 minutes: 0 seconds: 0)).
	calendar addEvent: appointment1.
	calendar addEvent: appointment2.
	calendar addTodo: todo
]

{ #category : #testing }
ICEventTest >> testHours [
  self assert: (appointment1 hours asInteger = 3).
  self assert: (appointment2 hours = (1 +(1/6)) asFloat).
   
]

{ #category : #testing }
ICEventTest >> testIDs [
	| aTodo |
	self assert: appointment1 uid = 'app1'.
	self assert: appointment2 uid = 'app2'.
	self assert: todo uid = 'todo1'.
	calendar addTodo: (
		ICTodo new
			summary: 'cleaning';
			uid: 'todo2';
			due: DateAndTime tomorrow;
			yourself).
	aTodo := ICTodo summary: 'shopping'.
	aTodo
		uid: 'todo3';
		due: DateAndTime tomorrow.
	calendar addTodo: aTodo.
	self assert: aTodo uid = 'todo3'.
	self assert: (calendar eventWithUid: 'app1') == appointment1.
	self assert: (calendar todoWithUid: 'todo2') summary = 'cleaning'
]

{ #category : #testing }
ICEventTest >> testInitialize [
	| anAppointment |
	anAppointment := ICEvent summary: 'physical test'.
	self assert: anAppointment summary = 'physical test'.
	self assert: anAppointment textualDescription isNil.
	self assert: anAppointment lastModified isNil.
	self assert: anAppointment isMediumPriority
]

{ #category : #testing }
ICEventTest >> testIsBefore [
	self assert: appointment1 <= appointment2
]

{ #category : #testing }
ICEventTest >> testStati [
	| stati |
	stati := ICEvent possibleStati asSet.
	self assert: stati size = 3.
	self assert: (stati includes: ICEvent statusCanceled).
	self assert: (stati includes: ICEvent statusConfirmed).
	self assert: (stati includes: ICEvent statusTentative).
	stati := ICTodo possibleStati asSet.
	self assert: stati size = 4.
	self assert: (stati includes: ICTodo statusCanceled).
	self assert: (stati includes: ICTodo statusNeedsAction).
	self assert: (stati includes: ICTodo statusInProcess).
	self assert: (stati includes: ICTodo statusCompleted).
	stati := ICJournal possibleStati asSet.
	self assert: stati size = 3.
	self assert: (stati includes: ICJournal statusCanceled).
	self assert: (stati includes: ICJournal statusDraft).
	self assert: (stati includes: ICJournal statusFinal)
]

{ #category : #testing }
ICEventTest >> testTesting [

  self deny: (appointment1 isFullDayEvent).
  self deny: (appointment1 isRecurrent).

  self deny: (todo isRecurrent).

  self assert: (appointment1 isValidForDate: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 18)).
							
   self assert: (todo startsInHour: todo due - (self durationClass days: 0 hours: 0 minutes: 0 seconds: 1)).
]

{ #category : #testing }
ICEventTest >> testTransparency [
	self assert: ICEvent new isTransparent
]

{ #category : #testing }
ICEventTest >> testUpdateAppointment [
	| appEvent |
	appEvent := ICEvent summary: 'meeting'.
	appEvent start: DateAndTime today; end: DateAndTime tomorrow.
	calendar addEvent: appEvent.
	appEvent updateEventWith: appointment1.
	self assert: appEvent summary = appointment1 summary.
	self assert: appEvent categories = appointment1 categories.
	self assert: appEvent textualDescription = appointment1 textualDescription.
	self assert: appEvent status = appointment1 status.
	self assert: appEvent priority = appointment1 priority.
	self assert: appEvent created = appointment1 created.
	self assert: appEvent lastModified = appointment1 lastModified.
	self assert: appEvent sequenceNumber = appointment1 sequenceNumber.
	self assert: appEvent start = appointment1 start.
	self assert: appEvent end = appointment1 end.
]

{ #category : #testing }
ICEventTest >> testUpdateToDo [
	| todoEvent |
	todoEvent := ICTodo summary: 'todo'.
	todoEvent updateEventWith: todo.
	self assert: todoEvent summary = todo summary.
	self assert: todoEvent categories = todo categories.
	self assert: todoEvent textualDescription = todo textualDescription.
	self assert: todoEvent status = todo status.
	self assert: todoEvent priority = todo priority.
	self assert: todoEvent created = todo created.
	self assert: todoEvent lastModified = todo lastModified.
	self assert: todoEvent sequenceNumber = todo sequenceNumber.
	self assert: todoEvent due = todo due
]
