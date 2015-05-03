converting
asMIMEDocument
	^MIMEDocument
		contentType: self contentType 
		content: self dataStream contents