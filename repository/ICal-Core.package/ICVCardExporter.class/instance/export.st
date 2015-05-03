exporting
export
	self dataStream reset.
	self lineStream reset.
	self cards do: [ :each |
		ICCardVersion
			use: each version
			during: [ self export: each ] ].
	self save