private
gethostnameFFi
	| bufferSize buffer status |
	bufferSize := 255.
	buffer := String new: 255.
	status := self gethostname: buffer with: bufferSize.
	^buffer