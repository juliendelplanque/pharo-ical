weeks
nearestMonthAndDayFor: aWeekNumber to: aDateAndTime
	|weekSt monthAndDay |
	weekSt:=self weekStartForWeekNumber: aWeekNumber ofYearFor: aDateAndTime .
	monthAndDay := Array new: 2.
	monthAndDay at: 1 put: weekSt  month.
	monthAndDay at: 2 put: weekSt dayOfMonth.
	^monthAndDay 