sub init()
    m.top.keyColor="0xE7F6F2"
    m.top.focusedKeyColor="0x19172F"
    m.top.translation=[300,450]
    m.top.textEditBox.maxTextLength=20
    m.top.textEditBox.textColor = "0xE7F6F2" 
    m.top.textEditBox.hintText = "Type your name to start" 
    m.top.textEditBox.clearOnDownKey="false"
    m.keyboard = m.top.getChild(1)
    m.keyboard.visible = false
    m.keyboard.observeField("focusedChild", "showPad")
end sub

sub showPad()
    m.keyboard.visible = true 
    m.top.showRectangle = m.keyboard.visible
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
        if (press) then
            if key = "OK" AND  m.top.textEditBox.hasFocus()
                m.top.setFocus(true)
                handled=true
            else if key = "back"
                m.top.textEditBox.setFocus(true)
                m.keyboard.visible=false
                m.top.showRectangle = m.keyboard.visible
                handled = true 
            end if
        end if
    return handled
end function
  
  
