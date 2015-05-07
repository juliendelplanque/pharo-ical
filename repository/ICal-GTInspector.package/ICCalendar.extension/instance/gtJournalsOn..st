*ICal-GTInspector
gtJournalsOn: aComposite
	<gtInspectorPresentationOrder: 44>

	aComposite table
		title: 'Journals';
		display: [ self journals ];
		column: 'Textual description'
		evaluated: [ :each | each summary ]
		tags: [ :each | each isDraft ifTrue: [ 'Draft' ] ifFalse: [ 'Final' ] ]