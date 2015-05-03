converting
asICalString
	^String streamContents: [ :stream |
		self printFrequencyOn: stream.
		self hasRepetition
			ifTrue: [
				self printCommaOn: stream.
				self printRepetitonOn: stream ].
		self hasInterval
			ifTrue: [
				self printCommaOn: stream.
				self printIntervalOn: stream ].
		self hasSeconds
			ifTrue: [
				self printCommaOn: stream.
				self printSecondsOn: stream ].
		self hasMinutes
			ifTrue: [
				self printCommaOn: stream.
				self printMinutesOn: stream ].
		self hasHours
			ifTrue: [
				self printCommaOn: stream.
				self printHoursOn: stream ].
		self hasWeekdays
			ifTrue: [ 
				self printCommaOn: stream.
				self printWeekdaysOn: stream ].
		self hasMonthdays
			ifTrue: [ 
				self printCommaOn: stream.
				self printMonthdaysOn: stream ].
		self hasYeardays
			ifTrue: [ 
				self printCommaOn: stream.
				self printYeardaysOn: stream ].
		self hasWeeknumbers
			ifTrue: [ 
				self printCommaOn: stream.
				self printWeeknumbersOn: stream ].
		self hasMonthnumbers
			ifTrue: [ 
				self printCommaOn: stream.
				self printMonthnumbersOn: stream ].
		self hasPositions
			ifTrue: [ 
				self printCommaOn: stream.
				self printPositionsnumbersOn: stream. ].
		self hasWeekStartday
			ifTrue: [ 
				self printCommaOn: stream.
				self printWeekStartdayOn: stream ] ]