initialize-release
initialize
	super initialize.
	self comments: OrderedCollection new.
	self names: OrderedCollection new.
	self recurrenceRules: OrderedCollection new.
	self recurrenceDates: OrderedCollection new.