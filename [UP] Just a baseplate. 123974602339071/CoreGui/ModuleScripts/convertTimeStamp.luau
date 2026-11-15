-- Path: CoreGui.RobloxGui.Modules.DevConsole.Util.convertTimeStamp
local v_u_1 = game:DefineFastFlag("DevConsoleFixTimestampDST", false)
return function(p2) -- name: convertTimeStamp
	-- upvalues: (copy) v_u_1
	local v3, v4, v5
	if v_u_1 then
		local v6 = os.date("*t", p2)
		v3 = v6.hour
		v4 = v6.min
		v5 = v6.sec
	else
		local v7 = p2 - os.time() + tick()
		local v8 = math.floor(v7) % 86400
		local v9 = v8 / 3600
		v3 = math.floor(v9)
		local v10 = v8 - v3 * 3600
		local v11 = v10 / 60
		v4 = math.floor(v11)
		v5 = v10 - v4 * 60
	end
	local v12 = (v3 < 10 and "0" or "") .. v3
	local v13 = (v4 < 10 and "0" or "") .. v4
	local v14 = (v5 < 10 and "0" or "") .. v5
	return string.format("%s:%s:%s", v12, v13, v14)
end