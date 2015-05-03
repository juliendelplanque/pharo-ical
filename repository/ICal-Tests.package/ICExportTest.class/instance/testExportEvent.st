testing
testExportEvent
	| export str |
	calendar name: 'veriveri''s Calendar'.
	calendar addEvent: event.
	export := iCalExporter export.
	str := 'BEGIN:VCALENDAR' , String crlf 
				, 'PRODID:' , calendar productId , String crlf 
				, 'VERSION:2.0' , String crlf 
				, 'X-WR-CALNAME:veriveri''s Calendar' , String crlf
				, 'METHOD:PUBLISH' , String crlf
				, 'BEGIN:VEVENT' , String crlf 
				, 'UID:' , event uid , String crlf 
				, 'CREATED:20050501T110231Z' , String crlf 
				, 'STATUS:TENTATIVE' , String crlf 
				, 'LAST-MODIFIED:20050501T110231Z' , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:aTitle' , String crlf 
				, 'PRIORITY:1' , String crlf 
				, 'DESCRIPTION:a long long long text\, very long... really!' , String crlf 
				, 'LOCATION:Bern' , String crlf 				
				, 'DTSTART:20050425T104500' , String crlf 
				, 'DTEND:20050425T120900' , String crlf 				
				, 'TRANSP:OPAQUE' , String crlf 
				, 'END:VEVENT' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value = (str at: index) ].
	self assert: export dataStream contents = str