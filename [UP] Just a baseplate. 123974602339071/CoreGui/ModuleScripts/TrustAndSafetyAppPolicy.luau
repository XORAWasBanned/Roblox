-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.TrustAndSafetyAppPolicy
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.PolicyProvider)
local v3 = v2.GetPolicyImplementations.MemStorageService("app-policy")
local v4 = v2.withGetPolicyImplementation(v3)
function v4.Mapper(_)
	return {}
end
return v4