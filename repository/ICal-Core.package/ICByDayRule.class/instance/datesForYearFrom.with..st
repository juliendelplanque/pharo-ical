growing
datesForYearFrom: existingDates with: dayLetterCode
	
	 (recurringSchedule hasHadByMonthDayRuleApplied or:[recurringSchedule hasHadByYearDayRuleApplied])
		ifTrue: [ ^self datesForSingleDayFrom: existingDates with: dayLetterCode ].
			 
		
			 recurringSchedule hasHadByWeekRuleApplied
		ifTrue: [ ^self datesForWeekFrom: existingDates with: dayLetterCode ].
			 recurringSchedule hasHadByMonthRuleApplied
		ifTrue: [ ^self datesForMonthFrom: existingDates with: dayLetterCode ].
			 
			^self generateDatesForEvery: dayLetterCode inTheYearStarting:existingDates.