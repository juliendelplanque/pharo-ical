initialize-release
initialize
	super initialize.
	self alarms: OrderedCollection new.	
	self resources: OrderedCollection new.
	self beMediumPriority.

	
	