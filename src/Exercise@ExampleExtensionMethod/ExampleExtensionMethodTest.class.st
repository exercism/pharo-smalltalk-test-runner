Class {
	#name : 'ExampleExtensionMethodTest',
	#superclass : 'ExercismTest',
	#category : 'Exercise@ExampleExtensionMethod',
	#package : 'Exercise@ExampleExtensionMethod'
}

{ #category : 'private' }
ExampleExtensionMethodTest class >> exTonelExtensionFilename [

	^ ClassDescription exTonelExtensionFilenameFor: String name 
]

{ #category : 'private' }
ExampleExtensionMethodTest class >> exampleSolutionExtensionSourceCode [

	^ 'Extension { #name : #String }

{ #category : #''*Exercise@ExampleExtensionMethod'' }
String >> somethingReturned [

	^ ''something returned''
]
'
]

{ #category : 'private' }
ExampleExtensionMethodTest class >> exampleSolutionSourceCode [ 
	"use only empty class that should overwrite example implementation"
	^ 'Class {
	#name : #ExampleExtensionMethod,
	#superclass : #Object,
	#category : #''Exercise@ExampleExtensionMethod''
}
'
]

{ #category : 'private' }
ExampleExtensionMethodTest class >> exampleTestCasesSourceCode [

	^ 'Class {
#name : #ExampleExtensionMethodTest,
#superclass : #ExercismTest,
#category : #''Exercise@ExampleExtensionMethod''
}

{ #category : #''as yet unclassified'' }
ExampleExtensionMethodTest >> testStringExtensionSomethingReturned [
	self assert: String new somethingReturned equals: ''something returned''
]
'
]

{ #category : 'config' }
ExampleExtensionMethodTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #(''introduction'');
		yourself.
]

{ #category : 'private' }
ExampleExtensionMethodTest class >> prepareExampleSolutionSourceCode [

	| solutionClass|
	" this is used for generating STON representation of MCSnapshot, that can be used to generate solution of example (golden test)"

	solutionClass  := Object << (self exercise exerciseClassName)
	slots:{};
	package: self package name asString;
	install.
	
	^ TonelWriter sourceCodeOf: solutionClass
]
