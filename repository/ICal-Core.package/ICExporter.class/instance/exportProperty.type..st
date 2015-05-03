exporting
exportProperty: anObject type: aTypeInformation 
	(self shouldExport: anObject) ifTrue: [
		(anObject isCollection
			and: [ aTypeInformation multipleValuesPerLine not
			and: [ anObject isString not ] ]) 
				ifTrue: [
					anObject do: [ :each |
						self exportSingleProperty: each type: aTypeInformation ] ]
				ifFalse: [
					self exportSingleProperty: anObject type: aTypeInformation ] ]