growing
datesForSingleDayFrom: existingDates with: byValue
	| nextDay |
	^ existingDates
		collect: [ :eachExistingDate | 
			nextDay := self nextOccuranceOf: byValue starting: eachExistingDate plus: eachExistingDate dayOfMonth.
			self newDateForMonthContaining: eachExistingDate on: nextDay ]