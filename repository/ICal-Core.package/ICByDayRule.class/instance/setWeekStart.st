as yet unclassified
setWeekStart
	(recurringSchedule isWeekly and: [ recurringSchedule hasWeekStartday ])
		ifTrue: [ self weekStart: recurringSchedule weekStart weekStartDay ]