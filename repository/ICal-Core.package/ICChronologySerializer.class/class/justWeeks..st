duration
justWeeks: aDuration
	^aDuration weeks isZero not
		and: [ (self daysWithoutWeeks: aDuration) isZero
		and: [ aDuration hours isZero
		and: [ aDuration minutes isZero
		and: [ aDuration seconds isZero ] ] ] ]