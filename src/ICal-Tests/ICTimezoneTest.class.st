Class {
	#name : #ICTimezoneTest,
	#superclass : #ICTest,
	#category : 'ICal-Tests-Core'
}

{ #category : #private }
ICTimezoneTest >> parse: aSymbol [
	| calendar importer |
	calendar := ICCalendar new.
	importer := ICImporter new
		calendar: calendar;
		fileContent: (self perform: aSymbol);
		yourself.
	importer import.
	self assert: calendar timezones size = 1.
	^calendar timezones first
]

{ #category : #strings }
ICTimezoneTest >> sample1 [

^
'BEGIN:VCALENDAR' , String crlf ,
'PRODID:-//SMALLWIKI2-Calendar v1.0//-' , String crlf ,
'VERSION:2.0' , String crlf ,
'METHOD:PUBLISH' , String crlf ,

'BEGIN:VTIMEZONE', String crlf ,
'TZID:US-Eastern', String crlf ,
'LAST-MODIFIED:19870101T000000Z', String crlf ,
'BEGIN:STANDARD', String crlf ,
'DTSTART:19971026T020000', String crlf ,
'RDATE:19971026T020000', String crlf ,
'TZOFFSETFROM:-0400', String crlf ,
'TZOFFSETTO:-0500', String crlf ,
'TZNAME;LANGUAGE=en:EST', String crlf ,
'TZNAME;LANGUAGE=fr-CA:HNE', String crlf ,
'COMMENT:The meeting really needs to include both ourselves', String crlf ,
'  and the customer. We can''t hold this  meeting without them.', String crlf ,
'  As a matter of fact\, the venue for the meeting ought to be at', String crlf ,
'  their site. - - John', String crlf ,
'END:STANDARD', String crlf ,
'BEGIN:DAYLIGHT', String crlf ,
'DTSTART:19971026T020000', String crlf ,
'RDATE:19970406T020000', String crlf ,
'TZOFFSETFROM:-0500', String crlf ,
'TZOFFSETTO:-0400', String crlf ,
'TZNAME:EDT', String crlf ,
'END:DAYLIGHT', String crlf ,
'END:VTIMEZONE', String crlf ,

'END:VCALENDAR' , String crlf.
]

{ #category : #strings }
ICTimezoneTest >> sample2 [

^
'BEGIN:VCALENDAR' , String crlf ,
'PRODID:-//SMALLWIKI2-Calendar v1.0//-' , String crlf ,
'VERSION:2.0' , String crlf ,
'METHOD:PUBLISH' , String crlf ,

'BEGIN:VTIMEZONE' , String crlf ,
'TZID:US-Eastern' , String crlf ,
'LAST-MODIFIED:19870101T000000Z' , String crlf ,
'TZURL:http://zones.stds_r_us.net/tz/US-Eastern' , String crlf ,
'BEGIN:STANDARD' , String crlf ,
'DTSTART:19671029T020000' , String crlf ,
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10' , String crlf ,
'TZOFFSETFROM:-0400' , String crlf ,
'TZOFFSETTO:-0500' , String crlf ,
'TZNAME:EST' , String crlf ,
'END:STANDARD' , String crlf ,
'BEGIN:DAYLIGHT' , String crlf ,
'DTSTART:19870405T020000' , String crlf ,
'RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4' , String crlf ,
'TZOFFSETFROM:-0500' , String crlf ,
'TZOFFSETTO:-0400' , String crlf ,
'TZNAME:EDT' , String crlf ,
'END:DAYLIGHT' , String crlf ,
'END:VTIMEZONE' , String crlf ,

'END:VCALENDAR' , String crlf.
]

{ #category : #strings }
ICTimezoneTest >> sample3 [

^
'BEGIN:VCALENDAR' , String crlf ,
'PRODID:-//SMALLWIKI2-Calendar v1.0//-' , String crlf ,
'VERSION:2.0' , String crlf ,
'METHOD:PUBLISH' , String crlf ,

'BEGIN:VTIMEZONE' , String crlf ,
'TZID:US--Fictitious-Eastern' , String crlf ,
'LAST-MODIFIED:19870101T000000Z' , String crlf ,
'BEGIN:STANDARD' , String crlf ,
'DTSTART:19671029T020000' , String crlf ,
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10' , String crlf ,
'TZOFFSETFROM:-0400' , String crlf ,
'TZOFFSETTO:-0500' , String crlf ,
'TZNAME:EST' , String crlf ,
'END:STANDARD' , String crlf ,
'BEGIN:DAYLIGHT' , String crlf ,
'DTSTART:19870405T020000' , String crlf ,
'RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4;UNTIL=19980404T070000Z' , String crlf ,
'TZOFFSETFROM:-0500' , String crlf ,
'TZOFFSETTO:-0400' , String crlf ,
'TZNAME:EDT' , String crlf ,
'END:DAYLIGHT' , String crlf ,
'END:VTIMEZONE' , String crlf ,

'END:VCALENDAR' , String crlf.
]

{ #category : #strings }
ICTimezoneTest >> sample4 [

^
'BEGIN:VCALENDAR' , String crlf ,
'PRODID:-//SMALLWIKI2-Calendar v1.0//-' , String crlf ,
'VERSION:2.0' , String crlf ,
'METHOD:PUBLISH' , String crlf ,

'BEGIN:VTIMEZONE' , String crlf ,
'TZID:US--Fictitious-Eastern' , String crlf ,
'LAST-MODIFIED:19870101T000000Z' , String crlf ,
'BEGIN:STANDARD' , String crlf ,
'DTSTART:19671029T020000' , String crlf ,
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10' , String crlf ,
'TZOFFSETFROM:-0400' , String crlf ,
'TZOFFSETTO:-0500' , String crlf ,
'TZNAME:EST' , String crlf ,
'END:STANDARD' , String crlf ,
'BEGIN:DAYLIGHT' , String crlf ,
'DTSTART:19870405T020000' , String crlf ,
'RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4;UNTIL=19980404T070000Z' , String crlf ,
'TZOFFSETFROM:-0500' , String crlf ,
'TZOFFSETTO:-0400' , String crlf ,
'TZNAME:EDT' , String crlf ,
'END:DAYLIGHT' , String crlf ,
'BEGIN:DAYLIGHT' , String crlf ,
'DTSTART:19990424T020000' , String crlf ,
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=4' , String crlf ,
'TZOFFSETFROM:-0500' , String crlf ,
'TZOFFSETTO:-0400' , String crlf ,
'TZNAME:EDT' , String crlf ,
'END:DAYLIGHT' , String crlf ,
'END:VTIMEZONE' , String crlf ,

'END:VCALENDAR' , String crlf.
]

{ #category : #testing }
ICTimezoneTest >> test1 [
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
	

]

{ #category : #testing }
ICTimezoneTest >> test2 [
	| timezone standardTime recurrenceRule name daylightSavingTime |
	timezone := self parse: #sample2.
	self assert: timezone id = 'US-Eastern'.
	self assert: timezone lastModified = (self dateAndTimeClass year: 1987 month: 01 day: 01 hour: 0 minute: 0 second: 0 offset: self durationClass zero).
	self assert: timezone url asString = 'http://zones.stds_r_us.net/tz/US-Eastern'.
	
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
	self assert: daylightSavingTime offsetFrom = (ICUtcOffset new positive: false; hours: 5; minutes: 0; seconds: 0; yourself).
	self assert: daylightSavingTime offsetTo = (ICUtcOffset new positive: false; hours: 4; minutes: 0; seconds: 0; yourself).
	self assert: daylightSavingTime names size = 1.
	name := daylightSavingTime names first.
	self assert: name text = 'EDT'.
]

{ #category : #testing }
ICTimezoneTest >> test3 [
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
]

{ #category : #testing }
ICTimezoneTest >> test4 [
	| timezone standardTime recurrenceRule name daylightSavingTime |
	timezone := self parse: #sample4.
	
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
	
	self assert: timezone daylightSavingTimes size = 2.
	daylightSavingTime := timezone daylightSavingTimes first.
	self assert: daylightSavingTime start = ((self dateAndTimeClass year: 1987 month: 04 day: 05 hour: 2 minute: 0 second: 00)).
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
	
	daylightSavingTime := timezone daylightSavingTimes second.
	self assert: daylightSavingTime start = (self dateAndTimeClass year: 1999 month: 04 day: 24 hour: 2 minute: 0 second: 00).
	self assert: daylightSavingTime recurrenceRules size = 1.
	recurrenceRule := daylightSavingTime recurrenceRules first.
	self assert: recurrenceRule frequency = 'YEARLY'.
	self assert: recurrenceRule weekdays = (Set with: 'SU' -> -1).
	self assert: recurrenceRule monthnumbers = (Set with: 4).
	self assert: recurrenceRule repetition isNil.
	self assert: daylightSavingTime offsetFrom = (ICUtcOffset new positive: false; hours: 5; minutes: 0; seconds: 0; yourself).
	self assert: daylightSavingTime offsetTo = (ICUtcOffset new positive: false; hours: 4; minutes: 0; seconds: 0; yourself).
	self assert: daylightSavingTime names size = 1.
	name := daylightSavingTime names first.
	self assert: name text = 'EDT'.
]

{ #category : #testing }
ICTimezoneTest >> testIsGloballyUnique [
	| timezone |
	timezone := ICTimezone new id: 'US-Eastern'; yourself.
	self deny: timezone isGloballyUnique.
	
	timezone := ICTimezone new id: 'California-Los_Angeles'; yourself.
	self deny: timezone isGloballyUnique.
	
	timezone := ICTimezone new id: '/US-New_York-New_York'; yourself.
	self assert: timezone isGloballyUnique.
]
