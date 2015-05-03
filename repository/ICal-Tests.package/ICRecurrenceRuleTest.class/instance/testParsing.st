testing
testParsing
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