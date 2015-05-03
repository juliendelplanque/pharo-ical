as yet unclassified
setWeekStartFor: anICRecurrenceRule
	anICRecurrenceRule hasWeekStartday
		ifTrue: [ weekStart := ICWeekStartDayRule newValue: anICRecurrenceRule weekStartday ]