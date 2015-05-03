comparing
= other
	^(other isKindOf: ICUtcOffset)
		and: [ self positive = other positive
		and: [ self hours = other hours
		and: [ self minutes = other minutes
		and: [ self seconds = other seconds ] ] ] ]