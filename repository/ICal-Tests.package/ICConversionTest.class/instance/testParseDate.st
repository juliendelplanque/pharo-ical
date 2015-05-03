testing
testParseDate
	| string date |
	string := '19970714'.
	date := self dateClass fromICalString: string.
	
	self assert: string = date asICalString.
	self assert: date = (self dateClass year: 1997 month: 7 day: 14).
	
	string := '1997-07-14'.
	date := self dateClass fromVCardString: string.
	
	self assert: string = date asVCardString.
	self assert: date = (self dateClass year: 1997 month: 7 day: 14)