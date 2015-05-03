private
asJpeg: anArray
	| input proc |
	input := String streamContents: [ :stream |
		anArray do: [ :each |
			stream nextPut: (Character value: each) ] ].
	proc := OSProcess thisOSProcess
		command:  'convert -quality 0 - jpg:-'
		input: input.
	[ proc isComplete ] whileFalse: [ (Delay forSeconds: 1) wait ].
	^proc upToEnd asByteArray