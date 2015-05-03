testing-parsing
testParseSurendar
	| cards card name imid organization |
	cards := ICCardHandParser parseVCardString: self surendarCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Surendar Chandra'.
	self assert: card title = 'Asst. Professor'.
	self assert: card version = 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Chandra'.
	self assert: name givenName = 'Surendar'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card aimids size = 1.
	imid := card aimids anyOne.
	self assert: (imid isKindOf: ICAIMId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'surendar'.
	
	self assert: card icqids isEmpty.
	
	self assert: card msnids size = 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'surendar'.
	
	self assert: card yahooids size = 1.
	imid := card yahooids anyOne.
	self assert: (imid isKindOf: ICYahooId).
	self assert: imid isPreferred.
	self assert: imid isWork.
	self deny: imid isHome.
	self assert: imid id = 'surendarcsdukeedu'.
	
	organization := card organization.
	self assert: organization name = 'Univ. of Notre Dame'.
	self assert: organization unitNames size = 1.
	self assert: organization unitNames anyOne = 'Computer Science and Engg'.
	
	self shouldnt: [ self assert: card notes size = 1 ] raise: Error.
	self assert: card notes anyOne equals:
'SMS message
12/22/2003 18:12
wassup

SMS message
12/23/2003 13:12
Hello'
	