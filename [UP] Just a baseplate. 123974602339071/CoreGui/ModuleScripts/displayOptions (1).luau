-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Reducers.displayOptions
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.SetScreenSize)
return v2.createReducer({
	["inputType"] = nil,
	["screenSize"] = nil,
	["screenSize"] = Vector2.new(0, 0)
}, {
	[v5.name] = function(p6, p7)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p6, {
			["screenSize"] = p7.screenSize
		})
	end
})