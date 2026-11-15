-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.preloadAssets
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v1.Utility.Flags)
local v5 = require(v2.FoundationCloudAssets)
local v_u_6 = require(v1.Utility.devAssert)
local v_u_7 = v5.Assets
local v_u_8 = v5.preloadAsset
return function(p9)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
	local v10 = typeof(p9) == "string" and { p9 } or p9
	v_u_3.forEach(v10, function(p11)
		-- upvalues: (ref) v_u_4, (ref) v_u_6, (ref) v_u_7, (ref) v_u_8
		local v12 = ("preloadAssets should only be used with valid FoundationCloudAssets; %* is an invalid name"):format(p11)
		if v_u_4.FoundationDevOnlyPropAsserts then
			v_u_6(v_u_7[p11], v12)
			if not v_u_7[p11] then
				return
			end
		else
			local v13 = v_u_7[p11]
			assert(v13, v12)
		end
		v_u_8(p11)
	end)
end