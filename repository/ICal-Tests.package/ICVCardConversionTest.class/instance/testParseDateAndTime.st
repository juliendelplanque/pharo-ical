testing
testParseDateAndTime
	| string dateAndTime |
	string := '1996-10-22T14:00:00Z'.
	dateAndTime := self dateAndTimeClass fromVCardString: string.
	self assert: dateAndTime = (self dateAndTimeClass year: 1996 month: 10 day: 22 hour: 14 minute: 00 second: 00).

	string := '1996-08-11T12:34:56Z'.
	dateAndTime := self dateAndTimeClass fromVCardString: string.
	self assert: dateAndTime = (self dateAndTimeClass year: 1996 month: 08 day: 11 hour: 12 minute: 34 second: 56).

	string := '19960811T123456Z'.
	dateAndTime := self dateAndTimeClass fromVCardString: string.
	self assert: dateAndTime = (self dateAndTimeClass year: 1996 month: 08 day: 11 hour: 12 minute: 34 second: 56).