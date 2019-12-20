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
		'unknownContainer'
	],
	#category : #'Famix-Ada-Generator'
}

{ #category : #accessing }
FamixAdaGenerator class >> packageName [
	^ #'Famix-Ada-Entities'
]

{ #category : #accessing }
FamixAdaGenerator class >> prefix [
	^ #'ADA'
]

{ #category : #definition }
FamixAdaGenerator >> defineClasses [

	super defineClasses.

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

]

{ #category : #definition }
FamixAdaGenerator >> defineHierarchy [

	super defineHierarchy.

	container --|> namedEntity.
	container --|> #TNamespace.
	container --|> #TWithLocalVariables.
	
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
	
	"packageAlias := builder newClassNamed: #PackageAlias.
	parameter := builder newClassNamed: #Parameter.
	separateDeclaration := builder newClassNamed: #SeparateDeclaration."

	subprogram --|> container.
	subprogram --|> #TFunction.
	subprogram --|> #TWithLocalVariables.

	"task := builder newClassNamed: #Task.
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
	unknownContainer := builder newClassNamed: #UnknownContainer."

]

{ #category : #definition }
FamixAdaGenerator >> defineRelations [
	super defineRelations.

	"((tWithImports property: #importedEntities)
			comment: 'The entities that are imported by this one' ;
			source)
		*-*
	((tImportable property: #importers)
			comment: 'The entities that import this one' ;
			target ;
			derived).
			
	compilationUnit <>- module."
]