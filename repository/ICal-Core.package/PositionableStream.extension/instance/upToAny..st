*ICal-Core
upToAny: aCollection 
	"Answer a subcollection from the current access position to the 
	occurrence (if any, but not inclusive) of anObject in the receiver. If 
	anObject is not in the collection, answer the entire rest of the receiver."
	| newStream element |
	newStream := WriteStream on: (collection species new: 100).
	[self atEnd or: [aCollection includes: (element := self next) ] ]
		whileFalse: [newStream nextPut: element].
	^newStream contents