-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Utility.SendAnalytics
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("EventIngestService")
local v_u_6 = not require(v1.Workspace.Packages.SharedFlags).GetFFlagShareGetPlatformTargetImpl() and function() -- name: getPlatformTarget
	-- upvalues: (copy) v_u_2
	local v_u_4 = Enum.Platform.None
	local function v5()
		-- upvalues: (ref) v_u_4, (ref) v_u_2
		v_u_4 = v_u_2:GetPlatform()
	end
	pcall(v5)
	return (v_u_4 == Enum.Platform.Windows and true or v_u_4 == Enum.Platform.OSX) and "client" or ((v_u_4 == Enum.Platform.IOS and true or v_u_4 == Enum.Platform.Android or v_u_4 == Enum.Platform.UWP) and "mobile" or ((v_u_4 == Enum.Platform.XBox360 and true or v_u_4 == Enum.Platform.XBoxOne or (v_u_4 == Enum.Platform.PS3 and true or v_u_4 == Enum.Platform.PS4) or v_u_4 == Enum.Platform.WiiU) and "console" or "unknownLua" .. tostring(v_u_4)))
end or require(v1.Workspace.Packages.Analytics).getPlatformTarget
return function(p7, p8, p9)
	-- upvalues: (ref) v_u_6, (copy) v_u_3
	local v10 = type(p7) == "string"
	assert(v10, "Expected eventContext to be a string")
	local v11 = type(p8) == "string"
	assert(v11, "Expected eventName to be a string")
	local v12 = type(p9) == "table"
	assert(v12, "Expected eventTable to be a table")
	local v13 = v_u_6()
	local v14 = p9 or {}
	local v15 = game.GameId
	v14.universeId = tostring(v15)
	v_u_3:sendEventDeferred(v13, p7, p8, v14)
end