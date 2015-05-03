actions
updateEventWith: anEventOrCommand 
	super updateEventWith: anEventOrCommand.

	self start: anEventOrCommand start.
	self end: anEventOrCommand end.
	self location: anEventOrCommand location.