accessing
totalSeconds
	| sum |
	sum := (self hours * 3600)+ (self minutes * 60) + self seconds.
	^self positive
		ifTrue: [ sum ]
		ifFalse: [ sum negated ]