strings
sample1

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