-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Network.Requests.GetPlaceInfos
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.Network.Url)
return function(p3, p4)
	-- upvalues: (copy) v_u_2
	for v5, v6 in ipairs(p4) do
		p4[v5] = tostring(v6)
	end
	local v7 = v_u_2:makeQueryString({
		["placeIds"] = p4
	})
	return p3(string.format("%s/v1/games/multiget-place-details?%s", v_u_2.GAME_URL, v7), "GET")
end