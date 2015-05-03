as yet unclassified
initialize
	super initialize.
	interval := 1.
	byRules := SortedCollection new.
	cache := false.
	dateCache := SortedCollection new