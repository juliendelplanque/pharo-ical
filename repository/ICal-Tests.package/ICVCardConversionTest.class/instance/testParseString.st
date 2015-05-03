testing
testParseString
	| string value |
	string := 'Poststrasse 1'.
	value := String fromVCardString: string parameters: Dictionary new.
	self assert: string = value asICalString.
	
	string := 'Z=FCrich'.
	value := String fromVCardString: string parameters: (Dictionary new add: 'ENCODING' -> 'QUOTED-PRINTABLE'; yourself).
	self assert: value = 'Zürich'