-- Path: CoreGui.RobloxGui.Modules.Server.shouldShowFriendJoinedPlayerToast
return function(p1)
	local v2 = p1:GetJoinData()
	if v2 then
		local v3 = v2.ReferredByPlayerId
		v2 = tonumber(v3)
	end
	return v2 == nil and true or v2 == 0
end