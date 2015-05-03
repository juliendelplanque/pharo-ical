utilities
unfoldEqualsWhiteSpaces
	| w |
	w := Array new: 7.
	w at: 1 put: Character space asString.
	w at: 2 put: Character tab asString.
	w at: 3 put: (Character value: 9) asString.
	w at: 4 put: (Character value: 32) asString.
	w at: 5 put: String cr.
	w at: 6 put: String lf.
	w at: 7 put: $= asString.
	^ w