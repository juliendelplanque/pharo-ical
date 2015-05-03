testing-parsing
testParseSurendarUrl
	| cards card |
	cards := ICCardHandParser parseVCardString: self surendarCardString.
	self assert: cards size = 1.
	card := cards anyOne.

	self assert: card url asVCardString = 'http://www.cse.nd.edu/~surendar/'.