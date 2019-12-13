"
A special DefVisitor to deal with DECLARE statements

Such statements are not visited by the normal DefVisitor (which does not visit statements) but by this visitor which is created on the fly by the RefVisitor
"
Class {
	#name : #LwsAdaVisitorDefForDeclare,
	#superclass : #LwsAdaVisitorDef,
	#category : #LewisMoose
}

{ #category : #'initialize-release' }
LwsAdaVisitorDefForDeclare >> fromRefVisitor: parentVisitor [
	self model: parentVisitor model.
	self programPath: parentVisitor programPath.
	"only needs top context in the stack"
	self pushContext: parentVisitor topContext.

]
