testing
testParseStringOldEncodingAndSpaces
	"This test FAILS because the LF character is non-correctly substituted."
	| string value |
	ICCalendarVersion
		use: 1.0
		during: [
			string := '123 Winding Way=0D=0A=' , String crlf ,
' Any Town, CA 12345=0D=0A=' , String crlf ,
' USA'.
			value := String fromICalString: (ICCalendarHandParser new unfold: string)  parameters: (Dictionary new add: 'ENCODING' -> 'QUOTED-PRINTABLE'; yourself).
			self assert: value =
('123 Winding Way', String crlf, 
'Any Town, CA 12345', String crlf, 
'USA').
			self assert: value asICalString =  '123 Winding Way=0D=0AAny Town\\, CA 12345=0D=0AUSA' ]