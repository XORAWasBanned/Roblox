-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.ComponentHosts.ChatNotificationBadge
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextChatService")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.SignalsReact)
local v5 = require(v1.Workspace.Packages.ExpChat)
local v_u_6 = v5.Stores.GetGlobalChatTooltipStore
local v_u_7 = v5.Stores.GetChatTooltipStore
local v_u_8 = v5.Stores.GetChatStatusStore
local v_u_9 = v5.isUserChatEnabled
local v10 = require(v1.Workspace.Packages.ExpChatShared)
local v_u_11 = v10.Flags.GetFFlagTextChatEnableUniverseChatTabs
local v_u_12 = v10.Flags.FFlagExpChatPresetChatEnabled
local v_u_13 = v10.Flags.FFlagExpChatUseUnifiedTooltipStore
local v_u_14 = require(v1.Workspace.Packages.SocialExperiments).ExpChatPresetChatBadgeFTUXExperimentation
local v_u_15 = require(v1.Workspace.Packages.SharedFlags).FFlagExpChatPresetChatBadgeExperimentCleanup
local v_u_16 = game:DefineFastFlag("ExpChatShowPresetTooltipToNonAgeChecked2", false)
require(v1.Workspace.Packages.Chrome)
return function(p17) -- name: ChatNotificationBadge
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_7, (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (copy) v_u_16, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_15, (copy) v_u_14
	local v18 = p17.iconHostProps
	local v_u_19 = v18.integration.id == "chat"
	local v20 = v_u_2:FindFirstChildOfClass("ChatWindowConfiguration")
	local v21
	if v20 == nil then
		v21 = true
	elseif v20.HorizontalAlignment == Enum.HorizontalAlignment.Left then
		v21 = v20.VerticalAlignment == Enum.VerticalAlignment.Top
	else
		v21 = false
	end
	local v22 = false
	local v_u_23, v_u_24
	if v_u_13 then
		local v_u_25 = v_u_7(false)
		v_u_23 = v_u_4.useSignalState(v_u_25.getIsChatWindowOpen)
		local v26 = v_u_4.useSignalState(v_u_25.getActiveTooltipKey)
		local v_u_27 = v_u_4.useSignalState(v_u_25.getIsChatInputBarVisible)
		local v28 = v_u_4.useSignalState(v_u_25.getIsScreenWideEnough)
		if v_u_19 then
			if not v28 then
				v21 = v28
			end
		else
			v21 = v_u_19
		end
		local v_u_29
		if v26 == "GlobalChatTooltip" then
			v_u_29 = v21
		else
			v_u_29 = false
		end
		local v30 = v_u_12
		if v30 then
			if v26 ~= "PresetChatTooltip" then
				v21 = false
			end
		else
			v21 = v30
		end
		local v_u_31 = v21
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_19, (ref) v_u_16, (ref) v_u_31, (copy) v_u_27, (ref) v_u_23, (ref) v_u_25, (copy) v_u_29, (ref) v_u_12
			if v_u_19 then
				local v32
				if v_u_16 then
					v32 = v_u_31
					if v32 then
						v32 = v_u_27 or v_u_23
					end
				else
					v32 = v_u_31
					if v32 then
						v32 = v_u_27
					end
				end
				local v33 = v_u_25.setShouldShow
				local v34 = "GlobalChatTooltip"
				local v35 = v_u_29
				if v35 then
					v35 = v_u_23
				end
				v33(v34, v35)
				if v_u_12 then
					v_u_25.setShouldShow("PresetChatTooltip", v32)
				end
			end
		end, {
			v_u_19,
			v_u_29,
			v_u_31,
			v_u_27,
			v_u_23,
			v_u_25.setShouldShow
		})
		v_u_24 = v_u_29 or v_u_31
		v22 = v_u_31
	else
		local v36 = v_u_6(false)
		local v37 = v_u_8(false)
		v_u_23 = v_u_4.useSignalState(v36.getIsChatWindowOpen)
		local v38 = v_u_9((v_u_4.useSignalState(v37.getChatStatus)))
		local v39 = v_u_4.useSignalState(v36.getIsGlobalChatTooltipDismissed)
		local v40 = v_u_4.useSignalState(v36.getIsGlobalChatTooltipEligible)
		local v41 = v_u_4.useSignalState(v36.getIsScreenWideEnough)
		local v42, v_u_43 = v_u_3.useState(false)
		v_u_3.useEffect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_2, (copy) v_u_43
			if v_u_11() then
				if v_u_2:HasAllocatedUniverseChatContext("global") then
					v_u_43(true)
				end
				local v_u_45 = v_u_2.UniverseChatChannelAllocated:Connect(function(p44)
					-- upvalues: (ref) v_u_43
					if p44 == "global" then
						v_u_43(true)
					end
				end)
				return function()
					-- upvalues: (copy) v_u_45
					v_u_45:Disconnect()
				end
			end
		end, {})
		if v_u_19 then
			if v38 then
				if v40 then
					if v42 then
						if v21 then
							if v41 then
								v41 = not v39
							end
						else
							v41 = v21
						end
					else
						v41 = v42
					end
				else
					v41 = v40
				end
			else
				v41 = v38
			end
		else
			v41 = v_u_19
		end
		local v_u_46 = v41
		local v_u_47 = v36.setShouldShowGlobalChatTooltip
		local v48 = {
			v_u_19,
			v_u_46,
			v_u_23,
			v_u_47
		}
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_19, (copy) v_u_47, (ref) v_u_46, (ref) v_u_23
			if v_u_19 then
				local v49 = v_u_47
				local v50 = v_u_46
				if v50 then
					v50 = v_u_23
				end
				v49(v50)
			end
		end, v48)
		v_u_24 = v_u_46
	end
	local v51, v_u_52 = v_u_3.useState(false)
	local v53 = { v_u_24, v_u_23 }
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_24, (ref) v_u_23, (copy) v_u_52
		if v_u_24 and v_u_23 then
			v_u_52(true)
		end
	end, v53)
	local v54 = v_u_24
	if v54 then
		v54 = not v51
	end
	if v_u_15 then
		local v_u_55 = v54 and v22
		if v_u_55 then
			v_u_55 = not v_u_23
		end
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_55, (ref) v_u_14
			if v_u_55 and v_u_14.isExperimentEnabled then
				v_u_14.logExposure()
			end
		end, { v_u_55 })
	end
	local v56 = table.clone(v18)
	if v54 and (not v22 or v_u_14.getShouldShowPresetChatIconBadge()) then
		v56.minBadgeCount = 1
	end
	return v_u_3.createElement(p17.NotificationBadge, v56)
end