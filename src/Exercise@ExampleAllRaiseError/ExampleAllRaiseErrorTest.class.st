Class {
	#name : 'ExampleAllRaiseErrorTest',
	#superclass : 'ExercismTest',
	#category : 'Exercise@ExampleAllRaiseError',
	#package : 'Exercise@ExampleAllRaiseError'
}

{ #category : 'private' }
ExampleAllRaiseErrorTest class >> exampleSolutionSourceCode [

	^ 'Class {
	#name : #ExampleAllRaiseError,
	#superclass : #Object,
	#category : #''Exercise@ExampleAllRaiseError''
}

{ #category : #''as yet unclassified'' }
ExampleAllRaiseError >> exerciseMethodA [
		self error: ''some domain error''
]

{ #category : #''as yet unclassified'' }
ExampleAllRaiseError >> exerciseMethodB [
		self error: ''another error''
]

{ #category : #''as yet unclassified'' }
ExampleAllRaiseError >> exerciseMethodC [
		self error: ''yet another error''
]
'
]

{ #category : 'private' }
ExampleAllRaiseErrorTest class >> exampleTestCasesSourceCode [

	^ 'Class {
#name : #ExampleAllRaiseErrorTest,
#superclass : #ExercismTest,
#category : #''Exercise@ExampleAllRaiseError''
}

{ #category : #''as yet unclassified'' }
ExampleAllRaiseErrorTest >> testExerciseMethodA [
	self assert: ExampleAllRaiseError new exerciseMethodA
]

{ #category : #''as yet unclassified'' }
ExampleAllRaiseErrorTest >> testExerciseMethodB [
	self assert: ExampleAllRaiseError new exerciseMethodB
]

{ #category : #''as yet unclassified'' }
ExampleAllRaiseErrorTest >> testExerciseMethodC [
	self assert: ExampleAllRaiseError new exerciseMethodC
]
'
]
