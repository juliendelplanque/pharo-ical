testing
shouldExport: anObject
	^(anObject isNil
		or: [ anObject isCollection
			and: [ anObject isEmpty
			and: [ anObject isString not ] ] ]) not