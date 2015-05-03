testing
testParseDateAndTimeUtc
	| string dateAndTime |
	string := '19980118T230000Z'.
	dateAndTime := self dateAndTimeClass fromICalString: string.
	
	self assert: string = dateAndTime asICalUtcString.
	self assert: dateAndTime = (self dateAndTimeClass year: 1998 month: 1 day: 18 hour: 23 minute: 0 second: 0 offset: (self durationClass seconds: 0))