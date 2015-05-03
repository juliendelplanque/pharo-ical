testing
testDate
	| date |
	date := self dateClass year: 1985 month: 04 day: 12.
	self assert: date asVCardString = '1985-04-12'.

	date :=  self dateClass year: 1996 month: 08 day: 05.
	self assert: date asVCardString = '1996-08-05'.

	date :=  self dateClass year: 1996 month: 11 day: 11.
	self assert: date asVCardString = '1996-11-11'.