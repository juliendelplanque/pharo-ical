initialize
createFromRule: anICRecurrenceRule for: anEvent
	event := anEvent.
	start := anEvent start copy.
	anICRecurrenceRule hasInterval
		ifTrue: [ interval := anICRecurrenceRule interval ].
	anICRecurrenceRule hasSeconds
		ifTrue: [ byRules add: (ICBySecondRule withAll: anICRecurrenceRule seconds asPartOf: self) ].
	anICRecurrenceRule hasMinutes
		ifTrue: [ byRules add: (ICByMinuteRule withAll: anICRecurrenceRule minutes asPartOf: self) ].
	anICRecurrenceRule hasHours
		ifTrue: [ byRules add: (ICByHourRule withAll: anICRecurrenceRule hours asPartOf: self) ].
	anICRecurrenceRule hasWeekdays
		ifTrue: [ byRules add: (ICByDayRule withAll: anICRecurrenceRule weekdays asPartOf: self) ].
	anICRecurrenceRule hasMonthdays
		ifTrue: [ byRules add: (ICByMonthDayRule withAll: anICRecurrenceRule monthdays asPartOf: self) ].
	anICRecurrenceRule hasYeardays
		ifTrue: [ byRules add: (ICByYearDayRule withAll: anICRecurrenceRule yeardays asPartOf: self) ].
	anICRecurrenceRule hasWeeknumbers
		ifTrue: [ byRules add: (ICByWeekRule withAll: anICRecurrenceRule weeknumbers asPartOf: self) ].
	anICRecurrenceRule hasMonthnumbers
		ifTrue: [ byRules add: (ICByMonthRule withAll: anICRecurrenceRule monthnumbers asPartOf: self) ].
	anICRecurrenceRule hasPositions
		ifTrue: [ byRules add: (ICBySetPositionRule withAll: anICRecurrenceRule positions asPartOf: self) ].
	self setEndDateFor: anICRecurrenceRule.
	self setWeekStartFor: anICRecurrenceRule