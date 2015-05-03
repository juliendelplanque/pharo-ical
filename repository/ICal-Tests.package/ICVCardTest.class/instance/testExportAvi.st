testing-exporting
testExportAvi
	"This test may FAIL because of Dictionary ordering.
	The Dictionary parameter in:
		ICVCardGenerator>>email:parameters:
	means that parameters may appear in a different order then
	the expected result has used.
	"
	| cards exporter str |
	cards := ICCardHandParser parseVCardString: self aviCardString.
	cards anyOne photo: nil.
	
	exporter := ICVCardExporter cards: cards.
	exporter export.
	str := self aviCardStringExport.

	self assert: exporter dataStream contents equals: str.

	exporter dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value equals: (str at: index) ].
	