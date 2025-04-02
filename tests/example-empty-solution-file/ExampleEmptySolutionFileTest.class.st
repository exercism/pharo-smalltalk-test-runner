Class {
#name : #ExampleEmptySolutionFileTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleEmptySolutionFile'
}

{ #category : 'as yet unclassified' }
ExampleEmptySolutionFileTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #('introduction');
		yourself.
]

{ #category : #'as yet unclassified' }
ExampleEmptySolutionFileTest >> testExerciseMethodA [
	self assert: ExampleSyntaxError new exerciseMethodA equals: $A
]

{ #category : #'as yet unclassified' }
ExampleEmptySolutionFileTest >> testExerciseMethodB [
	self assert: ExampleSyntaxError new exerciseMethodB equals: $B
]

{ #category : #'as yet unclassified' }
ExampleEmptySolutionFileTest >> testExerciseMethodC [
	self assert: ExampleSyntaxError new exerciseMethodC equals: $C
]
