private
newLineIndicesFor: aString
	^Array streamContents: [ :stream |
		| nextIndex stringSize |
		stringSize := aString size.
		nextIndex := 1.
		[
			nextIndex := nextIndex + 74 min: stringSize.
			nextIndex := nextIndex = stringSize
				ifTrue: [ nextIndex ]
				ifFalse: [ self scanForBeginningCharacterAt: nextIndex in: aString ].
			stream nextPut: nextIndex
				] doWhileTrue: [ nextIndex < stringSize ] ]