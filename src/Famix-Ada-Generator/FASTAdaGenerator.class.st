Class {
	#name : #FASTAdaGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'adaScope'
	],
	#category : #'Famix-Ada-Generator'
}

{ #category : #accessing }
FASTAdaGenerator class >> packageName [
	^ #'FAST-Ada-Entities'
]

{ #category : #accessing }
FASTAdaGenerator class >> prefix [
	^ #'FASTAda'
]

{ #category : #definition }
FASTAdaGenerator >> defineClasses [
	
	"#FASTAdaCaseAlternative #FASTAdaCaseStatement #FASTAdaContainerScope #FASTAdaDeclareScope #FASTAdaDeclareStatement #FASTAdaNamedBehaviouralEntity #FASTAdaNullStatement #FASTAdaProcedureCall #FASTAdaQualifiedIdentifier #FASTAdaStatementBlock #FASTAdaSubprogramCallStatement #FASTAdaSubprogramScope #FASTEntity #FASTStatement #FASTStatementBlock"

	super defineClasses.

	adaScope := builder  newClassNamed: #Scope.

]

{ #category : #definition }
FASTAdaGenerator >> defineHierarchy [

	super defineHierarchy.

	adaScope --|> FASTScope.
]

{ #category : #definition }
FASTAdaGenerator >> defineRelations [
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
