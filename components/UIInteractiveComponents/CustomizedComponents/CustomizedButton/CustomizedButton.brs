sub init()
	bindVariables()
	bindStyles()
	bindObservers()
end sub

sub bindVariables()
	m.buttonBackground = m.top.findNode("buttonBackground")
	m.buttonLabel = m.top.findNode("buttonLabel")
end sub

sub bindStyles()
	m.buttonLabel.width = m.buttonBackground.width
	m.buttonLabel.height = m.buttonBackground.height
end sub

sub bindObservers()
	m.top.observeField("focusedChild", "onButtonFocusedChange")
	m.top.observeField("isSelected", "dispatchAction")
	m.top.observeField("isFocused", "onButtonSelectedChange")
end sub

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
			if m.top.hasFocus()
				m.top.isSelected = true
			end if
		end if
		handled = true
	end if
	return handled
end function