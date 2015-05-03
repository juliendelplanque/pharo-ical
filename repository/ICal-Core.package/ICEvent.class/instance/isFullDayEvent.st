testing
isFullDayEvent
	^(self start isDateOrNil)
		and: [ self end isDateOrNil ]