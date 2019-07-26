Class {
	#name : #ICCalendarTest,
	#superclass : #ICTest,
	#instVars : [
		'calendar',
		'category1',
		'event1',
		'event2',
		'todo'
	],
	#category : 'ICal-Tests-Core'
}

{ #category : #'testing-categories' }
ICCalendarTest >> addCategory [
	| cat1 cat2 categoryNumber |
	cat1 := ICCategory summary: 'cat1'.
	cat1
		color: 'blue';
		textualDescription: 'for ???'.
	cat2 := ICCategory summary: 'cat2'.
	cat2
		color: 'green';
		textualDescription: 'for ???'.
	categoryNumber := calendar categories size.
	calendar addCategory: cat1.
	self assert: calendar categories size = (categoryNumber + 1).
	calendar addCategory: cat2.
	self assert: calendar categories size = (categoryNumber + 2)

]

{ #category : #'testing-categories' }
ICCalendarTest >> removeCategory [
   | categoryNumber |
   categoryNumber := calendar categories size.
   self assert: (calendar categories includes: category1).
   calendar removeCategory: category1.
   self assert: (calendar categories size = (categoryNumber -1)).
   self deny: (calendar categories includes: category1).
   

]

{ #category : #running }
ICCalendarTest >> setUp [
	| category2 |
	calendar := ICCalendar name: 'Veriveris Calendar'.
	event1 := ICEvent summary: 'first date'.
	event1 location: 'swimmingpool'.
	event1 uid: 'app1'.
	event1 addCategory: (ICCategory summary: 'second').
	event1 start: (self dateAndTimeClass  
				year: 2005
				month: 5
				day: 20
				hour: 19
				minute: 1
				second: 0).
	event1 end: (self dateAndTimeClass  
				year: 2005
				month: 5
				day: 20
				hour: 23
				minute: 1
				second: 0).
	event2 := ICEvent summary: 'diner with...'.
	event2 location: 'Bellvue Bern'.
	event2 uid: 'app2'.
	event2 textualDescription: 'it is with ...'.
	event2 addCategory: (ICCategory summary: 'second').
	event2 start: (self dateAndTimeClass  
				year: 2005
				month: 5
				day: 24
				hour: 20
				minute: 1
				second: 0).
	event2 end: (self dateAndTimeClass  
				year: 2005
				month: 5
				day: 24
				hour: 22
				minute: 1
				second: 0).
	todo := ICTodo summary: 'repairing my bike'.
	todo uid: 'todo1'.
	todo
		beLowPriority;
		addCategory: (ICCategory summary: 'second');
		due: (self dateAndTimeClass  
					year: 2005
					month: 7
					day: 30
					hour: 22
					minute: 0
					second: 0);
		textualDescription: 'bla bla'.
	category1 := ICCategory summary: 'personal'.
	category2 := ICCategory summary: 'music school'.
	calendar
		addEvent: event1;
		addTodo: todo.
	calendar addCategory: category2
]

{ #category : #'testing-events' }
ICCalendarTest >> testAddEvent [
	"self debug: #testAddEvent"
	| newEvent newTodo todoNumber totalEvents totalComponents |
	newEvent := ICEvent summary: 'lunch'.
	newEvent
		beMediumPriority;
		start: (self dateAndTimeClass  
					year: 2005
					month: 10
					day: 22
					hour: 18
					minute: 30
					second: 0);
		end: (self dateAndTimeClass  
					year: 2005
					month: 10
					day: 22
					hour: 22
					minute: 1
					second: 0);
		addCategory: (ICCategory summary: 'first');
		location: 'universitiy mensa'.
	newTodo := ICTodo summary: 'writing letters'.
	newTodo
		beLowPriority;
		addCategory: (ICCategory summary: 'second');
		due: (self dateAndTimeClass  
					year: 2005
					month: 6
					day: 30
					hour: 22
					minute: 0
					second: 0);
		textualDescription: 'bla bla'.
	todoNumber := calendar todos size.
	totalEvents := calendar events size.
	totalComponents := calendar components size.
	calendar
		addEvent: newEvent;
		addTodo: newTodo.
	self assert: calendar todos size = (todoNumber + 1).
	self assert: calendar events size = (totalEvents + 1).
	self assert: calendar components size = (totalComponents + 2)
]

{ #category : #testing }
ICCalendarTest >> testAppointments [
	"test add and remove methods for appointments"

	| size |
	size := 1.
	self assert: calendar events size = size.
	calendar addEvent: event2.
	self assert: calendar events size = (size + 1).
	calendar removeEvent: event1.
	self assert: calendar events size = size.
	calendar removeEvent: event2.
	self assert: calendar events isEmpty.
	calendar addEvent: event1.
	self assert: calendar events first == event1
]

{ #category : #testing }
ICCalendarTest >> testCategories [
	"test here methods to add and remove categories"

	| size collection c1 c2 c3 |
	size := 1.
	calendar addCategory: category1.
	self assert: calendar categories size = (size + 1).
	self assert: (calendar categoryWithSummary: 'personal') == category1.
	calendar removeCategory: category1.
	self assert: calendar categories size = size.
	c1 := ICCategory summary: 'school'.
	c2 := ICCategory summary: 'home'.
	c3 := ICCategory summary: 'friends'.
	collection := OrderedCollection 
				with: c1
				with: c2
				with: c3.
	calendar categories: collection.
	self assert: calendar categories size = 3.
	self assert: (calendar categories at: 2) == c2.
	self assert: calendar categories == collection.
	self assert: (calendar categoryWithSummary: 'friends') == c3

]

{ #category : #'testing-categories' }
ICCalendarTest >> testCategoryWithTitle [
	| cat1 cat2 cat3 |
	cat1 := ICCategory summary: 'cat1'.
	cat2 := ICCategory summary: 'cat2'.
	cat3 := ICCategory summary: 'cat3'.
	calendar
		addCategory: cat1;
		addCategory: cat2;
		addCategory: cat3.
	self assert: (calendar categoryWithSummary: 'cat1') == cat1.
	self assert: (calendar categoryWithSummary: 'cat2') == cat2.
	self assert: (calendar categoryWithSummary: 'cat3') == cat3.
	calendar removeCategory: cat1.
	self should: [ calendar categoryWithSummary: 'cat1' ] raise: Error
]

{ #category : #'testing-events' }
ICCalendarTest >> testEventsForDate [
	| app1 app2 app3 |
	app1 := ICEvent summary: 'event1'.
	app1 start: (self dateAndTimeClass  
				year: 2006
				month: 4
				day: 22
				hour: 22
				minute: 12
				second: 0).
	app1 end: (self dateAndTimeClass  
				year: 2006
				month: 4
				day: 22
				hour: 23
				minute: 12
				second: 0).
	app2 := ICEvent summary: 'event1'.
	app2 start: (self dateAndTimeClass  
				year: 2006
				month: 4
				day: 22
				hour: 22
				minute: 45
				second: 0).
	app2 end: (self dateAndTimeClass  
				year: 2006
				month: 4
				day: 22
				hour: 23
				minute: 30
				second: 0).
	app3 := ICEvent summary: 'event1'.
	app3 start: (self dateAndTimeClass  
				year: 2006
				month: 4
				day: 22
				hour: 22
				minute: 55
				second: 0).
	app3 end: (self dateAndTimeClass  
				year: 2006
				month: 4
				day: 22
				hour: 23
				minute: 55
				second: 0).
	calendar
		addEvent: app1;
		addEvent: app2;
		addEvent: app3.
	self 
		assert: (calendar 
				eventsForDate: (self dateAndTimeClass  
						year: 2006
						month: 4
						day: 22
						hour: 22
						minute: 0
						second: 0) asDate) 
					size = 3.
	calendar removeEvent: app1.
	self 
		assert: (calendar 
				eventsForDate: (self dateAndTimeClass  
						year: 2006
						month: 4
						day: 22
						hour: 22
						minute: 0
						second: 0) asDate) 
					size = 2.
	calendar removeEvent: app2.
	self 
		assert: (calendar 
				eventsForDate: (self dateAndTimeClass  
						year: 2006
						month: 4
						day: 22
						hour: 22
						minute: 0
						second: 0) asDate) 
					size = 1
]

{ #category : #'testing-events' }
ICCalendarTest >> testEventsForTimeStamp [	
	"self debug: #testEventsForTimeStamp"
	self 
		assert: (calendar 
				eventsForDateAndTime: (self dateAndTimeClass  
						year: 2005
						month: 5
						day: 20
						hour: 19
						minute: 0
						second: 0)) 
					size = 1.
	calendar removeEvent: event1.
	self 
		assert: (calendar 
				eventsForDateAndTime: (self dateAndTimeClass  
						year: 2005
						month: 5
						day: 20
						hour: 19
						minute: 0
						second: 0)) 
					isEmpty.
	self 
		assert: (calendar 
				todosForDateAndTime: (self dateAndTimeClass  
						year: 2005
						month: 7
						day: 30
						hour: 22
						minute: 0
						second: 0)) 
					size = 1.
	calendar removeTodo: todo.
	self 
		assert: (calendar 
				todosForDateAndTime: (self dateAndTimeClass  
						year: 2005
						month: 7
						day: 30
						hour: 22
						minute: 0
						second: 0)) 
					isEmpty
]

{ #category : #'testing-events' }
ICCalendarTest >> testIncludesEventWithUid [
	"self debug: #testIncludesEventWithUid"
	self assert: (calendar includesEventWithUid: 'app1').
	self deny: (calendar includesTodoWithUid: 'app1').
	self assert: (calendar includesTodoWithUid: 'todo1').
	self deny: (calendar includesEventWithUid: 'todo1').
	self deny: (calendar includesEventWithUid: 'app2').
	calendar addEvent: event2.
	self assert: (calendar includesEventWithUid: 'app2').
	calendar removeTodo: todo.
	self deny: (calendar includesTodoWithUid: 'todo1')
]

{ #category : #'testing-events' }
ICCalendarTest >> testRemoveEvent [
	| eventNumber todoNumber totalNumber |
	eventNumber := calendar events size.
	todoNumber := calendar todos size.
	totalNumber := calendar components size.
	calendar removeTodo: todo.
	self assert: calendar todos size = (todoNumber - 1).
	self assert: calendar components size = (totalNumber - 1).
	self assert: calendar events size = eventNumber.
	calendar removeEvent: event1.
	self assert: calendar todos size = (todoNumber - 1).
	self assert: calendar events size = (eventNumber - 1).
	self assert: calendar components size = (totalNumber - 2)
]

{ #category : #'testing-events' }
ICCalendarTest >> testRemoveEventWithUid [
   self assert: (calendar includesEventWithUid: 'app1').
   calendar removeEventWithUid: 'app1'.
   self should: [ calendar eventWithUid: 'app1' ] raise: Error.
   calendar removeEventWithUid: 'todo1'.
  self should: [ calendar eventWithUid: 'todo1' ] raise: Error.
]

{ #category : #testing }
ICCalendarTest >> testUser [
	| user |
	user := ICUser new.
	self assert: calendar users isEmpty.
	calendar addUser: user.
	self deny: calendar users isEmpty.
	self assert: calendar users anyOne == user
]
