-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Actions.OpenPrompt
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["promptType"] = p2,
		["promptInfo"] = p3
	}
end)