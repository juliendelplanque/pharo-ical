testing
testUpdateAppointment
	| appEvent |
	appEvent := ICEvent summary: 'meeting'.
	calendar addEvent: appEvent.
	appEvent updateEventWith: appointment1.
	self assert: appEvent summary = appointment1 summary.
	self assert: appEvent categories = appointment1 categories.
	self assert: appEvent textualDescription = appointment1 textualDescription.
	self assert: appEvent status = appointment1 status.
	self assert: appEvent priority = appointment1 priority.
	self assert: appEvent created = appointment1 created.
	self assert: appEvent lastModified = appointment1 lastModified.
	self assert: appEvent sequenceNumber = appointment1 sequenceNumber.
	self assert: appEvent start = appointment1 start.
	self assert: appEvent end = appointment1 end.