"
<express_specification>
SCHEMA LwsStructureSchema;

	TYPE LwsUnitElement = SELECT ( 
		LwsPackageDeclaration,
		LwsPackageBody,
		LwsSubprogramDeclaration,
		LwsSubprogramBody,
		LwsGenericDeclaration,
		LwsSeparateBody,
		LwsGenericInstanciation,
		LwsUnitRenamingDeclaration );
	END_TYPE;
	
	TYPE LwsImportClauseName = SELECT ( LwsCompoundName, LwsQualifiedIdentifier );
	END_TYPE;
	
	ENTITY LwsCompoundName SUBTYPE OF (LwsEntity);
		elements : List OF String ::= OrderedCollection new;
	DERIVE
		name : String ::= self elements first;
		suffixes : List OF String ::= self elements allButFirst;
		asString : String ::= String streamContents: [ :s | self elements do: [ :each | s nextPutAll: each ] separatedBy: [ s nextPut: $. ] ];
	WHERE
		mustHaveAtLeastOneElement :: self elements size >= 1;
	END_ENTITY;
	
	ENTITY LwsEntity;
		context : OPTIONAL LwsEntity;
	INVERSE
		contents : List OF LwsEntity FOR context;
	END_ENTITY;
	
	ENTITY LwsImportClause ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
		names : list OF LwsImportClauseName;
	END_ENTITY;
	
	ENTITY LwsWithClause SUBTYPE OF (LwsImportClause);
		SELF\LwsImportClause.names : list OF LwsCompoundName;
	DERIVE
		keywords : list OF String := [ 'with' ];
	END_ENTITY;
	
	ENTITY LwsUseClause SUBTYPE OF (LwsImportClause);
		SELF\LwsImportClause.names : list OF LwsQualifiedIdentifier;
	DERIVE
		keywords : list OF String := [ 'use' ];
	END_ENTITY;
	
	ENTITY LwsUseTypeClause SUBTYPE OF (LwsUseClause);
	DERIVE
		keywords : list OF String := [ 'use', 'type' ];
	END_ENTITY;
	
	ENTITY LwsUnit SUBTYPE OF (LwsEntity);
		isPrivate : Boolean := false;
		interfaces : List OF LwsUnitInterface;
		element : LwsUnitElement;
	END_ENTITY;
	
	ENTITY LwsUnitInterface SUBTYPE OF (LwsEntity);
		withClause : LwsWithClause;
		useClauses : List OF LwsUseClause;
	END_ENTITY;
	
END_SCHEMA;

</express_specification>

"
Class {
	#name : #LwsStructureSchema,
	#superclass : #PtsSchemaDefinitionHolder,
	#category : #'Lewis-Namespace'
}

{ #category : #'MSE annotation' }
LwsStructureSchema class >> annotation [
	<MSEClass: #LwsStructureSchema super: #PtsSchemaDefinitionHolder>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsStructureSchema class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #platypus }
LwsStructureSchema class >> platypusMetaData [
	<generatedByPlatypus>
	^ self namespace platypusMetaData schemaDefinitionNamed: self platypusIdent
]
