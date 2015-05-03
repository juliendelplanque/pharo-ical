testing
testRemoveToDo
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