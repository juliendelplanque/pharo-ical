testing-parsing
testParseMaeveUrl
	| cards card |
	cards := ICCardHandParser parseVCardString: self maeveCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card url asVCardString equals: 'http\://www.myspace.com/maeveprice'.	