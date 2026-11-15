-- Path: CoreGui.RobloxGui.Modules.TopBar.TopBarAppPolicy
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.PolicyProvider)
local v_u_3 = require(v1.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local v4 = v2.GetPolicyImplementations.MemStorageService("app-policy")
local v5 = v2.withGetPolicyImplementation(v4)
function v5.Mapper(p_u_6)
	-- upvalues: (copy) v_u_3
	return {
		["showBadgeOver12"] = not v_u_3 and function()
			-- upvalues: (copy) p_u_6
			return p_u_6.ShowBadgeOver12 or false
		end or nil
	}
end
return v5