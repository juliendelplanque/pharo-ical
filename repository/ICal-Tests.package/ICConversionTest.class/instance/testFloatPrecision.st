testing
testFloatPrecision
	"Double precision floating point has 64 bits (8 bytes),
	with 53 bit significand (or about 16 decimal digits of precision).
	But VM is using some of the bits, so get fewer than 16 decimal digits precision.
	Also, some precision may be lost during the calculations.
	Testing with 12 decimal digits seems to pass, on Pharo-1.4 with similar era VM."

	| string float |

	string := '123456.123456'.
	float := Float fromICalString: string.
	self assert: float asICalString equals: string.
	self assert: float equals: 123456.123456.