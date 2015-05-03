testing
testUnibe
	| organization string |
	string := 'University of Bern'.
	organization := ICOrganization fromICalString: string  parameters: Dictionary new.
	self assert: organization name = 'University of Bern'.
	self assert: organization unitNames isEmpty.
	self assert: organization asVCardString = string