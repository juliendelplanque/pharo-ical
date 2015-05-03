testing
testName
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