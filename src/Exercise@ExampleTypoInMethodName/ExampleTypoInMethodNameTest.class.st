Class {
	#name : 'ExampleTypoInMethodNameTest',
	#superclass : 'ExercismTest',
	#category : 'Exercise@ExampleTypoInMethodName',
	#package : 'Exercise@ExampleTypoInMethodName'
}

{ #category : 'private' }
ExampleTypoInMethodNameTest class >> exampleSolutionSourceCode [ 

	^ 'Class {
	#name : #ExampleTypoInMethodName,
	#superclass : #Object,
	#category : #''Exercise@ExampleTypoInMethodName''
}

{ #category : #''as yet unclassified'' }
ExampleTypoInMethodNameATYPO >> exerciseMethodA [
	^ $A
]

'
]

{ #category : 'private' }
ExampleTypoInMethodNameTest class >> exampleTestCasesSourceCode [ 

	^ 'Class {
#name : #ExampleTypoInMethodNameTest,
#superclass : #ExercismTest,
#category : #''Exercise@ExampleTypoInMethodName''
}

{ #category : ''as yet unclassified'' }
ExampleTypoInMethodNameTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #(''introduction'');
		yourself.
]

{ #category : #''as yet unclassified'' }
ExampleTypoInMethodNameTest >> testExampleMethodA [
	self assert: ExampleTypoInMethodName new exerciseMethodA equals: $A
]
'
]

{ #category : 'config' }
ExampleTypoInMethodNameTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #(''introduction'');
		yourself.
]
