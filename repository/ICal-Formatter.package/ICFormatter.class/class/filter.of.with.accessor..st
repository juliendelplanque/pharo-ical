filtering
filter: selector of: iCalendar with: listToRemove accessor: accessor
	|copiedICal|
	copiedICal := iCalendar deepCopy.
	copiedICal
		perform: (selector , ':') asSymbol
		with: ((iCalendar perform: selector) select: [ :element |
		(listToRemove anySatisfy: [ :regex |
			((element perform: accessor) matchesRegex: regex) ]) not ]).
	^copiedICal