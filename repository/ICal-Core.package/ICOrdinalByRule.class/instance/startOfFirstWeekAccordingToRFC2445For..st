weeks
startOfFirstWeekAccordingToRFC2445For: aDate
	| year weekStartIndex midWeekDay |
	weekStartIndex := self dayLetterCodes indexOf: self weekStart.
	midWeekDay := self dayLetterCodes atWrap: weekStartIndex + 3.
	year := aDate itsYear.
	year
		daysDo: [ :each | 
			midWeekDay = (self dayLetterCodeFor: each)
				ifTrue: [ ^ each start - (self durationClass days:3) ] ]