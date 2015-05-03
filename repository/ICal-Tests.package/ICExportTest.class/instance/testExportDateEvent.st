testing
testExportDateEvent
	| export str |
	calendar addEvent: dateEvent.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VEVENT' , String crlf 				
				, 'UID:' , dateEvent uid , String crlf 
				, 'CATEGORIES:category1,category2' , String crlf
				, 'CREATED:20050501T110231Z' , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:aTitle' , String crlf 
				, 'PRIORITY:5' , String crlf 				
				, 'DTSTART;VALUE=DATE:20050425' , String crlf 
				, 'END:VEVENT' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str