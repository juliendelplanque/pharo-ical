testing
testToDoList
	| calendar |
		
	calendar := calendars
		detect: [ :each | each name = 'veriveri''s Calendar' ]
		ifNone: [nil].
	self deny: calendar isNil.
	self deny: calendar todos size = 2.
	self deny: calendar todos isNil.
