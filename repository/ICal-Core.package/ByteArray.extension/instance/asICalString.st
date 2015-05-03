*ICal-Core
asICalString
	^(Base64MimeConverter mimeEncode:
		(ReadWriteStream on: self))
			contents