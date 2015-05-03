growing
datesForWeekFrom: existingDates with: byValue
	| nextDay newDayOfMonth month year startOfWeek |
	^ existingDates
		collect: [ :eachExistingDate | 
			startOfWeek:=self startOfWeekFor: eachExistingDate.
			year := startOfWeek year.
			nextDay := self nextOccuranceOf: byValue starting: startOfWeek plus: startOfWeek dayOfMonth.
			month := startOfWeek month.
			newDayOfMonth := nextDay.
			nextDay > startOfWeek daysInMonth
				ifTrue: [ 
					month := month + 1.
					newDayOfMonth := nextDay - startOfWeek daysInMonth.
					month > 12
						ifTrue: [ 
							month := 1.
							year := year + 1 ] ].
			self dateAndTimeClass
				year: year
				month: month
				day: newDayOfMonth
				hour: (self hourFor: eachExistingDate)
				minute: (self minuteFor: eachExistingDate)
				second: (self secondFor: eachExistingDate) ]