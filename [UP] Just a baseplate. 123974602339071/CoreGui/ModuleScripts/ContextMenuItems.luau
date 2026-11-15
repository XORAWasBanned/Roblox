-- Path: CoreGui.RobloxGui.Modules.AvatarContextMenu.ContextMenuItems
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("StarterGui")
local v_u_4 = game:GetService("Chat")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("RbxAnalyticsService")
local v_u_7 = game:GetService("GuiService")
local v8 = game:GetService("CorePackages")
local v_u_9 = game:GetService("TextChatService")
local v_u_10 = v2:WaitForChild("RobloxGui")
local v11 = v_u_10:WaitForChild("Modules")
local v_u_12 = require(v8.Workspace.Packages.RobloxTranslator)
local v_u_13 = require(v_u_10.Modules.GameTranslator)
local v14 = v11:WaitForChild("AvatarContextMenu")
local v_u_15 = require(v14:WaitForChild("ContextMenuUtil"))
local v_u_16 = require(v14.ThemeHandler)
local v_u_17 = require(v8.Workspace.Packages.BlockingUtility)
local v18 = require(v8.Packages.t)
local v_u_19 = require(v8.Workspace.Packages.ArgCheck)
local v_u_20 = require(v8.Workspace.Packages.ExpChat)
local v_u_21 = require(v11.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor)
local v_u_22 = require(v11.Common.Flags.FFlagWhisperEmoteOnAvatarContextMenuWithExpChat)
local v_u_23 = v_u_1.LocalPlayer
while not v_u_23 do
	v_u_1.PlayerAdded:wait()
	v_u_23 = v_u_1.LocalPlayer
end
local v_u_24 = {
	[Enum.AvatarContextMenuOption.Chat] = true,
	[Enum.AvatarContextMenuOption.Friend] = true,
	[Enum.AvatarContextMenuOption.Emote] = true,
	[Enum.AvatarContextMenuOption.InspectMenu] = true
}
local v_u_25 = {}
local v_u_26 = 0
local v_u_27 = {}
v_u_27.__index = v_u_27
function v_u_27.UpdateInspectMenuEnabled(_) -- name: UpdateInspectMenuEnabled
	-- upvalues: (copy) v_u_7, (copy) v_u_24
	local v28 = v_u_7:GetInspectMenuEnabled()
	if v28 ~= v_u_24[Enum.AvatarContextMenuOption.InspectMenu] then
		v_u_24[Enum.AvatarContextMenuOption.InspectMenu] = v28
	end
end
function v_u_27.ClearMenuItems(p29) -- name: ClearMenuItems
	local v30 = p29.MenuItemFrame:GetChildren()
	for v31 = 1, #v30 do
		if not v30[v31]:IsA("GuiObject") then
			continue
		end
		v30[v31]:Destroy()
	end
end
function v_u_27.AddCustomAvatarMenuItem(_, p32, p33) -- name: AddCustomAvatarMenuItem
	-- upvalues: (ref) v_u_26, (copy) v_u_25
	v_u_26 = v_u_26 + 1
	v_u_25[p32] = {
		["event"] = p33,
		["layoutOrder"] = v_u_26
	}
end
function v_u_27.RemoveCustomAvatarMenuItem(_, p34) -- name: RemoveCustomAvatarMenuItem
	-- upvalues: (copy) v_u_25
	v_u_25[p34] = nil
end
function v_u_27.IsContextAvatarEnumItem(_, p35) -- name: IsContextAvatarEnumItem
	local v36 = Enum.AvatarContextMenuOption:GetEnumItems()
	for v37 = 1, #v36 do
		if p35 ~= v36[v37] then
			continue
		end
		return true
	end
	return false
end
function v_u_27.EnableDefaultMenuItem(_, p38) -- name: EnableDefaultMenuItem
	-- upvalues: (copy) v_u_24
	v_u_24[p38] = true
end
function v_u_27.RemoveDefaultMenuItem(_, p39) -- name: RemoveDefaultMenuItem
	-- upvalues: (copy) v_u_24
	v_u_24[p39] = false
end
function v_u_27.RegisterCoreMethods(p_u_40) -- name: RegisterCoreMethods
	-- upvalues: (copy) v_u_3
	v_u_3:RegisterSetCore("AddAvatarContextMenuOption", function(p41) -- name: addMenuItemFunc
		-- upvalues: (copy) p_u_40
		if type(p41) ~= "table" then
			if typeof(p41) == "EnumItem" then
				if p_u_40:IsContextAvatarEnumItem(p41) then
					p_u_40:EnableDefaultMenuItem(p41)
				else
					error("AddAvatarContextMenuOption given EnumItem is not valid")
				end
			else
				error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
				return
			end
		end
		local v42 = ""
		local v43
		if p41[1] then
			local v44 = p41[1]
			if type(v44) == "string" then
				v42 = p41[1]
				if p41[2] then
					v43 = p41[2]
					if typeof(v43) == "Instance" and p41[2].ClassName == "BindableEvent" then
						p_u_40:AddCustomAvatarMenuItem(v42, p41[2])
						return
					end
				end
				error("AddAvatarContextMenuOption second table entry must be a BindableEvent")
			else
				error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
				if p41[2] then
					v43 = p41[2]
					if typeof(v43) == "Instance" and p41[2].ClassName == "BindableEvent" then
						p_u_40:AddCustomAvatarMenuItem(v42, p41[2])
						return
					end
				end
				error("AddAvatarContextMenuOption second table entry must be a BindableEvent")
			end
		else
			error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
			if p41[2] then
				v43 = p41[2]
				if typeof(v43) == "Instance" and p41[2].ClassName == "BindableEvent" then
					p_u_40:AddCustomAvatarMenuItem(v42, p41[2])
					return
				end
			end
			error("AddAvatarContextMenuOption second table entry must be a BindableEvent")
			return
		end
	end)
	v_u_3:RegisterSetCore("RemoveAvatarContextMenuOption", function(p45) -- name: removeMenuItemFunc
		-- upvalues: (copy) p_u_40
		if type(p45) == "string" then
			p_u_40:RemoveCustomAvatarMenuItem(p45)
			return
		elseif typeof(p45) == "EnumItem" then
			if p_u_40:IsContextAvatarEnumItem(p45) then
				p_u_40:RemoveDefaultMenuItem(p45)
			else
				error("RemoveAvatarContextMenuOption given EnumItem is not valid")
			end
		else
			error("RemoveAvatarContextMenuOption first argument must be a string or Enum.AvatarContextMenuOption")
			return
		end
	end)
end
function v_u_27.CreateCustomMenuItems(p_u_46) -- name: CreateCustomMenuItems
	-- upvalues: (copy) v_u_25, (copy) v_u_6, (copy) v_u_13, (copy) v_u_15, (copy) v_u_16
	for v47, v_u_48 in pairs(v_u_25) do
		v_u_6:TrackEvent("Game", "AvatarContextMenuCustomButton", "name: " .. tostring(v47))
		local v49 = v_u_15:MakeStyledButton("CustomButton", v_u_13:TranslateGameText(p_u_46.MenuItemFrame, v47), UDim2.new(0.96, 0, 0, 52), function() -- name: customButtonFunc
			-- upvalues: (copy) p_u_46, (copy) v_u_48
			if p_u_46.CloseMenuFunc then
				p_u_46:CloseMenuFunc()
			end
			v_u_48.event:Fire(p_u_46.SelectedPlayer)
		end, v_u_16:GetTheme())
		v49.Name = "CustomButton"
		v49.LayoutOrder = v_u_48.layoutOrder
		v49.Parent = p_u_46.MenuItemFrame
	end
end
local v_u_50 = "Add Friend"
local v_u_51 = "Friends"
local v_u_52 = "Friend Request Pending"
local v_u_53 = "Accept Friend Request"
local v_u_54 = "Player Blocked"
function v_u_27.CreateFriendButton(p_u_55, p56, p57) -- name: CreateFriendButton
	-- upvalues: (ref) v_u_50, (copy) v_u_12, (ref) v_u_51, (ref) v_u_52, (ref) v_u_53, (ref) v_u_54, (copy) v_u_6, (ref) v_u_23, (copy) v_u_15, (copy) v_u_16, (ref) v_u_26
	v_u_50 = v_u_12:FormatByKey("Corescripts.AvatarContextMenu.AddFriend")
	v_u_51 = v_u_12:FormatByKey("Corescripts.AvatarContextMenu.Friends")
	v_u_52 = v_u_12:FormatByKey("Corescripts.AvatarContextMenu.FriendRequestPending")
	v_u_53 = v_u_12:FormatByKey("Corescripts.AvatarContextMenu.AcceptFriendRequest")
	v_u_54 = v_u_12:FormatByKey("Corescripts.AvatarContextMenu.PlayerBlocked")
	local v_u_58 = p_u_55.MenuItemFrame:FindFirstChild("FriendStatus")
	if v_u_58 then
		v_u_58:Destroy()
		v_u_58 = nil
	end
	local v_u_59 = nil
	local function v60()
		-- upvalues: (ref) v_u_59, (ref) v_u_58, (ref) v_u_52, (ref) v_u_6, (ref) v_u_23, (copy) p_u_55
		if v_u_59 and v_u_58.Selectable then
			v_u_58.Selectable = false
			v_u_59.TextTransparency = 0.75
			v_u_59.Text = v_u_52
			v_u_6:ReportCounter("AvatarContextMenu-RequestFriendship")
			v_u_6:TrackEvent("Game", "RequestFriendship", "AvatarContextMenu")
			v_u_23:RequestFriendship(p_u_55.SelectedPlayer)
		end
	end
	local v61, v62 = v_u_15:MakeStyledButton("FriendStatus", v_u_50, UDim2.new(0.96, 0, 0, 52), v60, v_u_16:GetTheme())
	v_u_58 = v61
	v_u_59 = v62
	if p57 then
		v_u_58.Selectable = false
		v_u_59.TextTransparency = 0.75
		v_u_59.Text = v_u_54
	elseif p56 == Enum.FriendStatus.Friend then
		v_u_58.Selectable = false
		v_u_59.TextTransparency = 0.75
		v_u_59.Text = v_u_51
	elseif p56 == Enum.FriendStatus.FriendRequestSent then
		v_u_58.Selectable = false
		v_u_59.TextTransparency = 0.75
		v_u_59.Text = v_u_52
	elseif p56 == Enum.FriendStatus.FriendRequestReceived then
		v_u_59.Text = v_u_53
	else
		v_u_58.Selectable = true
		v_u_59.TextTransparency = 0
	end
	v_u_58.LayoutOrder = v_u_26 + 1
	v_u_58.Parent = p_u_55.MenuItemFrame
end
function v_u_27.UpdateFriendButton(p63, p64, p65) -- name: UpdateFriendButton
	if p63.MenuItemFrame:FindFirstChild("FriendStatus") then
		p63:CreateFriendButton(p64, p65)
	end
end
function v_u_27.CreateInspectAndBuyButton(p_u_66) -- name: CreateInspectAndBuyButton
	-- upvalues: (copy) v_u_24, (copy) v_u_7, (copy) v_u_15, (copy) v_u_12, (copy) v_u_16, (ref) v_u_26
	local function v67() -- name: browseItems
		-- upvalues: (copy) p_u_66, (ref) v_u_24, (ref) v_u_7
		if p_u_66.CloseMenuFunc then
			p_u_66:CloseMenuFunc()
		end
		if v_u_24[Enum.AvatarContextMenuOption.InspectMenu] then
			v_u_7:InspectPlayerFromUserIdWithCtx(p_u_66.SelectedPlayer.UserId, "avatarContextMenu")
		else
			warn("The Inspect Menu is not currently available.")
		end
	end
	local v68 = v_u_15:MakeStyledButton("View", v_u_12:FormatByKey("InGame.InspectMenu.Action.View"), UDim2.new(0.96, 0, 0, 52), v67, v_u_16:GetTheme())
	v68.LayoutOrder = v_u_26 + 4
	v68.Parent = p_u_66.MenuItemFrame
end
local function v_u_72() -- name: findFirstTextChannel
	-- upvalues: (copy) v_u_9, (copy) v_u_1
	local v69 = v_u_9:FindFirstChild("RBXGeneral", true)
	if v69 then
		return v69
	end
	for _, v70 in ipairs(v_u_9:GetDescendants()) do
		if not v70:IsA("TextSource") or (v70.UserId ~= v_u_1.LocalPlayer.UserId or v70.CanSend ~= true) then
			continue
		end
		local v71 = v70.Parent
		if not v71:IsA("TextChannel") then
			continue
		end
		return v71
	end
	return nil
end
function v_u_27.CreateEmoteButton(p_u_73) -- name: CreateEmoteButton
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_72, (copy) v_u_12, (copy) v_u_15, (copy) v_u_16, (ref) v_u_26
	local function v79() -- name: wave
		-- upvalues: (copy) p_u_73, (ref) v_u_6, (ref) v_u_1, (ref) v_u_72
		if p_u_73.CloseMenuFunc then
			p_u_73:CloseMenuFunc()
		end
		v_u_6:ReportCounter("AvatarContextMenu-Wave")
		local v74 = v_u_6
		local v75 = game.PlaceId
		v74:TrackEvent("Game", "AvatarContextMenuWave", "placeId: " .. tostring(v75))
		v_u_1:Chat("/e wave")
		local v76 = p_u_73.TextChatService
		local v77, _ = pcall(function()
			local _ = Enum.ChatVersion.LegacyChatService
		end)
		local v78 = (v77 and v76.ChatVersion == Enum.ChatVersion.TextChatService and true or false) and v_u_72()
		if v78 then
			v78:SendAsync("/e wave")
		end
	end
	local v80 = v_u_15:MakeStyledButton("Wave", v_u_12:FormatByKey("Corescripts.AvatarContextMenu.Wave"), UDim2.new(0.96, 0, 0, 52), v79, v_u_16:GetTheme())
	v80.LayoutOrder = v_u_26 + 5
	v80.Parent = p_u_73.MenuItemFrame
end
local v_u_81 = v18.interface({
	["localPlayerChatEnabled"] = v18.boolean,
	["localPlayerCanChatWithSelectedPlayer"] = v18.boolean
})
function v_u_27.CreateChatButton(p_u_82, p83) -- name: CreateChatButton
	-- upvalues: (copy) v_u_22, (copy) v_u_6, (copy) v_u_72, (copy) v_u_20, (copy) v_u_10, (ref) v_u_23, (copy) v_u_12, (copy) v_u_15, (copy) v_u_16, (ref) v_u_26, (copy) v_u_21, (copy) v_u_19, (copy) v_u_81, (copy) v_u_4, (copy) v_u_5
	local v_u_84 = v_u_22
	if not v_u_84 then
		local v85 = p_u_82.TextChatService
		local v86, _ = pcall(function()
			local _ = Enum.ChatVersion.LegacyChatService
		end)
		if v86 and v85.ChatVersion == Enum.ChatVersion.TextChatService and true or false then
			return
		end
	end
	local v_u_87 = false
	local function v96() -- name: chatFunc
		-- upvalues: (ref) v_u_87, (copy) p_u_82, (ref) v_u_6, (copy) v_u_84, (ref) v_u_72, (ref) v_u_20, (ref) v_u_10, (ref) v_u_23
		if v_u_87 then
			return
		end
		if p_u_82.CloseMenuFunc then
			p_u_82:CloseMenuFunc()
		end
		v_u_6:ReportCounter("AvatarContextMenu-Chat")
		local v88 = v_u_6
		local v89 = game.PlaceId
		v88:TrackEvent("Game", "AvatarContextMenuChat", "placeId: " .. tostring(v89))
		if v_u_84 then
			local v90 = p_u_82.TextChatService
			local v91, _ = pcall(function()
				local _ = Enum.ChatVersion.LegacyChatService
			end)
			if v91 and v90.ChatVersion == Enum.ChatVersion.TextChatService and true or false then
				local v_u_92 = v_u_72()
				if v_u_92 then
					task.spawn(function()
						-- upvalues: (copy) v_u_92, (ref) p_u_82
						v_u_92:SendAsync("/w @" .. p_u_82.SelectedPlayer.Name)
					end)
					if v_u_20.Events and v_u_20.Events.AvatarContextMenuWhisperSelected then
						v_u_20.Events.AvatarContextMenuWhisperSelected()
						return
					end
				end
				return
			end
		end
		local v93 = require(v_u_10.Modules.ChatSelector)
		v93:SetVisible(true)
		if not v93:EnterWhisperState(p_u_82.SelectedPlayer) then
			local v_u_94 = nil
			local function v95()
				-- upvalues: (ref) v_u_94, (ref) v_u_23
				v_u_94 = v_u_23.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
			end
			pcall(v95)
			if v_u_94 then
				v_u_94.Text = "/w " .. p_u_82.SelectedPlayer.Name
			end
			v93:FocusChatBar()
		end
	end
	local v97, v98 = v_u_15:MakeStyledButton("ChatStatus", v_u_12:FormatByKey("Corescripts.AvatarContextMenu.Chat"), UDim2.new(0.96, 0, 0, 52), v96, v_u_16:GetTheme())
	v97.LayoutOrder = v_u_26 + 3
	local v99
	if v_u_21 then
		v_u_19.assert(v_u_81(p83))
		v99 = p83.localPlayerChatEnabled
	else
		local function v100()
			-- upvalues: (ref) v_u_4, (ref) v_u_23
			return v_u_4:CanUserChatAsync(v_u_23.UserId)
		end
		local v101
		v99, v101 = pcall(v100)
		if v99 then
			v99 = v_u_5:IsStudio() or v101
		end
	end
	if v99 then
		v97.Parent = p_u_82.MenuItemFrame
		local v102
		if v_u_21 then
			v102 = p83.localPlayerCanChatWithSelectedPlayer
		else
			v102 = v_u_15:GetCanChatWith(p_u_82.SelectedPlayer)
		end
		if not v102 then
			v_u_87 = true
			v97.Selectable = false
			v98.TextTransparency = 0.75
			v98.Text = v_u_12:FormatByKey("Corescripts.AvatarContextMenu.ChatDisabled")
		end
	else
		v97.Parent = nil
	end
end
function v_u_27.RemoveLastButtonUnderline(p103) -- name: RemoveLastButtonUnderline
	local v104 = p103.MenuItemFrame:GetChildren()
	local v105 = -1
	local v106 = nil
	for _, v107 in pairs(v104) do
		if not v107:IsA("GuiObject") or v105 >= v107.LayoutOrder then
			continue
		end
		v105 = v107.LayoutOrder
		v106 = v107
	end
	local v108 = v106 and v106:FindFirstChild("Underline")
	if v108 then
		v108:Destroy()
	end
end
function v_u_27.BuildContextMenuItems(p109, p110, p111) -- name: BuildContextMenuItems
	-- upvalues: (copy) v_u_15, (copy) v_u_17, (copy) v_u_24
	if p110 then
		local v112 = v_u_15:GetFriendStatus(p110)
		local v113 = v_u_17:IsPlayerBlockedByUserId(p110.UserId)
		p109:ClearMenuItems()
		p109:SetSelectedPlayer(p110)
		if v_u_24[Enum.AvatarContextMenuOption.Friend] then
			p109:CreateFriendButton(v112, v113)
		end
		if v_u_24[Enum.AvatarContextMenuOption.Chat] then
			p109:CreateChatButton(p111)
		end
		if v_u_24[Enum.AvatarContextMenuOption.Emote] then
			p109:CreateEmoteButton()
		end
		if v_u_24[Enum.AvatarContextMenuOption.InspectMenu] then
			p109:CreateInspectAndBuyButton()
		end
		p109:CreateCustomMenuItems()
		p109:RemoveLastButtonUnderline()
	end
end
function v_u_27.SetSelectedPlayer(p114, p115) -- name: SetSelectedPlayer
	p114.SelectedPlayer = p115
end
function v_u_27.SetCloseMenuFunc(p116, p117) -- name: SetCloseMenuFunc
	p116.CloseMenuFunc = p117
end
function v_u_27.new(p118, p119) -- name: new
	-- upvalues: (copy) v_u_27, (copy) v_u_9
	local v120 = v_u_27
	local v121 = setmetatable({}, v120)
	v121.MenuItemFrame = p118
	v121.SelectedPlayer = nil
	v121.TextChatService = p119 and p119.TextChatService or v_u_9
	v121:RegisterCoreMethods()
	v_u_27:UpdateInspectMenuEnabled()
	return v121
end
v_u_7.InspectMenuEnabledChangedSignal:Connect(function(p122)
	-- upvalues: (copy) v_u_27
	if p122 then
		v_u_27:EnableDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
	else
		v_u_27:RemoveDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
	end
end)
return v_u_27