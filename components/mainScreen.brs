import "pkg:/source/EnumsContainer.bs"
import "pkg:/source/FocusHandler.bs"

sub init()
	bindVariables()
	bindObservers()
	initApp()
end sub

sub bindVariables()
	m.loadSpinner = m.top.findNode("loadSpinner")
	setGlobalComponents()
end sub

sub setGlobalComponents()
	m.global.addField("viewSelected", "string", true)
	m.global.addField("focusRegistry", "array", true)
	m.global.focusRegistry = ["MainScene"]
end sub

sub initApp()
	m.global.viewSelected = ScreenNames.HOME
end sub

sub bindObservers()
	m.global.observeField("viewSelected", "onViewSelected")
end sub

sub onViewSelected(event as object)
	viewSelected = event.getData()

	screenSelector = m.top.createChild("ScreenSelector")
	screenSelector.id = "ScreenSelector"
	screenSelector.viewId = viewSelected

	applyFocusTo(screenSelector, viewSelected)

	m.top.insertChild(screenSelector, 1)

	validateLoadStatus(screenSelector)
end sub

sub validateLoadStatus(screenSelector)
	if screenSelector <> invalid
		if screenSelector.loadCompleted = true then m.loadSpinner.isLoadCompleted = true
	end if
end sub

sub onMainScreenSuspend (arg as dynamic)
	for each key in arg
		print "***** Suspending Channel *****" key "=" arg[key]
	end for
end sub

sub onMainScreenResume(arg as dynamic)
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
end sub
