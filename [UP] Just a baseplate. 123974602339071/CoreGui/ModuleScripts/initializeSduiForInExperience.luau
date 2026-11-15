-- Path: CoreGui.RobloxGui.Modules.ServerDrivenUi.initializeSduiForInExperience
return function() -- name: initializeSduiForInExperience
	require(script.Parent.registerInExperienceComponents)()
	require(script.Parent.registerInExperienceActions)()
	require(script.Parent.registerInExperienceTelemetryHandlers)()
end