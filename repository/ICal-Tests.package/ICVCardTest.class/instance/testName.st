testing-parsing
testName
	| name |
	name := ICName fromICalString: 'Public;John;Quinlan;Mr.;Esq' parameters: Dictionary new.
	self assert: name familyName = 	'Public'.
	self assert: name givenName = 	'John'.
	self assert: name additionalNames size = 1.
	self assert: name additionalNames first = 'Quinlan'.
	self assert: name honorificPrefixes size = 1.
	self assert: name honorificPrefixes first = 'Mr.'.
	self assert: name honorificSuffixes size = 1.
	self assert: name honorificSuffixes first = 'Esq'.

	name := ICName fromICalString: 'Stevenson;John;Philip,Paul;Dr.;Jr.,M.D.,A.C.P.' parameters: Dictionary new.
	self assert: name familyName = 	'Stevenson'.
	self assert: name givenName = 	'John'.
		
	self assert: name additionalNames size = 2.
	self assert: name additionalNames first = 'Philip'.
	self assert: name additionalNames second = 'Paul'.
	
	self assert: name honorificPrefixes size = 1.
	self assert: name honorificPrefixes first = 'Dr.'.
	
	self assert: name honorificSuffixes size = 3.
	self assert: name honorificSuffixes first = 'Jr.'.
	self assert: name honorificSuffixes second = 'M.D.'.
	self assert: name honorificSuffixes third = 'A.C.P.'.