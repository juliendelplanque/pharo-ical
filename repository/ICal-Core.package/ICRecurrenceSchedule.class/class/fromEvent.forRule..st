instance creation
fromEvent: anEvent forRule: anICRecurrenceRule
	^ (self subclasses detect: [ :each | each frequency = anICRecurrenceRule frequency ])
		forEvent: anEvent
		withRule: anICRecurrenceRule