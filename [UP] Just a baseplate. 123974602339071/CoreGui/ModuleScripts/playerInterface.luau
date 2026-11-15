-- Path: CoreGui.RobloxGui.Modules.Interfaces.playerInterface
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.t)
return v2.union(v2.instanceIsA("Player"), v2.interface({
	["UserId"] = v2.integer,
	["Name"] = v2.string,
	["DisplayName"] = v2.string
}))