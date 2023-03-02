sub init()
    m.focusPosterOk = m.top.findNode("posterOk")
    m.top.observeField("focusedChild", "buttonFocused")
end sub

sub   buttonFocused()
    if m.top.hasfocus() 
        m.focusPosterOk.opacity ="1"
        m.focusPosterOk.width = "140"
        m.focusPosterOk.height = "130"
        m.focusPosterOk.traslation = [870,905]
    else
        m.focusPosterOk.width = "120"
        m.focusPosterOk.height = "110"
    end if
end sub



