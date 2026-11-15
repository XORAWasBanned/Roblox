-- Path: CoreGui.RobloxGui.Modules.Feedback.Actions.SetSourceLanguageName
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["sourceLanguageName"] = p2
	}
end)