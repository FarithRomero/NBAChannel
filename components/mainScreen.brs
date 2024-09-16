sub init()
	bindVariables()
end sub

sub bindVariables()
	m.loadSpinner = m.top.findNode("loadSpinner")

	setGlobalComponents()
end sub

sub setGlobalComponents()
	m.global.addField("viewSelected", "string", true)
    m.global.observeField("viewSelected", "onViewSelected")

	m.global.viewSelected = ScreenNames.HOME
end sub

sub onViewSelected(event as object)
	viewSelected = event.getData()

	screenSelector = m.top.createChild("ScreenSelector")
	screenSelector.id = "ScreenSelector"
	screenSelector.viewId = viewSelected

	screenSelector.setFocus(true)
	m.top.insertChild(screenSelector, 1)

	validateLoadStatus(screenSelector)
end sub

sub validateLoadStatus(screenSelector)
	if screenSelector <> invalid
		if screenSelector.loadCompleted = true then m.loadSpinner.isLoadCompleted = true
	end if
end sub

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
