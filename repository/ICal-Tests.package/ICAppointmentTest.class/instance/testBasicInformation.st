testing
testBasicInformation
	self assert: appointment summary = 'aTitle'.
	appointment categories do: [ :each |
		self assert:  each class == ICCategory ].
	self assert: appointment location = 'Bern'.
	self assert: appointment textualDescription = 'description'.
	self assert: appointment start class = self dateAndTimeClass .
	self 
		assert: appointment start > (self dateAndTimeClass  
						year: 2005
						month: 4
						day: 18).
	self assert: appointment end class = self dateAndTimeClass.
	self 
		assert: appointment end > (self dateAndTimeClass  
						year: 2005
						month: 4
						day: 18)