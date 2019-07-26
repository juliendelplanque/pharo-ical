"
This object is used to represents the STANDARD keyword in iCal syntax.

For example (from the grammar RFC 2445):
standardc  = ""BEGIN"" "":"" ""STANDARD"" CRLF
			tzprop
			 ""END"" "":"" ""STANDARD"" CRLF
"
Class {
	#name : #ICStandardTime,
	#superclass : #ICTime,
	#category : 'ICal-Core-Model'
}

{ #category : #accessing }
ICStandardTime class >> iCalType [
	^'STANDARD'
]
