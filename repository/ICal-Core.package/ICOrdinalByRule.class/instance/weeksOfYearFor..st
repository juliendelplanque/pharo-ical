weeks
weeksOfYearFor: aDate
	| dt wks |
	wks := OrderedCollection new.
	dt := self startOfFirstWeekAccordingToRFC2445For: aDate.
	[ dt year <= aDate year ]
		whileTrue: [ 
			wks add: (self timespanClass starting: dt duration: (self durationClass days: 7)).
			dt := dt + (self durationClass days: 7) ].
	^ wks