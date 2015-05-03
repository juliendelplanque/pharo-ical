dispatching
end: aString
	(self specialEnds includes: aString)
		ifTrue: [
			self perform: ('end' , aString asLowercase capitalized) asSymbol ]
		ifFalse: [
			self calendar addComponent: self tempComponent.
			self tempComponent: nil ]