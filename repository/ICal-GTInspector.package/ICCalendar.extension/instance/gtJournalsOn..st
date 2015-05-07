*ICal-GTInspector
gtJournalsOn: aComposite
	<gtInspectorPresentationOrder: 3>

	aComposite table
		title: 'Journals';
		display: [ self journals ];
		column: 'Summary'
		evaluated: [ :each | each summary ]
		tags: [ :each | each isDraft ifTrue: [ 'Draft' ] ifFalse: [ 'Final' ] ]