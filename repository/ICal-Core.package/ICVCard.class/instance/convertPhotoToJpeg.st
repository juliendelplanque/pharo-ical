public
convertPhotoToJpeg
	(self photo notNil and: [ self photo isKindOf: ByteArray ])
		ifTrue: [ self photo: (self asJpeg: self photo) ]