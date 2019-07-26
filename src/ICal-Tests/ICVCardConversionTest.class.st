Class {
	#name : #ICVCardConversionTest,
	#superclass : #ICTest,
	#category : 'ICal-Tests-Core-VCard'
}

{ #category : #testing }
ICVCardConversionTest >> testAddress [
	| address string |
	string := ';;123 Main Street;Any Town;CA;91921-1234;'.
	address := ICAddress fromVCardString: string parameters: Dictionary new.
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	self assert: address street = '123 Main Street'.
	self assert: address locality = 'Any Town'.
	self assert: address postalcode = '91921-1234'.
	self assert: address region = 'CA'.
	self assert: address country isEmptyOrNil.
	self assert: address asVCardString = string.	

	string := ';;501 E. Middlefield Rd.;Mountain View;CA;94043;U.S.A.'.
	address := ICAddress fromVCardString: string parameters: Dictionary new.
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	self assert: address street = '501 E. Middlefield Rd.'.
	self assert: address locality = 'Mountain View'.
	self assert: address postalcode = '94043'.
	self assert: address region = 'CA'.
	self assert: address country = 'U.S.A.'.
	self assert: address asVCardString = string.

	string := ';;6544 Battleford Drive;Raleigh;NC;27613-3502;U.S.A.'.
	address := ICAddress fromVCardString: string parameters: Dictionary new.
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	self assert: address street = '6544 Battleford Drive'.
	self assert: address locality = 'Raleigh'.
	self assert: address postalcode = '27613-3502'.
	self assert: address region = 'NC'.
	self assert: address country = 'U.S.A.'.
	self assert: address asVCardString = string.
]

{ #category : #testing }
ICVCardConversionTest >> testDate [
	| date |
	date := self dateClass year: 1985 month: 04 day: 12.
	self assert: date asVCardString = '1985-04-12'.

	date :=  self dateClass year: 1996 month: 08 day: 05.
	self assert: date asVCardString = '1996-08-05'.

	date :=  self dateClass year: 1996 month: 11 day: 11.
	self assert: date asVCardString = '1996-11-11'.
]

{ #category : #testing }
ICVCardConversionTest >> testDateAndTime [
	| dateAndTime |
	dateAndTime := self dateAndTimeClass year: 1996 month: 10 day: 22 hour: 14 minute: 00 second: 00.
	self assert: '1996-10-22T14:00:00'  = dateAndTime asVCardString.
	
	dateAndTime := self dateAndTimeClass year: 1996 month: 08 day: 11 hour: 12 minute: 34 second: 56.
	self assert: '1996-08-11T12:34:56'  = dateAndTime asVCardString.
]

{ #category : #testing }
ICVCardConversionTest >> testName [
	| name string |
	string := 'Public;John;Quinlan;Mr.;Esq.'.
	name := ICName fromICalString: string parameters: Dictionary new.
	self assert: name familyName = 'Public'.
	self assert: name givenName = 'John'.
	self assert: name additionalNames asArray = #('Quinlan').
	self assert: name honorificPrefixes asArray = #('Mr.').
	self assert: name honorificSuffixes asArray = #('Esq.').
	self assert: name asVCardString = string.
	string := 'Stevenson;John;Philip,Paul;Dr.;Jr.,M.D.,A.C.P.'.
	name := ICName fromICalString: string parameters: Dictionary new.
	self assert: name familyName = 'Stevenson'.
	self assert: name givenName = 'John'.
	self assert: name additionalNames asArray = #('Philip' 'Paul').
	self assert: name honorificPrefixes asArray = #('Dr.').
	self assert: name honorificSuffixes asArray = #('Jr.' 'M.D.' 'A.C.P.').
	self assert: name asVCardString = string
]

{ #category : #testing }
ICVCardConversionTest >> testParseDate [
	| string date |
	string := '1985-04-12'.
	date := self dateClass fromVCardString: string.
	self assert: date = (self dateClass year: 1985 month: 04 day: 12).

	string := '1996-08-05'.
	date := self dateClass fromVCardString: string.
	self assert: date = (self dateClass year: 1996 month: 08 day: 05).

	string := '1996-11-11'.
	date := self dateClass fromVCardString: string.
	self assert: date = (self dateClass year: 1996 month: 11 day: 11).

	string := '19850412'.
	date := self dateClass fromVCardString: string.
	self assert: date = (self dateClass year: 1985 month: 04 day: 12).
]

{ #category : #testing }
ICVCardConversionTest >> testParseDateAndTime [
	| string dateAndTime |
	string := '1996-10-22T14:00:00Z'.
	dateAndTime := self dateAndTimeClass fromVCardString: string.
	self assert: dateAndTime = (self dateAndTimeClass year: 1996 month: 10 day: 22 hour: 14 minute: 00 second: 00).

	string := '1996-08-11T12:34:56Z'.
	dateAndTime := self dateAndTimeClass fromVCardString: string.
	self assert: dateAndTime = (self dateAndTimeClass year: 1996 month: 08 day: 11 hour: 12 minute: 34 second: 56).

	string := '19960811T123456Z'.
	dateAndTime := self dateAndTimeClass fromVCardString: string.
	self assert: dateAndTime = (self dateAndTimeClass year: 1996 month: 08 day: 11 hour: 12 minute: 34 second: 56).
]

{ #category : #testing }
ICVCardConversionTest >> testParseString [
	| string value |
	string := 'Poststrasse 1'.
	value := String fromVCardString: string parameters: Dictionary new.
	self assert: string = value asICalString.
	
	string := 'Z=FCrich'.
	value := String fromVCardString: string parameters: (Dictionary new add: 'ENCODING' -> 'QUOTED-PRINTABLE'; yourself).
	self assert: value = 'Zürich'
]

{ #category : #testing }
ICVCardConversionTest >> testParseTime [
	| time string |
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: '10:22:00'  = time asVCardString.
	
	string := '10:22:00'.
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: (self timeClass fromVCardString: string) = time.
	
	string := '102200'.
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: (self timeClass fromVCardString: string) = time.
	
	string := '10:22:00.33'.
	time := self timeClass hour: 10 minute: 22 second: 00 nanosecond: 330000000.
	self assert: (self timeClass fromVCardString: string) = time.
	self assert: time asVCardString = string.
	
	string := '10:22:00.33Z'.
	time := self timeClass hour: 10 minute: 22 second: 00 nanosecond: 330000000.
	self assert: (self timeClass fromVCardString: string) = time.
	self assert: time asVCardUtcString = string.
	
	string := '10:22:00-08:00'.
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: (self timeClass fromVCardString: string) = time.
]

{ #category : #testing }
ICVCardConversionTest >> testTime [
	| time |
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: time asVCardString = '10:22:00'.

	time := self timeClass hour: 10 minute: 22 second: 00 nanosecond: 330000000.
	self assert: time asVCardString = '10:22:00.33'.

	time :=self timeClass hour: 10 minute: 22 second: 33.
	self assert: time asVCardString = '10:22:33'.

]
