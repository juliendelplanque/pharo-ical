testing
testRemoveAppointment
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