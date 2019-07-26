Class {
	#name : #ICImportTest,
	#superclass : #ICTest,
	#instVars : [
		'calendar',
		'importCommand',
		'todo',
		'otherTodo',
		'event'
	],
	#category : 'ICal-Tests-Core'
}

{ #category : #private }
ICImportTest >> createTodo [
	^(ICTodo summary: 'todo1')
				textualDescription: 'testest';
				due: (self dateAndTimeClass
							year: 2005
							month: 6
							day: 14
							hour: 12
							minute: 9
							second: 00);
				lastModified: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31);
				created: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31);
				completed: (self dateAndTimeClass 
							year: 2005
							month:6
							day: 14
							hour: 11
							minute: 2
							second: 31);
				beHighPriority;
				beCompleted;
				yourself.
]

{ #category : #private }
ICImportTest >> setUp [
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
]

{ #category : #testing }
ICImportTest >> testImport [
	| events eventAtDate date tempAlarm |
	date := self dateClass 
				year: 2005
				month: 6
				day: 14.
	self assert: calendar components size = 3.
	self assert: calendar events size = 1.
	self assert: calendar todos size = 2.
	importCommand import.
	self assert: calendar components size = 6.
	self assert: calendar todos size = 3.
	self assert: calendar events size = 3.
	self assert: (calendar events includes: event).
	self assert: (calendar todos includes: todo).
	self assert: (calendar components includes: event).
	self assert: (calendar components includes: todo).
	events := calendar componentForDate: date.
	self assert: events size = 6.
	eventAtDate := events detect: [:each | each summary = 'test1'].
	self assert: eventAtDate isHighPriority.
	self assert: eventAtDate location = 'Bern'.
	self assert: eventAtDate isConfirmed.
	self assert: eventAtDate textualDescription = 'blabla'.
	self 
		assert: eventAtDate start = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 11
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	self 
		assert: eventAtDate end = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 13
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	self assert: eventAtDate alarms size = 2.
	tempAlarm := eventAtDate alarms first.
	self assert: tempAlarm trigger value = (self dateAndTimeClass year: 1997 month: 3 day: 17 hour: 13 minute: 30 second: 00) asUTCWithOffsetAdded.
	self assert: tempAlarm repetitions = 4.
	self assert: tempAlarm delay = (self durationClass minutes: 15).
	self assert: tempAlarm isAudio.
	self assert: tempAlarm attachments size = 1.
	self assert: tempAlarm attachments first asICalString = (ZnUrl fromICalString: 'ftp://host.com/pub/sounds/bell-01.aud') asICalString.
	tempAlarm := eventAtDate alarms second.
	self assert: tempAlarm trigger value = (self durationClass minutes: 30 negated).
	self assert: tempAlarm trigger isRelatedToStart.
	self assert: tempAlarm delay = (self durationClass minutes: 15).
	self assert: tempAlarm isDisplay.
								
	eventAtDate := events detect: [:each | each summary = 'todo1'].
	self assert: eventAtDate isHighPriority.
	self assert: eventAtDate isCompleted.
	self assert: eventAtDate textualDescription = 'testest'.
	self 
		assert: eventAtDate due = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 12
								minute: 9
								second: 0)) .
	self 
		assert: eventAtDate completed = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 11
								minute: 2
								second: 31))
]

{ #category : #testing }
ICImportTest >> testImportName [
	| importedCalendar |
	importedCalendar := ICCalendarHandParser parseCalendarString: importCommand fileContent. 
	self assert: importedCalendar name = 'veriveri''s Calendar'.
]

{ #category : #testing }
ICImportTest >> testSynchronize [
	| events tempEvent date |
	date := self dateClass 
				year: 2005
				month: 6
				day: 14.
	self assert: calendar components size = 3.
	self assert: calendar todos size = 2.
	self assert: calendar events size = 1.
	importCommand synchronize.
	self assert: calendar components size = 3.
	self assert: calendar todos size = 1.
	self assert: calendar events size = 2.
	self assert: (calendar includesEventWithUid: event uid).
	self assert: (calendar includesTodoWithUid: todo uid).
	self assert: (calendar includesComponentWithUid: event uid).
	self assert: (calendar includesComponentWithUid: todo uid).
	self deny: (calendar includesTodoWithUid: otherTodo uid).
	
	events := calendar componentForDate: date.
	self assert: events size = 3.
	tempEvent := events detect: [:each | each summary = 'test1'].
	self assert: tempEvent isHighPriority.
	self assert: tempEvent location = 'Bern'.
	self assert: tempEvent isConfirmed.
	self assert: tempEvent textualDescription = 'blabla'.
	self 
		assert: tempEvent start = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 11
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	self 
		assert: tempEvent end = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 13
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	
	tempEvent := events detect: [:each | each summary = 'todo1'].
	self assert: tempEvent isHighPriority.
	self assert: tempEvent isCompleted.
	self assert: tempEvent textualDescription = 'testest'.
	self 
		assert: tempEvent due = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 15
								minute: 0
								second: 0)) asUTCWithOffsetAdded.
	self 
		assert: tempEvent completed = (self dateAndTimeClass date: date
						time: (self timeClass 
								hour: 11
								minute: 9
								second: 15)) asUTCWithOffsetAdded
]

{ #category : #testing }
ICImportTest >> testUnfolding [
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
]
