Class {
	#name : #ConfigurationOfLewis,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfLewis
}

{ #category : #private }
ConfigurationOfLewis class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfLewis class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfLewis class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfLewis class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfLewis class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfLewis class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfLewis class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfLewis class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline10: spec [
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'First try at defining a configuration for Lewis'.
		spec repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main' username: 'nicolasAnquetil' password: 'passwdst305'.
		spec author: 'NicolasAnquetil'.
		spec timestamp: '02/03/2014 20:15'.
		
		spec 
			package: 'AdaTests' with: [spec requires: 'Lewis'];
			package: 'Lewis' with: [spec requires: #('SmaCC' 'PetitStepExpress' 'Platypus') ];
			package: 'LewisHW' with: [spec requires: 'Lewis'];
			package: 'LewisMoose' with: [spec requires: 'LewisHW'].

		spec package: 'Platypus2' with: [
				spec requires: 'PetitStepExpress'.
				spec repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main' ].
		spec package: 'Platypus2Pharo' with: [
				spec requires: 'PetitStepExpress'.
				spec repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main'].

		spec package: 'PetitStepExpress' with: [spec repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/StepExpress/main'].

		spec
			group: 'Platypus' with: #('Platypus2' 'Platypus2Pharo' ) .

		spec project: 'SmaCC' with: [
			spec className: 'ConfigurationOfSmaCC';
			versionString: #stable;
			repository: 'http://www.smalltalkhub.com/mc/PharoExtras/Smacc/main'.
			]
	]
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline11: spec [
	<version: '1.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'First try at defining a configuration for Lewis'.
		spec repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main' username: 'nicolasAnquetil' password: 'passwdst305'.
		spec author: 'NicolasAnquetil'.
		spec timestamp: '02/03/2014 20:15'.
		
		spec 
			package: 'AdaTests' with: [spec requires: 'Lewis'];
			package: 'Lewis' with: [spec requires: #('SmaCC' 'PetitStepExpress' 'Platypus') ];
			package: 'LewisHW' with: [spec requires: 'Lewis'];
			package: 'LewisMoose' with: [spec requires: 'LewisHW'].

		spec package: 'Platypus2' with: [
				spec requires: 'PetitStepExpress'.
				spec repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main' ].
		spec package: 'Platypus2Pharo' with: [
				spec requires: 'PetitStepExpress'.
				spec repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main'].

		spec package: 'PetitStepExpress' with: [spec repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/StepExpress/main'].

		spec
			group: 'Platypus' with: #('Platypus2' 'Platypus2Pharo' ) .

		spec project: 'SmaCC' with: [
			spec className: 'ConfigurationOfSmaCC';
			versionString: #stable;
			repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main'.
			].
		spec project: 'PetitParser' with: [
			spec className: 'ConfigurationOfPetitParser';
			versionString: '1.51';
			repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main'.
			]
	]
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline12: spec [
	<version: '1.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'Updated configuration to include FASTCore'.
		spec repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'.
		spec author: 'NicolasAnquetil'.
		spec timestamp: '02/03/2014 20:15'.
		
		spec 
			package: 'AdaTests' with: [spec requires: 'Lewis'];
			package: 'Lewis' with: [spec requires: #('SmaCC' 'Platypus') ];
			package: 'LewisHW' with: [spec requires: 'Lewis'];
			package: 'LewisMoose' with: [spec requires: #('LewisHW' 'FASTCore')].
		
		spec project: 'PetitStepExpress' with: [ 
			spec className: 'ConfigurationOfPetitStepExpress';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/StepExpress/main'.
		 ].

		spec project: 'Platypus' with: [ 
			spec className: 'ConfigurationOfPlatypus';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main'.
		 ].

		spec project: 'SmaCC' with: [
			spec className: 'ConfigurationOfSmaCC';
			versionString: #stable;
			loads: #( 'Runtime' );
			repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main'.
			].

		spec project: 'PetitParser' with: [
			spec className: 'ConfigurationOfPetitParser';
			versionString: '1.5.1';
			repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main'.
			].

		spec project: 'FASTCore' with: [
			spec className: 'ConfigurationOfFASTCore';
			version: #stable;
			repository: 'http://smalltalkhub.com/mc/Moose/FASTCore/main'.
			]
	]
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline13: spec [
	<version: '1.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'Updated configuration to include FASTCore'.
		spec repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'.
		spec author: 'NicolasAnquetil'.
		spec timestamp: '02/03/2014 20:15'.
		
		spec 
			package: 'AdaTests' with: [spec requires: 'Lewis'];
			package: 'Lewis' with: [spec requires: #('SmaCC' 'Platypus') ];
			package: 'LewisHW' with: [spec requires: 'Lewis'];
			package: 'LewisMoose' with: [spec requires: #('LewisHW' 'FASTCore')].
		
		spec project: 'PetitStepExpress' with: [ 
			spec className: 'ConfigurationOfPetitStepExpress';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/StepExpress/main'.
		 ].

		spec project: 'Platypus' with: [ 
			spec className: 'ConfigurationOfPlatypus';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main'.
		 ].

		spec project: 'SmaCC' with: [
			spec className: 'ConfigurationOfSmaCC';
			versionString: #stable;
			loads: #( 'Runtime' );
			repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main'.
			].

		spec project: 'PetitParser' with: [
			spec className: 'ConfigurationOfPetitParser';
			versionString: '1.5.1';
			repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main'.
			].

		spec project: 'FASTCore' with: [
			spec className: 'ConfigurationOfFASTCore';
			version: #stable;
			repository: 'http://smalltalkhub.com/mc/Moose/FASTCore/main'.
			]
	]
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline14: spec [
	<version: '1.4-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'Remove PetitParseur dependency because it is not used.'.
		spec repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '19/01/2017 17:15'.
		
		spec 
			package: 'AdaTests' with: [spec requires: 'Lewis'];
			package: 'Lewis' with: [spec requires: #('SmaCC' 'Platypus') ];
			package: 'LewisHW' with: [spec requires: 'Lewis'];
			package: 'LewisMoose' with: [spec requires: #('LewisHW' 'FASTCore')].

		spec project: 'Platypus' with: [ 
			spec className: 'ConfigurationOfPlatypus';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main'.
		 ].

		spec project: 'SmaCC' with: [
			spec className: 'ConfigurationOfSmaCC';
			versionString: #stable;
			loads: #( 'Runtime' );
			repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main'.
			].

		spec project: 'FASTCore' with: [
			spec className: 'ConfigurationOfFASTCore';
			version: #stable;
			repository: 'http://smalltalkhub.com/mc/Moose/FASTCore/main'.
			]
	]
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline15: spec [
	<version: '1.5-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: 'Remove PetitParseur dependency because it is not used.'.
			spec repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'.
			spec author: 'CyrilFerlicot'.
			spec timestamp: '19/01/2017 17:15'.
			spec
				package: 'AdaTests' with: [ spec requires: 'Lewis' ];
				package: 'Lewis' with: [ spec requires: #('SmaCC' 'Platypus') ];
				package: 'LewisHW' with: [ spec requires: 'Lewis' ];
				package: 'LewisMoose' with: [ spec requires: #('LewisHW' 'FASTCore') ].
			spec
				project: 'Platypus'
				with: [ 
					spec
						className: 'ConfigurationOfPlatypus';
						versionString: #development;
						repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main' ].
			spec
				baseline: 'SmaCC'
				with: [ 
					spec
						repository: 'github://ThierryGoubier/SmaCC';
						loads: #('Runtime') ].
			spec
				project: 'FASTCore'
				with: [ 
					spec
						className: 'ConfigurationOfFASTCore';
						version: #stable;
						repository: 'http://smalltalkhub.com/mc/Moose/FASTCore/main' ] ]
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline16: spec [
	<version: '1.6-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'Use forked version of Platypus since noone has the right on Platypus. If we get the right later, remove this hack please.'.
		spec repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '31/08/2017 17:15'.
		
		spec 
			package: 'AdaTests' with: [spec requires: 'Lewis'];
			package: 'Lewis' with: [spec requires: #('SmaCC' 'Platypus') ];
			package: 'LewisHW' with: [spec requires: 'Lewis'];
			package: 'LewisMoose' with: [spec requires: #('LewisHW' 'FASTCore')].

		self flag: #todo. "For now, we do not have the right on Platypus and we really need to correct a bug. Since I get no answer to my mail to get accesses I forked Platypus inside Lewis repo and depend on it. If we get the rights later, remove this hack and use the repository of Alain."
		"spec project: 'Platypus' with: [ 
			spec className: 'ConfigurationOfPlatypus';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main'.
		 ]."
	
		spec project: 'Platypus' with: [ 
			spec className: 'ConfigurationOfPlatypus';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'.
		 ].

		spec project: 'SmaCC' with: [
			spec className: 'ConfigurationOfSmaCC';
			versionString: #stable;
			loads: #( 'Runtime' );
			repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main'.
			].

		spec project: 'FASTCore' with: [
			spec className: 'ConfigurationOfFASTCore';
			version: #stable;
			repository: 'http://smalltalkhub.com/mc/Moose/FASTCore/main'.
			]
	]
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline17: spec [
	<version: '1.7-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #'baseline'.
			spec description: 'Use forked version of Platypus since we don''t have the rights on Platypus. If we get the right later, remove this hack please.'.
			spec repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'.
			spec author: 'CyrilFerlicot'.
			spec timestamp: '31/08/2017 17:15'.
			spec
				package: 'AdaTests' with: [ spec requires: 'Lewis' ];
				package: 'Lewis' with: [ spec requires: #('SmaCC' 'Platypus') ];
				package: 'LewisHW' with: [ spec requires: 'Lewis' ];
				package: 'LewisMoose' with: [ spec requires: #('LewisHW' 'FASTCore') ].
	
	self flag: #todo. "For now, we do not have the right on Platypus and we really need to correct a bug. So I forked Platypus inside Lewis repo and depend on it. If we get the rights later, remove this hack and use the repository of Alain."
		"spec project: 'Platypus' with: [ 
			spec className: 'ConfigurationOfPlatypus';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/AlainPlantec/Platypus2/main'.
		 ]."
	
		spec project: 'Platypus' with: [ 
			spec className: 'ConfigurationOfPlatypus';
			versionString: #development;
			repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'.
		 ].
			spec
				baseline: 'SmaCC'
				with: [ 
					spec
						repository: 'github://ThierryGoubier/SmaCC';
						loads: #('Runtime') ].
			spec
				project: 'FASTCore'
				with: [ 
					spec
						className: 'ConfigurationOfFASTCore';
						version: #stable;
						repository: 'http://smalltalkhub.com/mc/Moose/FASTCore/main' ] ]
]

{ #category : #baselines }
ConfigurationOfLewis >> baseline18: spec [
	<version: '1.8-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #'baseline'.
			spec description: 'Trial for Moose 7'.
			spec repository: 'github://NicolasAnquetil/Ada2Famix'.
			spec
				package: 'Lewis' with: [ spec requires: #('SmaCC' 'Platypus') ];
				package: 'LewisHW' with: [ spec requires: 'Lewis' ];
				package: 'LewisMoose' with: [ spec requires: #('LewisHW' 'FAST') ].

		spec project: 'Platypus' with: [ 
			spec className: 'ConfigurationOfPlatypus';
			versionString: #development;
			repository: 'http://smalltalkhub.com/mc/AlainPlantec/Platypus2/main/'.
			"repository: 'http://www.smalltalkhub.com/mc/StephaneDucasse/Lewis/main'."
		 ].
			spec
				baseline: 'SmaCC'
				with: [ 
					spec
						repository: 'github://ThierryGoubier/SmaCC';
						loads: #('Runtime') ].
			spec
				baseline: 'FAST'
				with: [ spec
                loads: #('default');
                repository: 'github://moosetechnology/FAST:moose7/src' ].
	]
]

{ #category : #'symbolic versions' }
ConfigurationOfLewis >> development: spec [
	<symbolicVersion: #development>
	
	spec for: #common version: '1.7-baseline'.
	
	spec for: #'pharo4.x' version: '1.6-baseline'.

	spec for: #'pharo7.x' version: '1.8-baseline'.
]

{ #category : #accessing }
ConfigurationOfLewis >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]
