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
	m.top.observeField("focusedChild", "buttonFocused")
end sub

sub buttonFocused()
	if m.top.hasfocus()
		m.buttonBackground.blendColor = "0xFFFFFF"
	end if
end sub

