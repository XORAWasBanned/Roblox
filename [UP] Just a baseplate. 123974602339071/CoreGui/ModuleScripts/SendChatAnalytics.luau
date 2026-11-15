-- Path: CoreGui.RobloxGui.Modules.Server.SendChatAnalytics
local v_u_1 = game:GetService("RbxAnalyticsService")
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = p3 or {}
	local v5 = v4 ~= nil
	assert(v5, "eventTable must not be nil")
	local v6 = game.GameId
	v4.gameId = tostring(v6)
	local v7 = game.PlaceId
	v4.placeId = tostring(v7)
	v_u_1:SendEventDeferred("rcc", "lua_chat_system", p2, v4)
end