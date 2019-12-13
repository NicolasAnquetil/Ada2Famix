Class {
	#name : #Ada95TreeBuilder,
	#superclass : #Object,
	#category : #'Lewis-AdaParser'
}

{ #category : #'parser interface' }
Ada95TreeBuilder >> abort: names [
	^ { #abort:. names  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> abs: arg [
	^ { #abs:.  arg }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> abstract [
	^ { #abstract }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> abstractSubprogram: sub [
	^ {#abstractSubprogram:. sub }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> accept: ident formalPart: formalPart statements: statements  handlers: handlers [
	^ { #accept:. ident. #formalPart:. formalPart. #statements:. statements. #handlers:. handlers}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> acceptAlternative: acceptStmt statements: stmts [
	^{ #acceptAlternative:. acceptStmt. #statements:. stmts }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> access [
	^ { #access }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> accessMode [
	^ { #accessMode }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> accessToObject: subtypeInd accessMode: accessMode [
	^ { #accessToObject:. subtypeInd. #accessMode:. accessMode }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> accessToSubprogram: formalPart accessMode:  accessMode return: returnOpt [
	^{ #accessToSubpropgram:. formalPart. #accessMode:. accessMode. #return:. returnOpt }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> addressSpecFor: name useAt: expr [
	^ { #addressSpecFor:. name. #useAt:. expr}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> aggregate: arg [ 
	^ { #aggregate:. arg  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> aliased [
	^ { #aliased }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> aliasedConstantQualifier [
	^ { #aliasedConstantQualifier }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> aliasedOpt: aliasOp subtypeInd: subTypeInd [ 
	^ { #aliasedOpt:. aliasOp. #subtypeInd:. subTypeInd  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> aliasedQualifier [
	^ { #aliasedQualifier }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> alignAtMod: expr [
	^ { #alignAtMod:. expr }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> all [
	^ { #all }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> allAccessMode [
	^ { #allAccessMode }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> allSelector [
	^ { #allSelector }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> and [
	^ { #and }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> andThen [
	^ { #andThen }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> anyExpression [
	^ { #anyExpression }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> anyRangeType [
	^ { #anyRangeType }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> anyType [
	^ { #anyType }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> arrayTypeIndexes: index of: componentSubtype [
	^ { #arrayTypeIndexes:.  index. #of:. componentSubtype }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> assign: aValue to: leftPart [ 
	^ { #assign:. aValue. #to. leftPart }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> asyncSelect: delayOrEntryCall statements: statements thenAbortStatements: abortStatements [
	^ { #asyncSelect:. delayOrEntryCall. #statements:. statements. #thenAbortStatements:. abortStatements }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> attributeDefFor: name use: use [
	^ { #for:. name. #use:. use }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> basedLiteral: aBasedLit [
	^ { #basedLiteral:. aBasedLit }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> blockBodyStatements: statements  exceptionHandlers: handlers [
	^ { #blockBodyStatements:. statements.  #exceptionHandlers:. handlers }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> box [
	^ { #box }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> case: expr alternatives: alternatives [ 
	^ { #case:. expr. #alternatives:. alternatives  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> charSelector: aCharacter [
	^ { #charSelector:. aCharacter }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> characterEnumerationId: aChar [
	^{ #characterEnumerationId:. aChar }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> characterLiteral: aCharLit [
	^ { #characterLiteral:. aCharLit }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> code: aQualified [
	^ { #code:. aQualified}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> componentAssociationChoices: choices expression: expression [ 
	^ { #componentAssociationChoices:. choices. #expression:. expression  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> componentDecls: compDecl variantPartOpt: variantPartOpt [
	^ { #compDecls:. compDecl. #variantPartOpt:. variantPartOpt }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> componentIdentifiers: identifiers compSubtypeDef: subtypeDef initOpt: initOpt [ 
	^ { #componentIdentifiers:. identifiers. #compSubtypeDef:. subtypeDef. #initOpt:. initOpt  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> componentLocationName: compLoc at: expr range: range [
	^ { #componentLocationName:. compLoc. #at:. expr. #range:. range}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> compoundName: aName [ 
	^ { #compoundName:. aName. }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> compoundName: aCompoundName suffix: aName [
	^ { #compoundName:. aCompoundName. #suffix:. aName }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> compoundStatement: arg [
	^ { #compoundStatement:. arg }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> concat [
	^ { #concat }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> conditionalEntryCall: entryCall statements: statements else: else [
	^ { #conditionalEntryCall:. entryCall. #statements:. statements. #else:. else }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> constantAccessMode [
	^ { #constantAccessMode }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> constantQualifier [
	^ { #constantQualifier }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> decimalDigitConstraintExpression: expression rangeConstraintOpt: rangeConstraintOpt [
	^ { #decimalDigitConstraintExpression:. expression. #rangeConstraintOpt:. rangeConstraintOpt }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> decimalLiteral: aDecimal [
	^ { #decimalLiteral:. aDecimal }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> declPart: decls [
	^ { #declPart:. decls }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> delay: expr [
	^ { #delay:. expr  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> delayAlternative: delayStmt statements: stmts [
	^{ #delayAlternative:. delayStmt. #statements:. stmts }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> delayUntil: expr [
	^ { #delayUntil:. expr  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> delta [
	^ { #delta }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> deltaExpression: anExpression digits: digits rangeSpecOpt: aRangeSpec [
	^ { #deltaExpression:. anExpression. #digits:. digits. #rangeSpecOpt:. aRangeSpec }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> deltaExpression: anExpression rangeSpecOpt: aRangeSpec [
	^ { #deltaExpression:. anExpression. #rangeSpecOpt:. aRangeSpec }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> digits [
	^ { #digits }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> digitsExpression: anExpression rangeSpecOpt: aRangeSpec [
	^ { #digitsExpression:. anExpression. #rangeSpecOpt:. aRangeSpec }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> discreteRangeName: aName constraintOpt: constraintOpt [
	^ { #discreteRangeName:. aName. #constraintOpt:. constraintOpt  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> discrimPart: discrimPart [
	^ { #discrimPart:. discrimPart }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> discrimSpecIdentifiers: identifiers accessOpt: accessOpt mark: mark initOpt: initOpt [
	^ { #discrimSpecIdentifiers:. identifiers. #accessOpt:. accessOpt. #mark:. mark. #initOpt:. initOpt }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> discrimSpecs: discrimSpecs [
	^ { #discrimSpecs:. discrimSpecs }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> div [
	^ { #div }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> entryBodyDeclPart: declarations blockBody: body [
	^ { #entryBodyDeclPart:. declarations. #blockBody:. body }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> entryBodyName: ident iteration: iterOpt formalPart: formalPart when: when body: body [
	^ { #entryBodyName:. ident. #iteration:. iterOpt. #formalPart:. formalPart. #when:. when. #body:. body }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> entryCall: aQualifiedName [
	^ { #entryCall:. aQualifiedName }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> entryDecl: ident discreteRange: range formalPart: formalPart [
	^ { #entry:. ident. #discreteRange:. range. #formalPart:. formalPart }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> entryIterationPartName: aName range: aRange [
	^ { #entryIterationPartName:. aName. #range:. aRange }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> entryName: name [
	^ { #entryName:. name }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> entryName: name argument: arg [
	^ { #entryName:. name. #argument:. arg }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> enumerationTypeElements: identList [
	^ { #enumerationTypeElements:. identList }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> equal [
	^ { #equal }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> exceptionHandler: handler [
	^ {#exceptionHandler:. handler}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> exceptionHandler: identifier choices: choices statements: stmts [
	^ { #exceptionHandler:. identifier. #choices:. choices. #statements:. stmts }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> exceptionNames: exceptions [
	^ { #exceptionNames:. exceptions }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> exceptionNames: names renames: oldName [
	^ { #exceptionNames:. names. #renames:. oldName}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> exit: nameOpt whenOpt: condOpt [
	^ {#exit:. nameOpt. #whenOpt:. condOpt}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> expression: expression adding: addingOp term: arg [ 
	^ { #expression:. expression. #adding:. addingOp. #term:. arg  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> expression: expression logical: logical relation: relation [
	^ { #expression:. expression. #logical:. logical. #relation:. relation }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> expression:expr1 memberShip: memberShipOp expression: name [
	^ { #expression:. expr1. #memberShip:. memberShipOp. #expression:. name}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> expression:expr1 relational: op expression: expr2 [
	^ { #expression:. expr1. #relational:. op. #expression:. expr2}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> expression: expression shortCircuit: shortCircuit relation: relation [
	^ { #expression:. expression. #shortCircuit:. shortCircuit. #relation:. relation }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> expression: arg withIndexList: indexList [
	^ { #expression:. arg. #withIndexList:. indexList  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> expressionChoice: aChoice [
	^ { #expressionChoice:. aChoice }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> fixedType: aFixedType [
	^ { #fixedType:. aFixedType }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> for: iter reverseOpt: reverse in: discrete [
	^ { #for:. iter. #reverseOpt:. reverse. #in:. discrete }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> functionSpecName: func [ 
	^ { #functionSpecName:. func. }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> functionSpecName: name  formalPartOpt: formalPart return: ret [
	^ { #functionSpecName:. name. #formalPartOpt:. formalPart. #return:. ret }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> generic [
	^ { #generic }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericDiscriminant [
	^ { #genericDiscriminant }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericFormalParameter: aFormalParameter [
	^{ #genericFormalParameter:. aFormalParameter }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericFormalPart: formalPart packageSpec: pkgSpec [
	^ { #genericFormalPart:. formalPart. #packageSpec:. pkgSpec }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericFormalPart: formalPart subProcSpec: subProg [
	^ { #genericFormalPart:. formalPart. #subProcSpec:. subProg }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericFunction: aProcSpec default: subpDefault [
	^{ #genericFunction:. aProcSpec. #default:. subpDefault }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericPackage: name isNew: isName arg: boxOrNoBox [
	^ { #withPackage:. name. #isNew:. isName. #arg:. boxOrNoBox}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericPackageInstanciation: spec isNew: genericInst [
	^ { #package:. spec. #isNew:. genericInst }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericProcedure: aProcSpec default: subpDefault [
	^{ #genericProcedure:. aProcSpec. #default:. subpDefault }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericSubprogramDefault: aNameOrBox [
	^ { #genericSubprogramDefault:. aNameOrBox }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericType: aGenericType [
	^{ #genericType:. aGenericType }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> genericUseClause: use [
	^ {#genericUseClause:. use }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> goto: name [
	^ {#goto:. name }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> greaterThan [
	^ { #greaterThan }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> greaterThanOrEqual [
	^ { #greaterThanOrEqual }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> identifier: anIdentifier [
	^ { #identifier:. anIdentifier }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> identifierAttribute: aName [
	^ { #identifierAttribute:. aName }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> if: conditions else: else [
	^ { #if:. conditions. #else:. else }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> ifCondition: condition statements: statements [
	^ { #ifCondition:. condition. #statements:. statements }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> in [
	^ { #in }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> inMode [
	^ { #inMode  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> inOutMode [
	^ { #inOutMode  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> index: aName [ 
	^ { #index:. aName }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> integerTypeModSpec: anExpression [
	^ { #integerTypeModSpec:. anExpression }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> integerTypeRangeSpec: aRangeSpec [
	^ { #integerTypeRangeSpec:. aRangeSpec }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> label:  label [ 
	^ { #label:. label }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> labelOpt: lbl declare: decl body: aBlockBody [
	^ { #labelOpt:. lbl. #declare:. decl. #body:. aBlockBody }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> labelOpt: labOpt iteration: iteration basicLoop: basicLoop [ 
	^ { #labelOpt:. labOpt. #iteration:. iteration. #basicLoop:. basicLoop. }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> labels:  labels statement: statement [
	^ { #labels:. labels. #statement. statement}
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> lessThan [
	^ { #lessThan }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> lessThanOrEqual [
	^ { #lessThanOrEqual }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> limited [
	^ { #limited }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> mod [
	^ { #mod }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> mult [
	^ { #mult }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> name: aName attribute: attribute [
	^ { #name:. aName. #attribute:. attribute }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> name: aName constraint: aConstraint [ 
	^ { #name:. aName. #constraint:. aConstraint  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> name: aName indexes: anIndex [
	^ { #name:. aName. #indexes:. anIndex }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> name: aName primary: primary [
	^ { #name:. aName. #primary:. primary. }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> namedExceptionChoice: aName [
	^ { #namedExceptionChoice:. aName }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> newName: arg [
	^ { #newName:. arg }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> newSubtypeInd: aSubtypeInd with: privateOrRecordDef abstract: isAbstract [
	^ { #newSubtypeInd:. aSubtypeInd.  #with:. privateOrRecordDef. #abstract:. isAbstract}
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noAbstract [
	^ { #noAbstract }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noAccess [
	^ { #noAccess }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noAccessMode [
	^ { #noAccessMode }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noAlias [
	^ { #noAlias }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noAlign [
	^ { #noAlign }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noArgument [
	^ { #noArgument }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noBlockDecl [
	^ { #noBlockDecl }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noBodyPart [
	^ { #noBodyPart }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noBox [
	^ { #noBox }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noComponent [
	^ { #noComponent }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noCondition [
	^ { #noCondition }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noConstraint [
	^ { #noConstraint }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noDeclPart [
	^ { #noDeclPart  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noDiscreteRange [
	^ { #noDiscreteRange }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noDiscrimPart [
	^ { #noDiscrimPart }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noElse [
	^ { #noElse }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noEntryBody [
	^ { #noEntryBody }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noExpression [
	^ #(#noExpression)
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noFormalPart [
	^ { #noFormalPart }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noGenericFormalPart [
	^ { #noGenericFormalPart }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noGenericSubprogramDefault [
	^ { #noGenericSubprogramDefault }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noHandler [
	^ {#noHandler}
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noId [
	^ { #noId }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noIdentifier [
	^ { #noIdentifier }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noInit [
	^ { #noInit }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noInterface [
	^ { #noInterface }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noIteration [
	^ { #noIteration }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noLabel [
	^ { #noLabel }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noMode [
	^ { #noMode  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noName [
	^ {#noName}
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noPrivate [
	^ { #noPrivate  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noPrivatePart [
	^ { #noPrivatePart }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noQualifier [
	^ { #noQualifier }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noRangeConstraint [
	^ { #noRangeConstraint}
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noRangeSpec [
	^ { #noRangeSpec }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noReturn [
	^ { #noReturn }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noReverse [
	^ { #noReverse }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noStatement [
	^ { #noStatement }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noTaskDef [
	^ { #noTaskDef }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noTaskPrivate [
	^ { #noTaskPrivate }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noTypeCompletion [
	^ { #noTypeCompletion }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noVariantPart [
	^ { #noVariantPart }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> noVariantPartButPragmas: pragmas [ 	
	^ { #noVariantPartButPragmas:. pragmas  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> noWithPrivate [
	^ { #noWithPrivate }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> nonEqual [
	^ { #nonEqual }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> not: arg [
	^ { #not:.  arg }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> notIn [
	^ { #notIn }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> notPrivate [
	^ { #notPrivate  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> notTagged [
	^ { #notTagged }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> nullLiteral: parsedString [
	^ { #nullLiteral:. parsedString }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> nullRecord [
	^ { #nullRecord }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> nullStatement [
	^ { #nullStatement  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> numberDeclarationIdentifiers: identifiers init: anExpression [ 
	^ { #numberDeclarationIdentifiers:. identifiers. #init:. anExpression }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> objectNames: identifiers optQualifier: optQualifier subTypeDef: subTypeDef optInit: anExpression [
	^ { #objectNames:. identifiers. #optQualifier:. optQualifier. #subTypeDef:. subTypeDef. #optInit:. anExpression }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> objectNames: identifiers optQualifier: optQualifier subTypeDef: subTypeDef renames: oldName [
	^ { #objectNames:. identifiers. #optQualifier:. optQualifier. #subTypeDef:. subTypeDef. #renames:. oldName }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> or [
	^ { #or }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> orElse [
	^ { #orElse }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> otherChoice [
	^ { #otherChoice: }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> others [
	^ { #others }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> othersExceptionChoice [
	^ { #othersExceptionChoice }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> outMode [
	^ { #accessMode  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> package: aName is: aPkgDef [
	^ { #package:. aName. #is:. aPkgDef }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> packageBody: name declPart: decl bodyOpt: bodyOpt [
	^ { #packageBody:. name. #declPart:. decl. #bodyOpt:. bodyOpt }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> packageBodyStubName: name [
	^ { #packageBodyStubName:. name  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> packageName: name renames: oldName genericFormalPart: genericFormalPart [
	^ { #packageName:. name. #renames:. oldName. #genericFormalPart:. genericFormalPart}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> packagePart: elements [
	^ { #packagePart:. elements }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> packagePublicPart: public privatePart: private [
	^ { #packagePublicPart:. public. #privatePart:. private }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> paramIdentifiers: idents mode: mode domainName: domain init: init [
	^ { #paramIdentifiers:. idents. #mode:. mode. #domainName:. domain. #init:. init  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> parenthesized: expression [
	^ { #parenthesized:. expression }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> parserResult: anEntity [
	^ { #parserResult:. anEntity }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> plus [
	^ { #plus }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> pragma: pragma arguments: args [
	^ { #pragma:. pragma. #arguments:. args }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> pragmaArgument: anExpression named: aName [
	^ { #pragmaArgument:. anExpression. #named:. aName }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> primary: arg expon: arg2 [
	^ { #primary:.  arg. #expon:. arg2}
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> private [
	^ { #private  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> privateProtectedPart: part [
	^ { #privateProtectedPart:. part }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> privateTypeTaggedOpt: tag limitedOpt: limit [ 
	^ { #privateTypeTaggedOpt:. tag. #limitedOpt:. limit  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> procedureCall: aNameWithOptParameters [
	^ { #procedureCall:. aNameWithOptParameters }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> procedureSpecName: name formalPartOpt: formalPart [
	^ { #procedureSpecName:. name. #formalPartOpt:. formalPart.  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> protected: ident is: def [
	^ { #protected:. ident. #is:. def }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> protectedAccessMode [
	^ { #protectedAccessMode }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> protectedBody: name elements: bodies [ 
	^ { #protectedBody:. name. #elements:. bodies. }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> protectedElements: elements [
	^ { #protectedElements:. elements }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> protectedPublicPart: public privatePart: private [
	^ { #protectedPublicPart:. public. #privatePart:. private }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> protectedType: name  discrimPart: discrim is: def [
	^ { #protectedType:. name. #discrimPart:. discrim. #is:. def }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> protectedUnitBodyStubName: name [
	^ { #protectedUnitBodyStubName:. name  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> publicProtectedPart: part [
	^ { #publicProtectedPart:. part }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> qualifiedName: aName [
	^ { #qualifiedName:. aName }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> raise: name [
	^ { #raise:. name }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> rangeChoice: aChoice [
	^ { #rangeChoice:. aChoice }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> rangeConstraintRange: aRange [
	^ { #rangeConstraintRange:. aRange }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> rangeFrom: expr1 to: expr2 [
	^ { #rangeFrom:. expr1. #to:. expr2 }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> rangeNamed: aName argument: anExpression [
	^ { #rangeNamed:. aName. #argument:. anExpression}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> rangeSpec: aRange [
	^ { #rangeSpec:. aRange }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> recordComponents: compList [
	^ { #recordComponents:. compList }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> recordTypeSpecFor: name useRecordAlign: align compLocs:compLocs [
	^ { #for:. name. #useRecordAlign:. align. #compLocs:. compLocs }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> recordTypeTaggedOpt: taggedOpt limitedOpt: limitedOpt recordDef: recordDef [ 
	^ { #recordTypeTaggedOpt:.  taggedOpt. #limitedOpt:. limitedOpt. #recordDef:. recordDef  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> rem [
	^ { #rem }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> requeue: aTaskName withAbort: abort [
	^{ #requeue:. aTaskName. #withAbort:. abort }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> return [
	^ {#return}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> return: expr [
	^ {#return:. expr }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> reverse [
	^ { #reverse }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> select: guardedSelect or: or else: else [
	^ { #select:. guardedSelect. #or:. or. #else:. else }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> selected: anExpr selector: aSelector [
	^ { #selected:. anExpr. #selector:. aSelector }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> separate: name body: body [
	^ { #separate:. name. #body:. body  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> simpleExpression: expression [ 
	^ { #simpleExpression:. expression }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> simpleIdentifier: aString [
	^{ #simpleIdentifier:. aString }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> simpleNameSelector: aString [
	^ { #simpleNameSelector:. aString }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> simpleStatement: arg [
	^ { #simpleStatement:. arg }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> statements: stmts [
	^ stmts
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> statements: statements handlerPartOpt: handler [
	^ {#statements:. statements. #handlerPartOpt:. handler}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> stringAsName: aString [
	^ { #stringAsName:. aString}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> stringDesignator: name [ 
	^ { #stringDesignator:. name. }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> stringEnumerationId: aString [
	^{ #stringEnumerationId:. aString }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> stringLiteral: aString [ 
	^ { #stringLiteral:. aString }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> stringSelector: aLexString [
	^ { #stringSelector:. aLexString }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> stubEntity: content [
	| e |
	e := LwsStubEntity new.
	e contents: content.
	^e
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> subProgBodySpec: spec declPart: decl body: body [ 
	^ { #subProgSpec:. spec. #declPart:. decl. #body:. body }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> subProgSpec: spec isNew: genericInst [
	^ { #subProgSpec:. spec. #isNew:. genericInst }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> subProgSpec: spec renames: oldName genericFormalPart: genericFormalPart [
	^ { #subProgSpec:. spec. #renames:. oldName. #genericFormalPart:. genericFormalPart}
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> subTypeInd: aSubTypeInd [ 
	^ { #subTypeInd:. aSubTypeInd  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> subprogramBodyStubSpec: spec [
	^ { #subprogramBodyStubSpec:. spec  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> substract [
	^ { #substract }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> subtypeIdentifier: anIdentifier subTypeInd: aSubTypeInd [ 
	^ { #subtypeIdentifier:. anIdentifier. #subTypeInd:. aSubTypeInd }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> tagged [
	^ { #tagged }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> taggedAbstract [
	^ { #taggedAbstract }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> task: name is: taskDef [
	^ { #task:. name. #is:. taskDef }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> taskBody: body declPart: decl body: block [ 
	^ { #taskBody:. body. #is:. decl. #block. block. }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> taskBodyStubName: name [
	^ { #taskBodyStubName:. name  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> taskEntries:  entries representations: representations [
	^ { #taskEntries:.  entries. #representations:. representations }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> taskPublicPart: public privatePart: private [
	^ { #taskPublicPart:. public. #privatePart:. private }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> taskType: name discrimPart: discrim is: taskDef [
	^ { #taskType:. name. #discrimPart:. discrim. #is:. taskDef }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> term: arg [ 
	^ { #term:. arg  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> term: term multiply: multiply factor: factor [  
	^ { #term:. term. #multiply:. multiply. #factor:. factor  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> terminateAlternative [
	^ { #terminateAlternative }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> timedEntryCall: entryCall statements: statements orDelay: orDelay statements: orStatements [
	^ { #timedEntryCall:. entryCall. #statements:. statements. #orDelay:. orDelay. #statements:. orStatements }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> typeIdentifier: anIdentifier discrimPartOpt: discrimPartOpt completion: completion [ 
	^ { #typeIdentifier:. anIdentifier. #discrimPartOpt:. discrimPartOpt. #completion:. completion  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> unary: op term: arg [ 
	^ { #unary:. op. #term:. arg  }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> unaryPlus [
	^ { #unaryPlus }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> unarySubstract [
	^ { #unarySubstract }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> unit: unit private: private interfaces: context [
	^ { #unit:. unit. #private:. private. #context:. context }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> unlimited [
	^ { #unlimited }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> useClauseNames: names [ 
	^ { #useClauseNames:. names }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> useTypesClauseNames: names [ 
	^ { #useTypesClauseNames:. names }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> variantPartCase: name elements:  variants [ 
	^ { #variantPartCase:. name. #elements:.  variants  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> variantPartElementWhen: choices componentList: compList [ 
	^ { #variantPartElementWhen:. choices. #componentList:. compList  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> when: cond do: stmts [
	^ { #when:. cond. #do:. stmts  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> when: cond select: stmts [
	^ { #when:. cond. #select:. stmts  }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> while: cond [ 
	^ { #while:. cond }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> withClause: with useClauses: uses [
	^ { #withClause:. with. #useClauses:. uses }
]

{ #category : #'parser interface' }
Ada95TreeBuilder >> withClauseNames: names [ 
	^ { #withClauseNames:. names }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> withPrivate [
	^ { #withPrivate }
]

{ #category : #'parser constants' }
Ada95TreeBuilder >> xor [
	^ { #xor }
]
