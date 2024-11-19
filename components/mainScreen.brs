import "pkg:/source/EnumsContainer.bs"
import "pkg:/source/FocusHandler.bs"
import "pkg:/source/ViewsGenerator.bs"

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
	createNewView(ScreenNames.HOME, m.top)
	getAllFocusedNodes()
end sub

sub bindObservers()
	m.global.observeField("viewSelected", "onViewSelected")
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