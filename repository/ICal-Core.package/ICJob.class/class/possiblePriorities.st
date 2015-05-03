accessing-priorities
possiblePriorities
	"Description: The priority is specified as an integer in the range
   zero to nine. A value of zero (US-ASCII decimal 48) specifies an
   undefined priority. A value of one (US-ASCII decimal 49) is the
   highest priority. A value of two (US-ASCII decimal 50) is the second
   highest priority. Subsequent numbers specify a decreasing ordinal
   priority. A value of nine (US-ASCII decimal 58) is the lowest
   priority.

   A CUA with a three-level priority scheme of 'HIGH', 'MEDIUM' and
   'LOW' is mapped into this property such that a property value in the
   range of one (US-ASCII decimal 49) to four (US-ASCII decimal 52)
   specifies 'HIGH' priority. A value of five (US-ASCII decimal 53) is
   the normal or 'MEDIUM' priority. A value in the range of six (US-
   ASCII decimal 54) to nine (US-ASCII decimal 58) is 'LOW' priority.

   A CUA with a priority schema of 'A1', 'A2', 'A3', 'B1', 'B2', ...,
   'C3' is mapped into this property such that a property value of one
   (US-ASCII decimal 49) specifies 'A1', a property value of two (US-
   ASCII decimal 50) specifies 'A2', a property value of three (US-ASCII
   decimal 51) specifies 'A3', and so forth up to a property value of 9
   (US-ASCII decimal 58) specifies 'C3'."
	^0 to: 9