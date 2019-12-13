"
Ada DECLARE statement seen as an entity that contains local variables, types, subprograms.

An instance of FASTAdaDeclareStatement is both a Statement (with FASTStatement inheritance) and a Container (without any inheritance). To cope with the missing multiple inheritance we would need to duplicate all ADAContainerEntity making sure they are defined without #opposite, since an ADAContainerEntity would be expected by the opposite end.

So far only 'functions', 'types', 'localVariables' and 'packages' are duplicated. See comments in initialize method to see which instance variables were not duplicated.

"
Class {
	#name : #FASTAdaDeclareStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'types',
		'functions',
		'localVariables',
		'statementBlock',
		'packages'
	],
	#category : #'Ada-Entities-FAST'
}

{ #category : #'as yet unclassified' }
FASTAdaDeclareStatement class >> annotation [
	<MSEClass: #DeclareStatement super: #FASTStatement>
	<package: #FASTAda>
]

{ #category : #accessing }
FASTAdaDeclareStatement >> addFunction: aFunction [ 
	functions add: aFunction
]

{ #category : #accessing }
FASTAdaDeclareStatement >> addType: aType [ 
	types add: aType
]

{ #category : #accessing }
FASTAdaDeclareStatement >> childrenNodes [

	^ localVariables copy add: statementBlock
]

{ #category : #accessing }
FASTAdaDeclareStatement >> functions [
	<MSEProperty: #functions type: #ADASubprogram>
	<multivalued>
	<MSEComment: 'Functions defined in the DECLARE statement, if any.'>
	^ functions
]

{ #category : #accessing }
FASTAdaDeclareStatement >> functions: aCollectionOfFunctions [
	functions value: aCollectionOfFunctions
]

{ #category : #initialize }
FASTAdaDeclareStatement >> initialize [
	super initialize.
"	separates := FMNullMultivalueLink on: self opposite: #container: selector: #separates."
	packages := FMNullMultivalueLink on: self opposite: #container: selector: #packages  .
"	tasks     := FMNullMultivalueLink on: self opposite: #container: selector: #tasks."
	types := FMNullMultivalueLink on: self opposite: #container: selector: #types.
	functions := FMNullMultivalueLink on: self opposite: #container: selector: #functions.
	localVariables := FMMultivalueLink on: self opposite: #parentNode: .
"	accesses  := FMNullMultivalueLink on: self opposite: #accessor: selector: #accesses."
"	outgoingInvocations := FMNullMultivalueLink on: self opposite: #sender: selector: #outgoingInvocations."


	scope := FASTAdaDeclareScope new.
	scope owner: self.

]

{ #category : #accessing }
FASTAdaDeclareStatement >> localVariables [
	<MSEProperty: #localVariables type: #FASTNamedEntity>
	<multivalued>
	<MSEComment: 'Local variables of the declare statement'>
	^ localVariables
]

{ #category : #accessing }
FASTAdaDeclareStatement >> localVariables: newLocalVariables [
	localVariables value: newLocalVariables
]

{ #category : #'as yet unclassified' }
FASTAdaDeclareStatement >> name [
	^ self privateState propertyAt: #name ifAbsent: [ super name ]
]

{ #category : #'as yet unclassified' }
FASTAdaDeclareStatement >> name: aString [
	^ self privateState propertyAt: #name put: aString
]

{ #category : #accessing }
FASTAdaDeclareStatement >> packages [
	<MSEProperty: #packages type: #FASTNamedEntity>
	<multivalued>
	<MSEComment: 'Packages defined by the declare statement'>	
	^ packages
]

{ #category : #accessing }
FASTAdaDeclareStatement >> packages: aCollectionOfPackages [
	packages value: aCollectionOfPackages
]

{ #category : #accessing }
FASTAdaDeclareStatement >> sourceLanguage [
	^ ADASourceLanguage singleton
]

{ #category : #accessing }
FASTAdaDeclareStatement >> statementBlock [
	<MSEProperty: #statementBlock type: #FASTStatementBlock opposite: #declaredStatementParent>
	<MSEComment: 'Statements block of the declareStatement'>
	^ statementBlock
]

{ #category : #accessing }
FASTAdaDeclareStatement >> statementBlock: aStatementBlock [
	statementBlock := aStatementBlock.
	aStatementBlock declaredStatementParent = self
		ifFalse: [ aStatementBlock declaredStatementParent: self ]
]

{ #category : #accessing }
FASTAdaDeclareStatement >> statements [
	<MSEProperty: #statements type: #FASTStatement>
	<multivalued>
	<derived>
	<MSEComment: 'Statements within the block of the declareStatement'>
	^ statementBlock statements
]

{ #category : #accessing }
FASTAdaDeclareStatement >> types [
	<MSEProperty: #types type: #ADAType>
	<multivalued>
	<MSEComment: 'Types of the behavioural entity'>
	^ types
]

{ #category : #accessing }
FASTAdaDeclareStatement >> types: newLocalTypes [
	types value: newLocalTypes
]
