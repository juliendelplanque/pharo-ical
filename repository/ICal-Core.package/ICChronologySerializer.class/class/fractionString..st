time
fractionString: nanoseconds
	| string lastIndex |
	string := nanoseconds asString.
	lastIndex := string size.
	[ (string at: lastIndex) = $0 ] whileTrue: [
		lastIndex := lastIndex - 1].
	^string first: lastIndex