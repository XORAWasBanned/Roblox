-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Actions.OpenPublishAvatarAssetPrompt
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3, p4, p5)
	local v6 = {
		["promptInfo"] = {
			["promptType"] = p2,
			["accessoryType"] = p3,
			["guid"] = p4,
			["scopes"] = p5
		}
	}
	return v6
end)