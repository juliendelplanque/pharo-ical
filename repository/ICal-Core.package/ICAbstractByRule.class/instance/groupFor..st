hashing
groupFor: aDateAndTime
	self recurringSchedule isYearly
		ifTrue: [ ^ self yearGranularityHash: aDateAndTime ].
	self recurringSchedule isMonthly
		ifTrue: [ ^ self monthGranularityHash: aDateAndTime ].
	self recurringSchedule isWeekly
		ifTrue: [ ^ self weekGranularityHash: aDateAndTime ].
	self recurringSchedule isDaily
		ifTrue: [ ^ self dayGranularityHash: aDateAndTime ].
	self recurringSchedule isHourly
		ifTrue: [ ^ self hourGranularityHash: aDateAndTime ].
	self recurringSchedule isMinutely
		ifTrue: [ ^ self minuteGranularityHash: aDateAndTime ].
	self recurringSchedule isSecondly
		ifTrue: [ ^ self secondGranularityHash: aDateAndTime ]