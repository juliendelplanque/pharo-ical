private
newLineIndicesFor: aString
	^Array streamContents: [ :stream |
		| nextIndex stringSize |
		stringSize := aString size.
		nextIndex := 1.
		[
			nextIndex := nextIndex + 73 min: stringSize.
			stringSize - nextIndex = 1 ifTrue: [
				nextIndex := nextIndex + 1 ].
			nextIndex := nextIndex = stringSize
				ifTrue: [ nextIndex ]
				ifFalse: [ self scanForBeginningCharacterAt: nextIndex in: aString ].
			stream nextPut: nextIndex
				] doWhileTrue: [ nextIndex < stringSize ] ]