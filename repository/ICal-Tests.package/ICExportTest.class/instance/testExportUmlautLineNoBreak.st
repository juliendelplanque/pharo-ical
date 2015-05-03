testing
testExportUmlautLineNoBreak
	| line expected |
	iCalExporter stringConversionBlock: [ :string | string convertToEncoding: 'utf-8' ].
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt¸fff ggg hhh'.
	expected := ('aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt¸', String crlf,
		' fff ggg hhh', String crlf) convertToEncoding: 'utf-8'.
	
	self assert: (iCalExporter exportLine: line) dataStream contents equals: expected.