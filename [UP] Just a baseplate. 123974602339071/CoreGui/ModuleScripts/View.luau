-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.View
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetView)
local v5 = require(v3.Constants)
return v2.createReducer(v5.View.Wide, {
	[v4.name] = function(_, p6)
		return p6.view
	end
})