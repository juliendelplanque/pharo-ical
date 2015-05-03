private
setUp
	| importString |
	calendar := ICCalendar name: 'test'.
	event := (ICEvent summary: 'aTitle')
				location: 'Bern';
				textualDescription: 'a long long long text, very long... really!';
				uid: 'http://localhost:8080/seaside/smallwiki/Calendar/app1';
				start: (self dateAndTimeClass
							year: 2005
							month: 4
							day: 25
							hour: 10
							minute: 45
							second: 00);
				end: (self dateAndTimeClass
							year: 2005
							month: 6
							day: 25
							hour: 12
							minute: 9
							second: 00);
				lastModified: (self dateAndTimeClass
							year: 2005
							month: 4
							day: 25
							hour: 10
							minute: 45
							second: 00);
				created: (self dateAndTimeClass 
							year: 2005
							month: 4
							day: 25
							hour: 12
							minute: 9
							second: 00);
				beHighPriority;
				beTentative;
				yourself.
	todo := self createTodo.
	todo uid: 'http://localhost:8080/seaside/smallwiki/Calendar/todo1'.
	otherTodo := self createTodo.
	otherTodo summary: 'anotherToDo'.
	calendar addComponent: event.
	calendar addComponent: todo.
	calendar addComponent: otherTodo.
	importString := 'BEGIN:VCALENDAR' , String crlf ,
'PRODID:-//SMALLWIKI2-Calendar v1.0//-' , String crlf ,
'VERSION:2.0' , String crlf ,
'X-WR-CALNAME:veriveri''s Calendar' , String crlf ,
'METHOD:PUBLISH' , String crlf ,
'BEGIN:VEVENT' , String crlf ,
'DTSTART:20050614T110000Z' , String crlf ,
'DTEND:20050614T130000Z' , String crlf ,
'DTSTAMP:20050614T110853Z' , String crlf ,
'CREATED:20050614T110853Z' , String crlf ,
'LAST-MODIFIED:20050614T110853Z' , String crlf ,
'UID:http://localhost:8080/seaside/smallwiki/Calendar/app1' , String crlf ,
'SUMMARY:test1' , String crlf ,
'DESCRIPTION:blabla' , String crlf ,
'CATEGORIES:business' , String crlf ,
'PRIORITY:1' , String crlf ,
'STATUS:CONFIRMED' , String crlf ,
'LOCATION:Bern' , String crlf ,
'TRANSP:OPAQUE' , String crlf ,
'BEGIN:VALARM' , String crlf ,
'TRIGGER;VALUE=DATE-TIME:19970317T133000Z' , String crlf ,
'REPEAT:4' , String crlf ,
'DURATION:PT15M' , String crlf ,
'ACTION:AUDIO' , String crlf ,
'ATTACH;FMTTYPE=audio/basic:ftp://host.com/pub/sounds/bell-01.aud' , String crlf ,
'END:VALARM' , String crlf ,
'BEGIN:VALARM' , String crlf ,
'TRIGGER:-PT30M' , String crlf ,
'REPEAT:2' , String crlf ,
'DURATION:PT15M' , String crlf ,
'ACTION:DISPLAY' , String crlf ,
'END:VALARM' , String crlf ,
'END:VEVENT' , String crlf ,
'BEGIN:VEVENT' , String crlf ,
'DTSTART:20050614T160000Z' , String crlf ,
'DTEND:20050614T190000Z' , String crlf ,
'DTSTAMP:20050614T110951Z' , String crlf ,
'CREATED:20050614T110951Z' , String crlf ,
'LAST-MODIFIED:20050614T110951Z' , String crlf ,
'UID:http://localhost:8080/seaside/smallwiki/Calendar/app2' , String crlf ,
'SUMMARY:test2' , String crlf ,
'DESCRIPTION:erzttz' , String crlf ,
'CATEGORIES:business' , String crlf ,
'PRIORITY:9' , String crlf ,
'STATUS:CANCELLED' , String crlf ,
'LOCATION:Bern' , String crlf ,
'TRANSP:OPAQUE' , String crlf ,
'END:VEVENT' , String crlf ,
'BEGIN:VTODO' , String crlf ,
'DUE;VALUE=DATE-TIME:20050614T150000Z' , String crlf ,
'STATUS:COMPLETED' , String crlf ,
'COMPLETED:20050614T110915Z' , String crlf ,
'DTSTAMP:20050614T110915Z' , String crlf ,
'CREATED:20050614T110915Z' , String crlf ,
'LAST-MODIFIED:20050614T110915Z' , String crlf ,
'UID:http://localhost:8080/seaside/smallwiki/Calendar/todo1' , String crlf ,
'SUMMARY:todo1' , String crlf ,
'DESCRIPTION:testest' , String crlf ,
'CATEGORIES:business' , String crlf ,
'PRIORITY:1' , String crlf ,
'END:VTODO' , String crlf ,
'END:VCALENDAR' , String crlf.
	importCommand := (ICImporter new)
				calendar: calendar;
				fileContent: importString;
				yourself