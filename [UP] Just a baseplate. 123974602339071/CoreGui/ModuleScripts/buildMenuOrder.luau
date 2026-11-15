-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.buildMenuOrder
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(script.Parent.Constants)
local v_u_4 = require(v2.Workspace.Packages.InExperienceSideSheet)
local v_u_5 = require(v1.Integrations.Connect.isConnectDropdownEnabled)
local v_u_6 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v_u_7 = require(v2.Workspace.Packages.AppCommonLib).isTenFootInterface
local v_u_8 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v9 = require(v2.Workspace.Packages.SharedFlags)
local v_u_10 = v9.FFlagEnableInExperienceAvatarSwitcher
local v_u_11 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_12 = v9.FFlagAddInviteFriendsIntegration
local v_u_13 = v9.FFlagIntegrateTraversalHistoryInSideSheet
local v_u_14 = v9.FFlagEnableInExperienceShop
local v_u_15 = v9.FFlagRemoveFriendsChatUnibarEntrypoints
local v_u_16 = v9.FFlagExpChatCanShowFriendsTab
local v_u_17 = v9.FFlagShowSwitchServerButton
local v_u_18 = require(v2.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_19 = require(v1.Flags.FFlagEnableSideSheetRobuxWidget)
local v20
if v_u_13 then
	v20 = require(v2.Workspace.Packages.CoreScriptsRoactCommon).Traversal
else
	v20 = nil
end
local v_u_21
if v20 then
	v_u_21 = v20.Flags.FFlagAddTraversalHistory
else
	v_u_21 = false
end
return function() -- name: buildMenuOrder
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_16, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_21, (copy) v_u_13, (copy) v_u_19, (copy) v_u_11, (copy) v_u_12, (copy) v_u_3, (copy) v_u_10, (copy) v_u_17, (copy) v_u_18, (copy) v_u_14, (copy) v_u_4
	local v22 = v_u_5()
	if v22 then
		local v23 = v_u_15
		if v23 then
			v23 = v_u_16
		end
		v22 = not v23
	end
	local v24 = not v_u_6()
	if v24 then
		v24 = not v_u_7()
	end
	local v25 = not (v_u_8 and v_u_6())
	local v26 = v_u_21
	if v26 then
		v26 = v_u_13
	end
	local v_u_27 = {
		["RobuxWidget"] = v_u_19 and v_u_11 and 5 or nil,
		["invite_friends"] = v_u_12 and 10 or nil,
		["people"] = 20,
		["settings"] = 30,
		["trust_and_safety"] = 40,
		["connect_dropdown"] = v22 and 50 or nil,
		[v_u_3.AVATAR_SWITCHER_ID] = v_u_10 and 60 or nil,
		[v_u_3.SWITCH_SERVER_ID] = (v_u_17 or v_u_18()) and 65 or nil,
		[v_u_3.IN_EXPERIENCE_SHOP_ID] = v_u_14 and 70 or nil,
		["leaderboard"] = 80,
		["emotes"] = 90,
		["backpack"] = 100,
		["traversal_history"] = v26 and 110 or nil,
		["help"] = 120,
		["camera_entrypoint"] = v25 and 130 or nil,
		["gallery"] = 140,
		["selfie_view"] = v25 and 150 or nil,
		["music_entrypoint"] = v24 and 160 or nil,
		["AccountUpsell"] = v_u_18() and 170 or nil,
		[v_u_4.Enums.ActionBinding.Leave] = 180,
		[v_u_4.Enums.ActionBinding.Respawn] = 190
	}
	if v_u_18() then
		v_u_27.connect_dropdown = nil
		v_u_27[v_u_3.AVATAR_SWITCHER_ID] = nil
		v_u_27.emotes = nil
		v_u_27.traversal_history = nil
		v_u_27.camera_entrypoint = nil
		v_u_27.gallery = nil
		local v28 = v_u_3.SWITCH_SERVER_ID
		if v_u_27[v28] ~= nil then
			v_u_27[v28] = 200
		end
	elseif not v_u_11 then
		if v_u_27.connect_dropdown ~= nil then
			v_u_27.connect_dropdown = 10
		end
		local v29 = v_u_3.IN_EXPERIENCE_SHOP_ID
		if v_u_27[v29] ~= nil then
			v_u_27[v29] = 20
		end
		if v_u_27.selfie_view ~= nil then
			v_u_27.selfie_view = 30
		end
		local v30 = v_u_3.AVATAR_SWITCHER_ID
		if v_u_27[v30] ~= nil then
			v_u_27[v30] = 40
		end
		if v_u_27.music_entrypoint ~= nil then
			v_u_27.music_entrypoint = 50
		end
		if v_u_27.camera_entrypoint ~= nil then
			v_u_27.camera_entrypoint = 60
		end
		if v_u_27.trust_and_safety ~= nil then
			v_u_27.trust_and_safety = 70
		end
		v_u_27.respawn = 110
		v_u_27.invite_friends = nil
		v_u_27.people = nil
		v_u_27.settings = nil
		v_u_27.traversal_history = nil
		v_u_27.help = nil
		v_u_27.gallery = nil
		v_u_27[v_u_4.Enums.ActionBinding.Leave] = nil
		v_u_27[v_u_4.Enums.ActionBinding.Respawn] = nil
		v_u_27[v_u_3.SWITCH_SERVER_ID] = nil
	end
	local v31 = {}
	for v32 in v_u_27 do
		table.insert(v31, v32)
	end
	table.sort(v31, function(p33, p34)
		-- upvalues: (copy) v_u_27
		return v_u_27[p33] < v_u_27[p34]
	end)
	return v31
end