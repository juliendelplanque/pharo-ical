testing
testABCInc
	| organization string |
	string := 'ABC\, Inc.;North American Division;Marketing'.
	organization := ICOrganization fromICalString: string  parameters: Dictionary new.
	self assert: organization name = 'ABC, Inc.'.
	self assert: organization unitNames size = 2.
	self assert: organization unitNames first = 'North American Division'.
	self assert: organization unitNames second = 'Marketing'.
	self assert: organization asVCardString = string