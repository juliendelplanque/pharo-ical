running
setUp
	appointment := ICEvent summary: 'aTitle'.
	appointment location: 'Bern'.
	appointment textualDescription: 'description'.
	appointment addCategory: (ICCategory summary: 'first').
	appointment start: (self dateAndTimeClass  
				year: 2005
				month: 4
				day: 18
				hour: 21
				minute: 1
				second: 0).
	appointment end: (self dateAndTimeClass  
				year: 2005
				month: 4
				day: 18
				hour: 23
				minute: 59
				second: 0).
