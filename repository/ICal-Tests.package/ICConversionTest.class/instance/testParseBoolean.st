testing
testParseBoolean
	| string boolean |
	string := 'TRUE'.
	boolean := Boolean fromICalString: string.	
	self assert: string = boolean asICalString.
	self assert: boolean.
	
	string := 'FALSE'.
	boolean := Boolean fromICalString: string.	
	self assert: string = boolean asICalString.
	self deny: boolean.