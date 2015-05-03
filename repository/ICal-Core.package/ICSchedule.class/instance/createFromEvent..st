initialization
createFromEvent: anICEvent
	event := anICEvent.
	self
		createRecurrenceSchedules;
		createExclusionSchedules