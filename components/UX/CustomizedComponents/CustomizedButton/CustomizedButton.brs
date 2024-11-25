
' '***********************
' IMPORTS
' '***********************

' '***********************
'  [#0] MAIN ENTRY POINT
' '***********************

sub init()
	initVariables()
	initStyles()
	initObservers()
end sub

' '***********************
' [#1]: VARIABLES
' '***********************

sub initVariables()
	m.buttonBackground = m.top.findNode("buttonBackground")
	m.buttonLabel = m.top.findNode("buttonLabel")
end sub

' '***********************
' [#2]: OBSERVERS
' '***********************

sub initObservers()
	m.top.observeField("isSelected", "dispatchAction")
end sub

' '***********************
' [#3]: SETUPS
' '***********************

sub initStyles()
	m.buttonLabel.width = m.buttonBackground.width
	m.buttonLabel.height = m.buttonBackground.height
end sub

' '***********************
' [#4]: EVENTS
' '***********************

sub onButtonFocusedChange(event as object)
	event = event.getData()

	if event = true then m.buttonBackground.uri = "pkg:/images/FocussedButton.png" else m.buttonBackground.uri = "pkg:/images/UnfocusedButton.png"
end sub

sub onButtonSelectedChange()
end sub

sub dispatchAction()
	? "Dispatch new action"
end sub