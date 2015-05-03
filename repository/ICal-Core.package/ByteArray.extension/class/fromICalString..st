*ICal-Core
fromICalString: aString
	^(Base64MimeConverter mimeDecodeToBytes: 
		(ReadStream on: aString))
			contents