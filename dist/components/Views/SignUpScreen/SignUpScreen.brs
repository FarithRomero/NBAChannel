sub init()
    m.top.setFocus(true)
    bindVariables()
    bindStyles()
    focusHandler()
end sub

sub bindVariables()
    m.title = m.top.findNode("title")
    m.tyC = m.top.findNode("tyC")
    m.signUpButton = m.top.findNode("signUpButton")
    m.skipButton = m.top.findNode("skipButton")
end sub

sub bindStyles()
    m.title.text = "CREATE YOUR ACCOUNT AND ENJOY OUR CONTENT"
    m.tyC.text = "This channel just have academic porpuses and is non profit app"
    stopLoad()
end sub

sub stopLoad()
    m.top.loadComplete = true
end sub

sub focusHandler()
    m.signUpButton.setFocus(true)
end sub
'//# sourceMappingURL=./SignUpScreen.brs.map