testing-events
testRemoveEvent
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