"
<express_specification>
SCHEMA LwsDeclarationSchema;

	TYPE LwsArrayTypeIndexSpec = SELECT ( LwsIndex, LwsRange );
	END_TYPE;
	
	TYPE LwsObjectSubtypeIndication = SELECT ( LwsArrayType, LwsSubtypeIndication );
	END_TYPE;
	
	TYPE LwsAccessMode = ENUMERATION OF ( constantAccessMode, allAccessMode, protectedAccessMode );
	END_TYPE;
	
	TYPE LwsParameterMode = ENUMERATION OF ( inputMode, outputMode, inputOutputMode, accessMode );
	END_TYPE;
	
	TYPE LwsFunctionName = SELECT ( LwsStringDesignator, LwsCompoundName );
	END_TYPE;
	
	TYPE LwsPackageDeclarativeElement = SELECT ( LwsRepresentation, LwsUseClause, LwsBasicDeclaration );
	END_TYPE;
	
	TYPE LwsProtectedUnitPublicElement = SELECT ( LwsEntryDeclaration, LwsSubprogramDeclaration, LwsRepresentation );
	END_TYPE;
	
	TYPE LwsProtectedUnitPrivateElement = SELECT ( LwsProtectedUnitPublicElement, LwsComponentAttribute );
	END_TYPE;
	
	ENTITY LwsStringDesignator SUBTYPE OF (LwsEntity);
		name : String;
	DERIVE
		asString : String ::= self name;
	END_ENTITY;
	
	ENTITY LwsFormalParameter SUBTYPE OF (LwsEntity);
		names : list OF String;
		mode : OPTIONAL LwsParameterMode;
		domainName : LwsQualifiedIdentifier;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;
	
	ENTITY LwsDiscriminantPart ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsGenericDiscriminant SUBTYPE OF (LwsDiscriminantPart);
	END_ENTITY;
	
	ENTITY LwsDiscriminantSpecification SUBTYPE OF (LwsDiscriminantPart);
		elements : List OF LwsDiscriminantAttribute;
	END_ENTITY;
	
	ENTITY LwsDiscriminantAttribute SUBTYPE OF (LwsEntity);
		names : List OF String;
		isAccess : Boolean := false;
		domainName : LwsQualifiedIdentifier;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;
	
	ENTITY LwsBasicDeclaration SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsBodyStubDeclaration SUBTYPE OF (LwsBasicDeclaration);
	END_ENTITY;
	
	ENTITY LwsTaskBodyStubDeclaration SUBTYPE OF (LwsBodyStubDeclaration);
		name : String;
	END_ENTITY;
	
	ENTITY LwsPackageBodyStubDeclaration SUBTYPE OF (LwsBodyStubDeclaration);
		name : LwsCompoundName;
	END_ENTITY;
	
	ENTITY LwsSubprogramBodyStubDeclaration SUBTYPE OF (LwsBodyStubDeclaration);
		declaration : LwsSubprogramDeclaration;
	END_ENTITY;
	
	ENTITY LwsProtectedUnitBodyStubDeclaration SUBTYPE OF (LwsBodyStubDeclaration);
		name : String;
	END_ENTITY;
	
	ENTITY LwsExceptionDeclaration SUBTYPE OF (LwsBasicDeclaration);
		names : List OF String;
	END_ENTITY;
	
	ENTITY LwsRenamingDeclaration SUBTYPE OF (LwsBasicDeclaration);
		renamedEntityName : LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsElementRenamingDeclaration SUBTYPE OF (LwsRenamingDeclaration);
		newDeclaration : LwsBasicDeclaration;
	END_ENTITY;
	
	ENTITY LwsObjectRenamingDeclaration SUBTYPE OF (LwsElementRenamingDeclaration);
		SELF\LwsElementRenamingDeclaration.newDeclaration : LwsObjectDeclaration;
	END_ENTITY;
	
	ENTITY LwsExceptionRenamingDeclaration SUBTYPE OF (LwsElementRenamingDeclaration);
		SELF\LwsElementRenamingDeclaration.newDeclaration : LwsExceptionDeclaration;
	END_ENTITY;
	
	ENTITY LwsUnitRenamingDeclaration SUBTYPE OF (LwsRenamingDeclaration);
	END_ENTITY;
	
	ENTITY LwsPackageRenamingDeclaration SUBTYPE OF (LwsUnitRenamingDeclaration);
		newName : LwsCompoundName;
	END_ENTITY;
	
	ENTITY LwsSubprogramRenamingDeclaration SUBTYPE OF (LwsUnitRenamingDeclaration);
		newDeclaration : LwsSubprogramDeclaration;
	END_ENTITY;
	
	ENTITY LwsObjectDeclaration SUBTYPE OF (LwsBasicDeclaration);
		names : List OF String;
		isAliased : boolean := false;
		isConstant : boolean := false;
		definition : LwsObjectSubtypeIndication;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;
	
	ENTITY LwsTypeDeclaration ABSTRACT SUPERTYPE SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		discriminant : OPTIONAL LwsDiscriminantPart;
	END_ENTITY;
	
	ENTITY LwsFullTypeDeclaration SUBTYPE OF (LwsTypeDeclaration);
		typeDefinition : LwsTypeDefinition;
	END_ENTITY;
	
	ENTITY LwsPrivateTypeDeclaration SUBTYPE OF (LwsFullTypeDeclaration);
		SELF\LwsFullTypeDeclaration.typeDefinition : LwsPrivateTypeDefinition;
	END_ENTITY;
	
	ENTITY LwsIncompleteTypeDeclaration SUBTYPE OF (LwsTypeDeclaration);
	END_ENTITY;
	
	ENTITY LwsSubtypeDeclaration SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		subtypeIndication : LwsSubtypeIndication;
	END_ENTITY;
	
	ENTITY LwsPackageDeclaration SUBTYPE OF (LwsBasicDeclaration);
		name : LwsCompoundName;
		definition : LwsPackageDefinition;
	DERIVE
		asString : String ::= self name asString;
	END_ENTITY;
	
	ENTITY LwsPackageDefinition SUBTYPE OF (LwsEntity);
		publicPart : LwsPackagePart;
		privatePart : OPTIONAL LwsPackagePart;
	END_ENTITY;
	
	ENTITY LwsPackagePart SUBTYPE OF (LwsEntity);
		elements : List OF LwsPackageDeclarativeElement;
	END_ENTITY;
	
	ENTITY LwsSubprogramDeclaration ABSTRACT SUPERTYPE SUBTYPE OF (LwsBasicDeclaration);
		parameters : List OF LwsFormalParameter;
		isAbstract : Boolean := false;
	DERIVE
		asString : String ::= self name asString;
	END_ENTITY;
	
	ENTITY LwsProcedureDeclaration SUBTYPE OF (LwsSubprogramDeclaration);
		name : LwsCompoundName;
	END_ENTITY;
	
	ENTITY LwsFunctionDeclaration SUBTYPE OF (LwsSubprogramDeclaration);
		name : LwsFunctionName;
		returnType : OPTIONAL LwsQualifiedIdentifier;
	WHERE
		nameRule :: (self isKindOf: LwsOperatorOverloadDeclaration) not or: [ self name isKindOf: LwsStringDesignator ];
	END_ENTITY;
	
	ENTITY LwsOperatorOverloadDeclaration SUBTYPE OF (LwsFunctionDeclaration);
		SELF\LwsFunctionDeclaration.name : LwsStringDesignator;
	END_ENTITY;
	
	ENTITY LwsTaskDeclaration SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		definition : OPTIONAL LwsTaskDefinition;
	END_ENTITY;
	
	ENTITY LwsTaskTypeDeclaration SUBTYPE OF (LwsTaskDeclaration);
		discriminant : OPTIONAL LwsDiscriminantPart;
	END_ENTITY;
	
	ENTITY LwsTaskDefinition SUBTYPE OF (LwsEntity);
		publicPart : LwsTaskPart;
		privatePart : OPTIONAL LwsTaskPart;
	END_ENTITY;
	
	ENTITY LwsTaskPart SUBTYPE OF (LwsEntity);
		entries : list OF LwsEntryDeclaration;
		representations : List OF LwsRepresentation;
	END_ENTITY;
	
	ENTITY LwsProtectedUnitDeclaration SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		definition : LwsProtectedUnitDefinition;
	END_ENTITY;
	
	ENTITY LwsProtectedUnitTypeDeclaration SUBTYPE OF (LwsProtectedUnitDeclaration);
		discriminant : OPTIONAL LwsDiscriminantPart;
	END_ENTITY;
	
	ENTITY LwsProtectedUnitDefinition SUBTYPE OF (LwsEntity);
		publicPart : LwsProtectedUnitPublicPart;
		privatePart : OPTIONAL LwsProtectedUnitPrivatePart;
	END_ENTITY;
	
	ENTITY LwsProtectedUnitPart SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsProtectedUnitPublicPart SUBTYPE OF (LwsProtectedUnitPart);
		entries : List OF LwsProtectedUnitPublicElement;
	END_ENTITY;
	
	ENTITY LwsProtectedUnitPrivatePart SUBTYPE OF (LwsProtectedUnitPart);
		entries : List OF LwsProtectedUnitPrivateElement;
	END_ENTITY;
	
	ENTITY LwsRepresentation ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsAttributeRepresentation SUBTYPE OF (LwsRepresentation);
		name : LwsQualifiedIdentifier;
		useExpression : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsRecordTypeRepresentation SUBTYPE OF (LwsRepresentation);
		name : LwsQualifiedIdentifier;
		align : OPTIONAL LwsExpression;
		locations : List OF LwsComponentLocation;
	END_ENTITY;
	
	ENTITY LwsComponentLocation SUBTYPE OF (LwsEntity);
		name : LwsQualifiedIdentifier;
		at : LwsExpression;
		range : LwsRange;
	END_ENTITY;
	
	ENTITY LwsAddressRepresentation SUBTYPE OF (LwsRepresentation);
		name : LwsQualifiedIdentifier;
		useAt : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsEntryDeclaration SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		range : OPTIONAL LwsRange;
		parameters : List OF LwsFormalParameter;
	END_ENTITY;
	
	ENTITY LwsNumberDeclaration SUBTYPE OF (LwsBasicDeclaration);
		names : List OF String;
		initialization : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsGenericInstanciation SUBTYPE OF (LwsBasicDeclaration);
		name : LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsGenericSubprogramInstanciation SUBTYPE OF (LwsGenericInstanciation);
		subprogramDeclaration : LwsSubprogramDeclaration;
	END_ENTITY;
	
	ENTITY LwsGenericPackageInstanciation SUBTYPE OF (LwsGenericInstanciation);
		packageDeclaration : LwsCompoundName;
	END_ENTITY;
	
	ENTITY LwsSubtypeIndication SUBTYPE OF (LwsEntity);
		name : LwsQualifiedIdentifier;
		constraint : OPTIONAL LwsConstraint;
	END_ENTITY;
	
	ENTITY LwsTypeDefinition SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsAnyType SUBTYPE OF (LwsTypeDefinition);
		parenthesis : Boolean := false;
	END_ENTITY;
	
	ENTITY LwsAnyRangeType SUBTYPE OF (LwsAnyType);
	END_ENTITY;
	
	ENTITY LwsElementaryType SUBTYPE OF (LwsTypeDefinition);
	END_ENTITY;
	
	ENTITY LwsScalarType SUBTYPE OF (LwsElementaryType);
	END_ENTITY;
	
	ENTITY LwsAnyInteger SUBTYPE OF (LwsScalarType);
	END_ENTITY;
	
	ENTITY LwsAnyFixed SUBTYPE OF (LwsScalarType);
	END_ENTITY;
	
	ENTITY LwsDiscreteType SUBTYPE OF (LwsScalarType);
	END_ENTITY;
	
	ENTITY LwsEnumerationType SUBTYPE OF (LwsDiscreteType);
		elements : List OF LwsEnumerationId;
	END_ENTITY;
	
	ENTITY LwsEnumerationId ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsStringEnumerationId SUBTYPE OF (LwsEnumerationId);
		element : String;
	END_ENTITY;
	
	ENTITY LwsCharacterEnumerationId SUBTYPE OF (LwsEnumerationId);
		element : Character;
	END_ENTITY;
	
	ENTITY LwsSimpleType SUBTYPE OF (LwsDiscreteType);
	END_ENTITY;
	
	ENTITY LwsIntegerType SUBTYPE OF (LwsSimpleType);
	END_ENTITY;
	
	ENTITY LwsRangeIntegerType SUBTYPE OF (LwsIntegerType);
		range : LwsRangeConstraint;
	END_ENTITY;
	
	ENTITY LwsModIntegerType SUBTYPE OF (LwsIntegerType);
		modu : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsRealType SUBTYPE OF (LwsScalarType);
		range : OPTIONAL LwsRangeConstraint;
	END_ENTITY;
	
	ENTITY LwsFloatingType SUBTYPE OF (LwsRealType);
		digits : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsFixedType SUBTYPE OF (LwsRealType);
	END_ENTITY;
	
	ENTITY LwsOrdinaryFixedType SUBTYPE OF (LwsFixedType);
		delta : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsDecimalFixedType SUBTYPE OF (LwsOrdinaryFixedType);
		digits : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsAccessType ABSTRACT SUPERTYPE SUBTYPE OF (LwsElementaryType);
		accessMode : OPTIONAL LwsAccessMode;
	END_ENTITY;
	
	ENTITY LwsAccessToObject SUBTYPE OF (LwsAccessType);
		subtypeIndication : LwsSubtypeIndication;
	END_ENTITY;
	
	ENTITY LwsAccessToSubprogram SUBTYPE OF (LwsAccessType);
		parameters : List OF LwsFormalParameter;
		returnType : OPTIONAL LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsDerivedType SUBTYPE OF (LwsElementaryType);
		subtypeIndication : LwsSubtypeIndication;
		isAbstract : Boolean := false;
		withRecord : OPTIONAL LwsRecordType;
	END_ENTITY;
	
	ENTITY LwsPrivateTypeDefinition SUBTYPE OF (LwsTypeDefinition);
		isTagged : Boolean := false;
		isLimited : Boolean := false;
	END_ENTITY;
	
	ENTITY LwsCompositeType SUBTYPE OF (LwsTypeDefinition);
	END_ENTITY;
	
	ENTITY LwsArrayType SUBTYPE OF (LwsCompositeType);
		indexes : List OF LwsArrayTypeIndexSpec;
		componentType : LwsComponentSubtype;
	END_ENTITY;
	
	ENTITY LwsComponentSubtype SUBTYPE OF (LwsEntity);
		isAliased : Boolean := false;
		definition : LwsSubtypeIndication;
	END_ENTITY;
	
	ENTITY LwsIndex SUBTYPE OF (LwsEntity);
		typeMark : LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsRecordType ABSTRACT SUPERTYPE SUBTYPE OF (LwsCompositeType);
		isTagged : Boolean := false;
		isLimited : Boolean := false;
		isAbstract : Boolean := false;
	END_ENTITY;
	
	ENTITY LwsPrivateRecordType SUBTYPE OF (LwsRecordType);
	END_ENTITY;
	
	ENTITY LwsNullRecordType SUBTYPE OF (LwsRecordType);
	END_ENTITY;
	
	ENTITY LwsDefinedRecordType SUBTYPE OF (LwsRecordType);
		definition : LwsRecordDefinition;
	END_ENTITY;
	
	ENTITY LwsRecordDefinition SUBTYPE OF (LwsEntity);
		elements : List OF LwsComponentAttribute;
		variantPart : OPTIONAL LwsVariantRecordPart;
	END_ENTITY;
	
	ENTITY LwsVariantRecordPart SUBTYPE OF (LwsEntity);
		caseIdentifier : LwsSimpleIdentifier;
		elements : List OF LwsVariantComponentAttribute;
	END_ENTITY;
	
	ENTITY LwsComponentAttribute SUBTYPE OF (LwsEntity);
		names : List OF String;
		domain : LwsComponentSubtype;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;
	
	ENTITY LwsVariantComponentAttribute SUBTYPE OF (LwsEntity);
		choices : List OF LwsChoice;
		record : LwsRecordDefinition;
	END_ENTITY;
	
END_SCHEMA;

</express_specification>

"
Class {
	#name : #LwsDeclarationSchema,
	#superclass : #PtsSchemaDefinitionHolder,
	#category : #'Lewis-Namespace'
}

{ #category : #'MSE annotation' }
LwsDeclarationSchema class >> annotation [
	<MSEClass: #LwsDeclarationSchema super: #PtsSchemaDefinitionHolder>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsDeclarationSchema class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #platypus }
LwsDeclarationSchema class >> platypusMetaData [
	<generatedByPlatypus>
	^ self namespace platypusMetaData schemaDefinitionNamed: self platypusIdent
]
