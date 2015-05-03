testing
testTzid
	| dateAndTime |
	ICConversion hasChronosLoaded
		ifTrue: [ 
			dateAndTime := (Smalltalk classNamed: #Timepoint)
				fromICalString: '20040807T130000'
				parameters: (Dictionary new add: 'TZID' -> 'Pacific/Wallis'; yourself).
				
			self assert: dateAndTime timeZone name = #'Pacific/Wallis'.
			self assert: dateAndTime =  ((Smalltalk classNamed: #Timepoint)
				year: 2004 month: 08 day: 07
				hour: 13 minute: 00 second: 00
				timeZone: #'Pacific/Wallis') ]
		ifFalse: [
			"not yet implemented" ]