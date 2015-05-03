testing
isRecurrent
	^self hasRecurrenceRules
		or: [ self recurrenceDates notEmpty ]