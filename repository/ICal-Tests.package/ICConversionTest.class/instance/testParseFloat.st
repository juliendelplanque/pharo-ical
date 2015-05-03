testing
testParseFloat
	| float string |
	string := '-3.14'.
	float := Float fromICalString: string.
	self assert: string  = float asICalString.
	self assert: float = -3.14.
	
	string := '1.333'.
	float := Float fromICalString: string.
	self assert: string  = float asICalString.
	self assert: float = 1.333.