-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.ExpChat.ChatChromeIntegration
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v4 = game:GetService("TextChatService")
local v5 = v2:WaitForChild("RobloxGui")
local v_u_6 = game:GetService("Chat")
local v_u_7 = game:GetService("RunService")
local v_u_8 = game:GetService("Players")
local v_u_9 = game:GetService("UserInputService")
local v_u_10 = require(v1.ChromeShared.Unibar.Constants)
local v_u_11 = require(v1.Integrations.ChromeIntegrationUtils)
local v_u_12 = require(v1.Service)
local v_u_13 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_14 = require(v1.Integrations.CommonIcon)
local v_u_15 = require(v1.ChromeShared.Utility.FocusSelectExpChat)
local v_u_16 = require(v1.ChromeShared.Service.ViewportUtil)
local v17 = v_u_13.MappedSignal
local v_u_18 = UserSettings().GameSettings
local v_u_19 = game:GetService("GuiService")
local v_u_20 = require(v3.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local v_u_21 = require(v3.Workspace.Packages.AppCommonLib).isSpatial
local v_u_22 = require(script.Parent.ChatIconVisibleSignals).default
local v23 = require(v3.Workspace.Packages.SignalsUtils)
local v24 = require(v3.Workspace.Packages.Chrome).Enums.SideSheetPlacement
if require(v5.Modules.Flags.FFlagDebugDisableExperienceChatMain) then
	return nil
end
local v_u_25 = require(v3.Workspace.Packages.ExpChat)
local v_u_26 = v_u_25.Stores.GetFocusNavigationStore(false)
local v_u_27 = v_u_25.Stores.GetMessagesStore
local v_u_28 = v_u_25.shouldSkipHistoricalMessage
local v_u_29 = v_u_25.isHistoricalMessage
local v_u_30 = v_u_25.shouldSuppressUnreadForTabMetadata
local v_u_31 = require(v3.Workspace.Packages.FriendsChat.GetFriendsChatIconUnreadStore)
local v32 = require(v3.Workspace.Packages.SharedFlags)
local v_u_33 = v32.FFlagEnableConsoleExpControls
local v_u_34 = v32.FFlagExpChatWindowSyncUnibar
local v35 = v32.FFlagExpChatInitializeWindowFromGameSettings
local v36 = v32.FFlagRemoveFriendsChatUnibarEntrypoints
local v_u_37 = v32.FFlagExpChatEnableFriendsTab
local v38 = v32.FFlagExpChatCanShowFriendsTab
local v_u_39 = v32.FFlagExpChatHistoricalMessagesUnibarUnread
local v_u_40 = require(v3.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v_u_41 = require(v5.Modules.ChatSelector)
local v_u_42 = require(v3.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
local v43 = require(v3.Workspace.Packages.ExpChatShared)
local v44 = v43.Flags.GetFFlagTextChatEnableUniverseChatTabs
local v_u_45 = v43.shouldRenderTextChannelInDefaultWindow
local v_u_46 = v43.getTextChannelDisplayMode
local v_u_47 = game:DefineFastFlag("ExpChatSuppressWelcomeMessageUnibarUnread", false)
local v_u_48 = game:DefineFastFlag("ExpChatUnibarAvailabilityRefactor", false)
local v_u_49 = require(v3.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_50 = require(v3.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local v_u_51 = v_u_25.ExpChatPerfTracker
local v_u_52 = 0
local v_u_53
if v35 then
	v_u_53 = v_u_18.ChatVisible
	v_u_41:SetVisible(v_u_53)
else
	v_u_53 = v_u_41:GetVisibility()
end
local v_u_54 = nil
local v55 = v_u_41.VisibilityStateChanged
local v_u_56 = 0
local v_u_57 = false
local function v_u_63() -- name: updateUnreadNotification
	-- upvalues: (ref) v_u_54, (copy) v_u_39, (copy) v_u_27, (ref) v_u_56, (copy) v_u_37, (ref) v_u_52, (copy) v_u_31, (ref) v_u_53
	if v_u_54.notification then
		local v58
		if v_u_39 then
			local v59 = v_u_27(false).getHistoricalWindowMessageCount
			local v60 = not v59 and 0 or v59(false)
			local v61 = v_u_56
			v_u_56 = math.min(v61, v60)
			v58 = v60 - v_u_56
		else
			v58 = 0
		end
		if v_u_37 then
			local v62 = v_u_52 + v_u_31(false).getUnreadCountToDisplay(false) + v58
			if v_u_53 or v62 == 0 then
				v_u_54.notification:clear()
			else
				v_u_54.notification:fireCount(v62)
			end
		else
			v_u_54.notification:fireCount(v_u_52 + v58)
			return
		end
	else
		return
	end
end
if not v_u_34 then
	v55:connect(function(p64)
		-- upvalues: (copy) v_u_48, (copy) v_u_22, (ref) v_u_54
		if v_u_48 then
			v_u_22.setVisibleViaChatSelector(p64)
		elseif p64 then
			v_u_54.availability:pinned()
		end
	end)
	v_u_41.ChatWindowToggled:connect(function(p65)
		-- upvalues: (copy) v_u_48, (copy) v_u_22, (ref) v_u_54
		if v_u_48 then
			v_u_22.setVisibleViaChatSelector(p65)
		elseif p65 then
			v_u_54.availability:pinned()
		end
	end)
end
if v_u_34 then
	v_u_18:GetPropertyChangedSignal("ChatVisible"):Connect(function()
		-- upvalues: (copy) v_u_22, (copy) v_u_18
		v_u_22.setGameSettingsChatVisible(v_u_18.ChatVisible)
	end)
	v_u_22.setGameSettingsChatVisible(v_u_18.ChatVisible)
end
local v_u_73 = v17.new(v55, function()
	-- upvalues: (ref) v_u_53
	return v_u_53
end, function()
	-- upvalues: (copy) v_u_41, (copy) v_u_48, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (ref) v_u_54, (copy) v_u_19, (copy) v_u_18, (ref) v_u_53, (ref) v_u_57, (copy) v_u_37, (ref) v_u_52, (copy) v_u_39, (ref) v_u_56, (copy) v_u_27, (copy) v_u_31, (copy) v_u_63
	local v66 = v_u_41.GetVisibility()
	if not (v_u_48 or v66) then
		local v67
		if v_u_7:IsStudio() then
			v67 = true
		else
			local function v68()
				-- upvalues: (ref) v_u_6, (ref) v_u_8
				return v_u_6:CanUserChatAsync(v_u_8.LocalPlayer and v_u_8.LocalPlayer.UserId or 0)
			end
			local v69, v70 = pcall(v68)
			v67 = v69 and v70
		end
		if not v67 then
			v_u_54.availability:unavailable()
		end
	end
	if not v_u_19.MenuIsOpen then
		v_u_18.ChatVisible = v66
	end
	v_u_53 = v66
	v_u_57 = true
	if v_u_37 then
		if v66 then
			v_u_52 = 0
			if v_u_39 then
				local v71 = v_u_27(false).getHistoricalWindowMessageCount
				v_u_56 = not v71 and 0 or v71(false)
			end
			v_u_31(false).clearDisplayCount()
		end
		v_u_63()
	elseif v66 and (v_u_52 and v_u_54.notification) then
		v_u_52 = 0
		if v_u_39 then
			local v72 = v_u_27(false).getHistoricalWindowMessageCount
			v_u_56 = not v72 and 0 or v72(false)
		end
		v_u_54.notification:clear()
	end
end)
local function v74() -- name: isChatOpenAvailable
	-- upvalues: (ref) v_u_54, (copy) v_u_12
	return v_u_54.availability:get() ~= v_u_12.AvailabilitySignal.Unavailable
end
local function v77(p_u_75) -- name: ensureOpenChat
	-- upvalues: (ref) v_u_53, (copy) v_u_40, (copy) v_u_49, (copy) v_u_21, (copy) v_u_50, (copy) v_u_41, (copy) v_u_33, (copy) v_u_15, (ref) v_u_54, (copy) v_u_11, (copy) v_u_12
	if v_u_53 then
		if v_u_40:getVisible() then
			v_u_40.default:setVisible(false)
		end
	else
		local v76 = v_u_49 and v_u_21()
		if v76 then
			v76 = not v_u_50:isMovePanelToCenter()
		end
		if v76 then
			if v_u_40:getVisible() then
				v_u_40.default:setVisible(false)
			end
			v_u_41:SetVisible(true)
			if v_u_33 then
				v_u_15(v_u_54.id)
				return
			end
		else
			v_u_11.dismissRobloxMenuAndRun(function()
				-- upvalues: (copy) p_u_75, (ref) v_u_54, (ref) v_u_12, (ref) v_u_40, (ref) v_u_41, (ref) v_u_33, (ref) v_u_15
				if p_u_75() and v_u_54.availability:get() ~= v_u_12.AvailabilitySignal.Unavailable then
					if v_u_40:getVisible() then
						v_u_40.default:setVisible(false)
					end
					v_u_41:SetVisible(true)
					if v_u_33 then
						v_u_15(v_u_54.id)
					end
				end
			end)
		end
		return
	end
end
local v78 = {
	["id"] = "chat",
	["label"] = "CoreScripts.TopBar.Chat",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["selected"] = nil,
	["components"] = nil
}
local v79
if v36 and v38 then
	v79 = v24.Unibar
else
	v79 = v24.None
end
v78.sideSheetPlacement = v79
function v78.activated(_) -- name: activated
	-- upvalues: (ref) v_u_53, (copy) v_u_41, (copy) v_u_51, (copy) v_u_49, (copy) v_u_21, (copy) v_u_50, (copy) v_u_11, (copy) v_u_40, (copy) v_u_33, (copy) v_u_15, (ref) v_u_54
	if v_u_53 then
		v_u_41:SetVisible(false)
		return
	else
		v_u_51.start(v_u_51.Events.ChatWindowMountTTI, {})
		local v80 = v_u_49 and v_u_21()
		if v80 then
			v80 = not v_u_50:isMovePanelToCenter()
		end
		if v80 then
			v_u_41:SetVisible(true)
		else
			v_u_11.dismissRobloxMenuAndRun(function()
				-- upvalues: (ref) v_u_40, (ref) v_u_41, (ref) v_u_33, (ref) v_u_15, (ref) v_u_54
				if v_u_40:getVisible() then
					v_u_40.default:setVisible(false)
				end
				v_u_41:SetVisible(true)
				if v_u_33 then
					v_u_15(v_u_54.id)
				end
			end)
		end
	end
end
v78.isActivated = v_u_73
v78.selected = v_u_33 and function(p_u_81)
	-- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) v_u_20, (copy) v_u_15, (ref) v_u_54
	local v_u_82 = nil
	local v_u_83 = nil
	local v_u_84 = nil
	v_u_82 = v_u_12:selectedItem():connect(function(p85)
		-- upvalues: (copy) p_u_81, (ref) v_u_82, (ref) v_u_83, (ref) v_u_84
		local v86 = p85 ~= p_u_81.id
		assert(v86, "Expected selectedId to not be self.id on selection")
		v_u_82:disconnect()
		v_u_83:Disconnect()
		v_u_84:Disconnect()
	end)
	v_u_83 = v_u_9.InputChanged:Connect(function(p87)
		-- upvalues: (ref) v_u_20, (ref) v_u_15, (ref) v_u_54
		if p87.KeyCode == Enum.KeyCode.Thumbstick1 and v_u_20.mapPositionToDirection(Vector2.new(p87.Position.X, p87.Position.Y)) == Enum.KeyCode.Down then
			v_u_15(v_u_54.id)
		end
	end)
	v_u_84 = v_u_9.InputBegan:Connect(function(p88)
		-- upvalues: (ref) v_u_15, (ref) v_u_54
		local v89 = p88.KeyCode
		if v89 == Enum.KeyCode.DPadDown or v89 == Enum.KeyCode.Down then
			v_u_15(v_u_54.id)
		end
	end)
end or nil
v78.components = {
	["Icon"] = function(_) -- name: Icon
		-- upvalues: (copy) v_u_42, (copy) v_u_14, (copy) v_u_73
		local v90 = v_u_42()
		return v_u_14(v90.icon.off, v90.icon.on, v_u_73)
	end
}
v_u_54 = v_u_12:register(v78)
v_u_54.chatOpenCapability = v_u_37 and {
	["isAvailable"] = v74,
	["ensureOpenChat"] = v77
} or nil
if v_u_48 then
	v23.createDetachedEffect(function(p91)
		-- upvalues: (copy) v_u_22, (ref) v_u_54, (copy) v_u_34, (copy) v_u_25
		if v_u_22.getIsChatIconVisible(p91) then
			v_u_54.availability:available()
		else
			v_u_54.availability:unavailable()
		end
		if v_u_34 then
			local v92 = v_u_22.getIsChatWindowVisible(p91)
			v_u_25.Events.ChatTopBarButtonActivated(v92)
		end
	end)
	v_u_13.setCoreGuiAvailability(v_u_54, Enum.CoreGuiType.Chat, function(p93)
		-- upvalues: (copy) v_u_22
		v_u_22.setCoreGuiEnabled(p93)
	end)
end
if v_u_33 then
	v23.createDetachedEffect(function(p94)
		-- upvalues: (copy) v_u_26, (copy) v_u_12, (copy) v_u_10
		if v_u_26.getChatInputBarFocused(p94) then
			v_u_12:setShortcutBar(v_u_10.UNIBAR_SHORTCUTBAR_ID)
		else
			v_u_12:setShortcutBar(nil)
		end
	end)
end
if v_u_37 then
	v23.createDetachedEffect(function(p95)
		-- upvalues: (copy) v_u_31, (copy) v_u_63
		v_u_31(p95).getUnreadCountToDisplay(p95)
		v_u_63()
	end)
end
if v_u_39 then
	v23.createDetachedEffect(function(p96)
		-- upvalues: (copy) v_u_27, (ref) v_u_57, (ref) v_u_53, (ref) v_u_56, (copy) v_u_63
		local v97 = v_u_27(p96).getHistoricalWindowMessageCount
		if v97 then
			v97(p96)
		end
		if v_u_57 and v_u_53 then
			local v98 = v_u_27(false).getHistoricalWindowMessageCount
			v_u_56 = not v98 and 0 or v98(false)
		end
		v_u_63()
	end)
end
v4.MessageReceived:Connect(function(p99)
	-- upvalues: (copy) v_u_46, (copy) v_u_45, (copy) v_u_39, (copy) v_u_29, (copy) v_u_28, (copy) v_u_47, (copy) v_u_30, (ref) v_u_53, (ref) v_u_52, (copy) v_u_63
	local v100 = v_u_46()
	if v_u_45(p99.TextChannel, v100) then
		local v101 = not (v_u_39 and v_u_29(p99)) and (((p99 == nil or not v_u_28(p99)) and true or false) and v_u_47)
		if v101 then
			local v102 = v_u_30
			if p99 then
				p99 = p99.Metadata
			end
			v101 = v102(p99)
		end
		if not v101 then
			if not v_u_53 then
				v_u_52 = v_u_52 + 1
				v_u_63()
			end
		end
	else
		return
	end
end)
if v44() then
	v4.UniverseChatMessageReceived:Connect(function(p103)
		-- upvalues: (copy) v_u_39, (copy) v_u_29, (copy) v_u_28, (copy) v_u_47, (copy) v_u_30, (ref) v_u_53, (ref) v_u_52, (copy) v_u_63
		local v104 = not (v_u_39 and v_u_29(p103)) and (((p103 == nil or not v_u_28(p103)) and true or false) and v_u_47)
		if v104 then
			local v105 = v_u_30
			if p103 then
				p103 = p103.Metadata
			end
			v104 = v105(p103)
		end
		if not v104 then
			if not v_u_53 then
				v_u_52 = v_u_52 + 1
				v_u_63()
			end
		end
	end)
end
local v_u_106 = 0
v_u_41.MessagesChanged:connect(function(p107)
	-- upvalues: (ref) v_u_53, (ref) v_u_52, (ref) v_u_106, (copy) v_u_63
	if not v_u_53 then
		v_u_52 = v_u_52 + (p107 - v_u_106)
		v_u_63()
	end
	v_u_106 = p107
end)
if not v_u_34 then
	v_u_41.ChatActiveChanged:connect(function(p108)
		-- upvalues: (copy) v_u_48, (copy) v_u_22, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (ref) v_u_54
		if v_u_48 then
			v_u_22.setChatActiveCalledByDeveloper(p108)
		elseif p108 then
			local v109
			if v_u_7:IsStudio() then
				v109 = true
			else
				local function v110()
					-- upvalues: (ref) v_u_6, (ref) v_u_8
					return v_u_6:CanUserChatAsync(v_u_8.LocalPlayer and v_u_8.LocalPlayer.UserId or 0)
				end
				local v111, v112 = pcall(v110)
				v109 = v111 and v112
			end
			if not v109 then
				v_u_54.availability:available()
			end
		end
	end)
end
coroutine.wrap(function()
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_48, (copy) v_u_22, (copy) v_u_18, (copy) v_u_16, (ref) v_u_53, (copy) v_u_41, (ref) v_u_54, (copy) v_u_13
	local v113 = v_u_8.LocalPlayer
	while not v113 do
		v_u_8:GetPropertyChangedSignal("LocalPlayer"):Wait()
		v113 = v_u_8.LocalPlayer
	end
	local v114
	if v_u_7:IsStudio() then
		v114 = true
	else
		local function v115()
			-- upvalues: (ref) v_u_6, (ref) v_u_8
			return v_u_6:CanUserChatAsync(v_u_8.LocalPlayer and v_u_8.LocalPlayer.UserId or 0)
		end
		local v116, v117 = pcall(v115)
		v114 = v116 and v117
	end
	if v_u_48 then
		v_u_22.setLocalUserChat(v114)
		if v114 then
			local v118 = v_u_18.ChatVisible
			if v_u_16.isSmallTouchScreen() then
				v118 = false
			end
			v_u_53 = v118
			v_u_41:SetVisible(v118)
			return
		end
	elseif v114 and v_u_54.availability then
		v_u_13.setCoreGuiAvailability(v_u_54, Enum.CoreGuiType.Chat, function(p119)
			-- upvalues: (ref) v_u_54
			if p119 then
				v_u_54.availability:pinned()
			else
				v_u_54.availability:unavailable()
			end
		end)
		local v120 = v_u_18.ChatVisible
		if v_u_16.isSmallTouchScreen() then
			v120 = false
		end
		v_u_53 = v120
		v_u_41:SetVisible(v120)
	end
end)()
function _simulateChat() -- name: _simulateChat
	-- upvalues: (ref) v_u_53, (ref) v_u_52, (copy) v_u_63
	while true do
		repeat
			task.wait(math.random(1, 15))
		until not v_u_53
		v_u_52 = v_u_52 + 1
		v_u_63()
	end
end
return v_u_54