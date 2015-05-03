testing
testExportAlarmWithDisplayAction
	| export str alarmTodo created |
	alarmTodo := ICTodo summary: 'an alarming todo'.
	alarmTodo addAlarm: alarm2.
	created := alarmTodo created.
	alarmTodo uid: '(cons car cdr)'.
	calendar addEvent: alarmTodo.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VTODO' , String crlf 				
				, 'UID:' , alarmTodo uid , String crlf 
				, 'CREATED:' , created asICalUtcString , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:an alarming todo' , String crlf 
				, 'PRIORITY:5' , String crlf 
				, 'BEGIN:VALARM' , String crlf 
				, 'ACTION:DISPLAY' , String crlf 
				, 'TRIGGER:-PT0H30M0S' , String crlf 
				, 'DURATION:PT0H15M0S' , String crlf 
				, 'REPEAT:2' , String crlf 
				, 'END:VALARM' , String crlf 
				, 'END:VTODO' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value = (str at: index) ].
	self assert: export dataStream contents = str