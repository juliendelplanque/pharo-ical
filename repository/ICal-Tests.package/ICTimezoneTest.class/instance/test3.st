testing
test3
	| timezone standardTime recurrenceRule name daylightSavingTime |
	timezone := self parse: #sample3.
	self assert: timezone id = 'US--Fictitious-Eastern'.
	self assert: timezone lastModified = (self dateAndTimeClass year: 1987 month: 01 day: 01 hour: 0 minute: 0 second: 0 offset: self durationClass zero).
	
	self assert: timezone standardTimes size = 1.
	standardTime := timezone standardTimes first.
	self assert: standardTime start = (self dateAndTimeClass year: 1967 month: 10 day: 29 hour: 2 minute: 0 second: 00).
	self assert: standardTime recurrenceRules size = 1.
	recurrenceRule := standardTime recurrenceRules first.
	self assert: recurrenceRule frequency = 'YEARLY'.
	self assert: recurrenceRule weekdays = (Set with: 'SU' -> -1).
	self assert: recurrenceRule monthnumbers = (Set with: 10).
	self assert: standardTime offsetFrom = (ICUtcOffset new positive: false; hours: 4; minutes: 0; seconds: 0; yourself).
	self assert: standardTime offsetTo = (ICUtcOffset new positive: false; hours: 5; minutes: 0; seconds: 0; yourself).
	self assert: standardTime names size = 1.
	name := standardTime names first.
	self assert: name text = 'EST'.
	
	self assert: timezone daylightSavingTimes size = 1.
	daylightSavingTime := timezone daylightSavingTimes first.
	self assert: daylightSavingTime start = (self dateAndTimeClass year: 1987 month: 04 day: 05 hour: 2 minute: 0 second: 00).
	self assert: daylightSavingTime recurrenceRules size = 1.
	recurrenceRule := daylightSavingTime recurrenceRules first.
	self assert: recurrenceRule frequency = 'YEARLY'.
	self assert: recurrenceRule weekdays = (Set with: 'SU' -> 1).
	self assert: recurrenceRule monthnumbers = (Set with: 4).
	self assert: recurrenceRule repetition = (self dateAndTimeClass year: 1998 month: 04 day: 04 hour: 7 minute: 0 second: 00) asUTCWithOffsetAdded.
	self assert: daylightSavingTime offsetFrom = (ICUtcOffset new positive: false; hours: 5; minutes: 0; seconds: 0; yourself).
	self assert: daylightSavingTime offsetTo = (ICUtcOffset new positive: false; hours: 4; minutes: 0; seconds: 0; yourself).
	self assert: daylightSavingTime names size = 1.
	name := daylightSavingTime names first.
	self assert: name text = 'EDT'.