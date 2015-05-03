exporting
export: aComponent
	self exportBeginComponent: aComponent iCalType.
	aComponent exportOn: self.
	self exportEndComponent: aComponent iCalType