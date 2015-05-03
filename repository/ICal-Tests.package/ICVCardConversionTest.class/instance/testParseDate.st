testing
testParseDate
	| string date |
	string := '1985-04-12'.
	date := self dateClass fromVCardString: string.
	self assert: date = (self dateClass year: 1985 month: 04 day: 12).

	string := '1996-08-05'.
	date := self dateClass fromVCardString: string.
	self assert: date = (self dateClass year: 1996 month: 08 day: 05).

	string := '1996-11-11'.
	date := self dateClass fromVCardString: string.
	self assert: date = (self dateClass year: 1996 month: 11 day: 11).

	string := '19850412'.
	date := self dateClass fromVCardString: string.
	self assert: date = (self dateClass year: 1985 month: 04 day: 12).