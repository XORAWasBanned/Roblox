-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.PlayerProfile.AddConnectionButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.SignalsReact)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = v5.Enums.ButtonVariant
local v_u_7 = v5.Enums.FillBehavior
local v_u_8 = v5.Button
local v_u_9 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_10 = require(v1.Workspace.Packages.PeopleService)
return v_u_3.memo(function(p_u_11) -- name: AddConnectionButton
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_10, (copy) v_u_2, (copy) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7
	local v12 = v_u_9({
		["isFriend"] = "CommonUI.Features.Label.Connection",
		["addPerson"] = "CommonUI.Features.Label.Add",
		["requestSent"] = "CommonUI.Features.Label.Sent"
	})
	local v_u_13 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_10
		return v_u_10.getService("Constants")
	end, {})
	local v_u_14 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_10
		return v_u_10.getService("PeopleAnalyticsManager")
	end, {})
	local v_u_15 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_10
		return v_u_10.getService("FriendStatusStore")
	end, {})
	local v_u_16 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_11, (ref) v_u_2
		if p_u_11.userId then
			return v_u_2:GetPlayerByUserId(p_u_11.userId)
		else
			return nil
		end
	end, { p_u_11.userId })
	local v17 = v_u_4.useSignalState(v_u_15.getFriendButtonText(p_u_11.userId, v12))
	local v18 = v_u_4.useSignalState(v_u_15.getIsFriendButtonDisabled(p_u_11.userId))
	local v19 = v_u_3.createElement
	local v20 = v_u_8
	local v21 = {
		["text"] = v17
	}
	local v22
	if v18 then
		v22 = v_u_6.Subtle
	else
		v22 = v_u_6.Emphasis
	end
	v21.variant = v22
	v21.fillBehavior = v_u_7.Fill
	v21.isDisabled = v18
	v21.LayoutOrder = p_u_11.layoutOrder
	function v21.onActivated() -- name: onActivated
		-- upvalues: (copy) v_u_14, (copy) v_u_13, (copy) v_u_15, (copy) v_u_16
		v_u_14:trackRequestFriendship(v_u_13.ANALYTICS.ENTRY_POINT.PLAYER_PROFILE)
		v_u_15.sendFriendRequest(v_u_16)
	end
	return v19(v20, v21)
end)