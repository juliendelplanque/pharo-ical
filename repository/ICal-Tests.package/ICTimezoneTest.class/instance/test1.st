testing
test1
	| timezone standardTime recurrenceDate name comment daylightSavingTime |
	timezone := self parse: #sample1.
	self assert: timezone id = 'US-Eastern'.
	self assert: timezone lastModified equals: (self dateAndTimeClass year: 1987 month: 01 day: 01 hour: 0 minute: 0 second: 0 offset: self durationClass zero).
	
	self assert: timezone standardTimes size = 1.
	standardTime := timezone standardTimes first.
	self assert: standardTime start = (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 2 minute: 0 second: 00).
	self assert: standardTime recurrenceDates size = 1.
	recurrenceDate := standardTime recurrenceDates first.
	self assert: recurrenceDate = (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 2 minute: 0 second: 00).
	self assert: standardTime offsetFrom = (ICUtcOffset new positive: false; hours: 4; minutes: 0; seconds: 0; yourself).
	self assert: standardTime offsetTo = (ICUtcOffset new positive: false; hours: 5; minutes: 0; seconds: 0; yourself).
	self assert: standardTime names size = 2.
	name := standardTime names first.
	self assert: name language = 'EN'.
	self assert: name text = 'EST'.
	name := standardTime names second.
	self assert: name language = 'FR-CA'.
	self assert: name text = 'HNE'.
	self assert: standardTime comments size = 1.
	comment := standardTime comments first.
	self assert: comment = 'The meeting really needs to include both ourselves and the customer. We can''t hold this  meeting without them. As a matter of fact, the venue for the meeting ought to be at their site. - - John'.
	
	self assert: timezone daylightSavingTimes size = 1.
	daylightSavingTime := timezone daylightSavingTimes first.
	self assert: daylightSavingTime start = (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 2 minute: 0 second: 00).
	self assert: daylightSavingTime recurrenceDates size = 1.
	recurrenceDate := daylightSavingTime recurrenceDates first.
	self assert: recurrenceDate = (self dateAndTimeClass year: 1997 month: 04 day: 06 hour: 2 minute: 0 second: 00).
	self assert: daylightSavingTime offsetFrom = (ICUtcOffset new positive: false; hours: 5; minutes: 0; seconds: 0; yourself).
	self assert: daylightSavingTime offsetTo = (ICUtcOffset new positive: false; hours: 4; minutes: 0; seconds: 0; yourself).
	self assert: daylightSavingTime names size = 1.
	name := daylightSavingTime names first.
	self assert: name text = 'EDT'.
	
