testing-parsing
testParsePhilippe
	| cards card address name emailAddress |
	cards := ICCardHandParser parseVCardString: self philippeCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Philippe Marschall'.
	self assert: card version = 2.1.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Marschall'.
	self assert: name givenName = 'Philippe'.
	self assert: card nickname = 'pmm'.
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
	
	self assert: address street = 'Poststrasse 1'.
	self assert: address locality = 'Zürich'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode = '8001'.
	self assert: address country isEmptyOrNil.
	
	self assert: card phoneNumbers isEmpty.
	
	self assert: card emailAddresses size = 1.
	emailAddress := card emailAddresses anyOne.
	self assert: emailAddress address = 'philippe.marschall@gmail.com'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	self assert: card photo isNil.
	
	self assert: card aimids isEmpty.
	
	self assert: card icqids isEmpty.
	
	self assert: card msnids isEmpty.
	
	self assert: card yahooids isEmpty.
	