*ICal-Core
formatNanosec
	|tmp|
	tmp := (self nanoSecond /10000000) asInteger.
	(tmp < 10)
		ifTrue: [ ^'0',tmp asString ]
		ifFalse: [ ^tmp asString ]