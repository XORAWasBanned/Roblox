-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.Containers.ReportPersonMenuItemsContainer
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("Players")
local v4 = game:GetService("CoreGui").RobloxGui
local v_u_5 = require(v2.Packages.React)
local v_u_6 = require(v2.Packages.Cryo)
local v_u_7 = require(v1.MenuConfigs.getMenuItemsFromConfigs)
local v_u_8 = require(v1.Utility.getMenuItemSizings)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.Constants)
local v_u_10 = require(v1.MenuConfigs.Players.ReportPlayerMenuItemConfigList)
local v_u_11 = require(v1.Reducers.reportPersonUIStateReducer)
local v_u_12 = require(v1.Utility.handlePreselectedPlayer)
local v_u_13 = require(v4.Modules.VoiceChat.VoiceChatServiceManager).default
require(v4.Modules.VoiceChat.VoiceUsersByProximity)
local v_u_14 = require(v2.Workspace.Packages.VoiceChatCore).Constants
local v_u_15 = v_u_9.PlayerMenuActions
local v_u_16 = game:DefineFastFlag("PreselectedPlayerReportBugfix", false)
local function v_u_19(p17, p18) -- name: alphabeticalSort
	return p17.Name:lower() < p18.Name:lower()
end
return function(p_u_20) -- name: ReportPersonMenuItemsContainer
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_11, (copy) v_u_9, (copy) v_u_16, (copy) v_u_13, (copy) v_u_14, (copy) v_u_12, (copy) v_u_15, (copy) v_u_19, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_10
	local v21 = v_u_8()
	local v_u_22, v_u_23 = v_u_5.useReducer(v_u_11, v_u_9.InitPersonUIState)
	v_u_5.useEffect(function()
		-- upvalues: (copy) p_u_20, (ref) v_u_9, (ref) v_u_16, (ref) v_u_13, (ref) v_u_14, (ref) v_u_12, (copy) v_u_23, (ref) v_u_15
		if p_u_20.utilityProps.isReportTabVisible == true then
			p_u_20.utilityProps.analyticsDispatch({
				["type"] = v_u_9.AnalyticsActions.SwitchToPersonInitialSelections
			})
			if v_u_16 then
				local v24 = v_u_13:UserVoiceEnabled()
				if v24 then
					v24 = v_u_13:GetVoiceJoinProgress() ~= v_u_14.VOICE_JOIN_PROGRESS.Suspended
				end
				if not v24 then
					if p_u_20.utilityProps.preselectedPlayer then
						v_u_12(p_u_20.utilityProps.preselectedPlayer, false, v_u_23, p_u_20.utilityProps.analyticsDispatch)
					end
					v_u_23({
						["type"] = nil,
						["enabled"] = false,
						["type"] = v_u_15.SetVoiceEnabled
					})
					return
				end
			end
			v_u_13:asyncInit():andThen(function()
				-- upvalues: (ref) p_u_20, (ref) v_u_12, (ref) v_u_23, (ref) v_u_15
				if p_u_20.utilityProps.preselectedPlayer then
					v_u_12(p_u_20.utilityProps.preselectedPlayer, true, v_u_23, p_u_20.utilityProps.analyticsDispatch)
				end
				v_u_23({
					["type"] = nil,
					["enabled"] = true,
					["type"] = v_u_15.SetVoiceEnabled
				})
			end):catch(function()
				-- upvalues: (ref) p_u_20, (ref) v_u_12, (ref) v_u_23
				if p_u_20.utilityProps.preselectedPlayer then
					v_u_12(p_u_20.utilityProps.preselectedPlayer, false, v_u_23, p_u_20.utilityProps.analyticsDispatch)
				end
			end)
		end
	end, { p_u_20.utilityProps.isReportTabVisible })
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_22, (ref) v_u_9, (ref) v_u_13, (ref) v_u_19, (ref) v_u_3, (ref) v_u_6, (copy) v_u_23, (ref) v_u_15
		local v25 = {}
		if v_u_22.methodOfAbuse == v_u_9.AbuseMethods.VoiceChat then
			local v26 = v_u_13:getRecentUsersInteractionData()
			for _, v27 in pairs(v26) do
				local v28 = v27.player
				table.insert(v25, v28)
			end
			table.sort(v25, v_u_19)
		elseif v_u_22.methodOfAbuse == v_u_9.AbuseMethods.TextChat or (v_u_22.methodOfAbuse == v_u_9.AbuseMethods.Other or (v_u_22.methodOfAbuse == v_u_9.AbuseMethods.Avatar or v_u_22.methodOfAbuse == nil)) then
			v25 = v_u_3:GetPlayers()
			table.sort(v25, v_u_19)
		end
		local v_u_29 = false
		local v_u_30 = false
		local v33 = v_u_6.List.filter(v25, function(p31)
			-- upvalues: (ref) v_u_22, (ref) v_u_29, (ref) v_u_30, (ref) v_u_3
			if v_u_22.preselectedPlayer and p31.UserId == v_u_22.preselectedPlayer.UserId then
				v_u_29 = true
			end
			if v_u_22.allegedAbuser and p31.UserId == v_u_22.allegedAbuserId then
				v_u_30 = true
			end
			local v32
			if p31 == v_u_3.LocalPlayer then
				v32 = false
			else
				v32 = p31.UserId > 0
			end
			return v32
		end)
		v_u_23({
			["type"] = v_u_15.UpdatePlayerNameMap,
			["playerObjects"] = v33
		})
		if v_u_22.preselectedPlayer and v_u_29 then
			v_u_23({
				["type"] = v_u_9.PlayerMenuActions.UpdateAbuser,
				["abuseId"] = v_u_22.preselectedPlayer.UserId,
				["abuser"] = v_u_22.preselectedPlayer
			})
			v_u_23({
				["type"] = nil,
				["player"] = nil,
				["type"] = v_u_9.PlayerMenuActions.SetPreselectedPlayer
			})
		elseif not v_u_30 then
			v_u_23({
				["type"] = nil,
				["abuseId"] = nil,
				["abuser"] = nil,
				["type"] = v_u_9.PlayerMenuActions.UpdateAbuser
			})
		end
	end, {
		v_u_22.methodOfAbuse,
		v_u_22.isVoiceEnabled,
		p_u_20.utilityProps.isReportTabVisible,
		v_u_22.preselectedPlayer
	})
	local v34 = v_u_7(v_u_22, v_u_23, p_u_20.utilityProps, v_u_10, p_u_20.isSmallPortraitViewport)
	local v35 = v_u_6.Dictionary.join
	local v36 = {
		["Layout"] = v_u_5.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v21.ItemPadding)
		})
	}
	local v37 = v35(v36, v34)
	local v38 = v_u_5.createElement
	local v39 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v40 = {
		["MenuItems"] = v_u_5.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, v37)
	}
	return v38("Frame", v39, v40)
end