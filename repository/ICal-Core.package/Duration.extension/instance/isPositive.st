*ICal-Core
isPositive
	^seconds > 0
	 	or: [ seconds = 0
			and: [ nanos > 0 ] ]