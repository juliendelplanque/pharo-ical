testing
testDateAndTime
	| dateAndTime |
	dateAndTime := self dateAndTimeClass  year: 1950 month: 11 day: 22 hour: 22 minute: 33 second: 44.
	self assert: '19501122T223344'  = dateAndTime asICalString.
	
	dateAndTime := self dateAndTimeClass  year: 1950 month: 1 day: 2 hour: 3 minute: 4 second: 5.
	self assert: '19500102T030405'  = dateAndTime asICalString.
	
	dateAndTime := self dateAndTimeClass  year: 1998 month: 1 day: 19 hour: 7 minute: 0 second: 0.
	self assert: '19980119T070000'  = dateAndTime asICalString.
	
	dateAndTime := self dateAndTimeClass  year: 1998 month: 1 day: 18 hour: 23 minute: 0 second: 0.
	self assert: '19980118T230000'  = dateAndTime asICalString.