testing
testInitialize
	| anAppointment |
	anAppointment := ICEvent summary: 'physical test'.
	self assert: anAppointment summary = 'physical test'.
	self assert: anAppointment textualDescription isNil.
	self assert: anAppointment lastModified isNil.
	self assert: anAppointment isMediumPriority