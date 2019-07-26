testing
testWeekdays
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