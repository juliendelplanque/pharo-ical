Class {
	#name : #ICVCardExportLineTest,
	#superclass : #ICTest,
	#instVars : [
		'vCardExporter'
	],
	#category : 'ICal-Tests-Core-VCard'
}

{ #category : #running }
ICVCardExportLineTest >> performTest [
	ICCardVersion 
		use: 2.1
		during: [ super performTest ].
	
]

{ #category : #running }
ICVCardExportLineTest >> setUp [
	vCardExporter := ICVCardExporter new
	
]

{ #category : #testing }
ICVCardExportLineTest >> testExportExactlyThreeLines [
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt=', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt=', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt' , String crlf.

	self assert: (vCardExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICVCardExportLineTest >> testExportExactlyTwoLines [

	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt=', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt', String crlf.
	
	self assert: (vCardExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICVCardExportLineTest >> testExportFourLines [
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt fff ggg hhh'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt=', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt=' , String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt=' , String crlf,
		'  fff ggg hhh', String crlf.

	self assert: (vCardExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICVCardExportLineTest >> testExportThreeLines [

	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt fff ggg hhh'.
	expected := 
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt=', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt=', String crlf,
		'  fff ggg hhh', String crlf.
	
	self assert: (vCardExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICVCardExportLineTest >> testExportTwoLines [
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt fff ggg hhh'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt=', String crlf,
		'  fff ggg hhh', String crlf.
	self assert: (vCardExporter exportLine: line) dataStream contents = expected.
]
