-- Path: CoreGui.RobloxGui.Modules.TopBar.Analytics
local v_u_1 = game:GetService("RbxAnalyticsService")
local v2 = game:GetService("CorePackages")
game:GetService("GuiService")
game:GetService("CoreGui"):WaitForChild("RobloxGui")
game:GetService("UserInputService")
game:GetService("Players")
local v_u_3 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_4 = require(v2.Packages.Cryo)
local v5 = script.Parent
local v_u_6 = require(v5.Constants)
require(v5.Flags.GetFFlagEnableTopBarAnalytics)()
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.new() -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6
	local v8 = {
		["_target"] = "client",
		["_context"] = "topbar",
		["_defaultProps"] = nil
	}
	local v9 = {}
	local v10 = game.GameId
	v9.universeid = tostring(v10)
	local v11 = game.PlaceId
	v9.placeid = tostring(v11)
	v9.sessionid = v_u_1:GetSessionId()
	v8._defaultProps = v9
	local v12 = v_u_7
	local v_u_13 = setmetatable(v8, v12)
	if v_u_3 then
		v_u_13._defaultProps.playsessionid = v_u_1:GetPlaySessionId()
	end
	function v_u_13._sendEvent(p14, p15)
		-- upvalues: (ref) v_u_4, (copy) v_u_13, (ref) v_u_1
		local v16 = v_u_4.Dictionary.join(v_u_13._defaultProps, p15 or {})
		v_u_1:SendEventDeferred(v_u_13._target, v_u_13._context, p14, v16)
		return nil
	end
	function v_u_13._onButtonActivated(p17, p18)
		-- upvalues: (copy) v_u_13, (ref) v_u_6
		local v19 = v_u_13._sendEvent
		local v20 = v_u_6.Analytics.EventNameTopBarButtonActivated
		local v21 = {
			["button"] = p17
		}
		local v22
		if p18 then
			v22 = v_u_6.Analytics.StatusActive
		else
			v22 = v_u_6.Analytics.StatusInactive
		end
		v21.status = v22
		return v19(v20, v21)
	end
	return v_u_13
end
function v_u_7.onChatButtonActivated(p23, p24) -- name: onChatButtonActivated
	-- upvalues: (copy) v_u_6
	return p23._onButtonActivated(v_u_6.Analytics.ChatButtonName, p24)
end
function v_u_7.onMoreMenuActivated(p25) -- name: onMoreMenuActivated
	-- upvalues: (copy) v_u_6
	return p25._onButtonActivated(v_u_6.Analytics.MoreMenuButtonName, true)
end
function v_u_7.onInventoryActivated(p26, p27) -- name: onInventoryActivated
	-- upvalues: (copy) v_u_6
	return p26._onButtonActivated(v_u_6.Analytics.InventoryButtonName, p27)
end
function v_u_7.onLeaderboardActivated(p28, p29) -- name: onLeaderboardActivated
	-- upvalues: (copy) v_u_6
	return p28._onButtonActivated(v_u_6.Analytics.LeaderboardButtonName, p29)
end
function v_u_7.onEmotesActivated(p30, p31) -- name: onEmotesActivated
	-- upvalues: (copy) v_u_6
	return p30._onButtonActivated(v_u_6.Analytics.EmotesButtonName, p31)
end
function v_u_7.onShowGamepadNavigationDialog(p32) -- name: onShowGamepadNavigationDialog
	-- upvalues: (copy) v_u_6
	return p32._sendEvent(v_u_6.Analytics.ShowGamepadNavigationDialog)
end
function v_u_7.onDismissGamepadNavigationDialog(p33) -- name: onDismissGamepadNavigationDialog
	-- upvalues: (copy) v_u_6
	return p33._sendEvent(v_u_6.Analytics.DismissGamepadNavigationDialog)
end
v_u_7.default = v_u_7.new()
return v_u_7