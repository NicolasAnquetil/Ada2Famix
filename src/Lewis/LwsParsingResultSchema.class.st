"
<express_specification>
SCHEMA LwsParsingResultSchema;

	ENTITY LwsPragma SUBTYPE OF (LwsEntity);
		name : String;
		arguments : List OF LwsPragmaArgument;
	END_ENTITY;
	
	ENTITY LwsPragmaArgument SUBTYPE OF (LwsEntity);
		name : OPTIONAL String;
		argumentValue : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsToken;
		start : Integer;
		id : PRIVATE Array OF Integer;
		value : String;
		blanks : List OF LwsBlankToken ::= OrderedCollection new;
		level : OPTIONAL integer ::= 0;
	DERIVE
		blankString : String ::= String streamContents: [ :strm | self blanks do: [ :b | strm nextPutAll: b parsedString ] ];
		parsedString : String ::= 
				String
					streamContents: [ :strm | 
						strm
							nextPutAll: self blankString;
							nextPutAll: self value ];
	END_ENTITY;
	
	ENTITY LwsPragmaToken SUBTYPE OF (LwsCommentToken);
		pragma : LwsPragma;
		tokens : List OF LwsToken;
	DERIVE
		parsedString : String ::= 
				String
					streamContents: [ :strm | 
						strm nextPutAll: super parsedString asUppercase.
						self tokens do: [ :t | strm nextPutAll: t parsedString ] ];
	END_ENTITY;
	
	ENTITY LwsKeywordToken SUBTYPE OF (LwsToken);
	DERIVE
		SELF\LwsToken.parsedString : String ::= self blankString , self value asUppercase;
	END_ENTITY;
	
	ENTITY LwsUnitElementToken SUBTYPE OF (LwsKeywordToken);
	END_ENTITY;
	
	ENTITY LwsOperatorToken SUBTYPE OF (LwsKeywordToken);
	END_ENTITY;
	
	ENTITY LwsAssignToken SUBTYPE OF (LwsOperatorToken);
	END_ENTITY;
	
	ENTITY LwsDelimToken SUBTYPE OF (LwsToken);
	END_ENTITY;
	
	ENTITY LwsBlankToken SUBTYPE OF (LwsDelimToken);
	END_ENTITY;
	
	ENTITY LwsSemicolonToken SUBTYPE OF (LwsDelimToken);
	END_ENTITY;
	
	ENTITY LwsSpaceToken SUBTYPE OF (LwsBlankToken);
	END_ENTITY;
	
	ENTITY LwsTabulationToken SUBTYPE OF (LwsBlankToken);
	END_ENTITY;
	
	ENTITY LwsEolToken SUBTYPE OF (LwsBlankToken);
	END_ENTITY;
	
	ENTITY LwsCommentToken SUBTYPE OF (LwsToken);
	END_ENTITY;
	
	ENTITY LwsEofToken SUBTYPE OF (LwsToken);
	END_ENTITY;
	
	ENTITY LwsBuiltinTypeToken SUBTYPE OF (LwsKeywordToken);
	END_ENTITY;
	
	ENTITY LwsIdentifierToken SUBTYPE OF (LwsToken);
	END_ENTITY;
	
	ENTITY LwsValueToken SUBTYPE OF (LwsToken);
	END_ENTITY;
	
	ENTITY LwsNumberValueToken SUBTYPE OF (LwsValueToken);
	END_ENTITY;
	
	ENTITY LwsBooleanValueToken SUBTYPE OF (LwsValueToken);
	END_ENTITY;
	
	ENTITY LwsStringValueToken SUBTYPE OF (LwsValueToken);
	END_ENTITY;
	
	ENTITY LwsCharacterValueToken SUBTYPE OF (LwsValueToken);
	END_ENTITY;
	
	ENTITY LwsTokenList;
		tokens : List OF LwsToken ::= OrderedCollection new;
	DERIVE
		size : Integer ::= self tokens size;
		last : LwsToken ::= self tokens ifEmpty: [  ] ifNotEmpty: [ :t | t last ];
		asString : String ::= String streamContents: [ :strm | self tokens do: [ :t | strm nextPutAll: t parsedString ] ];
	END_ENTITY;
	
	ENTITY LwsParsingResult SUBTYPE OF (LwsEntity);
		entities : List OF LwsEntity;
		tokenList : LwsTokenList ::= LwsTokenList new;
	DERIVE
		tokens : List OF LwsToken ::= self tokenList tokens;
		asString : String ::= self tokenList asString;
	END_ENTITY;
	
END_SCHEMA;

</express_specification>

"
Class {
	#name : #LwsParsingResultSchema,
	#superclass : #PtsSchemaDefinitionHolder,
	#category : #'Lewis-Namespace'
}

{ #category : #'MSE annotation' }
LwsParsingResultSchema class >> annotation [
	<MSEClass: #LwsParsingResultSchema super: #PtsSchemaDefinitionHolder>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsParsingResultSchema class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #platypus }
LwsParsingResultSchema class >> platypusMetaData [
	<generatedByPlatypus>
	^ self namespace platypusMetaData schemaDefinitionNamed: self platypusIdent
]
