-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Actions.OpenPublishAssetPrompt
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3, p4, p5, p6)
	local v7 = {
		["promptInfo"] = {
			["promptType"] = p2,
			["assetInstance"] = p3,
			["assetType"] = p4,
			["guid"] = p5,
			["scopes"] = p6
		}
	}
	return v7
end)