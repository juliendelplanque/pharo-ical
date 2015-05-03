private
standardCalendarHeader
	^'BEGIN:VCALENDAR' , String crlf 
	, 'PRODID:' , calendar productId , String crlf 
	, 'VERSION:2.0' , String crlf 
	, 'X-WR-CALNAME:test' , String crlf 
	, 'METHOD:PUBLISH' , String crlf