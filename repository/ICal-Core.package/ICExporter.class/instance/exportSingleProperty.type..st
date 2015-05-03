exporting
exportSingleProperty: anObject type: aTypeInformation 
	self exportPropertyName: aTypeInformation.
	self exportType: aTypeInformation of: anObject.
	self exportAdditionalOf: anObject type: aTypeInformation.
	self exportValue: anObject type: aTypeInformation.
	self exportLine: self lineStream contents.
	self lineStream reset