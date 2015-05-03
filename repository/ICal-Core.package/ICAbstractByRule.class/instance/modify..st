as yet unclassified
modify: aCollectionOfDates
	^ self shouldShrink
		ifTrue: [ self shrink: aCollectionOfDates ]
		ifFalse: [ self grow: aCollectionOfDates ]