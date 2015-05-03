weeks
startOfWeekFor: aDateAndTime
	| year weekStartIndex days dayOfWeek |
	weekStartIndex := self weekDayNumberFor: self weekStart.
	dayOfWeek := aDateAndTime dayOfWeek.
	days := weekStartIndex - dayOfWeek.
	weekStartIndex > dayOfWeek
		ifTrue: [ days := days - 7 ]. 
		^aDateAndTime +(self durationClass seconds: 86400* days) 