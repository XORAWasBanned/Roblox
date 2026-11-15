-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Reducers
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = {
	["common"] = require(script.common),
	["displayOptions"] = require(script.displayOptions),
	["placeInfo"] = require(script.placeInfo),
	["report"] = require(script.report)
}
return v2.combineReducers(v3)