strings
sample2

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