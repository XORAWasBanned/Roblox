-- Path: CoreGui.RobloxGui.Modules.SelfieView.Utils.SelfieViewPolicy
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.PolicyProvider)
local v3 = v2.GetPolicyImplementations.MemStorageService("app-policy")
local v4 = v2.withGetPolicyImplementation(v3)
function v4.Mapper(p_u_5)
	return {
		["eligibleForSelfieViewFeature"] = function() -- name: eligibleForSelfieViewFeature
			-- upvalues: (copy) p_u_5
			return p_u_5.EligibleForSelfieViewFeature or false
		end
	}
end
v4.PolicyImplementation = v3
return v4