testing
isValidForDate: aDate

	^self start asDate <= aDate and: [self end asDate >= aDate].