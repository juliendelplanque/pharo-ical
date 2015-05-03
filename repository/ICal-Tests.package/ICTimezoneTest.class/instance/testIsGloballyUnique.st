testing
testIsGloballyUnique
	| timezone |
	timezone := ICTimezone new id: 'US-Eastern'; yourself.
	self deny: timezone isGloballyUnique.
	
	timezone := ICTimezone new id: 'California-Los_Angeles'; yourself.
	self deny: timezone isGloballyUnique.
	
	timezone := ICTimezone new id: '/US-New_York-New_York'; yourself.
	self assert: timezone isGloballyUnique.