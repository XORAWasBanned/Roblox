-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Helpers.getActiveInterventionTimeoutEnd
return function(p1, p2) -- name: getActiveInterventionTimeoutEnd
	local v3 = p1.timeoutDurationSeconds
	if v3 == nil or v3 < 0 then
		return false, nil
	elseif v3 == 0 then
		return true, nil
	else
		local v4 = p1.timeoutStartTime
		local v5
		if v4 and v4 ~= "" then
			v5 = DateTime.fromIsoDate(v4)
		else
			v5 = nil
		end
		local v6
		if v5 then
			v6 = v5.UnixTimestamp
		else
			v6 = p2
		end
		local v7 = v6 + v3
		if v7 <= p2 then
			return false, nil
		else
			return true, v7
		end
	end
end