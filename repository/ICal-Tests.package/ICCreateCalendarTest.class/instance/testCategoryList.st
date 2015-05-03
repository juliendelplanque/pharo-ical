testing
testCategoryList
	| calendar |
		
	calendar := calendars
		detect: [ :each | each name = 'veriveri''s Calendar' ]
		ifNone: [ nil ].
	self deny: calendar isNil.
	self deny: calendar categories isNil.
	self assert: calendar categories isEmpty.	
	
