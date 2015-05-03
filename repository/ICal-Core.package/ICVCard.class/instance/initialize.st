initialize-release
initialize
	super initialize.
	self addresses: OrderedCollection new.
	self phoneNumbers: OrderedCollection new.
	self emailAddresses: OrderedCollection new.
	self version: 3.0.
	self aimids: OrderedCollection new.
	self icqids: OrderedCollection new.
	self msnids: OrderedCollection new.
	self yahooids:OrderedCollection new.
	self categories: OrderedCollection new.
	self notes: OrderedCollection new