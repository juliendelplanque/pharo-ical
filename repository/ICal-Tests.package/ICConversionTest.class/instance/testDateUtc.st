testing
testDateUtc
	| date |
	date := self dateClass year: 1901 month: 1 day: 1 .
	self assert: '19010101'  = date asICalUtcString.
	
	date := self dateClass year: 1901 month: 2 day: 1 .
	self assert: '19010201'  = date asICalUtcString.
	
	date := self dateClass year: 1901 month: 11 day: 22.
	self assert: '19011122'  = date asICalUtcString.
	
	date := self dateClass year: 1997 month: 7 day: 14.
	self assert: '19970714'  = date asICalUtcString.