growing
newDatesFrom: neededByValues considering: existingDates
	recurringSchedule isWeekly
		ifTrue: [ ^ neededByValues gather: [ :dayLetterCode | self datesForWeekFrom: existingDates with: dayLetterCode ] ].
	recurringSchedule isMonthly
		ifTrue: [ ^ neededByValues gather: [ :dayLetterCode | self datesForMonthFrom: existingDates with: dayLetterCode ] ].
	recurringSchedule isYearly
		ifTrue: [ ^ neededByValues gather: [ :dayLetterCode | self datesForYearFrom: existingDates with: dayLetterCode ] ]