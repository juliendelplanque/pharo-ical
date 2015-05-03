exporting-parameters
exportParameter: aName value: aValue
	self lineStream
		nextPut: $; ;
		nextPutAll: aName;
		nextPut: $=;
		nextPutAll: aValue
		