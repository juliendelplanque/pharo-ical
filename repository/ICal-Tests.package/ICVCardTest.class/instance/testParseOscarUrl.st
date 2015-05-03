testing-parsing
testParseOscarUrl
	| cards card |
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size = 1.
	card := cards anyOne.

	self assert: card url asVCardString = 'http://www.iam.unibe.ch/~oscar/'.
	