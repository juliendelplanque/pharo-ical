private
calendarTestWithName: aString 
	| newCalendar |
	newCalendar := calendars
		detect: [:each | each name = aString]
		ifNone: [ nil ].
	self assert: newCalendar notNil.
	self assert: (newCalendar isKindOf: ICCalendar).
	self assert: newCalendar name = aString.
	self assert: newCalendar categories isEmpty