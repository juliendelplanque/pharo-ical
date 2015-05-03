exporting
exportOldLine: aString
	| start string |
	start := 0.
	string := self stringConversionBlock value: aString.
	(self newLineIndicesFor: string) do: [ :end |
		start = 0
			ifFalse: [ self dataStream space ].
		self dataStream
			next: (end min: string size) - start
			putAll: string
			startingAt: start + 1.
		end = string size ifFalse: [
			self dataStream nextPut: $= ].
		self dataStream nextPutAll: String crlf.
		start := end ]