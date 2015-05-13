offset
changeOffset: selector of: iCalendar of: aDuration
	(iCalendar perform: selector) do: [ :item |
		item start: (item start offset: aDuration).
		item end: (item end offset: aDuration) ]