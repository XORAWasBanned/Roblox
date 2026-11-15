-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChatScript
local v_u_1 = game:GetService("StarterGui")
local v2 = game:GetService("GuiService")
local v3 = game:GetService("Chat")
local v4 = game:GetService("ReplicatedStorage")
local v5 = v3:WaitForChild("ClientChatModules")
local v_u_6 = require(v5:WaitForChild("ChatSettings"))
local function v47() -- name: DoEverything
	-- upvalues: (copy) v_u_6
	local v_u_7 = require(script:WaitForChild("ChatMain"))
	local v8 = {
		["ChatWindow"] = {},
		["SetCore"] = {},
		["GetCore"] = {}
	}
	v8.ChatWindow.ChatTypes = {}
	v8.ChatWindow.ChatTypes.BubbleChatEnabled = v_u_6.BubbleChatEnabled
	v8.ChatWindow.ChatTypes.ClassicChatEnabled = v_u_6.ClassicChatEnabled
	local v9 = Instance.new("BindableEvent")
	v9.Name = "ToggleVisibility"
	v8.ChatWindow.ToggleVisibility = v9
	local v_u_10 = "ToggleVisibility"
	v9.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_10
		v_u_7[v_u_10](v_u_7, ...)
	end)
	local v11 = Instance.new("BindableEvent")
	v11.Name = "SetVisible"
	v8.ChatWindow.SetVisible = v11
	local v_u_12 = "SetVisible"
	v11.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_12
		v_u_7[v_u_12](v_u_7, ...)
	end)
	local v13 = Instance.new("BindableEvent")
	v13.Name = "FocusChatBar"
	v8.ChatWindow.FocusChatBar = v13
	local v_u_14 = "FocusChatBar"
	v13.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_14
		v_u_7[v_u_14](v_u_7, ...)
	end)
	local v15 = Instance.new("BindableEvent")
	v15.Name = "EnterWhisperState"
	v8.ChatWindow.EnterWhisperState = v15
	local v_u_16 = "EnterWhisperState"
	v15.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_16
		v_u_7[v_u_16](v_u_7, ...)
	end)
	local v17 = Instance.new("BindableFunction")
	v17.Name = "GetVisibility"
	v8.ChatWindow.GetVisibility = v17
	local v_u_18 = "GetVisibility"
	function v17.OnInvoke(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_18
		return v_u_7[v_u_18](v_u_7, ...)
	end
	local v19 = Instance.new("BindableFunction")
	v19.Name = "GetMessageCount"
	v8.ChatWindow.GetMessageCount = v19
	local v_u_20 = "GetMessageCount"
	function v19.OnInvoke(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_20
		return v_u_7[v_u_20](v_u_7, ...)
	end
	local v21 = Instance.new("BindableEvent")
	v21.Name = "TopbarEnabledChanged"
	v8.ChatWindow.TopbarEnabledChanged = v21
	local v_u_22 = "TopbarEnabledChanged"
	v21.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_22
		v_u_7[v_u_22](v_u_7, ...)
	end)
	local v23 = Instance.new("BindableFunction")
	v23.Name = "IsFocused"
	v8.ChatWindow.IsFocused = v23
	local v_u_24 = "IsFocused"
	function v23.OnInvoke(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_24
		return v_u_7[v_u_24](v_u_7, ...)
	end
	local v_u_25 = Instance.new("BindableEvent")
	v_u_25.Name = "ChatBarFocusChanged"
	v8.ChatWindow.ChatBarFocusChanged = v_u_25
	v_u_7.ChatBarFocusChanged:connect(function(...)
		-- upvalues: (copy) v_u_25
		v_u_25:Fire(...)
	end)
	local v_u_26 = Instance.new("BindableEvent")
	v_u_26.Name = "VisibilityStateChanged"
	v8.ChatWindow.VisibilityStateChanged = v_u_26
	v_u_7.VisibilityStateChanged:connect(function(...)
		-- upvalues: (copy) v_u_26
		v_u_26:Fire(...)
	end)
	local v_u_27 = Instance.new("BindableEvent")
	v_u_27.Name = "MessagesChanged"
	v8.ChatWindow.MessagesChanged = v_u_27
	v_u_7.MessagesChanged:connect(function(...)
		-- upvalues: (copy) v_u_27
		v_u_27:Fire(...)
	end)
	local v_u_28 = Instance.new("BindableEvent")
	v_u_28.Name = "MessagePosted"
	v8.ChatWindow.MessagePosted = v_u_28
	v_u_7.MessagePosted:connect(function(...)
		-- upvalues: (copy) v_u_28
		v_u_28:Fire(...)
	end)
	local v29 = Instance.new("BindableEvent")
	v29.Name = "CoreGuiEnabled"
	v8.ChatWindow.CoreGuiEnabled = v29
	local v_u_30 = "CoreGuiEnabled"
	v29.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_30
		v_u_7[v_u_30]:fire(...)
	end)
	local v31 = Instance.new("BindableEvent")
	v31.Name = "ChatMakeSystemMessage"
	v8.SetCore.ChatMakeSystemMessage = v31
	local v_u_32 = "ChatMakeSystemMessage"
	v31.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_32
		v_u_7[v_u_32 .. "Event"]:fire(...)
	end)
	local v33 = Instance.new("BindableEvent")
	v33.Name = "ChatWindowPosition"
	v8.SetCore.ChatWindowPosition = v33
	local v_u_34 = "ChatWindowPosition"
	v33.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_34
		v_u_7[v_u_34 .. "Event"]:fire(...)
	end)
	local v35 = Instance.new("BindableEvent")
	v35.Name = "ChatWindowSize"
	v8.SetCore.ChatWindowSize = v35
	local v_u_36 = "ChatWindowSize"
	v35.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_36
		v_u_7[v_u_36 .. "Event"]:fire(...)
	end)
	local v37 = Instance.new("BindableFunction")
	v37.Name = "ChatWindowPosition"
	v8.GetCore.ChatWindowPosition = v37
	local v_u_38 = "ChatWindowPosition"
	function v37.OnInvoke(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_38
		return v_u_7["f" .. v_u_38](...)
	end
	local v39 = Instance.new("BindableFunction")
	v39.Name = "ChatWindowSize"
	v8.GetCore.ChatWindowSize = v39
	local v_u_40 = "ChatWindowSize"
	function v39.OnInvoke(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_40
		return v_u_7["f" .. v_u_40](...)
	end
	local v41 = Instance.new("BindableEvent")
	v41.Name = "ChatBarDisabled"
	v8.SetCore.ChatBarDisabled = v41
	local v_u_42 = "ChatBarDisabled"
	v41.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_42
		v_u_7[v_u_42 .. "Event"]:fire(...)
	end)
	local v43 = Instance.new("BindableFunction")
	v43.Name = "ChatBarDisabled"
	v8.GetCore.ChatBarDisabled = v43
	local v_u_44 = "ChatBarDisabled"
	function v43.OnInvoke(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_44
		return v_u_7["f" .. v_u_44](...)
	end
	local v45 = Instance.new("BindableEvent")
	v45.Name = "SpecialKeyPressed"
	v8.ChatWindow.SpecialKeyPressed = v45
	local v_u_46 = "SpecialKeyPressed"
	v45.Event:connect(function(...)
		-- upvalues: (copy) v_u_7, (copy) v_u_46
		v_u_7[v_u_46](v_u_7, ...)
	end)
	SetCoreGuiChatConnections(v8)
end
function SetCoreGuiChatConnections(p_u_48) -- name: SetCoreGuiChatConnections
	-- upvalues: (copy) v_u_1
	local v49 = 0
	while v49 < 10 do
		v49 = v49 + 1
		local function v50()
			-- upvalues: (ref) v_u_1, (copy) p_u_48
			v_u_1:SetCore("CoreGuiChatConnections", p_u_48)
		end
		local v51, v52 = pcall(v50)
		if v51 then
			break
		end
		if not v51 and v49 == 10 then
			error("Error calling SetCore CoreGuiChatConnections: " .. v52)
		end
		wait()
	end
end
function checkBothChatTypesDisabled() -- name: checkBothChatTypesDisabled
	-- upvalues: (copy) v_u_6
	if v_u_6.BubbleChatEnabled == nil or v_u_6.ClassicChatEnabled == nil then
		return false
	else
		return not (v_u_6.BubbleChatEnabled or v_u_6.ClassicChatEnabled)
	end
end
if v2:IsTenFootInterface() then
	v4:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer()
	return
elseif checkBothChatTypesDisabled() then
	local v53 = {
		["ChatWindow"] = {}
	}
	v53.ChatWindow.ChatTypes = {}
	v53.ChatWindow.ChatTypes.BubbleChatEnabled = false
	v53.ChatWindow.ChatTypes.ClassicChatEnabled = false
	SetCoreGuiChatConnections(v53)
else
	v47()
end