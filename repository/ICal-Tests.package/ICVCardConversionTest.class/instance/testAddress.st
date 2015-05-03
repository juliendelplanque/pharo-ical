testing
testAddress
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