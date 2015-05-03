exporting
exportValue: anObject type: aTypeInformation
	self lineStream nextPut: $:.
	(anObject isCollection not or: [ anObject isString ])
			ifTrue: [				
				self lineStream nextPutAll: (aTypeInformation convert: anObject) ]
			ifFalse: [
				anObject
					do: [ :each | self lineStream nextPutAll: (aTypeInformation convert: each) ]
					separatedBy: [ self lineStream nextPut: $, ] ]