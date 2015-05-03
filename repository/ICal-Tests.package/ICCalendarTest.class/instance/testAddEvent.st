testing-events
testAddEvent
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