testing-parsing
testParseEric
	| cards card name imid |
	cards := ICCardHandParser parseVCardString: self ericCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Eric Wahlforss'.
	self assert: card title = 'Entrepreneur / Musician'.
	self assert: card url asVCardString = 'http://eric.wahlforss.com/'.
	self assert: card version = 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Wahlforss'.
	self assert: name givenName = 'Eric'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card aimids size = 1.	
	imid := card aimids anyOne.
	self assert: (imid isKindOf: ICAIMId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'ericwahlforss'.
	
	self assert: card icqids size = 1.	
	imid := card icqids anyOne.
	self assert: (imid isKindOf: ICICQId).
	self assert: imid isPreferred.
	self assert: imid isWork.
	self deny: imid isHome.
	self assert: imid id = '5399905'.
	
	self assert: card msnids size = 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self deny: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'ericwahlforss@hotmail.com'.
	
	self assert: card yahooids isEmpty.
	
	self assert: card categories size = 1.
	self assert: card categories anyOne summary = '24HDC'
	