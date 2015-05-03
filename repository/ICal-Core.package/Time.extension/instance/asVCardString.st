*ICal-Core
asVCardString
	(self nanoSecond = 0)
		ifTrue: [ ^ self print24 ]
		ifFalse: [
			^ self print24,'.',self formatNanosec ]
	