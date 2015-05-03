parsing
parseParameters
	self parameters: Dictionary new.
	[ self stream atEnd or: [ self stream peek = $: ] ] whileFalse: [ self parseParameter ]