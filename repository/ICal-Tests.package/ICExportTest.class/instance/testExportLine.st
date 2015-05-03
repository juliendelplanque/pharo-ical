testing
testExportLine
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt fff ggg hhh'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt', String crlf,
		'  fff ggg hhh', String crlf.

	self assert: (iCalExporter exportLine: line) dataStream contents = expected.