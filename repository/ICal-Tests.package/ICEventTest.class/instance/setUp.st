running
setUp
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
	calendar addEvent: todo