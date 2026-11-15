-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Actions.GameNameFetched
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["gameName"] = p2
	}
end)