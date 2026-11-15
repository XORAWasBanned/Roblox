-- Path: CorePackages.Packages._Index.NetworkingGames.NetworkingGames.networkRequests.createGetExperiencesPlayabilityStatus
local v_u_1 = require(script.Parent.Parent.GAMES_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetExperiencesPlayabilityStatus"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("games"):path("multiget-playability-status"):expandedQueryArgsWithIds("universeIds", p4)
	end)
end