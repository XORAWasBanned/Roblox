-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.Visible
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.ShowMenu)
local v5 = require(v3.Actions.HideMenu)
return v2.createReducer(true, {
	[v4.name] = function(_, _)
		return true
	end,
	[v5.name] = function(_, _)
		return false
	end
})