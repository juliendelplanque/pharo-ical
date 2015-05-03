testing
testImport
	| events eventAtDate date tempAlarm |
	date := self dateClass 
				year: 2005
				month: 6
				day: 14.
	self assert: calendar components size = 3.
	self assert: calendar events size = 1.
	self assert: calendar todos size = 2.
	importCommand import.
	self assert: calendar components size = 6.
	self assert: calendar todos size = 3.
	self assert: calendar events size = 3.
	self assert: (calendar events includes: event).
	self assert: (calendar todos includes: todo).
	self assert: (calendar components includes: event).
	self assert: (calendar components includes: todo).
	events := calendar componentForDate: date.
	self assert: events size = 6.
	eventAtDate := events detect: [:each | each summary = 'test1'].
	self assert: eventAtDate isHighPriority.
	self assert: eventAtDate location = 'Bern'.
	self assert: eventAtDate isConfirmed.
	self assert: eventAtDate textualDescription = 'blabla'.
	self 
		assert: eventAtDate start = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 11
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	self 
		assert: eventAtDate end = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 13
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	self assert: eventAtDate alarms size = 2.
	tempAlarm := eventAtDate alarms first.
	self assert: tempAlarm trigger value = (self dateAndTimeClass year: 1997 month: 3 day: 17 hour: 13 minute: 30 second: 00) asUTCWithOffsetAdded.
	self assert: tempAlarm repetitions = 4.
	self assert: tempAlarm delay = (self durationClass minutes: 15).
	self assert: tempAlarm isAudio.
	self assert: tempAlarm attachments size = 1.
	self assert: tempAlarm attachments first asICalString = (ZnUrl fromICalString: 'ftp://host.com/pub/sounds/bell-01.aud') asICalString.
	tempAlarm := eventAtDate alarms second.
	self assert: tempAlarm trigger value = (self durationClass minutes: 30 negated).
	self assert: tempAlarm trigger isRelatedToStart.
	self assert: tempAlarm delay = (self durationClass minutes: 15).
	self assert: tempAlarm isDisplay.
								
	eventAtDate := events detect: [:each | each summary = 'todo1'].
	self assert: eventAtDate isHighPriority.
	self assert: eventAtDate isCompleted.
	self assert: eventAtDate textualDescription = 'testest'.
	self 
		assert: eventAtDate due = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 12
								minute: 9
								second: 0)) .
	self 
		assert: eventAtDate completed = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 11
								minute: 2
								second: 31))