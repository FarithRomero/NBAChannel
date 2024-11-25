' '***********************
' IMPORTS
' '***********************

import "pkg:/source/EnumsContainer.bs"
import "pkg:/source/FocusHandler.bs"
import "pkg:/source/ViewsGenerator.bs"
import "pkg:/source/ValidationUtils.bs"

' '***********************
'  [#0] MAIN ENTRY POINT
' '***********************

sub init()
	initVariables()
	initObservers()

	initApp()
end sub

' '***********************
' [#1]: VARIABLES
' '***********************

sub initVariables()
	m.loadSpinner = m.top.findNode("loadSpinner")
	setGlobalComponents()
end sub

sub setGlobalComponents()
	m.global.addField("viewSelected", "string", true)
	m.global.addField("focusRegistry", "array", true)
	m.global.focusRegistry = ["MainScene"]
end sub

' '***********************
' [#2]: OBSERVERS
' '***********************

sub initObservers()
	m.global.observeField("viewSelected", "onViewSelected")
end sub

' '***********************
' [#3]: SETUPS
' '***********************

sub initApp()
	openTab(ScreenNames.HOME, m.top)
end sub

' '***********************
' [#4]: EVENTS
' '***********************

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