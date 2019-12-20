Class {
	#name : #FamixAdaGenerator,
	#superclass : #FamixFileBasedLanguageGenerator,
	#category : #'Famix-Ada-Generator'
}

{ #category : #accessing }
FamixAdaGenerator class >> packageName [
	^ #'Famix-Ada-Entities'
]

{ #category : #accessing }
FamixAdaGenerator class >> prefix [
	^ #'FamixFortran'
]

{ #category : #definition }
FamixAdaGenerator >> defineClasses [

	super defineClasses.

"#ADAAggregateArgument #ADAArgument #ADAAttribute #ADACompilationUnit #ADAGenericPackageInstanciation #ADAGenericSubprogramInstanciation #ADAInitializingInvocation #ADAInstanceableEntity #ADAMethod #ADAModel #ADAPackage #ADAPackageAlias #ADAParameter #ADASeparateDeclaration #ADASourceLanguage #ADASubprogram #ADATask #ADATopLevelContainer #ADAType #ADATypeAccess #ADATypeAccessSubprogram #ADATypeArray #ADATypeClass #ADATypeEnum #ADATypeMod #ADATypeRange #ADATypeRecord #ADATypeTask #ADAUnknownContainer"

	"compilationUnit := builder  newClassNamed: #CompilationUnit.
	module := builder  newClassNamed: #Module.
	program := builder  newClassNamed: #Program.
	globalVariable := builder newClassNamed: #GlobalVariable.
	localVariable := builder newClassNamed: #LocalVariable.
	parameter := builder newClassNamed: #Parameter.
	function := builder newClassNamed: #Function.
	type := builder newClassNamed: #Type.
	invocation := builder newClassNamed: #Invocation.
	access := builder newClassNamed: #Access."
]

{ #category : #definition }
FamixAdaGenerator >> defineHierarchy [

	super defineHierarchy.

	"access --|> association.
	access --|> #TAccess.

	invocation --|> association.
	invocation --|> #TInvocation.
	invocation --|> #TWithSignature.

	compilationUnit --|> namedEntity.
	compilationUnit --|> #TWithFunctions.
	compilationUnit --|> #TWithTypes.
	compilationUnit --|> #TGlobalVariableScope.
	compilationUnit --|> #TNamespace.

	module --|> namedEntity.
	module --|> #TModule.
	module --|> #TImportable.
	module --|> #TWithImports.
	module --|> #TWithFunctions.
	module --|> #TWithTypes.
	module --|> #TGlobalVariableScope.
	module --|> #TNamespace.

	globalVariable --|> namedEntity.
	globalVariable --|> #TStructuralEntity.
	globalVariable --|> #TGlobalVariable.
	globalVariable --|> #TDefinedInModule.
	globalVariable --|> #TPossibleStub.
	globalVariable --|> #TNamespaceEntity.

	program --|> namedEntity.
	program --|> #TWithTypes.
	program --|> #TWithLocalVariables.
	program --|> #TWithStatements.
	program --|> #TWithAccesses.
	program --|> #TWithInvocations.
	program --|> #TDefinedInModule.
	program --|> #TWithImports.
	program --|> #TNamespaceEntity.
	program --|> #TNamespace.

	function --|> namedEntity.
	function --|> #TFunction.
	function --|> #TWithStatements.
	function --|> #TWithAccesses.
	function --|> #TWithInvocations.
	function --|> #TNamespace.
	function --|> #TInvocable.
	function --|> #TPossibleStub.
	function --|> #TWithLocalVariables.
	function --|> #TWithParameters.
	function --|> #TDefinedInModule.
	function --|> #TNamespaceEntity.
	function --|> #TWithSignature.

	localVariable --|> namedEntity.
	localVariable --|> #TStructuralEntity.
	localVariable --|> #TLocalVariable.
	localVariable --|> #TNamespaceEntity.

	parameter --|> namedEntity.
	parameter --|> #TStructuralEntity.
	parameter --|> #TPara
meter.
	parameter --|> #TNamespaceEntity.

	type --|> namedEntity.
	type --|> #TType.
	type --|> #TWithTypeAliases.
	type --|> #TParameterizedTypeUser.
	type --|> #TDefinedInModule.
	type --|> #TNamespaceEntity."


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
