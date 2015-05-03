testing
testExportExactlyTowLines
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt', String crlf.
	self assert: (iCalExporter exportLine: line) dataStream contents = expected.