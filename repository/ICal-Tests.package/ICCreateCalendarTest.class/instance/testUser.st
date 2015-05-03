testing
testUser
	| newCalendar |
	newCalendar := calendars 
				detect: [:each | each name = 'veriveri''s Calendar']
				ifNone: [ nil ].
	self assert: newCalendar notNil.
	self assert: (newCalendar isKindOf: ICCalendar).
	self deny: newCalendar users isEmptyOrNil.
	self assert: newCalendar users anyOne = user