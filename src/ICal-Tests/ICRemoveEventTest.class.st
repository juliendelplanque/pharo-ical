Class {
	#name : #ICRemoveEventTest,
	#superclass : #ICTest,
	#instVars : [
		'calendar',
		'event'
	],
	#category : 'ICal-Tests-Core'
}

{ #category : #private }
ICRemoveEventTest >> removeTesting: anEvent [
"Helper method for testing methods. Test removing the current event"
  | eventSizeBeforeRemove |
  eventSizeBeforeRemove := calendar events size.
  calendar removeEvent: anEvent.
  self deny: (calendar events size = eventSizeBeforeRemove).
  self assert: (calendar events size = (eventSizeBeforeRemove - 1)).

]

{ #category : #running }
ICRemoveEventTest >> setUp [
	calendar := ICCalendar name: 'the calendar'
]

{ #category : #testing }
ICRemoveEventTest >> testRemoveAppointment [
	"self debug: #testRemoveAppointment"
	event := ICEvent summary: 'simple appointment'.
	calendar addEvent: event.
	event
		location: 'room one';
		addCategory: (ICCategory summary: 'second');
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
					second: 0);
		beLowPriority.
	self removeTesting: event
]

{ #category : #testing }
ICRemoveEventTest >> testRemoveToDo [
	event := ICTodo summary: 'working'.
	event
		addCategory: (ICCategory summary: 'second');
		due: (self dateAndTimeClass 
					year: 2005
					month: 6
					day: 24
					hour: 12
					minute: 1
					second: 0);
		beLowPriority.
	calendar addEvent: event.
	self removeTesting: event
]
