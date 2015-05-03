testing
testAppointments
	"test add and remove methods for appointments"

	| size |
	size := 1.
	self assert: calendar events size = size.
	calendar addEvent: event2.
	self assert: calendar events size = (size + 1).
	calendar removeEvent: event1.
	self assert: calendar events size = size.
	calendar removeEvent: event2.
	self assert: calendar events isEmpty.
	calendar addEvent: event1.
	self assert: calendar events first == event1