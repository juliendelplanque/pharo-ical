initialize-release
initialize
	super initialize.
	self created: self dateAndTimeClass now.
	self categories: OrderedCollection new.
	self recurrenceDates: OrderedCollection new.
	self exclusionDates: OrderedCollection new.
	self attachments: OrderedCollection new.
	self recurrenceRules: OrderedCollection new.
	self exclusionRules: OrderedCollection new.
	self sequenceNumber: 0