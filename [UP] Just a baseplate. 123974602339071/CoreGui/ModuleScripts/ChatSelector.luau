-- Path: CoreGui.RobloxGui.Modules.ChatSelector
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = v1:WaitForChild("RobloxGui")
v_u_3:WaitForChild("Modules")
local v_u_4 = game:GetService("StarterGui")
game:GetService("UserInputService")
game:GetService("GuiService")
local v_u_5 = game:GetService("Players")
local v6 = require(v_u_3.Modules.ChatUtil)
local v_u_7 = v_u_5.ClassicChat
local v_u_8 = v_u_5.BubbleChat
local v9 = game:GetService("VRService")
local v10 = require(v2.Workspace.Packages.SharedFlags)
local v_u_11 = v10.FFlagEnableConsoleExpControls
local _ = v10.FFlagChromeChatGamepadSupportFix
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = {}
local v_u_15 = {
	["Visible"] = not v9.VREnabled
}
local v_u_26 = {
	["ToggleVisibility"] = function(_) -- name: ToggleVisibility
		-- upvalues: (ref) v_u_12, (copy) v_u_15
		if v_u_12 then
			v_u_12:ToggleVisibility()
		else
			v_u_15.Visible = not v_u_15.Visible
		end
	end,
	["SetVisible"] = function(_, p16) -- name: SetVisible
		-- upvalues: (ref) v_u_12, (copy) v_u_15
		if v_u_12 then
			v_u_12:SetVisible(p16)
		else
			v_u_15.Visible = p16
		end
	end,
	["FocusChatBar"] = function(_) -- name: FocusChatBar
		-- upvalues: (ref) v_u_12
		if v_u_12 then
			v_u_12:FocusChatBar()
		end
	end,
	["FocusSelectChatBar"] = function(_, p17, p18) -- name: FocusSelectChatBar
		-- upvalues: (ref) v_u_12, (copy) v_u_11
		if v_u_12 and v_u_11 then
			v_u_12:FocusSelectChatBar(p17, p18)
		end
	end,
	["EnterWhisperState"] = function(_, p19) -- name: EnterWhisperState
		-- upvalues: (ref) v_u_12
		if v_u_12 then
			return v_u_12:EnterWhisperState(p19)
		end
	end,
	["GetVisibility"] = function(_) -- name: GetVisibility
		-- upvalues: (ref) v_u_12, (copy) v_u_15
		if v_u_12 then
			return v_u_12:GetVisibility()
		else
			return v_u_15.Visible
		end
	end,
	["GetMessageCount"] = function(_) -- name: GetMessageCount
		-- upvalues: (ref) v_u_12
		return not v_u_12 and 0 or v_u_12:GetMessageCount()
	end,
	["TopbarEnabledChanged"] = function(_, ...) -- name: TopbarEnabledChanged
		-- upvalues: (ref) v_u_12
		if v_u_12 then
			return v_u_12:TopbarEnabledChanged(...)
		end
	end,
	["IsFocused"] = function(_, p20) -- name: IsFocused
		-- upvalues: (ref) v_u_12
		if v_u_12 then
			return v_u_12:IsFocused(p20)
		else
			return false
		end
	end,
	["ClassicChatEnabled"] = function(_) -- name: ClassicChatEnabled
		-- upvalues: (ref) v_u_12, (copy) v_u_7
		if v_u_12 then
			return v_u_12:ClassicChatEnabled()
		else
			return v_u_7
		end
	end,
	["IsBubbleChatOnly"] = function(_) -- name: IsBubbleChatOnly
		-- upvalues: (ref) v_u_12, (copy) v_u_8, (copy) v_u_7
		if v_u_12 then
			return v_u_12:IsBubbleChatOnly()
		end
		local v21 = v_u_8
		if v21 then
			v21 = not v_u_7
		end
		return v21
	end,
	["IsDisabled"] = function(_) -- name: IsDisabled
		-- upvalues: (ref) v_u_12, (copy) v_u_8, (copy) v_u_7
		if v_u_12 then
			return v_u_12:IsDisabled()
		else
			return not (v_u_8 or v_u_7)
		end
	end,
	["HideTemp"] = function(_, p22, p23) -- name: HideTemp
		-- upvalues: (copy) v_u_14, (ref) v_u_13, (copy) v_u_26
		if next(v_u_14) == nil then
			v_u_13 = v_u_26:GetVisibility()
		end
		if p23 then
			v_u_14[p22] = p23
		else
			v_u_14[p22] = nil
		end
		local v24 = v_u_26
		local v25 = v_u_13
		if v25 then
			v25 = next(v_u_14) == nil
		end
		v24:SetVisible(v25)
	end,
	["ChatBarFocusChanged"] = v6.Signal(),
	["ChatWindowToggled"] = v6.Signal(),
	["ChatActiveChanged"] = v6.Signal()
}
v_u_26.ChatActiveChanged:connect(function(p27)
	-- upvalues: (copy) v_u_26
	v_u_26:SetVisible(p27)
end)
v_u_26.VisibilityStateChanged = v6.Signal()
v_u_26.MessagesChanged = v6.Signal()
v_u_26.BubbleChatOnlySet = v6.Signal()
v_u_26.ChatDisabled = v6.Signal()
local v_u_28 = false
local v_u_29 = {}
local function v30() -- name: NonFunc end
v_u_4:RegisterSetCore("ChatMakeSystemMessage", function(p31) -- name: MakeSystemMessageQueueingFunction
	-- upvalues: (ref) v_u_28, (copy) v_u_29
	if not v_u_28 then
		local v32 = v_u_29
		table.insert(v32, p31)
	end
end)
v_u_4:RegisterSetCore("ChatWindowPosition", v30)
v_u_4:RegisterGetCore("ChatWindowPosition", v30)
v_u_4:RegisterSetCore("ChatWindowSize", v30)
v_u_4:RegisterGetCore("ChatWindowSize", v30)
v_u_4:RegisterSetCore("ChatBarDisabled", v30)
v_u_4:RegisterGetCore("ChatBarDisabled", v30)
v_u_4:RegisterGetCore("ChatActive", function()
	-- upvalues: (copy) v_u_26
	return v_u_26:GetVisibility()
end)
v_u_4:RegisterSetCore("ChatActive", function(p33)
	-- upvalues: (copy) v_u_26
	v_u_26.ChatActiveChanged:fire(p33)
end)
coroutine.wrap(function()
	-- upvalues: (ref) v_u_12, (copy) v_u_3, (copy) v_u_26, (copy) v_u_5, (copy) v_u_4, (copy) v_u_15, (ref) v_u_28, (copy) v_u_29
	v_u_12 = require(v_u_3.Modules.NewChat)
	local v34 = v_u_12
	local v_u_35 = v_u_26
	if v34.ChatBarFocusChanged then
		local v_u_36 = "ChatBarFocusChanged"
		v34.ChatBarFocusChanged:connect(function(...)
			-- upvalues: (copy) v_u_35, (copy) v_u_36
			v_u_35[v_u_36]:fire(...)
		end)
	end
	local v37 = v_u_12
	local v_u_38 = v_u_26
	if v37.VisibilityStateChanged then
		local v_u_39 = "VisibilityStateChanged"
		v37.VisibilityStateChanged:connect(function(...)
			-- upvalues: (copy) v_u_38, (copy) v_u_39
			v_u_38[v_u_39]:fire(...)
		end)
	end
	local v40 = v_u_12
	local v_u_41 = v_u_26
	if v40.ChatWindowToggled then
		local v_u_42 = "ChatWindowToggled"
		v40.ChatWindowToggled:connect(function(...)
			-- upvalues: (copy) v_u_41, (copy) v_u_42
			v_u_41[v_u_42]:fire(...)
		end)
	end
	local v43 = v_u_12
	local v_u_44 = v_u_26
	if v43.ChatActiveChanged then
		local v_u_45 = "ChatActiveChanged"
		v43.ChatActiveChanged:connect(function(...)
			-- upvalues: (copy) v_u_44, (copy) v_u_45
			v_u_44[v_u_45]:fire(...)
		end)
	end
	local v46 = v_u_12
	local v_u_47 = v_u_26
	if v46.BubbleChatOnlySet then
		local v_u_48 = "BubbleChatOnlySet"
		v46.BubbleChatOnlySet:connect(function(...)
			-- upvalues: (copy) v_u_47, (copy) v_u_48
			v_u_47[v_u_48]:fire(...)
		end)
	end
	local v49 = v_u_12
	local v_u_50 = v_u_26
	if v49.ChatDisabled then
		local v_u_51 = "ChatDisabled"
		v49.ChatDisabled:connect(function(...)
			-- upvalues: (copy) v_u_50, (copy) v_u_51
			v_u_50[v_u_51]:fire(...)
		end)
	end
	while v_u_5.LocalPlayer == nil do
		v_u_5.ChildAdded:wait()
	end
	local _ = v_u_5.LocalPlayer
	local v52 = v_u_12
	local v_u_53 = v_u_26
	if v52.MessagesChanged then
		local v_u_54 = "MessagesChanged"
		v52.MessagesChanged:connect(function(...)
			-- upvalues: (copy) v_u_53, (copy) v_u_54
			v_u_53[v_u_54]:fire(...)
		end)
	end
	v_u_4:RegisterGetCore("UseNewLuaChat", function()
		return true
	end)
	v_u_12:SetVisible(v_u_15.Visible)
	v_u_4:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, v_u_4:GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
	v_u_28 = true
	for _, v_u_55 in pairs(v_u_29) do
		local function v56()
			-- upvalues: (ref) v_u_4, (copy) v_u_55
			v_u_4:SetCore("ChatMakeSystemMessage", v_u_55)
		end
		pcall(v56)
	end
end)()
return v_u_26