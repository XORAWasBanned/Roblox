-- Path: CorePackages.Packages._Index.NetworkingGames.NetworkingGames.createRequestThunks
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createGetExperiencesPlayabilityStatus)
local v_u_3 = require(v1.createGetExperiencesProductInfo)
local v_u_4 = require(v1.createGetExperiencesDetails)
local v_u_5 = require(v1.createGetExperienceMedia)
return function(p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	return {
		["GetExperiencesPlayabilityStatus"] = v_u_2(p6),
		["GetExperiencesProductInfo"] = v_u_3(p6),
		["GetExperiencesDetails"] = v_u_4(p6),
		["GetExperienceMedia"] = v_u_5(p6)
	}
end