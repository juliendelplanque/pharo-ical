Class {
	#name : #BaselineOfICal,
	#superclass : #BaselineOf,
	#category : 'BaselineOfICal'
}

{ #category : #'as yet unclassified' }
BaselineOfICal >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			package: #'ICal-Core';
			package: #'ICal-Tests' with: [ spec requires: #('ICal-Core') ];
			package: #'ICal-GTInspector' with: [ spec requires: #('ICal-Core') ] ].
]
