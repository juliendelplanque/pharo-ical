testing
testParseParameterString
	| string |
	string := 'TESTME'.
	self assert: 'TESTME' = string asICalParameterString.
	
	string := 'TEST;ME'.
	self assert: '"TEST;ME"' = string asICalParameterString.