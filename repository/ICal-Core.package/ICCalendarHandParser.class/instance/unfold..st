utilities
unfold: aString
	"remove any sequence of CR LF WSP"
	| pattern whiteSpaces |
	whiteSpaces := Array
		with: Character space
		with: Character tab
		with: (Character value: 9)
		with: (Character value: 32).
	pattern := Array new: 3.
	pattern at: 1 put: Character cr.
	pattern at: 2 put: Character lf.
	^whiteSpaces
		inject: (self unfoldEquals
			ifTrue: [ self unfoldEquals: aString ]
			ifFalse: [ aString ])
		into: [ :string :each |
			pattern at: 3 put: each.
			(string includesSubstring: pattern)
				ifFalse: [ string ]
				ifTrue: [ string copyReplaceAll: pattern with: ''  ] ]