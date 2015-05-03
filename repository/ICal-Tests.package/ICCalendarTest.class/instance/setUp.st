running
setUp
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