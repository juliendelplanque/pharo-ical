accessing
components
	^Array streamContents: [ :stream |
		stream
			nextPutAll: self events;
			nextPutAll: self todos;
			nextPutAll: self journals;
			nextPutAll: self timezones;
			nextPutAll: self freeBusy ]