sub init()
	m.top.setFocus(true)

	bindVariables()
	bindStyles()
	setViews()
	' m.channelPoster = m.top.findNode("channelPoster")
	' m.playerPoster = m.top.findNode("playerPoster")
	' ' m.keyboard = m.top.findNode("TypeKeyboard")
	' m.okButton = m.top.findNode("okButton")
	' ' m.keyboardBackGround = m.top.findNode("keyboardBackGround")
	' m.msWelcome = m.top.findNode("msWelcome")
	' m.enterScreen = m.top.findNode("enterScreen")
	' m.firstSceen = m.top.findNode("firstSceen")
	' m.customizedRowlist = m.top.findNode("usersProfiles")
	' m.secondScreen = m.top.findNode("dataUserScreen")
	' m.userDataName = m.top.findNode("userDataName")
	' m.posterDataUser = m.top.findNode("posterDataUser")
	' m.msWelcome = m.top.findNode("msWelcome")
	' m.TeamsData = m.top.findNode("TeamsData")
	' m.video = m.top.findNode("exampleVideo")

	' m.keyboard.textEditBox.observeField("text", "onTextFieldChange")
	' m.keyboard.observeField("showRectangle", "onVisibleKeyboardChange")
	' m.customizedRowlist.observeField("rowItemSelected", "displaySecondScreen")

	' m.firstSceen.visible = false
	' m.secondScreen.visible = false

	' m.startTimer = m.top.findNode("startTimer")
	' m.startTimer.control = "start"
	' m.initialStartTimerText = "Alert!"
	' m.finalStartTimertext = "This is a sample Roku Chanel non-profit."
	' m.startTimerLabel = m.top.FindNode("startTimerLabel")
	' m.startTimerLabel.text = m.initialStartTimerText
	' ' m.textchange = false
	' m.startTimer.ObserveField("fire","changetext")

	' onVisibleKeyboardChange()
	' onTextFieldChange()
	' createUserContentTask()
end sub

sub bindVariables()
	m.loadingIndicator = m.top.findNode("loadingIndicator")
end sub

sub bindStyles()
    m.loadingIndicator.poster.uri = "pkg:/images/spinner.png"
    m.loadingIndicator.poster.blendcolor = "#942524"
end sub

sub setViews()
	screen = m.top.createChild("SignUpScreen")
	screen.setFocus(true)

	m.top.insertChild(screen, 1)

	validateLoadStatus(screen)
end sub

sub validateLoadStatus(screen)
 if screen.loadComplete = true then m.loadingIndicator.visible = false
end sub
' sub onVisibleKeyboardChange()
'     m.keyboardBackGround.visible = m.keyboard.showRectangle
' end sub

' sub onTextFieldChange()
'   m.userName = m.keyboard.textEditBox.text
' end sub

' sub createUserContentTask()
'   m.userContentTask = CreateObject("roSGNode", "usersContentTask")
'   m.userContentTask.url = "https://api-nba-v1.p.rapidapi.com/teams"
'   m.userContentTask.observeField("output", "onOutputChanged")
'   m.userContentTask.control = "RUN"
' end sub

' sub onOutputChanged()
'   if (m.enterScreen.visible = true)
'     m.customizedRowlist.content = invalid
'   else m.customizedRowlist.content = m.userContentTask.output
'     m.customizedRowlist.setFocus(true)
'     m.userContentTask.unobserveField("output")
'     m.userContentTask.control = "stop"
'     m.userContentTask = invalid
'   end if
' end sub

' sub displaySecondScreen()
'   m.itemContentSelected = m.customizedRowlist.content.getChild(m.customizedRowlist.rowItemSelected[0]).getChild(m.customizedRowlist.rowItemSelected[1])
'   displayVideoOn()

'   if (m.itemContentSelected.displayDetailScreen = true and  m.itemContentSelected.displayVideo = false) then
'     m.customizedRowlist.visible = false
'     m.firstSceen.visible = false
'     m.secondScreen.visible = true
'     m.userDataName.text = m.itemContentSelected.title
'     m.posterDataUser.uri = m.itemContentSelected.HDPOSTERURL
'     m.TeamsData.text = "Team name: " + m.itemContentSelected.Directors[0] + " City: " + m.itemContentSelected.Directors[1] + " Code Team: " + m.itemContentSelected.Directors[2] + " Nickname: " + m.itemContentSelected.Directors[3]
'     m.msWelcome.visible = false
'   end if
' end sub

' sub displayVideoOn()
'   if m.itemContentSelected.displayVideo = true   then
'     videoContent = createObject("RoSGNode", "ContentNode")
'     videoContent.url = m.itemContentSelected.url
'     videoContent.title = m.itemContentSelected.title
'     videoContent.streamformat = "hls"

'     m.video.content = videoContent
'     m.video.control = "play"
'     m.video.setFocus(true)
'     m.video.visible = true
'   end if
' end sub

function onMainScreenSuspend (arg as dynamic)
	for each key in arg
		print "***** Suspending Channel *****" key "=" arg[key]
	end for
end function

function onMainScreenResume(arg as dynamic)
	for each key in arg
			print "***** Resuming Channel *****" key "=" arg[key]
	end for

	if arg.launchParams <> invalid
	launchParams = arg.launchParams
		if(launchParams.mediaType <> invalid) and (launchParams.contentId <> invalid)
			print "Deep Link  Media Player"
		end if
	end if
	myScene = m.top.getScene()
	myScene.signalBeacon("AppResumeComplete")
end function

' function onKeyEvent(key as String, press as Boolean) as Boolean
'   handled = false
'     if (press) then
'       if (key = "up")
'         if m.okButton.hasFocus()
'           m.keyboard.setFocus(true)
'         end if
'       else if (key = "down")
'         if m.keyboard.isInFocusChain()
'           m.okButton.setFocus(true)
'           handled = true
'         end if
'       else if (key = "OK" )
'           ' if m.top.hasFocus()
'           '   m.keyboard.setFocus(true)
'           '     m.okButton.visible = true
'           '   handled=true
'           ' else
'           if m.okButton.hasFocus()
'             m.enterScreen.visible = false
'             m.channelPoster = invalid
'             m.playerPoster = invalid
'             m.firstSceen.visible = true
'             m.customizedRowlist.content = m.userContentTask.output
'             m.customizedRowlist.setFocus(true)
'             m.userName = m.keyboard.textEditBox.text
'             m.msWelcome.text = "Welcome " + m.userName
'           end if
'       else if (key = "back")
'         if (m.video.hasFocus())
'           m.video.control = "stop"
'           m.video.content = invalid
'           m.video.visible = false
'           m.customizedRowlist.setFocus(true)
'           handled = true
'         ' else if (m.okButton.hasFocus())
'         '   m.keyboard.textEditBox.setFocus(true)
'         '   handled = true
'       else if m.customizedRowlist.hasFocus() then
'         m.itemContentSelected.displayDetailScreen = false
'         m.customizedRowlist.visible = true
'         m.secondScreen.visible = false
'         m.firstSceen.visible = true
'         m.msWelcome.visible = true
'         handled = true
'         end if
'       end if
'     end if
'   return handled
' end function


' sub changetext()
'   if (m.textchange = false) then
'     m.startTimerLabel.text = m.finalStartTimertext
'     m.textchange = true
'    else
'      m.startTimerLabel.text = m.initialStartTimerText
'      m.textchange = false
'    end if
' end sub