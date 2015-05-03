as yet unclassified
shrink: aCollectionOfDates
	^ aCollectionOfDates removeAllSuchThat: [ :each | self shrinkTestFor: each ]