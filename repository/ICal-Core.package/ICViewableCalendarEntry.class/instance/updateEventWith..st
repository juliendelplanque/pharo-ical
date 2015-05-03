updating
updateEventWith: anEventOrCommand 
	self created: anEventOrCommand  created.
	self status: anEventOrCommand  status.
	self lastModified: anEventOrCommand lastModified