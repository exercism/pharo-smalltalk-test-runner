Class {
#name : #ExampleAllRaiseErrorTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleAllRaiseError'
}

{ #category : 'as yet unclassified' }
ExampleAllRaiseErrorTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #('introduction');
		yourself.
]

{ #category : #'as yet unclassified' }
ExampleAllRaiseErrorTest >> testExerciseMethodA [
	self assert: ExampleAllRaiseError new exerciseMethodA
]

{ #category : #'as yet unclassified' }
ExampleAllRaiseErrorTest >> testExerciseMethodB [
	self assert: ExampleAllRaiseError new exerciseMethodB
]

{ #category : #'as yet unclassified' }
ExampleAllRaiseErrorTest >> testExerciseMethodC [
	self assert: ExampleAllRaiseError new exerciseMethodC
]
