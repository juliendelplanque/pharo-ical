testing
testDate
	| date |
	date := self dateClass year: 1901 month: 1 day: 1.
	self assert: '19010101'  = date asICalString.
	self assert: '1901-01-01' = date asVCardString.
	
	date := self dateClass year: 1901 month: 2 day: 1.
	self assert: '19010201'  = date asICalString.
	self assert: '1901-02-01'  = date asVCardString.
	
	date := self dateClass year: 1901 month: 11 day: 22 .
	self assert: '19011122'  = date asICalString.
	self assert: '1901-11-22'  = date asVCardString.
	
	date := self dateClass year: 1997 month: 7 day: 14 .
	self assert: '19970714'  = date asICalString.
	self assert: '1997-07-14'  = date asVCardString.