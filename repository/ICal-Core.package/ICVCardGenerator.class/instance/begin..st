processing-properties
begin: aString
	(aString sameAs:  'VCARD')
		ifFalse: [self error: 'Only expecting VCARDS'].
	self currentCard: ICVCard new