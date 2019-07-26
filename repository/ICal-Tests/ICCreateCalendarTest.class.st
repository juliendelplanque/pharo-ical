Class {
	#name : #ICCreateCalendarTest,
	#superclass : #ICTest,
	#instVars : [
		'calendars',
		'user'
	],
	#category : 'ICal-Tests-Core'
}

{ #category : #private }
ICCreateCalendarTest >> addCalendarWithName: aString [ 
	calendars add: (ICCalendar name: aString)
]

{ #category : #private }
ICCreateCalendarTest >> calendarTestWithName: aString [ 
	| newCalendar |
	newCalendar := calendars
		detect: [:each | each name = aString]
		ifNone: [ nil ].
	self assert: newCalendar notNil.
	self assert: (newCalendar isKindOf: ICCalendar).
	self assert: newCalendar name = aString.
	self assert: newCalendar categories isEmpty
]

{ #category : #private }
ICCreateCalendarTest >> calendarTestWithSummary: aString [ 
	| newCalendar |
	newCalendar := calendars detect: [:each | each summary = aString]
				ifNone: [nil].
	self deny: newCalendar isNil.
	self assert: newCalendar class = ICCalendar.
	self assert: newCalendar categories isEmpty
]

{ #category : #running }
ICCreateCalendarTest >> setUp [
	| calendar |
	user := ICUser new.
	calendar := ICCalendar name: 'veriveri''s Calendar'.
	calendar addUser: user.
	calendars := OrderedCollection with: calendar
]

{ #category : #testing }
ICCreateCalendarTest >> testCalendar [
	self calendarTestWithName: 'veriveri''s Calendar'.
]

{ #category : #testing }
ICCreateCalendarTest >> testCategoryList [
	| calendar |
		
	calendar := calendars
		detect: [ :each | each name = 'veriveri''s Calendar' ]
		ifNone: [ nil ].
	self deny: calendar isNil.
	self deny: calendar categories isNil.
	self assert: calendar categories isEmpty.	
	

]

{ #category : #testing }
ICCreateCalendarTest >> testCreatingSeveralCalendars [
	self addCalendarWithName: 'new Calendar 1'.
	self addCalendarWithName: 'new Calendar 2'.
	self addCalendarWithName: 'new Calendar 3'.
	
	self addCalendarWithName: 'new Calendar 1'.
     self addCalendarWithName: 'new Calendar 2'.
     self addCalendarWithName: 'new Calendar 3'.
]

{ #category : #testing }
ICCreateCalendarTest >> testToDoList [
	| calendar |
		
	calendar := calendars
		detect: [ :each | each name = 'veriveri''s Calendar' ]
		ifNone: [nil].
	self deny: calendar isNil.
	self deny: calendar todos size = 2.
	self deny: calendar todos isNil.

]

{ #category : #testing }
ICCreateCalendarTest >> testUser [
	| newCalendar |
	newCalendar := calendars 
				detect: [:each | each name = 'veriveri''s Calendar']
				ifNone: [ nil ].
	self assert: newCalendar notNil.
	self assert: (newCalendar isKindOf: ICCalendar).
	self deny: newCalendar users isEmptyOrNil.
	self assert: newCalendar users anyOne = user
]
