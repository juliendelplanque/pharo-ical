initialize-release
initialize
	super initialize.
	self uid: self generateUid.
	self comments: OrderedCollection new