testing
testParseDateAndTime
	| string dateAndTime |
	string := '19980118T230000'.
	dateAndTime := self dateAndTimeClass fromICalString: string.
	
	self assert: string = dateAndTime asICalString.
	self assert: dateAndTime = (self dateAndTimeClass year: 1998 month: 1 day: 18 hour: 23 minute: 0 second: 0)