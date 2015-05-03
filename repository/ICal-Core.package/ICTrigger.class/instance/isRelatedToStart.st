testing
isRelatedToStart
	^self related = self class relatedToStart
		or: [ self related isNil ]