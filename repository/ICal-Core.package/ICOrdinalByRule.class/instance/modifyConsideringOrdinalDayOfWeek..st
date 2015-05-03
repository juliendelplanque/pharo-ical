as yet unclassified
modifyConsideringOrdinalDayOfWeek: aCollectionOfDates
	(self byValues anySatisfy: [ :each | each isString not ])
		ifFalse: [ ^ super modify: aCollectionOfDates ].
	^self shouldShrink
		ifTrue: [ self shrinkWithOrdinals: aCollectionOfDates ]
		ifFalse: [ self growWithOrdinals: aCollectionOfDates ]