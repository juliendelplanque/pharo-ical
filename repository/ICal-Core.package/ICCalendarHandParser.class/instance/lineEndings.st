accessing
lineEndings
	^lineEndings ifNil:[lineEndings:= (Array with: Character cr with: Character lf).]