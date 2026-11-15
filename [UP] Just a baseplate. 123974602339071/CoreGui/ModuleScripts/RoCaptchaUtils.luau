-- Path: CoreGui.RobloxGui.Modules.Server.RoCaptcha.RoCaptchaUtils
local v_u_1 = game:GetService("HttpService")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v2.Common.Flags.FFlagRoCaptchaReturnToServerInstance)
return {
	["isUniverseAllowed"] = function(p4, p5) -- name: isUniverseAllowed
		local v6 = tostring(p5)
		for v7 in string.gmatch(p4, "[^,]+") do
			if string.match(v7, "^%s*(.-)%s*$") ~= v6 then
				continue
			end
			return true
		end
		return false
	end,
	["parseLaunchData"] = function(p8) -- name: parseLaunchData
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		if type(p8) ~= "string" or p8 == "" then
			return nil
		end
		local v9 = v_u_1.JSONDecode
		local v10 = v_u_1
		local v11, v12 = pcall(v9, v10, p8)
		if not v11 or type(v12) ~= "table" then
			return nil
		end
		local v13 = v12.challengeId
		local v14 = v12.desiredPlaceId
		local v15 = tonumber(v14)
		if type(v13) ~= "string" or v13 == "" then
			return nil
		end
		if not v15 or (v15 <= 0 or v15 % 1 ~= 0) then
			return nil
		end
		local v16
		if v_u_3 then
			v16 = v12.serverInstanceId
			if type(v16) ~= "string" or not string.match(v16, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
				v16 = nil
			end
		else
			v16 = nil
		end
		return {
			["challengeId"] = v13,
			["desiredPlaceId"] = v15,
			["serverInstanceId"] = v16
		}
	end
}