"
<express_specification>
SCHEMA LwsDeclarationBodySchema;

	TYPE LwsPrimaryBody = SELECT ( LwsSubprogramBody, LwsPackageBody, LwsTaskBody, LwsProtectedUnitBody );
	END_TYPE;
	
	TYPE LwsDeclarationOrBody = SELECT ( LwsBasicDeclaration, LwsPrimaryBody, LwsUseClause, LwsRepresentation );
	END_TYPE;
	
	TYPE LwsProtectedUnitBodyElement = SELECT ( LwsEntryBody, LwsSubprogramBody, LwsSubprogramDeclaration );
	END_TYPE;
	
	TYPE LwsSubunitBody = SELECT ( LwsSubprogramBody, LwsPackageBody, LwsTaskBody, LwsProtectedUnitBody );
	END_TYPE;
	
	ENTITY LwsEntryBodyPart SUBTYPE OF (LwsEntity);
		locals : List OF LwsDeclarationOrBody;
		blockBody : LwsBlockBody;
	END_ENTITY;
	
	ENTITY LwsBody ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsEntryBody SUBTYPE OF (LwsBody);
		name : String;
		iteration : OPTIONAL LwsEntryIteration;
		parameters : List OF LwsFormalParameter;
		whenCondition : LwsExpression;
		body : OPTIONAL LwsEntryBodyPart;
	END_ENTITY;
	
	ENTITY LwsEntryIteration SUBTYPE OF (LwsEntity);
		name : String;
		range : LwsRange;
	END_ENTITY;
	
	ENTITY LwsBlockBody SUBTYPE OF (LwsBody);
		statements : List OF LwsStatement;
		handlers : List OF LwsExceptionHandler;
	END_ENTITY;
	
	ENTITY LwsBodyWithLocals ABSTRACT SUPERTYPE SUBTYPE OF (LwsBody);
		locals : List OF LwsDeclarationOrBody ::= OrderedCollection new;
	END_ENTITY;
	
	ENTITY LwsSubprogramBody SUBTYPE OF (LwsBodyWithLocals);
		declaration : LwsSubprogramDeclaration;
		blockBody : LwsBlockBody;
	END_ENTITY;
	
	ENTITY LwsPackageBody SUBTYPE OF (LwsBodyWithLocals);
		name : LwsCompoundName;
		blockBody : OPTIONAL LwsBlockBody;
	END_ENTITY;
	
	ENTITY LwsTaskBody SUBTYPE OF (LwsBodyWithLocals);
		name : String;
		blockBody : LwsBlockBody;
	END_ENTITY;
	
	ENTITY LwsProtectedUnitBody SUBTYPE OF (LwsBody);
		name : String;
		elements : List OF LwsProtectedUnitBodyElement;
	END_ENTITY;
	
	ENTITY LwsSeparateBody SUBTYPE OF (LwsBody);
		name : LwsCompoundName;
		subunitBody : LwsSubunitBody;
	END_ENTITY;
	
END_SCHEMA;

</express_specification>

"
Class {
	#name : #LwsDeclarationBodySchema,
	#superclass : #PtsSchemaDefinitionHolder,
	#category : #'Lewis-Namespace'
}

{ #category : #'MSE annotation' }
LwsDeclarationBodySchema class >> annotation [
	<MSEClass: #LwsDeclarationBodySchema super: #PtsSchemaDefinitionHolder>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsDeclarationBodySchema class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #platypus }
LwsDeclarationBodySchema class >> platypusMetaData [
	<generatedByPlatypus>
	^ self namespace platypusMetaData schemaDefinitionNamed: self platypusIdent
]
