shrinking
select: indexFromEnd  fromEndOf: someDates
	|selectedDates index |
	index:=indexFromEnd negated. 
	selectedDates :=OrderedCollection new. 
	(someDates groupedBy: [:each | self groupFor: each]) do:[:eachGroup | 
	index > eachGroup size ifFalse: [selectedDates add: (eachGroup  reverse at: index ) ]].
	^selectedDates sort
	