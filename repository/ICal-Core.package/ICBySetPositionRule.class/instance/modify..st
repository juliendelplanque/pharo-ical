as yet unclassified
modify: aCollectionOfDates
	|newDates|
	newDates :=OrderedCollection new. 
	
	
	 self byValues
		collect: [ :eachOrdinal | 
			newDates addAll:(eachOrdinal > 0
				ifTrue: [ self select: eachOrdinal fromStartOf:aCollectionOfDates ]
				ifFalse: [ self select: eachOrdinal fromEndOf: aCollectionOfDates ]) ].
			^newDates