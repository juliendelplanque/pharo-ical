accessing
activeComponent
	^self tempAlarm isNil
		ifTrue: [ self tempComponent ]
		ifFalse: [ self tempAlarm ]