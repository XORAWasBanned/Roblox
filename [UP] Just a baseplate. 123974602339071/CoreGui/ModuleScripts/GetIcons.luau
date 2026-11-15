-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Network.Requests.Games.GetIcons
local v1 = script.Parent.Parent.Parent.Parent
local v_u_2 = require(v1.Network.Url)
return function(p3, p4)
	-- upvalues: (copy) v_u_2
	return p3(string.format("%sv1/games/%d/icon", v_u_2.GAME_URL, p4), "GET")
end