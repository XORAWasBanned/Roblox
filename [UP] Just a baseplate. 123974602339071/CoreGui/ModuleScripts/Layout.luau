-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Reducers.Layout
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = v3.Actions
local v5 = require(v4.SetLayout)
local v6 = require(v3.Constants)
return v2.createReducer(v6.Layout.Large, {
	[v5.name] = function(_, p7)
		return p7.layout
	end
})