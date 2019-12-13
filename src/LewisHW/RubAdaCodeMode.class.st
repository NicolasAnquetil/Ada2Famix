Class {
	#name : #RubAdaCodeMode,
	#superclass : #RubEditingMode,
	#category : #'LewisHW-Rubric'
}

{ #category : #menu }
RubAdaCodeMode class >> editingModeMenuOn: aBuilder [
	"Specify the menu used to select an editing mode"

	<contextMenu>
	<RubEditingModeMenu>
	(aBuilder item: self label translated)
		action: [:model | model textArea editingMode: self new]
]

{ #category : #accessing }
RubAdaCodeMode class >> label [
	^ 'Ada code'
]

{ #category : #menu }
RubAdaCodeMode class >> menuKeyword [
	^ 'RubAdaCodeMenu'
]

{ #category : #menu }
RubAdaCodeMode class >> menuOn: aBuilder [
	"Specify the menu used when writing code. Try it with:
	(PragmaMenuBuilder 
		pragmaKeyword: 'smalltalkEditorMenu'
		model: nil) menu popUpInWorld
	"

	<contextMenu>
	<RubAdaCodeMenu>
	| uitheme |
	uitheme := Smalltalk ui icons.
			"(aBuilder item: #'Load' translated)
				keyText: 'd';
				selector: #loadFile;
				help: nil;
				icon: uitheme smallDoItIcon."

]

{ #category : #'initialize-release' }
RubAdaCodeMode >> updateTextAreaWhenPlugged [
	self textArea withDecoratorNamed: #adaStyler.
	super updateTextAreaWhenPlugged


]

{ #category : #'initialize-release' }
RubAdaCodeMode >> updateTextAreaWhenUnplugged [
	self textArea withoutDecoratorNamed: #adaStyler.
	super updateTextAreaWhenUnplugged


]
