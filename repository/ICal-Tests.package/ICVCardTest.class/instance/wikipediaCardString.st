fixtures-parsing
wikipediaCardString
^
'BEGIN:VCARD' , String crlf ,
'VERSION:2.1' , String crlf ,
'FN:Firstname Lastname' , String crlf ,
'N:Lastname;Firstname' , String crlf ,
'ADR;WORK;PREF;ENCODING=QUOTED-PRINTABLE:;Footown 12345=0AFooland;Bar Street 99' , String crlf ,
'LABEL;ENCODING=QUOTED-PRINTABLE;WORK;PREF:Bar Street 99=0AFootown 12345=0AFooland' , String crlf ,
'TEL;CELL:+358-40-123456' , String crlf ,
'EMAIL;INTERNET:nobody@example.invalid' , String crlf ,
'UID:' , String crlf ,
'END:VCARD' , String crlf