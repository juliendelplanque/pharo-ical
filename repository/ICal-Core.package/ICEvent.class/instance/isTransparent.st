transparency
isTransparent
	^self transparency = self class transparencyTranparent
		or: [ self end isNil ]