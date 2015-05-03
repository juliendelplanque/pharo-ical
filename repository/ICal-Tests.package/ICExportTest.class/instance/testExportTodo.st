testing
testExportTodo
	| export str |
	calendar addTodo: todo.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VTODO' , String crlf 
				, 'UID:' , todo uid , String crlf 
				, 'CREATED:20050501T110231Z' , String crlf 
				, 'STATUS:COMPLETED' , String crlf 
				, 'LAST-MODIFIED:20050501T110231Z' , String crlf 
				, 'SEQUENCE:0' , String crlf 
				, 'SUMMARY:aTitle' , String crlf 
				, 'PRIORITY:1' , String crlf 
				, 'DESCRIPTION:a long long long text\, very long... really!' , String crlf 
				, 'COMPLETED:20050501T110231Z' , String crlf 
				, 'DUE:20050425T120900' , String crlf 
				, 'END:VTODO' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str