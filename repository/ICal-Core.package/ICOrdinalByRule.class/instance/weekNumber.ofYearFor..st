weeks
weekNumber: aWeekNumber ofYearFor: aDate
	| dt wks weekNum |
	weekNum := 1.
	dt := self startOfFirstWeekAccordingToRFC2445For: aDate.
	[ dt year <= aDate year ]
		whileTrue: [ 
			weekNum = aWeekNumber
				ifTrue: [ ^ Timespan starting: dt duration: (self durationClass days: 7) ].
			dt := dt + (self durationClass days: 7).
			weekNum := weekNum + 1 ]