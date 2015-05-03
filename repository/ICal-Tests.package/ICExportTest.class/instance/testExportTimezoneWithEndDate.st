testing
testExportTimezoneWithEndDate
	| export str |
	calendar addTimezone: self timezoneWithEndDate.
	export := iCalExporter export.
	str := self standardCalendarHeader,
'BEGIN:VTIMEZONE', String crlf,
'TZID:US-Eastern', String crlf, 
'LAST-MODIFIED:19870101T000000Z', String crlf, 
'TZURL:http://zones.stds_r_us.net/tz/US-Eastern', String crlf, 
'BEGIN:STANDARD', String crlf, 
'DTSTART:19671029T020000', String crlf, 
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10', String crlf, 
'TZOFFSETFROM:-0400', String crlf, 
'TZOFFSETTO:-0500', String crlf, 
'TZNAME:EST', String crlf, 
'END:STANDARD', String crlf, 
'BEGIN:DAYLIGHT', String crlf, 
'DTSTART:19870405T020000', String crlf, 
'RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4', String crlf, 
'TZOFFSETFROM:-0500', String crlf, 
'TZOFFSETTO:-0400', String crlf, 
'TZNAME:EDT', String crlf, 
'END:DAYLIGHT', String crlf, 
'END:VTIMEZONE', String crlf, 
self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value equals: (str at: index)].
	self assert: export dataStream contents equals: str