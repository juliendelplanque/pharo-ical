initialize-release
setUp
	super setUp.
	date := self dateAndTimeClass
		year: 1997
		month: 9
		day: 2
		hour: 9
		minute: 0
		second: 0.
	event := ICEvent summary: 'diner'.
	event addCategory: (ICCategory summary: 'friends').
	event start: date.
	event beLowPriority.
	event location: 'in nature'