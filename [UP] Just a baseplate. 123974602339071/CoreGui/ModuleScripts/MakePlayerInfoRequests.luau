-- Path: CoreGui.RobloxGui.Modules.PlayerList.Thunks.MakePlayerInfoRequests
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("CorePackages")
local v4 = v1:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.PlayerPermissionsModule)
local v_u_6 = require(v4.Modules.TenFootInterface)
local v7 = require(v3.Workspace.Packages.PlayerList)
local v_u_8 = require(v3.Workspace.Packages.BlockingUtility)
local v_u_9 = require(v4.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled)
local v10 = require(v3.Workspace.Packages.SharedFlags)
local v_u_11 = v10.FFlagBadgeVisibilitySettingEnabled
local v_u_12 = v10.FFlagReplacePlayerIconRoduxWithSignal
local v_u_13 = v7.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_14 = game:DefineFastFlag("EnableBadgeCheckForUserCreator", false)
local v_u_15 = require(v3.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore
local v16 = require(v3.Packages.UIBlox).App.ImageSet.Images
local v17 = script.Parent.Parent
local v_u_18 = {
	["Admin"] = v16["icons/status/player/admin"],
	["Intern"] = v16["icons/status/player/intern"],
	["Star"] = v16["icons/status/player/videostar"]
}
local v_u_19 = require(v17.Actions.SetPlayerSpecialGroupIcon)
local v_u_20 = require(v17.Actions.SetPlayerIsCreator)
local v_u_21 = require(v17.Actions.SetPlayerAvatarIcon)
local v_u_22 = require(v17.Actions.SetPlayerIsBlocked)
local v_u_23 = require(v17.Actions.SetPlayerFriendStatus)
local function v_u_30(p24, p25, p26) -- name: dispatchIfPlayerExists
	local v27 = p24:getState().players
	local v28 = false
	for _, v29 in ipairs(v27) do
		if p25 ~= v29 then
			continue
		end
		v28 = true
	end
	if v28 then
		p24:dispatch(p26)
	end
end
local function v_u_38(p31, p32) -- name: getGroupsPermissionsInfo
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_18, (copy) v_u_12, (copy) v_u_15, (copy) v_u_9, (copy) v_u_30, (copy) v_u_19
	if v_u_11 then
		local v33 = nil
		if v_u_5.IsPlayerAdminAsync(p32) then
			v33 = v_u_18.Admin
		elseif v_u_5.IsPlayerStarAsync(p32) then
			v33 = v_u_18.Star
		elseif v_u_5.IsPlayerInternAsync(p32) then
			v33 = v_u_18.Intern
		end
		if v33 then
			if v_u_12 then
				local v34 = v_u_15.getPlayerIconInfoReactive(p32.UserId)(false)
				v_u_15.setPlayerIconInfo(p32.UserId, {
					["isPlaceOwner"] = v34.isPlaceOwner,
					["avatarIcon"] = v34.avatarIcon,
					["specialGroupIcon"] = v33
				})
			else
				if v_u_9 and v_u_5.IsPlayerInExperienceNameEnabledAsync(p32) and true or false or not v33 then
					v33 = nil
				end
				v_u_30(p31, p32, v_u_19(p32, v33))
			end
		end
	elseif v_u_5.IsPlayerAdminAsync(p32) then
		if v_u_12 then
			local v35 = v_u_15.getPlayerIconInfoReactive(p32.UserId)(false)
			v_u_15.setPlayerIconInfo(p32.UserId, {
				["isPlaceOwner"] = v35.isPlaceOwner,
				["avatarIcon"] = v35.avatarIcon,
				["specialGroupIcon"] = v_u_18.Admin
			})
			return
		end
		if not (v_u_9 and v_u_5.IsPlayerInExperienceNameEnabledAsync(p32)) then
			v_u_30(p31, p32, v_u_19(p32, v_u_18.Admin))
			return
		end
	elseif v_u_5.IsPlayerStarAsync(p32) then
		if v_u_12 then
			local v36 = v_u_15.getPlayerIconInfoReactive(p32.UserId)(false)
			v_u_15.setPlayerIconInfo(p32.UserId, {
				["isPlaceOwner"] = v36.isPlaceOwner,
				["avatarIcon"] = v36.avatarIcon,
				["specialGroupIcon"] = v_u_18.Star
			})
			return
		end
		if not (v_u_9 and v_u_5.IsPlayerInExperienceNameEnabledAsync(p32)) then
			v_u_30(p31, p32, v_u_19(p32, v_u_18.Star))
			return
		end
	elseif v_u_5.IsPlayerInternAsync(p32) then
		if v_u_12 then
			local v37 = v_u_15.getPlayerIconInfoReactive(p32.UserId)(false)
			v_u_15.setPlayerIconInfo(p32.UserId, {
				["isPlaceOwner"] = v37.isPlaceOwner,
				["avatarIcon"] = v37.avatarIcon,
				["specialGroupIcon"] = v_u_18.Intern
			})
			return
		end
		if not (v_u_9 and v_u_5.IsPlayerInExperienceNameEnabledAsync(p32)) then
			v_u_30(p31, p32, v_u_19(p32, v_u_18.Intern))
		end
	end
end
local function v_u_42(p39, p40) -- name: getGameCreator
	-- upvalues: (copy) v_u_14, (copy) v_u_5, (copy) v_u_12, (copy) v_u_15, (copy) v_u_9, (copy) v_u_30, (copy) v_u_20
	if v_u_14 or game.CreatorType == Enum.CreatorType.Group then
		if v_u_5.CanPlayerManagePlaceAsync(p40) then
			if v_u_12 then
				local v41 = v_u_15.getPlayerIconInfoReactive(p40.UserId)(false)
				v_u_15.setPlayerIconInfo(p40.UserId, {
					["isPlaceOwner"] = true,
					["avatarIcon"] = nil,
					["specialGroupIcon"] = nil,
					["avatarIcon"] = v41.avatarIcon,
					["specialGroupIcon"] = v41.specialGroupIcon
				})
				return
			end
			if not (v_u_9 and v_u_5.IsPlayerInExperienceNameEnabledAsync(p40)) then
				v_u_30(p39, p40, v_u_20(p40, true))
			end
		end
	end
end
local function v_u_47(p43, p44) -- name: getPlayerAvatarIcon
	-- upvalues: (copy) v_u_13, (copy) v_u_6, (copy) v_u_12, (copy) v_u_15, (copy) v_u_30, (copy) v_u_21
	if v_u_13 or not v_u_6:IsEnabled() then
		return
	else
		local v45 = "rbxthumb://type=Avatar&id=" .. p44.UserId .. "&w=100&h=100"
		if v_u_12 then
			local v46 = v_u_15.getPlayerIconInfoReactive(p44.UserId)(false)
			v_u_15.setPlayerIconInfo(p44.UserId, {
				["isPlaceOwner"] = v46.isPlaceOwner,
				["avatarIcon"] = v45,
				["specialGroupIcon"] = v46.specialGroupIcon
			})
		else
			v_u_30(p43, p44, v_u_21(p44, v45))
		end
	end
end
local function v_u_50(p48, p49) -- name: getPlayerIsBlocked
	-- upvalues: (copy) v_u_8, (copy) v_u_30, (copy) v_u_22
	if v_u_8:IsPlayerBlockedByUserId(p49.UserId) then
		v_u_30(p48, p49, v_u_22(p49, true))
	end
end
local function v_u_53(p51, p52) -- name: getPlayerFriendStatus
	-- upvalues: (copy) v_u_2, (copy) v_u_30, (copy) v_u_23
	if p52 ~= v_u_2.LocalPlayer and (p52.Parent == v_u_2 and v_u_2.LocalPlayer.Parent == v_u_2) then
		v_u_30(p51, p52, v_u_23(p52, v_u_2.LocalPlayer:GetFriendStatus(p52)))
	end
end
return function(p_u_54) -- name: MakePlayerInfoRequests
	-- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) v_u_5, (copy) v_u_15, (copy) v_u_38, (copy) v_u_42, (copy) v_u_47, (copy) v_u_50, (copy) v_u_53
	return function(p_u_55)
		-- upvalues: (ref) v_u_12, (copy) p_u_54, (ref) v_u_9, (ref) v_u_5, (ref) v_u_15, (ref) v_u_38, (ref) v_u_42, (ref) v_u_47, (ref) v_u_50, (ref) v_u_53
		if v_u_12 then
			coroutine.wrap(function()
				-- upvalues: (ref) p_u_54, (ref) v_u_9, (ref) v_u_5, (ref) v_u_15, (ref) v_u_38, (copy) p_u_55, (ref) v_u_42, (ref) v_u_47
				local v56 = p_u_54
				if v_u_9 and v_u_5.IsPlayerInExperienceNameEnabledAsync(v56) and true or false then
					v_u_15.setPlayerIconInfo(p_u_54.UserId, {
						["isPlaceOwner"] = false,
						["avatarIcon"] = nil,
						["specialGroupIcon"] = nil
					})
				else
					coroutine.wrap(v_u_38)(p_u_55, p_u_54)
					coroutine.wrap(v_u_42)(p_u_55, p_u_54)
					coroutine.wrap(v_u_47)(p_u_55, p_u_54)
				end
			end)()
		else
			coroutine.wrap(v_u_38)(p_u_55, p_u_54)
			coroutine.wrap(v_u_42)(p_u_55, p_u_54)
			coroutine.wrap(v_u_47)(p_u_55, p_u_54)
		end
		coroutine.wrap(v_u_50)(p_u_55, p_u_54)
		coroutine.wrap(v_u_53)(p_u_55, p_u_54)
	end
end