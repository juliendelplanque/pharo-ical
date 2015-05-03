*ICal-Core
subStringsFull: separators 
	"Answer an array containing the substrings in the receiver separated 
	by the elements of separators."
	| char result sourceStream subString |
	sourceStream := ReadStream on: self.
	result := OrderedCollection new.
	subString := String new.
	[sourceStream atEnd]
		whileFalse: 
			[char := sourceStream next.
			(separators includes: char)
				ifTrue: [
					result add: subString.
					subString := String new ]
				ifFalse: [subString := subString , (String with: char)]].
	result add: subString.
	^ result