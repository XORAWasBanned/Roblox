-- Path: CoreGui.RobloxGui.Modules.Settings.ReactPageSignal
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Signals)
require(script.Parent.EnumReactPage)
return v_u_2.createComputed(function() -- name: ReactPageSignal
	-- upvalues: (copy) v_u_2
	local v3, v4 = v_u_2.createSignal(nil)
	return {
		["currentReactPage"] = v3,
		["setCurrentReactPage"] = v4
	}
end)