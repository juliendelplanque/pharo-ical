testing
testExportTimezoneRecurrenceDate
	| export str |
	calendar addTimezone: self timezoneRecurrenceDate.
	export := iCalExporter export.
	str := self standardCalendarHeader,
'BEGIN:VTIMEZONE', String crlf,
'TZID:US-Eastern', String crlf,
'LAST-MODIFIED:19870101T000000Z', String crlf,
'BEGIN:STANDARD', String crlf,
'DTSTART:19971026T020000', String crlf,
'RDATE:19971026T020000', String crlf,
'TZOFFSETFROM:-0400', String crlf,
'TZOFFSETTO:-0500', String crlf,
'TZNAME:EST', String crlf,
'END:STANDARD', String crlf,
'BEGIN:DAYLIGHT', String crlf,
'DTSTART:19971026T020000', String crlf,
'RDATE:19970406T020000', String crlf,
'TZOFFSETFROM:-0500', String crlf,
'TZOFFSETTO:-0400', String crlf,
'TZNAME:EDT', String crlf,
'END:DAYLIGHT', String crlf,
'END:VTIMEZONE', String crlf,
self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str