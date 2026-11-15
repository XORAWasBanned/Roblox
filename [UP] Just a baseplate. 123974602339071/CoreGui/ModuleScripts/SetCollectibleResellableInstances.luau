-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetCollectibleResellableInstances
local v1 = game:GetService("CorePackages")
require(script.Parent.Parent.Models.CollectibleInstance)
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["collectibleItemId"] = p2,
		["collectibleItemInstances"] = p3
	}
end)