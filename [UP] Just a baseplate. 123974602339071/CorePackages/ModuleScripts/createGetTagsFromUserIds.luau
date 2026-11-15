-- Path: CorePackages.Packages._Index.NetworkingAliases-31ab8d40-0.6.3.NetworkingAliases.networkRequests.createGetTagsFromUserIds
local v_u_1 = require(script.Parent.Parent.ALIAS_URL)
require(script.Parent.Parent.networkingAliasesTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.POST({
		["Name"] = "GetTagsFromUserIds"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("user"):path("get-tags"):body({
			["targetUserIds"] = p4
		})
	end)
end