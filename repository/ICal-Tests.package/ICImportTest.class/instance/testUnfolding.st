testing
testUnfolding
	| importString |
	importString := 'BEGIN:VCALENDAR' , String crlf ,
'PRODID:-//SMALLWIKI2-Calendar v1.0//-' , String crlf ,
'VERSION:2.0' , String crlf ,
'METHOD:PUBLISH' , String crlf ,
'BEGIN:VEVENT' , String crlf ,
'DT' , String crlf ,
' START' , String crlf ,
' ;' , String crlf ,
'	val' , String crlf ,
'	ue' , String crlf ,
'	=' , String crlf ,
' DA' , String crlf ,
' Te' , String crlf ,
'	:' , String crlf ,
' 20050' , String crlf ,
' 614' , String crlf ,
'DTEND:20050614T130000Z' , String crlf ,
'DTSTAMP:20050614T110853Z' , String crlf ,
'CREATED:20050614T110853Z' , String crlf ,
'LAST-MODIFIED:20050614T110853Z' , String crlf ,
'UID:http://localhost:8080/seaside/smallwiki/Calendar/app1' , String crlf ,
'SUMMARY:te' , String crlf ,
' s' , String crlf ,
' t' , String crlf ,
'DESCRIPTION:blabla' , String crlf ,
'CATEGORIES:' , String crlf ,
' business' , String crlf ,
'PRIORITY:1' , String crlf ,
'STATUS:CONFIRMED' , String crlf ,
'LOCATION:Be' , String crlf ,
'	rn' , String crlf ,
'TRANSP:OPAQUE' , String crlf ,
'END:VEVENT' , String crlf ,
'END:VCALENDAR' , String crlf.
	calendar := ICCalendarHandParser parseCalendarString: importString.
	event := calendar events first.
	self assert: event start = (self dateClass year: 2005 month: 6 day: 14).
	self assert: event summary = 'test'.
	self assert: event location = 'Bern'.
	self assert: event isOpaque.
	self assert: event textualDescription = 'blabla'.
	self assert: event categories size = 1.
	self assert: event categories first summary = 'business'.