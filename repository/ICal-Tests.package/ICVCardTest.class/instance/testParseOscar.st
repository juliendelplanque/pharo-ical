testing-parsing
testParseOscar
	| cards card address name phoneNumber emailAddress organization |
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Oscar2 Nierstrasz'.
	self assert: card version = 3.0.
	self assert: card title = 'Professor'.
	
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Nierstrasz'.
	self assert: name givenName = 'Oscar'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 3.
	address := card addresses first.
	
	self deny: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self assert: address isPreferred.
	self assert: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Software Composition Group
IAM, University of Bern
Neubrueckstrasse 10'.
	self assert: address locality = 'Bern'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode = 'CH-3012'.
	self assert: address country = 'SWITZERLAND'.
	
	address := card addresses second.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Fluhmattweg 41'.
	self assert: address locality = 'Kehrsatz'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode = '3122'.
	self assert: address country = 'SWITZERLAND'.
	
	address := card addresses third.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Schuetzenmattstrasse 14, room 103'.
	self assert: address locality isEmptyOrNil.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode isEmptyOrNil.
	self assert: address country isEmptyOrNil.
	
	self assert: card phoneNumbers size = 3.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '+41 31 631.4618'.
	self deny: phoneNumber isHome.
	self assert: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers second.
	self assert: phoneNumber number = '+41 31 961.7065'.
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
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers third.
	self assert: phoneNumber number = '+41 31 631.3355'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self assert: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	self assert: card emailAddresses size = 1.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address = 'oscar.nierstrasz@acm.org'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	organization := card organization.
	self assert: organization name = 'University of Bern'.
	self assert: organization unitNames isEmpty.