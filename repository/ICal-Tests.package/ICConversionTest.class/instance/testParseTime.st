testing
testParseTime
	| string time |
	string := '123456'.
	time := self timeClass fromICalString: string.
	
	self assert: string = time asICalString.
	self assert: time = (self timeClass hour: 12 minute: 34 second: 56)