duration
hasTime: aDuration
	^aDuration hours isZero not
		or: [ aDuration minutes isZero not
		or: [ aDuration seconds isZero not ] ]