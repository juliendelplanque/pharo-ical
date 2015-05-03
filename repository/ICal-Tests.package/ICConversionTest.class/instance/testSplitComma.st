testing
testSplitComma
	| parts |
	parts := 'a,b,c' splitAtCommas.
	self assert: parts = #('a' 'b' 'c') asOrderedCollection.
	
	parts := 'a\,b,c' splitAtCommas.
	self assert: parts = #('a\,b' 'c') asOrderedCollection.
	
	parts := 'a\,b\,c' splitAtCommas.
	self assert: parts = #('a\,b\,c') asOrderedCollection.
	
	"parts := splitter splitAtCommas: ',,'.
	self assert: parts = #('' '' '') asOrderedCollection.
	
	parts := splitter splitAtCommas: ',\,'.
	self assert: parts = #('' '\,') asOrderedCollection."