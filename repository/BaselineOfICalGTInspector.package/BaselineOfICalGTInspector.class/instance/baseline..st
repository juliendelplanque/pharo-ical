baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec baseline: 'ICal' with: [
    		spec repository: 'github://juliendelplanque/pharo-ical/repository' ].
		spec package: #'ICal-GTInspector' ].