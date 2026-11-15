-- Path: CoreGui.RobloxGui.Modules.ErrorReporting.createCoreScriptReportProcessor
local v_u_1 = game:GetService("ContentProvider")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("UserInputService")
local function v_u_6() -- name: getStaticAttributes
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_5, (copy) v_u_2
	return {
		["LocalVersion"] = v_u_4:GetRobloxVersion(),
		["BaseUrl"] = v_u_1.BaseUrl,
		["PlaceId"] = game.PlaceId,
		["Platform"] = v_u_5:GetPlatform().Name,
		["UserAgent"] = v_u_2:GetUserAgent(),
		["CoreScriptVersion"] = v_u_4:GetCoreScriptVersion()
	}
end
return function(p7) -- name: createCoreScriptReportProcessor
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	local v_u_8 = p7 or v_u_6()
	return function(p9) -- name: processReport
		-- upvalues: (copy) v_u_8, (ref) v_u_3, (ref) v_u_4
		p9:addAttributes(v_u_8)
		p9:addAttributes({
			["PlayerCount"] = #v_u_3:GetPlayers()
		})
		p9:addAttributes({
			["RobloxChannel"] = v_u_4:GetRobloxClientChannel()
		})
		return p9
	end, v_u_8
end