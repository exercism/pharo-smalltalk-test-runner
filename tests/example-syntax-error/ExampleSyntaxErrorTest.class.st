Class {
#name : #ExampleSyntaxErrorTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleSyntaxError'
}

{ #category : 'as yet unclassified' }
ExampleSyntaxErrorTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #('introduction');
		yourself.
]

{ #category : #'as yet unclassified' }
ExampleSyntaxErrorTest >> testExerciseMethodA [
	self assert: ExampleSyntaxError new exerciseMethodA equals: $A
]

{ #category : #'as yet unclassified' }
ExampleSyntaxErrorTest >> testExerciseMethodB [
	self assert: ExampleSyntaxError new exerciseMethodB equals: $B
]

{ #category : #'as yet unclassified' }
ExampleSyntaxErrorTest >> testExerciseMethodC [
	self assert: ExampleSyntaxError new exerciseMethodC equals: $C
]
