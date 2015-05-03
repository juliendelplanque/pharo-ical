exporting
exportType: aTypeInformation of: anObject
	(anObject isCollection not or: [ anObject isString ]) ifTrue: [
		anObject iCalType = aTypeInformation defaultType ifFalse: [
			self
				exportParameter: 'VALUE'
				value: anObject iCalType ] ]
		