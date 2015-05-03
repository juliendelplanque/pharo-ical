testing
testExportFourLines
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt fff ggg hhh'.
	expected := 
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt' , String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt' , String crlf,
		'  fff ggg hhh', String crlf.
	self assert: (iCalExporter exportLine: line) dataStream contents = expected.