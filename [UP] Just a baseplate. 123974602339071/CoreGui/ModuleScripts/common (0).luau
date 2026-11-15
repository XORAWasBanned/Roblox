-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Reducers.common
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.ShowToast)
return v3.createReducer({
	["toastTitle"] = nil,
	["toastSubtitle"] = nil
}, {
	[v5.name] = function(p6, p7)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p6, {
			["toastTitle"] = p7.toastTitle,
			["toastSubtitle"] = p7.toastSubtitle
		})
	end
})