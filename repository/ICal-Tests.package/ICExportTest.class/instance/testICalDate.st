testing
testICalDate
	self assert: event start asDate asICalString = '20050425'.
	self assert: event end asDate asICalString = '20050425'