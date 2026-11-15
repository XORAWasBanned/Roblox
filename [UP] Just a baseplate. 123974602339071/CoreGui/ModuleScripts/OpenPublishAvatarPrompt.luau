-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Actions.OpenPublishAvatarPrompt
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3, p4)
	local v5 = {
		["promptInfo"] = {
			["promptType"] = p2,
			["guid"] = p3,
			["scopes"] = p4
		}
	}
	return v5
end)