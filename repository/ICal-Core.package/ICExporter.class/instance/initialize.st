initialization
initialize
	super initialize.
	self dataStream: (WriteStream on: String new).
	self lineStream: (WriteStream on: String new).