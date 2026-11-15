-- Path: CoreGui.RobloxGui.Modules.PlayerList.ContextMenuController
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("RbxAnalyticsService")
local v_u_6 = v2:WaitForChild("RobloxGui")
local v_u_7 = require(v1.Workspace.Packages.BlockingUtility)
local v_u_8 = require(v1.Workspace.Packages.RobloxTranslator)
local v9 = script.Parent
local v_u_10 = require(v9.Thunks.RequestFriendship)
local v11 = require(v1.Workspace.Packages.PlayerList)
local v_u_12 = v11.PlayerListVisibilityStore
local v_u_13 = v11.PlayerContextualMenuStore
local v14 = v11.builderIcon
local v_u_15 = v_u_13.buildMenuHeader
local v_u_16 = v3.LocalPlayer
local v_u_17 = v14("person-plus")
local v_u_18 = v14("person-trash-can")
local v_u_19 = v14("circle-slash")
local v_u_20 = v14("speech-bubble-exclamation")
local v_u_21 = v14("magnifying-glass-plus")
local function v_u_39(p22) -- name: getFriendLabelAndIcon
	-- upvalues: (copy) v_u_8, (copy) v_u_18, (copy) v_u_17
	if p22 == Enum.FriendStatus.Friend then
		local v_u_23 = "InGame.PlayerDropDown.Unfriend"
		local function v24()
			-- upvalues: (ref) v_u_8, (copy) v_u_23
			return v_u_8:FormatByKey(v_u_23)
		end
		local v25, v26 = pcall(v24)
		return (not v25 or (not v26 or v26 == "")) and "Unfriend" or v26, v_u_18
	elseif p22 == Enum.FriendStatus.FriendRequestSent then
		local v_u_27 = "InGame.PlayerDropDown.CancelRequest"
		local function v28()
			-- upvalues: (ref) v_u_8, (copy) v_u_27
			return v_u_8:FormatByKey(v_u_27)
		end
		local v29, v30 = pcall(v28)
		return (not v29 or (not v30 or v30 == "")) and "Cancel request" or v30, v_u_17
	elseif p22 == Enum.FriendStatus.FriendRequestReceived then
		local v_u_31 = "InGame.PlayerDropDown.Accept"
		local function v32()
			-- upvalues: (ref) v_u_8, (copy) v_u_31
			return v_u_8:FormatByKey(v_u_31)
		end
		local v33, v34 = pcall(v32)
		return (not v33 or (not v34 or v34 == "")) and "Accept request" or v34, v_u_17
	else
		local v_u_35 = "InGame.PlayerDropDown.Action.ConnectionRequest"
		local function v36()
			-- upvalues: (ref) v_u_8, (copy) v_u_35
			return v_u_8:FormatByKey(v_u_35)
		end
		local v37, v38 = pcall(v36)
		return (not v37 or (not v38 or v38 == "")) and "Friend request" or v38, v_u_17
	end
end
local function v_u_41(p40) -- name: openReportDialog
	-- upvalues: (copy) v_u_6
	if require(v_u_6.Modules.isNewInGameMenuEnabled)() then
		require(v_u_6.Modules.InGameMenuInit).openReportDialog(p40, "PlayerListReskin")
	else
		require(v_u_6.Modules.Settings.Pages.ReportAbuseMenuContainerPage):ReportPlayer(p40, "PlayerListReskin")
	end
end
local function v_u_79(p42) -- name: assembleMenuItems
	-- upvalues: (copy) v_u_39, (copy) v_u_8, (copy) v_u_18, (copy) v_u_21, (copy) v_u_19, (copy) v_u_20
	local v43 = {}
	if not (p42.isSelf or p42.isBlocked) then
		local v44, v45 = v_u_39(p42.friendStatus)
		local v46 = p42.friendStatus == Enum.FriendStatus.Friend
		local v47 = {
			["key"] = "friend",
			["label"] = nil,
			["icon"] = nil,
			["onActivated"] = nil,
			["telemetryAction"] = nil,
			["onceGroup"] = "friending",
			["requiresConfirm"] = nil,
			["confirmLabel"] = nil,
			["label"] = v44,
			["icon"] = v45,
			["onActivated"] = p42.actions.onFriend
		}
		local v48 = p42.friendStatus
		v47.telemetryAction = v48 == Enum.FriendStatus.Friend and "friend_remove" or (v48 == Enum.FriendStatus.FriendRequestSent and "friend_cancel" or (v48 == Enum.FriendStatus.FriendRequestReceived and "friend_accept" or "friend_send"))
		v47.requiresConfirm = v46 and true or nil
		local v49
		if v46 then
			local v_u_50 = "InGame.PlayerDropDown.ConfirmUnfriend"
			local function v51()
				-- upvalues: (ref) v_u_8, (copy) v_u_50
				return v_u_8:FormatByKey(v_u_50)
			end
			local v52, v53 = pcall(v51)
			v49 = (not v52 or (not v53 or v53 == "")) and "Tap to confirm unfriend" or v53
		else
			v49 = nil
		end
		v47.confirmLabel = v49
		table.insert(v43, v47)
		if p42.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			local v54 = {
				["key"] = "decline",
				["label"] = nil,
				["icon"] = nil,
				["onActivated"] = nil,
				["telemetryAction"] = "friend_decline",
				["onceGroup"] = "friending"
			}
			local v_u_55 = "InGame.PlayerDropDown.Decline"
			local function v56()
				-- upvalues: (ref) v_u_8, (copy) v_u_55
				return v_u_8:FormatByKey(v_u_55)
			end
			local v57, v58 = pcall(v56)
			v54.label = (not v57 or (not v58 or v58 == "")) and "Decline" or v58
			v54.icon = v_u_18
			v54.onActivated = p42.actions.onDecline
			table.insert(v43, v54)
		end
	end
	if p42.inspectMenuEnabled then
		local v59 = {
			["key"] = "examine",
			["label"] = nil,
			["icon"] = nil,
			["onActivated"] = nil,
			["telemetryAction"] = "avatar_examine"
		}
		local v_u_60 = "InGame.PlayerDropDown.Examine"
		local function v61()
			-- upvalues: (ref) v_u_8, (copy) v_u_60
			return v_u_8:FormatByKey(v_u_60)
		end
		local v62, v63 = pcall(v61)
		v59.label = (not v62 or (not v63 or v63 == "")) and "Examine avatar" or v63
		v59.icon = v_u_21
		v59.onActivated = p42.actions.onExamine
		table.insert(v43, v59)
	end
	if not p42.isSelf then
		local v64 = {
			["key"] = "block",
			["label"] = nil,
			["icon"] = nil,
			["onActivated"] = nil,
			["telemetryAction"] = nil
		}
		local v65
		if p42.isBlocked then
			local v_u_66 = "InGame.PlayerDropDown.UnBlock"
			local function v67()
				-- upvalues: (ref) v_u_8, (copy) v_u_66
				return v_u_8:FormatByKey(v_u_66)
			end
			local v68, v69 = pcall(v67)
			v65 = (not v68 or (not v69 or v69 == "")) and "Unblock" or v69
		else
			local v_u_70 = "InGame.PlayerDropDown.Block"
			local function v71()
				-- upvalues: (ref) v_u_8, (copy) v_u_70
				return v_u_8:FormatByKey(v_u_70)
			end
			local v72, v73 = pcall(v71)
			v65 = (not v72 or (not v73 or v73 == "")) and "Block" or v73
		end
		v64.label = v65
		v64.icon = v_u_19
		v64.onActivated = p42.actions.onBlock
		v64.telemetryAction = p42.isBlocked and "user_unblock" or "user_block"
		table.insert(v43, v64)
		local v74 = {
			["key"] = "report",
			["label"] = nil,
			["icon"] = nil,
			["onActivated"] = nil,
			["telemetryAction"] = "user_report"
		}
		local v_u_75 = "InGame.PlayerDropDown.Report"
		local function v76()
			-- upvalues: (ref) v_u_8, (copy) v_u_75
			return v_u_8:FormatByKey(v_u_75)
		end
		local v77, v78 = pcall(v76)
		v74.label = (not v77 or (not v78 or v78 == "")) and "Report abuse" or v78
		v74.icon = v_u_20
		v74.onActivated = p42.actions.onReport
		table.insert(v43, v74)
	end
	return v43
end
return {
	["buildMenuData"] = function(p_u_80, p_u_81, p_u_82, p83) -- name: buildMenuData
		-- upvalues: (copy) v_u_16, (copy) v_u_7, (copy) v_u_79, (copy) v_u_4, (copy) v_u_5, (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_6, (copy) v_u_41, (copy) v_u_15
		local v_u_84 = p_u_80.UserId
		local v85
		if v_u_16 == nil then
			v85 = false
		else
			v85 = p_u_80 == v_u_16
		end
		local v_u_86 = false
		local v_u_87 = Enum.FriendStatus.Unknown
		if not v85 then
			local function v88()
				-- upvalues: (ref) v_u_86, (ref) v_u_7, (copy) v_u_84
				v_u_86 = v_u_7:IsPlayerBlockedByUserId(v_u_84)
			end
			pcall(v88)
			if not v_u_86 then
				if p83 == nil then
					local function v89()
						-- upvalues: (ref) v_u_87, (ref) v_u_16, (copy) p_u_80
						v_u_87 = v_u_16:GetFriendStatus(p_u_80)
					end
					pcall(v89)
				else
					v_u_87 = p83
				end
			end
		end
		local v90 = v_u_79({
			["isSelf"] = v85,
			["isBlocked"] = v_u_86,
			["friendStatus"] = v_u_87,
			["inspectMenuEnabled"] = v_u_4:GetInspectMenuEnabled(),
			["actions"] = {
				["onFriend"] = function() -- name: onFriend
					-- upvalues: (ref) v_u_87, (ref) v_u_5, (ref) v_u_16, (copy) p_u_80, (ref) v_u_10
					if v_u_87 == Enum.FriendStatus.Friend or v_u_87 == Enum.FriendStatus.FriendRequestSent then
						v_u_5:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
						v_u_16:RevokeFriendship(p_u_80)
						return
					elseif v_u_87 == Enum.FriendStatus.FriendRequestReceived then
						v_u_10(p_u_80, true)()
					else
						v_u_10(p_u_80)()
					end
				end,
				["onDecline"] = function() -- name: onDecline
					-- upvalues: (ref) v_u_5, (ref) v_u_16, (copy) p_u_80
					v_u_5:TrackEvent("Game", "DeclineFriendship", "PlayerDropDown")
					v_u_16:RevokeFriendship(p_u_80)
				end,
				["onExamine"] = function() -- name: onExamine
					-- upvalues: (copy) p_u_82, (ref) v_u_13, (ref) v_u_12, (ref) v_u_4, (copy) v_u_84, (copy) p_u_81
					if p_u_82 then
						v_u_13.setSuppressNextDismissRestore(true)
						v_u_12.setVisible(false)
					end
					v_u_4:InspectPlayerFromUserIdWithCtx(v_u_84, "leaderBoard")
					p_u_81()
				end,
				["onBlock"] = function() -- name: onBlock
					-- upvalues: (copy) p_u_82, (ref) v_u_86, (ref) v_u_13, (ref) v_u_12, (ref) v_u_7, (copy) p_u_80, (ref) v_u_6, (copy) p_u_81
					if p_u_82 and not v_u_86 then
						v_u_13.setSuppressNextDismissRestore(true)
						v_u_12.setVisible(false)
					end
					if v_u_86 then
						coroutine.wrap(function()
							-- upvalues: (ref) v_u_7, (ref) p_u_80
							v_u_7:UnblockPlayerAsync(p_u_80)
						end)()
					else
						require(v_u_6.Modules.Settings.onBlockButtonActivated)(p_u_80, nil, "PlayerListReskin", {})
					end
					p_u_81()
				end,
				["onReport"] = function() -- name: onReport
					-- upvalues: (copy) p_u_82, (ref) v_u_13, (ref) v_u_12, (ref) v_u_41, (copy) p_u_80, (copy) p_u_81
					if p_u_82 then
						v_u_13.setSuppressNextDismissRestore(true)
						v_u_12.setVisible(false)
					end
					v_u_41(p_u_80)
					p_u_81()
				end
			}
		})
		local v91 = {
			["player"] = p_u_80,
			["header"] = v_u_15(p_u_80),
			["items"] = v90
		}
		local v92 = {
			["isSelf"] = v85
		}
		local v93
		if v85 then
			v93 = nil
		else
			v93 = v_u_87.Name
		end
		v92.friendStatus = v93
		v91.telemetry = v92
		return v91
	end,
	["assembleMenuItems"] = v_u_79,
	["getFriendLabelAndIcon"] = v_u_39
}