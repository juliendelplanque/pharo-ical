"
My class side provide messages to convert fields of an ICCalendar object.
"
Class {
	#name : #ICFormatter,
	#superclass : #Object,
	#category : 'ICal-Formatter'
}

{ #category : #offset }
ICFormatter class >> changeEventOffsetOf: iCalendar of: aDuration [
	self changeOffset: #events of: iCalendar of: aDuration.
]

{ #category : #offset }
ICFormatter class >> changeOffset: selector of: iCalendar of: aDuration [
	(iCalendar perform: selector) do: [ :item |
		item start: (item start offset: aDuration).
		item end: (item end offset: aDuration) ]
]

{ #category : #conversion }
ICFormatter class >> convert: selector of: iCalendar with: conversionDictionnary accessor: accessor mutator: mutator [
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
]

{ #category : #conversion }
ICFormatter class >> convertCategoriesSummariesOf: iCalendar with: conversionDictionnary [
	"This message modify the summary of iCalendar categories collection using the conversionDictionnary.
	 The conversionDictionnary keys are regular expressions and its value are string to use in case
	 the regex matches with the summary."
	
	^self convert: #categories
		 	of: iCalendar with: conversionDictionnary
			accessor: #summary mutator: #summary:
]

{ #category : #conversion }
ICFormatter class >> convertEventsSummariesOf: iCalendar with: conversionDictionnary [
	"This message modify the summary of iCalendar events collection using the conversionDictionnary.
	 The conversionDictionnary keys are regular expressions and its value are string to use in case
	 the regex matches with the summary."
	
	^self convert: #events
		  	of: iCalendar with: conversionDictionnary
		  	accessor: #summary mutator: #summary:
]

{ #category : #filtering }
ICFormatter class >> filter: selector of: iCalendar with: listToRemove accessor: accessor [
	|copiedICal|
	copiedICal := iCalendar deepCopy.
	copiedICal
		perform: (selector , ':') asSymbol
		with: ((iCalendar perform: selector) select: [ :element |
		(listToRemove anySatisfy: [ :regex |
			((element perform: accessor) matchesRegex: regex) ]) not ]).
	^copiedICal
]

{ #category : #filtering }
ICFormatter class >> filterEventsSummariesOf: iCalendar with: regexList [
	"This message modify the summary of iCalendar events collection using the conversionDictionnary.
	 The conversionDictionnary keys are regular expressions and its value are string to use in case
	 the regex matches with the summary."
	
	^self filter: #events
		  	of: iCalendar with: regexList
		  	accessor: #summary
]
