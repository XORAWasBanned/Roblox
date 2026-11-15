-- Path: CoreGui.RobloxGui.Modules.Feedback.Actions.ShowHelpModal
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["helpModalVisible"] = p2
	}
end)