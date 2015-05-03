as yet unclassified
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec
			project: 'ZincHTTPComponents' with: [ 
				spec
					className: #ConfigurationOfZincHTTPComponents;
					versionString: #stable;
					repository: 'http://mc.stfx.eu/ZincHTTPComponents'
				 ].
		spec package: #'ICal-Core' ].