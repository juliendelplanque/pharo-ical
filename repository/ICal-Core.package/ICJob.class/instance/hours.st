calculation
hours
	| diff |
	diff := self end - self start.
	^diff hours + (diff minutes / 60) asFloat.