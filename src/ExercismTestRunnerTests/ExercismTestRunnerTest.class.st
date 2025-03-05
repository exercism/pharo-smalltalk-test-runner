"
An ExercismTestRunnerTest is a test class for testing the behavior of ExercismTestRunner
"
Class {
	#name : 'ExercismTestRunnerTest',
	#superclass : 'TestCase',
	#category : 'ExercismTestRunnerTests',
	#package : 'ExercismTestRunnerTests'
}

{ #category : 'test-data' }
ExercismTestRunnerTest class >> mockSnapshotRunnerSolutionSTON [
^ 'MCSnapshot {
	#definitions : OrderedCollection [
		MCOrganizationDefinition {
			#categories : [
				#''Exercise@MockRunner''
			]
		},
		MCMethodDefinition {
			#classIsMeta : false,
			#source : ''mockMethodA \r\t^ true'',
			#category : #''as yet unclassified'',
			#selector : #mockMethodA,
			#className : #MockRunner
		},
		MCMethodDefinition {
			#classIsMeta : false,
			#source : ''mockMethodB\r\t^ false'',
			#category : #''as yet unclassified'',
			#selector : #mockMethodB,
			#className : #MockRunner
		},
		MCMethodDefinition {
			#classIsMeta : false,
			#source : ''mockMethodC \r\tself error: \''My domain mock error.\'' '',
			#category : #''as yet unclassified'',
			#selector : #mockMethodC,
			#className : #MockRunner
		},
		MCClassDefinition {
			#name : #MockRunner,
			#superclassName : #Object,
			#variables : OrderedCollection [ ],
			#category : #''Exercise@MockRunner'',
			#type : #normal,
			#comment : '''',
			#commentStamp : '''',
			#traitComposition : ''{}'',
			#classTraitComposition : ''{}''
		}
	],
	#classDefinitionCache : { #MockRunner : @8 }
}'
]

{ #category : 'test-data' }
ExercismTestRunnerTest class >> mockSnapshotRunnerTestCaseSTON [
^ 'MCSnapshot {
	#definitions : OrderedCollection [
		MCOrganizationDefinition {
			#categories : [
				#''Exercise@MockRunner''
			]
		},
		MCMethodDefinition {
			#classIsMeta : true,
			#source : ''exercise\r\t^ (self createExerciseAfter: HelloWorldTest)\r\t\tisCore: true;\r\t\tdifficulty: 1;\r\t\ttopics: #(\''introduction\'');\r\t\tyourself'',
			#category : #''as yet unclassified'',
			#selector : #exercise,
			#className : #MockRunnerTest
		},
		MCMethodDefinition {
			#classIsMeta : false,
			#source : ''testMockMethodA \r\tself assert: MockRunner new mockMethodA'',
			#category : #''as yet unclassified'',
			#selector : #testMockMethodA,
			#className : #MockRunnerTest
		},
		MCMethodDefinition {
			#classIsMeta : false,
			#source : ''testMockMethodB\r\tself assert: MockRunner new mockMethodB'',
			#category : #''as yet unclassified'',
			#selector : #testMockMethodB,
			#className : #MockRunnerTest
		},
		MCMethodDefinition {
			#classIsMeta : false,
			#source : ''testMockMethodC \r\tself assert: MockRunner new mockMethodC'',
			#category : #''as yet unclassified'',
			#selector : #testMockMethodC,
			#className : #MockRunnerTest
		},
		MCClassDefinition {
			#name : #MockRunnerTest,
			#superclassName : #ExercismTest,
			#variables : OrderedCollection [ ],
			#category : #''Exercise@MockRunner'',
			#type : #normal,
			#comment : '''',
			#commentStamp : '''',
			#traitComposition : ''{}'',
			#classTraitComposition : ''{}''
		}
	],
	#classDefinitionCache : { #MockRunnerTest : @9 }
}'
]

{ #category : 'private' }
ExercismTestRunnerTest >> mockRunnerSolutionSnapshot [

	^ STON fromString: self class mockSnapshotRunnerSolutionSTON
]

{ #category : 'private' }
ExercismTestRunnerTest >> mockRunnerTestCaseSnapshot [

	^ STON fromString: self class mockSnapshotRunnerTestCaseSTON
]

{ #category : 'private' }
ExercismTestRunnerTest >> prepareMockExtensionMethods [

	| package |
	Array compile: 'mockMethodArray 
	^ true'.
	Integer compile: 'mockMethodInteger
	^ false'.
	
	package := RPackageOrganizer default packageNamed: 'Exercise@MockRunner' 
		ifAbsent: [RPackageOrganizer default createPackageNamed: 'Exercise@MockRunner'].
	package addMethod: Array>>#mockMethodArray.
	package addMethod: Integer>>#mockMethodInteger.
]

{ #category : 'private' }
ExercismTestRunnerTest >> prepareMockSolution [

	self mockRunnerSolutionSnapshot install.
	
]

{ #category : 'private' }
ExercismTestRunnerTest >> prepareMockSolutionFileIn: sourceDirectoryRef [

	(TonelWriter on: sourceDirectoryRef) writeSnapshot: self mockRunnerSolutionSnapshot.
	
	"Remove the package file as its not needed for Exercism"
	(sourceDirectoryRef / 'Exercise@MockRunner' / 'package.st') delete.
	(sourceDirectoryRef / 'Exercise@MockRunner') entries do: [:entry | entry reference moveTo: sourceDirectoryRef ].
	(sourceDirectoryRef / 'Exercise@MockRunner') delete.
	
]

{ #category : 'private' }
ExercismTestRunnerTest >> prepareMockTestCase [

	self mockRunnerTestCaseSnapshot install.
	
]

{ #category : 'running' }
ExercismTestRunnerTest >> tearDown [ 
	|aPackage|
	aPackage := RPackageOrganizer default packageNamed: 'Exercise@MockRunner' ifAbsent: [nil].
	aPackage ifNotNil: [ 
		aPackage removeFromSystem.
		
		"remove ext. methods as well"
		Array compiledMethodAt: #mockMethodArray
				ifPresent: [ :method | method removeFromSystem].
		Integer compiledMethodAt: #mockMethodInteger
				ifPresent: [ :method | method removeFromSystem].
		].
	super tearDown
]

{ #category : 'tests' }
ExercismTestRunnerTest >> testLoadSourceDefinitionsFrom [

	|memRef definitions|
	memRef := FileSystem memory root.
	self prepareMockSolutionFileIn: memRef.
	self assert: memRef entries isNotEmpty.
	definitions := ExercismTestRunner default loadSourceDefinitionsFrom: memRef.
	self assert: definitions isNotEmpty. 
	ExercismTestRunner default validateDefinitions: definitions.
	
]

{ #category : 'tests' }
ExercismTestRunnerTest >> testPrepareMockSolution [
	|memRef|
	memRef := FileSystem memory root.
	self prepareMockSolutionFileIn: memRef.
	self assert: memRef entries isNotEmpty.
]

{ #category : 'running' }
ExercismTestRunnerTest >> testRemoveDefinedSolutionClassesAndExtensionMethods [

	| exercise |
	"preparing mock test case"
	self prepareMockTestCase.
	self prepareMockSolution.
	self prepareMockExtensionMethods.
	exercise := ExercismTestRunner default findExercise: 'mock-runner'.
	self assertCollection: exercise solutionClasses equals: {(self class environment at: #MockRunner). Integer. Array.} asSet.
	self assert: exercise definedSolutionClasses equals: {self class environment at: #MockRunner} asSet.
	exercise removeDefinedSolutionClassesAndExtensionMethods.
	self assert: exercise solutionClasses isEmpty.
	self assert: exercise definedSolutionClasses isEmpty.
]

{ #category : 'running' }
ExercismTestRunnerTest >> testRunTestsOnExerciseImportSourcefromResult [

	|memRef inputDir outputDir outputFile|
	
	memRef := FileSystem memory root.
	inputDir := (memRef / 'input') ensureCreateDirectory.
	outputDir := (memRef / 'output') ensureCreateDirectory.
	"preparing mock test case"
	self prepareMockTestCase.
	self prepareMockSolutionFileIn: inputDir.
	
	ExercismTestRunner default runTestsOnExercise: 'mock-runner' importSourceFrom: inputDir result: outputDir.
	
	outputFile := outputDir / 'results.json'. 
	self assert: outputFile isFile.
	self assert: (outputFile contents includesSubstring: '"status" : "error"').
	self assert: (outputFile contents includesSubstring: '"message" : "My domain mock error.').
	self assert: (outputFile contents includesSubstring: '"status" : "pass"').
	self assert: (outputFile contents includesSubstring: '"status" : "fail"').
]

{ #category : 'tests' }
ExercismTestRunnerTest >> testSetErrorToJson [

	|result|
	result := (ExercismTestRunner default setErrorToJson: 'Some error') .
	self assert: (result includesSubstring: '"message" : "Some error"').
	self assert: (result includesSubstring: '"status" : "error"').
]

{ #category : 'tests' }
ExercismTestRunnerTest >> testValidateDefinitions [

	|reader|
	reader := TonelReader fromExerciseDirectory: FileSystem memory root.
	reader loadDefinitions.
	self should: [ExercismTestRunner default validateDefinitions: reader definitions] raise: ExDomainError description: 'Empty source code definitions are not valid for loading exercise'.
]

{ #category : 'tests' }
ExercismTestRunnerTest >> testValidateDirectory [

	|runner|
	runner := ExercismTestRunner default.
	"this should pass"
	runner validateDirectory: FileSystem memory root.
	
	self should: [runner validateDirectory: 'non-existing-dir' asFileReference ] raise: ExDomainError description: 'Invalid path to directory should raise domain error'.
]

{ #category : 'tests' }
ExercismTestRunnerTest >> testWriteJsonTo [
	|jsonData memRef|
	memRef := FileSystem memory root.
	jsonData := 'some json contents'.
	ExercismTestRunner default writeJson: jsonData to: memRef.
	
	self assert: (memRef / 'results.json') asFileReference contents equals: jsonData.
]
