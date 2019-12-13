"
<express_specification>
SCHEMA LwsGenericDeclarationSchema;

	TYPE LwsGenericDeclarationTarget = SELECT ( LwsPackageDeclaration, LwsSubprogramDeclaration );
	END_TYPE;
	
	TYPE LwsSubprogramDefaultValue = SELECT ( LwsQualifiedIdentifier, LwsAnyExpression );
	END_TYPE;
	
	ENTITY LwsGenericDeclaration SUBTYPE OF (LwsBasicDeclaration);
		formalPart : List OF LwsGenericFormalElement;
		declaration : LwsGenericDeclarationTarget;
	END_ENTITY;
	
	ENTITY LwsGenericSubprogramDeclaration SUBTYPE OF (LwsGenericDeclaration);
		SELF\LwsGenericDeclaration.declaration : LwsSubprogramDeclaration;
	END_ENTITY;
	
	ENTITY LwsGenericPackageDeclaration SUBTYPE OF (LwsGenericDeclaration);
		SELF\LwsGenericDeclaration.declaration : LwsPackageDeclaration;
	END_ENTITY;
	
	ENTITY LwsGenericFormalElement ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsGenericFormalParameter SUBTYPE OF (LwsGenericFormalElement);
		base : LwsFormalParameter;
	END_ENTITY;
	
	ENTITY LwsGenericFormalType SUBTYPE OF (LwsGenericFormalElement);
		base : LwsFullTypeDeclaration;
	END_ENTITY;
	
	ENTITY LwsGenericFormalSubprogram SUBTYPE OF (LwsGenericFormalElement);
		base : LwsSubprogramDeclaration;
		subpDefault : OPTIONAL LwsGenericSubprogramDefault;
	END_ENTITY;
	
	ENTITY LwsGenericFormalProcedure SUBTYPE OF (LwsGenericFormalSubprogram);
		SELF\LwsGenericFormalSubprogram.base : LwsProcedureDeclaration;
	END_ENTITY;
	
	ENTITY LwsGenericFormalFunction SUBTYPE OF (LwsGenericFormalSubprogram);
		SELF\LwsGenericFormalSubprogram.base : LwsProcedureDeclaration;
	END_ENTITY;
	
	ENTITY LwsGenericFormalPackage SUBTYPE OF (LwsGenericFormalElement);
		name : String;
		isNewName : LwsQualifiedIdentifier;
		boxArgument : Boolean := false;
	END_ENTITY;
	
	ENTITY LwsGenericFormalUseClause SUBTYPE OF (LwsGenericFormalElement);
		base : LwsUseClause;
	END_ENTITY;
	
	ENTITY LwsGenericSubprogramDefault SUBTYPE OF (LwsEntity);
		default : LwsSubprogramDefaultValue;
	END_ENTITY;
	
END_SCHEMA;

</express_specification>

"
Class {
	#name : #LwsGenericDeclarationSchema,
	#superclass : #PtsSchemaDefinitionHolder,
	#category : #'Lewis-Namespace'
}

{ #category : #'MSE annotation' }
LwsGenericDeclarationSchema class >> annotation [
	<MSEClass: #LwsGenericDeclarationSchema super: #PtsSchemaDefinitionHolder>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsGenericDeclarationSchema class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #platypus }
LwsGenericDeclarationSchema class >> platypusMetaData [
	<generatedByPlatypus>
	^ self namespace platypusMetaData schemaDefinitionNamed: self platypusIdent
]
