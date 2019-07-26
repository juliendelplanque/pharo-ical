Class {
	#name : #ICAppointmentTest,
	#superclass : #ICTest,
	#instVars : [
		'appointment',
		'serie'
	],
	#category : 'ICal-Tests-Core'
}

{ #category : #running }
ICAppointmentTest >> setUp [
	appointment := ICEvent summary: 'aTitle'.
	appointment location: 'Bern'.
	appointment textualDescription: 'description'.
	appointment addCategory: (ICCategory summary: 'first').
	appointment start: (self dateAndTimeClass  
				year: 2005
				month: 4
				day: 18
				hour: 21
				minute: 1
				second: 0).
	appointment end: (self dateAndTimeClass  
				year: 2005
				month: 4
				day: 18
				hour: 23
				minute: 59
				second: 0).

]

{ #category : #testing }
ICAppointmentTest >> testBasicInformation [
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
]
