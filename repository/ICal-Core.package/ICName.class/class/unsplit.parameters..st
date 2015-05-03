private
unsplit: aString parameters: aDictionary
	^aString splitAtCommas
		collect: [ :each | String fromICalString: each parameters: aDictionary ]
		thenSelect: [ :each | each isEmptyOrNil not ]