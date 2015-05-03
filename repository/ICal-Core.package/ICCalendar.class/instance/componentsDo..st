accessing
componentsDo: aBlock
	self eventsDo: aBlock.
	self todosDo: aBlock.
	self journalsDo: aBlock.
	self timezonesDo: aBlock.
	self freeBusyDo: aBlock