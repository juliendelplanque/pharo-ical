as yet unclassified
testStartOfFirstWeek
	self
		assert: (byRule startOfFirstWeekAccordingToRFC2445For: (self dateAndTimeClass year: 2004 month: 3 day: 3))
		equals: (self dateAndTimeClass year: 2003 month: 12 day: 29).
	self
		assert: (byRule startOfFirstWeekAccordingToRFC2445For: (self dateAndTimeClass year: 2005 month: 3 day: 3))
		equals: (self dateAndTimeClass year: 2005 month: 1 day: 3).
	byRule weekStart: 'SA'.
	self
		assert: (byRule startOfFirstWeekAccordingToRFC2445For: (self dateAndTimeClass year: 2004 month: 3 day: 3))
		equals: (self dateAndTimeClass year: 2004 month: 1 day: 3).
	self
		assert: (byRule startOfFirstWeekAccordingToRFC2445For: (self dateAndTimeClass year: 2005 month: 3 day: 3))
		equals: (self dateAndTimeClass year: 2005 month: 1 day: 1)