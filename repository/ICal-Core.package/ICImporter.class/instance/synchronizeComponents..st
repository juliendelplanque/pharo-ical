synchronizing
synchronizeComponents: aCollection
	
	self deleteComponentsNotInFile: aCollection.
	self updateOrAddComponentsInFile: aCollection.