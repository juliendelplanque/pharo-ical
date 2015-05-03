testing-parsing
testParseAvi
	| cards card address name phoneNumber emailAddress imid |
	cards := ICCardHandParser parseVCardString: self aviCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Avi Bryant'.
	self assert: card version = 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Bryant'.
	self assert: name givenName = 'Avi'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 1.
	address := card addresses anyOne.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self assert: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'xxx E. xx Ave'.
	self assert: address locality = 'Vancouver'.
	self assert: address region = 'BC'.
	self assert: address postalcode = 'V5V 1E3'.
	self assert: address country = 'Canada'.
	
	self assert: card phoneNumbers size = 1.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '(778) xxx-xxxx'.
	self assert: phoneNumber isHome.
	self assert: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	self assert: card emailAddresses size = 2.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address = 'avi@smallthought.com'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	emailAddress := card emailAddresses second.
	self assert: emailAddress address = 'avi.bryant@gmail.com'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self assert: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	self assert: card photo iCalType = 'BINARY'.
	
	self assert: card aimids size = 1.
	imid := card aimids anyOne.
	self assert: (imid isKindOf: ICAIMId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self deny: imid isHome.
	self assert: imid id = 'avbry'.
	
	self assert: card icqids isEmpty.
	
	self assert: card msnids size = 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self deny: imid isHome.
	self assert: imid id = 'avi666@hotmail.com'.
	
	self assert: card yahooids isEmpty.
	self assert: (card timeZone isKindOf: ICUtcOffset).
	self assert: (card timeZone totalSeconds = (5 * 60 * 60) negated)
	