utilities
unfoldEquals: aString
	"remove any sequence of = CR LF WSP"
	| pattern whiteSpaces |
	whiteSpaces := Array
		with: Character space
		with: Character tab
		with: (Character value: 9)
		with: (Character value: 32).
	pattern := Array new: 4.
	pattern at: 1 put: $=.
	pattern at: 2 put: Character cr.
	pattern at: 3 put: Character lf.
	^whiteSpaces inject: aString into: [ :string :each |
		pattern at: 4 put: each.
		(string includesSubstring: pattern)
			ifFalse: [ string ]
			ifTrue: [ string copyReplaceAll: pattern with: ''  ] ]