dispatching
begin: aString
	(self specialBegins includes: aString)
		ifTrue: [
			self perform: ('begin' , aString asLowercase capitalized) asSymbol ]
		ifFalse: [
			self tempComponent: (ICConversion componentClassFor: aString) new ]