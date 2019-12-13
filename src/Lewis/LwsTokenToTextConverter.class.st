"
A LewisAbstractVisitor is xxxxxxxxx.

"
Class {
	#name : #LwsTokenToTextConverter,
	#superclass : #LewisAbstractVisitor,
	#instVars : [
		'text'
	],
	#category : #'Lewis-Visitors'
}

{ #category : #examples }
LwsTokenToTextConverter class >> textMorphOnFileName: aPathString [
	| workspace ast v |
	workspace := RubScrolledTextMorph new extent: 500 @ 600.
	ast := LwsParser parseStream: aPathString asFileReference readStream.
	ast accept: (v := LwsTokenToTextConverter new).
	workspace updateTextWith: v text.
	workspace openInWorld
]

{ #category : #initialize }
LwsTokenToTextConverter >> initialize [
	super initialize.
	text := Text new
]

{ #category : #accessing }
LwsTokenToTextConverter >> text [
	^ text
]

{ #category : #private }
LwsTokenToTextConverter >> token: aToken color: aColor [ 
	text addAttribute: (TextColor color: aColor ) from: aToken startPosition to: aToken stopPosition.
]

{ #category : #private }
LwsTokenToTextConverter >> token: aToken color: aColor emphasis: aTextEmphasis [
	text addAttribute: (TextColor color: aColor ) from: aToken startPosition to: aToken stopPosition.
	text addAttribute: aTextEmphasis from: aToken startPosition to: aToken stopPosition.
]

{ #category : #private }
LwsTokenToTextConverter >> token: aToken emphasis: aTextEmphasis [
	text addAttribute: aTextEmphasis from: aToken startPosition to: aToken stopPosition.
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitAssignToken: anAssignToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitBlankToken: aBlankToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitBooleanValueToken: aBooleanValueToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitBuiltinTypeToken: aBuiltinTypeToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitCharacterValueToken: aCharacterValueToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitCommentToken: aCommentToken [
	<generatedByPlatypus>
	self token: aCommentToken color: Color darkGray 
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitDelimToken: aDelimToken [
	<generatedByPlatypus>
"	(aDelimToken value = '(' or: [ aDelimToken value = ')' ])
		ifTrue: [ self token: aDelimToken emphasis: TextEmphasis bold ]"
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitEofToken: anEofToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitEolToken: anEolToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitIdentifierToken: anIdentifierToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitKeywordToken: aKeywordToken [
	<generatedByPlatypus>
	
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitNumberValueToken: aNumberValueToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitOperatorToken: anOperatorToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitParsingResult: aParsingResult [
	<generatedByPlatypus>
	aParsingResult tokenList ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitPragmaArgument: aPragmaArgument [
	<generatedByPlatypus>
	
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitPragmaToken: aPragmaToken [
	<generatedByPlatypus>
	
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitSemicolonToken: aSemicolonToken [
	<generatedByPlatypus>
	
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitSpaceToken: aSpaceToken [
	<generatedByPlatypus>

]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitStringValueToken: aStringValueToken [
	<generatedByPlatypus>
	self token: aStringValueToken color: Color brown
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitTabulationToken: aTabulationToken [
	<generatedByPlatypus>
	 
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitToken: aToken [
	<generatedByPlatypus>
	
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitTokenList: aTokenList [
	<generatedByPlatypus>
	text := aTokenList asString asText.
	aTokenList tokens ifNotNil: [ :a | a reverseDo: [ :e | e accept: self ] ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitUnitElementToken: aToken [
	<generatedByPlatypus>
	self token: aToken color: Color blue darker
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsTokenToTextConverter >> visitValueToken: aValueToken [
	<generatedByPlatypus>
	
]
