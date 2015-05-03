as yet unclassified
testDayOfWeek
	"date is a Saturday"

	byRule
		weekStart: 'MO'.
	self assert: (byRule dayOfWeekFor: date) equals: 6.
	byRule
		weekStart: 'TU'.
	self assert: (byRule dayOfWeekFor: date) equals: 5.
	byRule
		weekStart: 'WE'.
	self assert: (byRule dayOfWeekFor: date) equals: 4.
	byRule
		weekStart: 'TH'.
	self assert: (byRule dayOfWeekFor: date) equals: 3.
	byRule
		weekStart: 'FR'.
	self assert: (byRule dayOfWeekFor: date) equals: 2.
	byRule
		weekStart: 'SA'.
	self assert: (byRule dayOfWeekFor: date) equals: 1.
	byRule
		weekStart: 'SU'.
	self assert: (byRule dayOfWeekFor: date) equals: 7