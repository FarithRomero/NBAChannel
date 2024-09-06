sub init()
    bindVariables()
    bindStyles()
end sub

sub bindVariables()
    m.title = m.top.findNode("title")
    m.tyC = m.top.findNode("tyC")
end sub

sub bindStyles()
    m.title.text = "CREATE YOUR ACCOUNT AND ENJOY OUR CONTENT"
    m.tyC.text = "This channel just have academic porpuses and is non profit app"
    stopLoad()
end sub

sub stopLoad()
    m.top.loadComplete = true
end sub
'Cambiar el splash del inicio por uno mejor
'//# sourceMappingURL=./SignUpScreen.brs.map