testing
testExportExactlyThreeLines
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt=', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt=', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt' , String crlf.

	self assert: (vCardExporter exportLine: line) dataStream contents = expected.