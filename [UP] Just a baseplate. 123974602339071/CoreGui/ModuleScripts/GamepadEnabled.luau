-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.GamepadEnabled
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetGamepadEnabled)
return v2.createReducer(false, {
	[v4.name] = function(_, p5)
		return p5.gamepadEnabled
	end
})