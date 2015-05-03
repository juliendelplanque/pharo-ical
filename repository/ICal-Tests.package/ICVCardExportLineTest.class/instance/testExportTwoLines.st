testing
testExportTwoLines
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt fff ggg hhh'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt=', String crlf,
		'  fff ggg hhh', String crlf.
	self assert: (vCardExporter exportLine: line) dataStream contents = expected.