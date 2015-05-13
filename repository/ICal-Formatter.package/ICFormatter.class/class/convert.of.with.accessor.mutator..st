conversion
convert: selector of: iCalendar with: conversionDictionnary accessor: accessor mutator: mutator
	"Generic message that converts elements of an IterableCollection in a instance variable of
	 iCalendar that can be accessed with selector using the conversionDictionnary.
	 Elements value to be converted are accessed with accessor and modified with mutator.
	 The conversionDictionnary keys are regular expressions (as string) and its values are
	 strings.
	 This method return a copy of the original iCalendar (no side effect)."
	
	|copiedICal|
	copiedICal := iCalendar deepCopy.
	(copiedICal perform: selector) do: [ :element |
		conversionDictionnary keysDo: [ :regex |
		((element perform: accessor) matchesRegex: regex)
			ifTrue: [
				element perform: mutator with: (conversionDictionnary at: regex) ]
		 ]
	].
	^copiedICal