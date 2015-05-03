processing-properties
end: aString
	(aString sameAs: 'VCARD') ifFalse: [
		self error: 'Only expecting VCARDS' ].
	self cards add: self currentCard.
	self currentCard: nil