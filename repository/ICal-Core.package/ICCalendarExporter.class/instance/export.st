exporting
export
	self dataStream reset.
	self lineStream reset.
	self export: self calendar.
	self save