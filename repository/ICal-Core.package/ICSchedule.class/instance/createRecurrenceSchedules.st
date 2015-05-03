initialization
createRecurrenceSchedules
	recurrenceSchedules := self event recurrenceRules
		collect: [ :each | 
			| newSchedule |
			newSchedule := each asRecurrenceScheduleFor: self event.
		]