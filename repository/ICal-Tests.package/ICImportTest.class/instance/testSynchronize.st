testing
testSynchronize
	| events tempEvent date |
	date := self dateClass 
				year: 2005
				month: 6
				day: 14.
	self assert: calendar components size = 3.
	self assert: calendar todos size = 2.
	self assert: calendar events size = 1.
	importCommand synchronize.
	self assert: calendar components size = 3.
	self assert: calendar todos size = 1.
	self assert: calendar events size = 2.
	self assert: (calendar includesEventWithUid: event uid).
	self assert: (calendar includesTodoWithUid: todo uid).
	self assert: (calendar includesComponentWithUid: event uid).
	self assert: (calendar includesComponentWithUid: todo uid).
	self deny: (calendar includesTodoWithUid: otherTodo uid).
	
	events := calendar componentForDate: date.
	self assert: events size = 3.
	tempEvent := events detect: [:each | each summary = 'test1'].
	self assert: tempEvent isHighPriority.
	self assert: tempEvent location = 'Bern'.
	self assert: tempEvent isConfirmed.
	self assert: tempEvent textualDescription = 'blabla'.
	self 
		assert: tempEvent start = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 11
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	self 
		assert: tempEvent end = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 13
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	
	tempEvent := events detect: [:each | each summary = 'todo1'].
	self assert: tempEvent isHighPriority.
	self assert: tempEvent isCompleted.
	self assert: tempEvent textualDescription = 'testest'.
	self 
		assert: tempEvent due = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 15
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	self 
		assert: tempEvent completed = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 11
								minute: 9
								second: 15)) asUTCWithOffsetAdded