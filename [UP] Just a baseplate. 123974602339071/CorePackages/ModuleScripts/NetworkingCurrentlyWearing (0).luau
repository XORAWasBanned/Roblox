-- Path: CorePackages.Packages._Index.NetworkingCurrentlyWearing.NetworkingCurrentlyWearing
local v1 = script.networkRequests
local v_u_2 = require(v1.createGetCurrentlyWearing)
local v_u_3 = require(v1.createGetItemDetails)
return {
	["config"] = function(p4) -- name: createRequestThunks
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return {
			["GetCurrentlyWearing"] = v_u_2(p4),
			["GetItemDetails"] = v_u_3(p4)
		}
	end
}