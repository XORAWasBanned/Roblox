-- Path: CorePackages.Packages._Index.LuaRoactPolicyProvider.LuaRoactPolicyProvider
local v_u_1 = require(script.connect)
local v_u_2 = require(script.Provider)
local v3 = require(script.Logger)
local v4 = script.getPolicyImplementations
local v5 = require(v4.fromMemStorageService)
local v6 = require(v4.fromPolicyService)
local v7 = require(v4.fromStaticSource)
local v8 = require(script.AppPolicyContext)
local v12 = {
	["withGetPolicyImplementation"] = function(p9) -- name: withGetPolicyImplementation
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v10 = p9.read
		assert(v10, "expected getPolicyImpl to have `read` function")
		local v11 = p9.onPolicyChanged
		assert(v11, "expected getPolicyImpl to have `onPolicyChanged` function")
		return {
			["connect"] = v_u_1(p9),
			["Provider"] = v_u_2()
		}
	end,
	["GetPolicyImplementations"] = {
		["MemStorageService"] = v5(),
		["PolicyService"] = v6(),
		["Static"] = v7()
	},
	["Logger"] = v3,
	["AppPolicyContext"] = v8
}
return v12