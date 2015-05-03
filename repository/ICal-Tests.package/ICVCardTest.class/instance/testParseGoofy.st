testing-parsing
testParseGoofy
	| cards card address name phoneNumber |
	cards := ICCardHandParser parseVCardString: self goofyCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Markus Tschannen'.
	self assert: card version = 2.1.
	self assert: card birthday = (self dateClass year: 1980 month: 10 day: 30).
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Tschannen'.
	self assert: name givenName = 'Markus'.
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
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Neufeldstrasse 11'.
	self assert: address locality = 'Bern'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode = '3012'.
	self assert: address country = 'Schweiz'.
	
	self assert: card phoneNumbers size = 2.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '+41 31 302 08 56'.
	self assert: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers second.
	self assert: phoneNumber number = '+41 78 845 24 12'.
	self assert: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self assert: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	self assert: card emailAddresses isEmpty.
	self assert: (card timeZone isKindOf: String).
	self assert: (card timeZone = '-05:00; EST; Raleigh/North America').
	self assert: card geo = (37.386013 @ -122.082932)