-- Path: CorePackages.Packages._Index.NetworkingAliases-31ab8d40-0.6.3.NetworkingAliases.createRequestThunks
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createGetTagsFromUserIds)
local v_u_3 = require(v1.createSetUserTag)
require(script.Parent.networkingAliasesTypes)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return {
		["GetTagsFromUserIds"] = v_u_2(p4),
		["SetUserTag"] = v_u_3(p4)
	}
end