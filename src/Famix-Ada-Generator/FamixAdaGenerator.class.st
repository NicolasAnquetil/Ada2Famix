Class {
	#name : #FamixAdaGenerator,
	#superclass : #FamixFileBasedLanguageGenerator,
	#instVars : [
		'compilationUnit',
		'container',
		'aggregateArgument',
		'argument',
		'attribute',
		'genericPackageInstanciation',
		'genericSubprogramInstanciation',
		'initializingInvocation',
		'instanceableEntity',
		'method',
		'package',
		'packageAlias',
		'parameter',
		'separateDeclaration',
		'subprogram',
		'task',
		'topLevelContainer',
		'type',
		'typeAccess',
		'typeAccessSubprogram',
		'typeArray',
		'typeClass',
		'typeEnum',
		'typeMod',
		'typeRange',
		'typeRecord',
		'typeTask',
		'unknownContainer',
		'structural',
		'access',
		'fastScope'
	],
	#category : #'Famix-Ada-Generator'
}

{ #category : #accessing }
FamixAdaGenerator class >> packageName [
	^ #'Famix-Ada'
]

{ #category : #accessing }
FamixAdaGenerator class >> prefix [
	^ #'ADA'
]

{ #category : #accessing }
FamixAdaGenerator class >> submetamodels [
	^ { FASTAdaGenerator }
]

{ #category : #definition }
FamixAdaGenerator >> defineClasses [

	super defineClasses.

	access := builder newClassNamed: #Access.
	container := builder newClassNamed: #ContainerEntity.
	"tInstanceable := builder newClassNamed: #TInstanceable."
	aggregateArgument := builder newClassNamed: #AggregateArgument.
	argument := builder newClassNamed: #Argument.
	attribute := builder newClassNamed: #Attribute.
	compilationUnit := builder newClassNamed: #CompilationUnit.
	genericPackageInstanciation := builder newClassNamed: #GenericPackageInstanciation.
	genericSubprogramInstanciation := builder newClassNamed: #GenericSubprogramInstanciation.
	initializingInvocation := builder newClassNamed: #InitializingInvocation.
	method := builder newClassNamed: #Method.
	package := builder newClassNamed: #Package.
	packageAlias := builder newClassNamed: #PackageAlias.
	parameter := builder newClassNamed: #Parameter.
	separateDeclaration := builder newClassNamed: #SeparateDeclaration.
	structural := builder newClassNamed: #StructuralEntity.
	subprogram := builder newClassNamed: #Subprogram.
	task := builder newClassNamed: #Task.
	topLevelContainer := builder newClassNamed: #TopLevelContainer.
	type := builder newClassNamed: #Type.
	typeAccess := builder newClassNamed: #TypeAccess.
	typeAccessSubprogram := builder newClassNamed: #TypeAccessSubprogram.
	typeArray := builder newClassNamed: #TypeArray.
	typeClass := builder newClassNamed: #TypeClass.
	typeEnum := builder newClassNamed: #TypeEnum.
	typeMod := builder newClassNamed: #TypeMod.
	typeRange := builder newClassNamed: #TypeRange.
	typeRecord := builder newClassNamed: #TypeRecord.
	typeTask := builder newClassNamed: #TypeTask.
	unknownContainer := builder newClassNamed: #UnknownContainer.

	fastScope := self remoteEntity: #Scope withPrefix: #FASTAda.
]

{ #category : #definition }
FamixAdaGenerator >> defineHierarchy [

	super defineHierarchy.

	access --|> association.
	access --|> #TAccess.

	container --|> namedEntity.
	container --|> #TNamespace.
	container --|> #TWithLocalVariables.
	container --|> #TWithAccesses.  "should be lower in hierarchy? Like BehaviouralEntity ?"
	container --|> #TScopable.
	
	"tInstanceable := builder newClassNamed: #TInstanceable."
	
	"aggregateArgument := builder newClassNamed: #AggregateArgument.
	argument := builder newClassNamed: #Argument.
	attribute := builder newClassNamed: #Attribute."

	compilationUnit --|> container.	
	compilationUnit --|> #TCompilationUnit.

	"genericPackageInstanciation := builder newClassNamed: #GenericPackageInstanciation.
	genericSubprogramInstanciation := builder newClassNamed: #GenericSubprogramInstanciation.
	initializingInvocation := builder newClassNamed: #InitializingInvocation.
	method := builder newClassNamed: #Method."

	package --|> container.
	package --|> #TPackage.
	package --|> #TWithFunctions.
	package --|> #TWithLocalVariables.
	
	"packageAlias := builder newClassNamed: #PackageAlias."
	parameter --|> structural.
	"separateDeclaration := builder newClassNamed: #SeparateDeclaration."

	subprogram --|> container.
	subprogram --|> #TFunction.
	subprogram --|> #TWithLocalVariables.

	structural --|> namedEntity.
	structural --|> #TAccessible.
	
	topLevelContainer --|> container.

]

{ #category : #definition }
FamixAdaGenerator >> defineProperties [
	super defineProperties.
	
	topLevelContainer withTesting.

]

{ #category : #definition }
FamixAdaGenerator >> defineRelations [
	super defineRelations.

	((package property: #container)
			comment: 'The container defining this package.';
			container)
		*-
	((container property: #packages)
			comment: 'Packages defined in the container, if any.').

	self flag: 'Not marked #container because FamixTFunction already has one such property: #functionOwner'.
	((subprogram property: #container)
			comment: 'The container defining this subprogram.')
		*-
	((container property: #subprograms)
			comment: 'Subprograms defined in the container, if any.').

	((structural property: #container)
			comment: 'Parent ContrainerEntity';
			container)
		*-
	((container property: #localVariables)
			comment: 'Variables defined in the container, if any.').

	"For now this is inherited from FAST-Core-Resolution#FASTScope
	((fastScope property: #owner)
		comment: 'Entity owning this scope')
		--
	((container property: #fastScope)
		comment: 'A FastScope associated to this entity')."

]
