as yet unclassified
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			package: #'ICal-Core';
			package: #'ICal-Tests' with: [ spec requires: #('ICal-Core') ];
			package: #'ICal-GTInspector' with: [ spec requires: #('ICal-Core') ] ].