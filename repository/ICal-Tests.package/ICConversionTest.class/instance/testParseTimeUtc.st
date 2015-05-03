testing
testParseTimeUtc
	| string time |
	string := '123456Z'.
	time := self timeClass fromICalString: string.
	
	self assert: string = time asICalUtcString.
	self assert: time = (self timeClass hour: 12 minute: 34 second: 56)