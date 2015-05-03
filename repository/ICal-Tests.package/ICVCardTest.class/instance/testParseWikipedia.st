testing-parsing
testParseWikipedia
	| cards card address name phoneNumber emailAddress |
	cards := ICCardHandParser parseVCardString: self wikipediaCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Firstname Lastname'.
	self assert: card version = 2.1.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Lastname'.
	self assert: name givenName = 'Firstname'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 1.
	address := card addresses anyOne.
	
	self deny: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self assert: address isPreferred.
	self assert: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address locality isEmptyOrNil.
	
	self assert: address street = 'Bar Street 99'.
	self assert: address extended = ('Footown 12345', String lf, 'Fooland').
	self assert: address region isEmptyOrNil.
	self assert: address postalcode isEmptyOrNil.
	self assert: address country isEmptyOrNil.
	
	self assert: card phoneNumbers size = 1.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '+358-40-123456'.
	self deny: phoneNumber isHome.
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

	
	self assert: card emailAddresses size = 1.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address = 'nobody@example.invalid'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.