-- Path: CorePackages.Packages._Index.NetworkingGames.NetworkingGames.networkRequests.createGetExperiencesProductInfo
local v_u_1 = require(script.Parent.Parent.GAMES_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetExperiencesProductInfo"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("games"):path("games-product-info"):expandedQueryArgsWithIds("universeIds", p4)
	end)
end