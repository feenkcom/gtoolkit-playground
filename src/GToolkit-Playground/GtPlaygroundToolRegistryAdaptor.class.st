Class {
	#name : #GtPlaygroundToolRegistryAdaptor,
	#superclass : #Object,
	#category : #'GToolkit-Playground-ToolRegistry'
}

{ #category : #testing }
GtPlaygroundToolRegistryAdaptor class >> isRegistered [
	<return: #Boolean>
	^ Smalltalk tools workspace = self
]

{ #category : #actions }
GtPlaygroundToolRegistryAdaptor class >> open [
	^ GtPlayground open maximized
]

{ #category : #'tools registry' }
GtPlaygroundToolRegistryAdaptor class >> register [
	<script>
	self registerToolsOn: Smalltalk tools
]

{ #category : #'tools registry' }
GtPlaygroundToolRegistryAdaptor class >> registerToolsOn: aToolRegistry [
	aToolRegistry register: self as: #workspace

]

{ #category : #icons }
GtPlaygroundToolRegistryAdaptor class >> taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^ #workspaceIcon
]

{ #category : #'taskbar-required' }
GtPlaygroundToolRegistryAdaptor class >> taskbarLabel [
	^ self title
]

{ #category : #accessing }
GtPlaygroundToolRegistryAdaptor class >> title [
	^ 'GT Playground'
]

{ #category : #'tools registry' }
GtPlaygroundToolRegistryAdaptor class >> unregister [
	<script>
	GTPlayground register
]
