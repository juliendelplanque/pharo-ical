testing-parsing
testParseSean
	| cards card address name phoneNumber emailAddress organization |
	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Sean Glazier'.
	self assert: card version = 2.1.
	self assert: card title = 'Lead Software Engineer'.
	self assert: card birthday = (self dateClass year: 2005 month: 10 day: 01).
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Glazier'.
	self assert: name givenName = 'Sean'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 2.
	address := card addresses first.
	
	self deny: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self assert: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = '6 Christie Lane'.
	self assert: address locality = 'Stratham'.
	self assert: address region = 'NH'.
	self assert: address postalcode = '03885'.
	self assert: address country = 'USA'.
	
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
	
	self assert: address street = '6 Christie Lane'.
	self assert: address locality = 'Stratham'.
	self assert: address region = 'NH'.
	self assert: address postalcode = '03885'.
	self assert: address country = 'USA'.
	
	self assert: card phoneNumbers size = 4.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '603 772 4480'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
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
	self assert: phoneNumber number = '603 770 8260'.
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
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers third.
	self assert: phoneNumber number = '603 772 2852'.
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
	
	phoneNumber := card phoneNumbers fourth.
	self assert: phoneNumber number = '603 770 8260'.
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
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	self assert: card emailAddresses size = 2.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address = 'sglazier@comcast.net'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	emailAddress := card emailAddresses second.
	self assert: emailAddress address = 'sglazier@comcast.net'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self assert: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	organization := card organization.
	self assert: organization name = 'Cincom Systems'.
	self assert: organization unitNames isEmpty.
	