testing
testDateAndTime
	| dateAndTime |
	dateAndTime := self dateAndTimeClass year: 1996 month: 10 day: 22 hour: 14 minute: 00 second: 00.
	self assert: '1996-10-22T14:00:00'  = dateAndTime asVCardString.
	
	dateAndTime := self dateAndTimeClass year: 1996 month: 08 day: 11 hour: 12 minute: 34 second: 56.
	self assert: '1996-08-11T12:34:56'  = dateAndTime asVCardString.