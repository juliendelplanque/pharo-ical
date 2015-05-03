enumerating
datesBetween: aStart and: anEnd
	| recurringDates |
	recurringDates := self recurrenceDatesBetween: aStart and: anEnd.
	recurringDates removeAllFoundIn: (self exclusionDatesBetween: aStart and: anEnd).
		 ^recurringDates asArray sort