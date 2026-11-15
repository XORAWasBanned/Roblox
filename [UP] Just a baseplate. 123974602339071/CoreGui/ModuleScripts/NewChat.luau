-- Path: CoreGui.RobloxGui.Modules.NewChat
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_2 = game:GetService("StarterGui")
local v_u_3 = game:GetService("GuiService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("TextChatService")
local v_u_6 = v_u_5.ChatVersion == Enum.ChatVersion.LegacyChatService
local v_u_7 = false
local v_u_8 = v4.ClassicChat
local v_u_9 = v4.BubbleChat
local v10 = require(v1.Modules.ChatUtil)
local v11 = game:GetService("CorePackages")
local v_u_12 = require(v11.Workspace.Packages.ExpChat)
local v13 = require(v11.Workspace.Packages.SharedFlags)
local v_u_14 = v13.getFFlagExpChatAlwaysRunTCS
local v_u_15 = v13.FFlagEnableConsoleExpControls
local v_u_16 = v13.FFlagExpChatWindowSyncUnibar
local v_u_17 = v_u_12.Stores.GetTransparencyStore(false)
local v_u_18 = {}
local v_u_19 = {
	["Visible"] = true,
	["MessageCount"] = 0,
	["TopbarEnabled"] = true,
	["CoreGuiEnabled"] = true
}
local v_u_20 = {
	["ChatWindow"] = nil,
	["GetCore"] = nil,
	["SetCore"] = nil
}
local v_u_21 = {}
local v_u_22 = {}
local function v_u_26(p23, ...) -- name: DispatchEvent
	-- upvalues: (copy) v_u_20
	local v24 = v_u_20.ChatWindow
	local v25
	if v24 and (v24[p23] and v24[p23]:IsA("BindableEvent")) then
		v25 = v24[p23]
	else
		v25 = nil
	end
	if not v25 then
		return false
	end
	v25:Fire(...)
	return true
end
local function v_u_30(p27, ...) -- name: AttemptInvokeFunction
	-- upvalues: (copy) v_u_20
	local v28 = v_u_20.ChatWindow
	local v29
	if v28 and (v28[p27] and v28[p27]:IsA("BindableFunction")) then
		v29 = v28[p27]
	else
		v29 = nil
	end
	if v29 then
		return true, v29:Invoke()
	else
		return false, nil
	end
end
function v_u_18.ToggleVisibility(_) -- name: ToggleVisibility
	-- upvalues: (copy) v_u_19, (ref) v_u_6, (copy) v_u_5, (copy) v_u_14, (copy) v_u_18, (copy) v_u_26, (copy) v_u_16, (copy) v_u_12, (copy) v_u_17
	v_u_19.Visible = not v_u_19.Visible
	v_u_6 = v_u_5.ChatVersion == Enum.ChatVersion.LegacyChatService
	local v31
	if v_u_14() then
		v31 = v_u_6
	else
		v31 = false
	end
	if v31 then
		v_u_18.VisibilityStateChanged:fire(v_u_19.Visible)
	elseif not v_u_26("ToggleVisibility") then
		v_u_18.VisibilityStateChanged:fire(v_u_19.Visible)
	end
	if not v_u_16 then
		v_u_12.Events.ChatTopBarButtonActivated(v_u_19.Visible)
	end
	if v_u_19.Visible then
		v_u_17.resetAllTransparency()
	end
	v_u_18.ChatWindowToggled:fire(v_u_19.Visible)
end
function v_u_18.SetVisible(_, p32) -- name: SetVisible
	-- upvalues: (copy) v_u_19, (copy) v_u_16, (copy) v_u_12, (copy) v_u_17, (copy) v_u_18, (ref) v_u_6, (copy) v_u_5, (copy) v_u_14, (copy) v_u_26
	v_u_19.Visible = p32
	if not v_u_16 then
		v_u_12.Events.ChatTopBarButtonActivated(v_u_19.Visible)
	end
	if v_u_19.Visible then
		v_u_17.resetAllTransparency()
	end
	v_u_18.ChatWindowToggled:fire(v_u_19.Visible)
	v_u_6 = v_u_5.ChatVersion == Enum.ChatVersion.LegacyChatService
	local v33
	if v_u_14() then
		v33 = v_u_6
	else
		v33 = false
	end
	if v33 then
		v_u_26("SetVisible", false)
		v_u_18.VisibilityStateChanged:fire(false)
	elseif not v_u_26("SetVisible", v_u_19.Visible) then
		v_u_18.VisibilityStateChanged:fire(v_u_19.Visible)
	end
end
function v_u_18.FocusChatBar(_) -- name: FocusChatBar
	-- upvalues: (copy) v_u_26, (copy) v_u_12
	v_u_26("FocusChatBar")
	v_u_12.Events.ChatTopBarFocusActivated()
end
function v_u_18.FocusSelectChatBar(_, p34, p35) -- name: FocusSelectChatBar
	-- upvalues: (copy) v_u_15, (copy) v_u_12
	if v_u_15 then
		v_u_12.Events.ChatTopBarFocusSelect(p34, p35)
	end
end
function v_u_18.EnterWhisperState(_, p36) -- name: EnterWhisperState
	-- upvalues: (copy) v_u_26
	return v_u_26("EnterWhisperState", p36)
end
function v_u_18.GetVisibility(_) -- name: GetVisibility
	-- upvalues: (copy) v_u_30, (copy) v_u_19
	local v37, v38 = v_u_30("GetVisibility")
	if v37 then
		return v38
	else
		return v_u_19.Visible
	end
end
function v_u_18.GetMessageCount(_) -- name: GetMessageCount
	-- upvalues: (copy) v_u_30, (copy) v_u_19
	local v39, v40 = v_u_30("GetMessageCount")
	if v39 then
		return v40
	else
		return v_u_19.MessageCount
	end
end
function v_u_18.TopbarEnabledChanged(_, p41) -- name: TopbarEnabledChanged
	-- upvalues: (copy) v_u_19, (copy) v_u_26
	v_u_19.TopbarEnabled = p41
	v_u_26("TopbarEnabledChanged", v_u_19.TopbarEnabled)
end
function v_u_18.IsFocused(_, p42) -- name: IsFocused
	-- upvalues: (copy) v_u_30
	local v43, v44 = v_u_30("IsFocused", p42)
	if v43 then
		return v44
	else
		return false
	end
end
function v_u_18.ClassicChatEnabled(_) -- name: ClassicChatEnabled
	-- upvalues: (ref) v_u_8
	return v_u_8
end
function v_u_18.IsBubbleChatOnly(_) -- name: IsBubbleChatOnly
	-- upvalues: (ref) v_u_9, (ref) v_u_8
	local v45 = v_u_9
	if v45 then
		v45 = not v_u_8
	end
	return v45
end
function v_u_18.IsDisabled(_) -- name: IsDisabled
	-- upvalues: (ref) v_u_9, (ref) v_u_8
	return not (v_u_9 or v_u_8)
end
function SetInitialChatTypes(p46) -- name: SetInitialChatTypes
	-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8, (copy) v_u_18
	if not v_u_7 then
		v_u_7 = true
		local v47 = p46.BubbleChatEnabled
		local v48 = p46.ClassicChatEnabled
		if type(v47) == "boolean" then
			v_u_9 = v47
		end
		if type(v48) == "boolean" then
			v_u_8 = v48
		end
		if not (v_u_8 or v_u_9) then
			v_u_18.ChatDisabled:fire()
		end
		if v_u_9 and not v_u_8 then
			v_u_18.BubbleChatOnlySet:fire()
		end
	end
end
v_u_18.ChatBarFocusChanged = v10.Signal()
v_u_18.VisibilityStateChanged = v10.Signal()
v_u_18.ChatWindowToggled = v10.Signal()
v_u_18.MessagesChanged = v10.Signal()
v_u_18.BubbleChatOnlySet = v10.Signal()
v_u_18.ChatDisabled = v10.Signal()
local v_u_49 = game:GetService("Chat")
v_u_49:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function()
	-- upvalues: (copy) v_u_49, (copy) v_u_26, (copy) v_u_18
	if v_u_49.IsAutoMigrated and not v_u_26("SetVisible", false) then
		v_u_18.VisibilityStateChanged:fire(false)
	end
end)
v_u_2.CoreGuiChangedSignal:connect(function(p50, p51)
	-- upvalues: (copy) v_u_19, (copy) v_u_26
	if p50 == Enum.CoreGuiType.All or p50 == Enum.CoreGuiType.Chat then
		v_u_19.CoreGuiEnabled = p51
		v_u_26("CoreGuiEnabled", v_u_19.CoreGuiEnabled)
	end
end)
v_u_3:AddSpecialKey(Enum.SpecialKey.ChatHotkey)
v_u_3.SpecialKeyPressed:connect(function(p52, p53)
	-- upvalues: (copy) v_u_3, (ref) v_u_6, (copy) v_u_5, (copy) v_u_14, (copy) v_u_26
	if not v_u_3.MenuIsOpen then
		v_u_6 = v_u_5.ChatVersion == Enum.ChatVersion.LegacyChatService
		local v54
		if v_u_14() then
			v54 = v_u_6
		else
			v54 = false
		end
		if not v54 then
			v_u_26("SpecialKeyPressed", p52, p53)
		end
	end
end)
function DoConnectSetCore(p_u_55) -- name: DoConnectSetCore
	-- upvalues: (copy) v_u_2, (copy) v_u_20, (copy) v_u_22
	v_u_2:RegisterSetCore(p_u_55, function(p56)
		-- upvalues: (ref) v_u_20, (copy) p_u_55, (ref) v_u_22
		local v57 = v_u_20.SetCore
		local v58 = p_u_55
		local v59
		if v57 and (v57[v58] and v57[v58]:IsA("BindableEvent")) then
			v59 = v57[v58]
		else
			v59 = nil
		end
		if v59 then
			v59:Fire(p56)
		else
			if v_u_22[p_u_55] == nil then
				v_u_22[p_u_55] = {}
			end
			local v60 = v_u_22[p_u_55]
			table.insert(v60, p56)
		end
	end)
end
DoConnectSetCore("ChatMakeSystemMessage")
DoConnectSetCore("ChatWindowPosition")
DoConnectSetCore("ChatWindowSize")
DoConnectSetCore("ChatBarDisabled")
local v_u_61 = "ChatWindowPosition"
v_u_2:RegisterGetCore("ChatWindowPosition", function(p62)
	-- upvalues: (copy) v_u_20, (copy) v_u_61
	local v63 = v_u_20.GetCore
	local v64 = v_u_61
	local v65
	if v63 and (v63[v64] and v63[v64]:IsA("BindableFunction")) then
		v65 = v63[v64]
	else
		v65 = nil
	end
	local v66
	if v65 then
		v66 = v65:Invoke(p62)
	else
		v66 = nil
	end
	return v66
end)
local v_u_67 = "ChatWindowSize"
v_u_2:RegisterGetCore("ChatWindowSize", function(p68)
	-- upvalues: (copy) v_u_20, (copy) v_u_67
	local v69 = v_u_20.GetCore
	local v70 = v_u_67
	local v71
	if v69 and (v69[v70] and v69[v70]:IsA("BindableFunction")) then
		v71 = v69[v70]
	else
		v71 = nil
	end
	local v72
	if v71 then
		v72 = v71:Invoke(p68)
	else
		v72 = nil
	end
	return v72
end)
local v_u_73 = "ChatBarDisabled"
v_u_2:RegisterGetCore("ChatBarDisabled", function(p74)
	-- upvalues: (copy) v_u_20, (copy) v_u_73
	local v75 = v_u_20.GetCore
	local v76 = v_u_73
	local v77
	if v75 and (v75[v76] and v75[v76]:IsA("BindableFunction")) then
		v77 = v75[v76]
	else
		v77 = nil
	end
	local v78
	if v77 then
		v78 = v77:Invoke(p74)
	else
		v78 = nil
	end
	return v78
end)
local function v123(p79) -- name: RegisterCoreGuiConnections
	-- upvalues: (ref) v_u_21, (copy) v_u_20, (copy) v_u_18, (copy) v_u_19, (copy) v_u_22
	if type(p79) == "table" then
		local v_u_80 = p79.ChatWindow
		local v_u_81 = p79.SetCore
		local v82 = p79.GetCore
		if type(v_u_80) == "table" then
			for _, v83 in pairs(v_u_21) do
				v83:disconnect()
			end
			local v84 = v_u_80.ChatTypes
			if type(v84) == "table" then
				SetInitialChatTypes(v_u_80.ChatTypes)
			end
			v_u_21 = {}
			v_u_20.ChatWindow = {}
			local v85 = v_u_20.ChatWindow
			local v86
			if v_u_80 and (v_u_80.ToggleVisibility and v_u_80.ToggleVisibility:IsA("BindableEvent")) then
				v86 = v_u_80.ToggleVisibility
			else
				v86 = nil
			end
			v85.ToggleVisibility = v86
			local v87 = v_u_20.ChatWindow
			local v88
			if v_u_80 and (v_u_80.SetVisible and v_u_80.SetVisible:IsA("BindableEvent")) then
				v88 = v_u_80.SetVisible
			else
				v88 = nil
			end
			v87.SetVisible = v88
			local v89 = v_u_20.ChatWindow
			local v90
			if v_u_80 and (v_u_80.FocusChatBar and v_u_80.FocusChatBar:IsA("BindableEvent")) then
				v90 = v_u_80.FocusChatBar
			else
				v90 = nil
			end
			v89.FocusChatBar = v90
			local v91 = v_u_20.ChatWindow
			local v92
			if v_u_80 and (v_u_80.EnterWhisperState and v_u_80.EnterWhisperState:IsA("BindableEvent")) then
				v92 = v_u_80.EnterWhisperState
			else
				v92 = nil
			end
			v91.EnterWhisperState = v92
			local v93 = v_u_20.ChatWindow
			local v94
			if v_u_80 and (v_u_80.TopbarEnabledChanged and v_u_80.TopbarEnabledChanged:IsA("BindableEvent")) then
				v94 = v_u_80.TopbarEnabledChanged
			else
				v94 = nil
			end
			v93.TopbarEnabledChanged = v94
			local v95 = v_u_20.ChatWindow
			local v96
			if v_u_80 and (v_u_80.IsFocused and v_u_80.IsFocused:IsA("BindableFunction")) then
				v96 = v_u_80.IsFocused
			else
				v96 = nil
			end
			v95.IsFocused = v96
			local v97 = v_u_20.ChatWindow
			local v98
			if v_u_80 and (v_u_80.SpecialKeyPressed and v_u_80.SpecialKeyPressed:IsA("BindableEvent")) then
				v98 = v_u_80.SpecialKeyPressed
			else
				v98 = nil
			end
			v97.SpecialKeyPressed = v98
			local function v105(p_u_99) -- name: DoConnect
				-- upvalues: (ref) v_u_20, (copy) v_u_80, (ref) v_u_18, (ref) v_u_21
				local v100 = v_u_20.ChatWindow
				local v101 = v_u_80
				local v102
				if v101 and (v101[p_u_99] and v101[p_u_99]:IsA("BindableEvent")) then
					v102 = v101[p_u_99]
				else
					v102 = nil
				end
				v100[p_u_99] = v102
				if v_u_20.ChatWindow[p_u_99] then
					local v103 = v_u_20.ChatWindow[p_u_99].Event:connect(function(...)
						-- upvalues: (ref) v_u_18, (copy) p_u_99
						v_u_18[p_u_99]:fire(...)
					end)
					local v104 = v_u_21
					table.insert(v104, v103)
				end
			end
			v105("ChatBarFocusChanged")
			v105("VisibilityStateChanged")
			v105("ChatWindowToggled")
			v105("MessagesChanged")
			local v106 = v_u_20.ChatWindow
			local v107
			if v_u_80 and (v_u_80.MessagePosted and v_u_80.MessagePosted:IsA("BindableEvent")) then
				v107 = v_u_80.MessagePosted
			else
				v107 = nil
			end
			v106.MessagePosted = v107
			if v_u_20.ChatWindow.MessagePosted then
				local v109 = v_u_20.ChatWindow.MessagePosted.Event:connect(function(p108)
					game:GetService("Players"):Chat(p108)
				end)
				local v110 = v_u_21
				table.insert(v110, v109)
			end
			v_u_18:SetVisible(v_u_19.Visible)
			v_u_18:TopbarEnabledChanged(v_u_19.TopbarEnabled)
			local v111
			if v_u_80 and (v_u_80.CoreGuiEnabled and v_u_80.CoreGuiEnabled:IsA("BindableEvent")) then
				v111 = v_u_80.CoreGuiEnabled
			else
				v111 = nil
			end
			if v111 then
				v_u_20.ChatWindow.CoreGuiEnabled = v111
				v111:Fire(v_u_19.CoreGuiEnabled)
			end
		else
			error("Table \'ChatWindow\' must be provided!")
		end
		if type(v_u_81) == "table" and type(v82) == "table" then
			v_u_20.SetCore = {}
			v_u_20.GetCore = {}
			local function v116(p112) -- name: addSetCore
				-- upvalues: (copy) v_u_81, (ref) v_u_20, (ref) v_u_22
				local v113 = v_u_81
				local v114
				if v113 and (v113[p112] and v113[p112]:IsA("BindableEvent")) then
					v114 = v113[p112]
				else
					v114 = nil
				end
				if v114 then
					v_u_20.SetCore[p112] = v114
					if v_u_22[p112] then
						for _, v115 in pairs(v_u_22[p112]) do
							v114:Fire(v115)
						end
						v_u_22[p112] = nil
					end
				end
			end
			v116("ChatMakeSystemMessage")
			v116("ChatWindowPosition")
			v116("ChatWindowSize")
			v116("ChatBarDisabled")
			local v117 = v_u_20.GetCore
			local v118
			if v82 and (v82.ChatWindowPosition and v82.ChatWindowPosition:IsA("BindableFunction")) then
				v118 = v82.ChatWindowPosition
			else
				v118 = nil
			end
			v117.ChatWindowPosition = v118
			local v119 = v_u_20.GetCore
			local v120
			if v82 and (v82.ChatWindowSize and v82.ChatWindowSize:IsA("BindableFunction")) then
				v120 = v82.ChatWindowSize
			else
				v120 = nil
			end
			v119.ChatWindowSize = v120
			local v121 = v_u_20.GetCore
			local v122
			if v82 and (v82.ChatBarDisabled and v82.ChatBarDisabled:IsA("BindableFunction")) then
				v122 = v82.ChatBarDisabled
			else
				v122 = nil
			end
			v121.ChatBarDisabled = v122
			return
		end
		if type(v_u_81) ~= "nil" or type(v82) ~= "nil" then
			error("Both \'SetCore\' and \'GetCore\' must be tables if provided!")
		end
	end
end
v_u_12.listenToDispatch(function(p124)
	-- upvalues: (copy) v_u_18
	if p124.type == "FocusChatHotKeyActivated" then
		v_u_18:SetVisible(true)
	end
end)
v_u_2:RegisterSetCore("CoreGuiChatConnections", v123)
return v_u_18