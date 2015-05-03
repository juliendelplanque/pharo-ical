testing
testParseInteger
	| integer string |
	string := '-1'.
	integer := Integer fromICalString: string.
	self assert: string  = integer asICalString.
	self assert: integer = -1.
	
	string := '1337'.
	integer := Integer fromICalString: string.
	self assert: string  = integer asICalString.
	self assert: integer = 1337.