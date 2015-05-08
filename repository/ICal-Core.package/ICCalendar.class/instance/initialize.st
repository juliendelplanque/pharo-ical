initialize-release
initialize
	super initialize.

	self beICalendar.
	self categories: OrderedCollection new.
	self journals: OrderedCollection new.
	self timezones: OrderedCollection new.
	self todos: (SortedCollection sortBlock: [:td1 :td2 | td1 due < td2 due ]).
	self events: (SortedCollection sortBlock: [:e1 :e2 | e1 start < e2 start ]).
	self users: OrderedCollection new.
	self freeBusy: (SortedCollection sortBlock: [:fb1 :fb2 | fb1 start < fb2 start ]).
	self productId: self class productId.
	self method: self class methodPublish