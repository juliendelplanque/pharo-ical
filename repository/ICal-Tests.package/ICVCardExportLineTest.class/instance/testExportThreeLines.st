testing
testExportThreeLines

	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt fff ggg hhh'.
	expected := 
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt=', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt=', String crlf,
		'  fff ggg hhh', String crlf.
	
	self assert: (vCardExporter exportLine: line) dataStream contents = expected.