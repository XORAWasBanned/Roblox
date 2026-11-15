-- Path: CoreGui.RobloxGui.Modules.Shell.Reducers.AppShellReducer
game:GetService("CorePackages")
local v1 = script.Parent
local v_u_2 = require(v1.ScreenList)
return function(p3, p4)
	-- upvalues: (copy) v_u_2
	return {
		["ScreenList"] = v_u_2((p3 or {}).ScreenList, p4)
	}
end