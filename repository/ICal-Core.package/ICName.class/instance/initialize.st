initialize-release
initialize
	super initialize.
	self additionalNames: OrderedCollection new.
	self honorificPrefixes: OrderedCollection new.
	self honorificSuffixes: OrderedCollection new.