testing
testTimezoneName
	| name |
	name := ICTimezoneName fromICalString: 'EST' parameters: Dictionary new.
	
	self assert: name text = 'EST'.
	self assert: name language isNil.

	name := ICTimezoneName fromICalString: 'HNE' parameters: (Dictionary with: 'LANGUAGE' -> 'fr-CA').
	
	self assert: name text = 'HNE'.
	self assert: name language = 'fr-CA'.
	
	name := ICTimezoneName fromICalString: 'EST' parameters: (Dictionary with: 'LANGUAGE' -> 'en').
	
	self assert: name text = 'EST'.
	self assert: name language = 'en'
	
	