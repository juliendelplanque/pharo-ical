accessing
topStack
	self tempAlarm isNil ifFalse: [
		^self tempAlarm ].
	
	self tempTime isNil ifFalse: [
		^self tempTime ].
	
	^self tempComponent