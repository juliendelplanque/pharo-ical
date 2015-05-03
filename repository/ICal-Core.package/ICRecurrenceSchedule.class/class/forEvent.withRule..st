instance creation
forEvent: anEvent withRule: anICRecurrenceRule
	^ self basicNew initialize createFromRule: anICRecurrenceRule for: anEvent