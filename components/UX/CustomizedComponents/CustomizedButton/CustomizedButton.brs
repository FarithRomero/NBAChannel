
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
	m.top.observeField("focusedChild", "onButtonFocusedChange")
	m.top.observeField("isSelected", "dispatchAction")
	m.top.observeField("isFocused", "onButtonSelectedChange")
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

sub onButtonFocusedChange()
	if m.top.hasFocus() then m.top.isFocused = true
end sub

sub onButtonSelectedChange()
	if m.top.isFocused = true then m.buttonBackground.uri = "pkg:/images/FocussedButton.png" else m.buttonBackground.uri = "pkg:/images/UnfocusedButton.png"
end sub

sub dispatchAction()
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
	handled = false
	if press
		if key = "OK"
			if m.top.isInFocusChain()
				? "FOCO ENCONTRADO"
			end if
		end if
		handled = true
	end if
	return handled
end function
