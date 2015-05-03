initialization
createExclusionSchedules
	exclusionSchedules := self event exclusionRules
		collect: [ :each | 
			| newSchedule |
			newSchedule := each asRecurrenceScheduleFor: self event.
			newSchedule
				cache: self cache;
				yourself ]