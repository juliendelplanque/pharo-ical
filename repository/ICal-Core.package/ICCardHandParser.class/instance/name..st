accessing
name: aString
	(aString includes: $.)
		ifFalse: [
			name := aString]
		ifTrue: [
			name := aString copyAfter: $. .
			self group: (aString copyUpTo: $.) ]
	