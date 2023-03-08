sub init()
    m.focusPosterOk = m.top.findNode("posterOk")
    m.focusLabelOk = m.top.findNode("labelOk")
    m.top.observeField("focusedChild", "buttonFocused")
end sub

sub   buttonFocused()
    if m.top.hasfocus() 
        m.focusPosterOk.opacity ="1"
        m.focusLabelOk.color = "0x000000"
    else
        m.focusPosterOk.opacity ="0.3"
        m.focusLabelOk.color = "0xFCFFE7"
    end if
end sub

