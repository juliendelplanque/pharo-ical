Class {
	#name : #ICRecurrenceRuleTest,
	#superclass : #ICTest,
	#category : 'ICal-Tests-Core'
}

{ #category : #testing }
ICRecurrenceRuleTest >> testHours [
	| rule expected firstOption secondOption actual |
	rule := ICRecurrenceRule frequency: 'MONTHLY'.
	
	rule addHour: 5.	
	expected := 'FREQ=MONTHLY;BYHOUR=5'.
	self assert: expected = rule asICalString.
	
	rule addHour: 15.	
	firstOption := 'FREQ=MONTHLY;BYHOUR=15,5'.
	secondOption := 'FREQ=MONTHLY;BYHOUR=5,15'.
	actual := rule asICalString.
	self assert: ((Array with: firstOption with: secondOption) includes: actual).
	
]

{ #category : #testing }
ICRecurrenceRuleTest >> testParsing [
	| string rule options |
	string := 'FREQ=MONTHLY;BYDAY=TU,MO,TH,WE,FR;BYSETPOS=-1'.
	rule := ICRecurrenceRule fromICalString: string.
	options := Array
		streamContents: [ :array | 
			#('MO' 'TU' 'WE' 'TH' 'FR')
				permutationsDo: [ :permutation | 
					array
						nextPut:
							(String
								streamContents: [ :stream | 
									stream nextPutAll: 'FREQ=MONTHLY;BYDAY='.
									permutation do: [ :each | stream nextPutAll: each ] separatedBy: [ stream nextPut: $, ].
									stream nextPutAll: ';BYSETPOS=-1' ]) ] ].
	
	self assert: (options includes: rule asICalString)
]

{ #category : #testing }
ICRecurrenceRuleTest >> testRepetition [
	| rule expected |
	rule := ICRecurrenceRule frequency: 'MONTHLY'.
	
	rule count: 4.	
	expected := 'FREQ=MONTHLY;COUNT=4'.
	self assert: expected = rule asICalString.
	
	rule until: (self dateClass year: 1997 month: 3 day: 10).
	expected := 'FREQ=MONTHLY;UNTIL=19970310'.
	self assert: expected = rule asICalString.
	
	rule count: 2.
	expected := 'FREQ=MONTHLY;COUNT=2'.
	self assert: expected = rule asICalString.
]

{ #category : #testing }
ICRecurrenceRuleTest >> testSimple [
	| rule |
	rule := ICRecurrenceRule frequency: 'MONTHLY'.
	self assert: 'FREQ=MONTHLY' = rule asICalString
]

{ #category : #testing }
ICRecurrenceRuleTest >> testWeekdays [
	| rule expected options |
	rule := ICRecurrenceRule frequency: 'MONTHLY'.
	
	rule addWeekday: 'MO'.	
	expected := 'FREQ=MONTHLY;BYDAY=MO'.
	self assert: expected equals: rule asICalString.
	
	rule addWeekday: 'TU' occurrence: 2.	
	expected := 'FREQ=MONTHLY;BYDAY=MO,2TU'.
	self assert: expected equals: rule asICalString.
	
	rule addWeekday: 'WE' occurrence: -5.
	options := Array streamContents: [ :array |
		#('MO' '2TU' '-5WE')	permutationsDo: [ :permutation |
				array nextPut: (String streamContents: [ :stream |
					stream nextPutAll: 'FREQ=MONTHLY;BYDAY='.
					permutation
						do: [ :each | stream nextPutAll: each ]
						separatedBy: [ stream nextPut: $, ] ] ) ] ].
	self assert: (options includes: rule asICalString)
]
