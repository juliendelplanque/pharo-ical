testing
testExportAlarmWithAudioAction
	| export str alarmEvent created |
	alarmEvent := ICEvent summary: 'an alarming event'.
	alarmEvent addAlarm: alarm1.
	created := alarmEvent created.
	alarmEvent uid: 'xxx'.
	calendar addEvent: alarmEvent.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VEVENT' , String crlf 				
				, 'UID:' , alarmEvent uid , String crlf 
				, 'CREATED:' , created asICalUtcString , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:an alarming event' , String crlf 
				, 'PRIORITY:5' , String crlf
				, 'BEGIN:VALARM' , String crlf 
				, 'ACTION:AUDIO' , String crlf 
				, 'TRIGGER;VALUE=DATE-TIME:19970317T133000' , String crlf 
				, 'DURATION:PT0H15M0S' , String crlf 
				, 'REPEAT:4' , String crlf 
				, 'ATTACH:ftp://host.com/pub/sounds/bell-01.aud' , String crlf 
				, 'END:VALARM' , String crlf 
				, 'END:VEVENT' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value = (str at: index) ].
	self assert: export dataStream contents = str