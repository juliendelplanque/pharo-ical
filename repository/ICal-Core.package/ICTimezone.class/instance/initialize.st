initialize-release
initialize
	super initialize.
	self standardTimes: OrderedCollection new.
	self daylightSavingTimes: OrderedCollection new