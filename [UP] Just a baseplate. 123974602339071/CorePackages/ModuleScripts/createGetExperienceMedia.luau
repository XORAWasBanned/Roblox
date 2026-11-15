-- Path: CorePackages.Packages._Index.NetworkingGames.NetworkingGames.networkRequests.createGetExperienceMedia
local v_u_1 = require(script.Parent.Parent.GAMES_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetExperienceMedia"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v2"):path("games"):id(p4):path("media")
	end)
end