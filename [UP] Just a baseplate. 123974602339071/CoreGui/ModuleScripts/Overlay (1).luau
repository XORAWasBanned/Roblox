-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.Overlay
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.OpenOverlay)
local v5 = require(v3.Actions.CloseOverlay)
return v2.createReducer({
	["overlay"] = nil,
	["overlayProps"] = nil,
	["overlayProps"] = {}
}, {
	[v4.name] = function(_, p6)
		return {
			["overlay"] = p6.overlay,
			["overlayProps"] = p6.overlayProps
		}
	end,
	[v5.name] = function(_, _)
		return {
			["overlay"] = nil,
			["overlayProps"] = nil,
			["overlayProps"] = {}
		}
	end
})