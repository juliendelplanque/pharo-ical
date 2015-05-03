initialize-release
initialize
	super initialize.

	self beICalendar.
	self categories: OrderedCollection new.
	self journals: OrderedCollection new.
	self timezones: OrderedCollection new.
	self todos: OrderedCollection new.
	self events: OrderedCollection new.
	self users: OrderedCollection new.
	self freeBusy: OrderedCollection new.
	self productId: self class productId.
	self method: self class methodPublish