testing
testParseStringOldEncoding
	"This test FAILS because the LF character is non-correctly substituted."
	| string value |
	ICCalendarVersion
		use: 1.0
		during: [
			string := 'Bar Street 99=0AFootown 12345=0AFooland'.
			value := String fromICalString: string parameters: (Dictionary new add: 'ENCODING' -> 'QUOTED-PRINTABLE'; yourself).
			self assert: value =
('Bar Street 99', String lf, 
'Footown 12345', String lf, 
'Fooland').
			self assert: value asICalString equals: 'Bar Street 99=0AFootown 12345=0AFooland' ]