-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.BubbleChat.BubbleChat
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Chat")
local v_u_4 = game:GetService("TextService")
local v_u_5 = v_u_1.LocalPlayer
while v_u_5 == nil do
	v_u_1.ChildAdded:wait()
	v_u_5 = v_u_1.LocalPlayer
end
local v6 = v_u_5:WaitForChild("PlayerGui")
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeGameChatBubble")
end)
local v_u_9 = v7 and v8
local v10, v11 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixBubbleChatText")
end)
local v_u_12 = v10 and v11
local v13, v14 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta")
end)
local v_u_15 = v13 and v14
local v16, v17 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPreventOldBubbleChatOverlap")
end)
local v_u_18 = v16 and v17
local v_u_19 = Enum.Font.SourceSans
local v_u_20 = Enum.FontSize.Size24
local v_u_21 = 128 - utf8.len(utf8.nfcnormalize("...")) - 1
local v_u_22 = {
	["WHITE"] = "dub",
	["BLUE"] = "blu",
	["GREEN"] = "gre",
	["RED"] = "red"
}
local v_u_23 = Instance.new("ScreenGui")
v_u_23.Name = "BubbleChat"
v_u_23.ResetOnSpawn = false
v_u_23.Parent = v6
local function v_u_29() -- name: createFifo
	local v_u_24 = {
		["data"] = {}
	}
	local v_u_25 = Instance.new("BindableEvent")
	v_u_24.Emptied = v_u_25.Event
	function v_u_24.Size(_) -- name: Size
		-- upvalues: (copy) v_u_24
		return #v_u_24.data
	end
	function v_u_24.Empty(_) -- name: Empty
		-- upvalues: (copy) v_u_24
		return v_u_24:Size() <= 0
	end
	function v_u_24.PopFront(_) -- name: PopFront
		-- upvalues: (copy) v_u_24, (copy) v_u_25
		table.remove(v_u_24.data, 1)
		if v_u_24:Empty() then
			v_u_25:Fire()
		end
	end
	function v_u_24.Front(_) -- name: Front
		-- upvalues: (copy) v_u_24
		return v_u_24.data[1]
	end
	function v_u_24.Get(_, p26) -- name: Get
		-- upvalues: (copy) v_u_24
		return v_u_24.data[p26]
	end
	function v_u_24.PushBack(_, p27) -- name: PushBack
		-- upvalues: (copy) v_u_24
		local v28 = v_u_24.data
		table.insert(v28, p27)
	end
	function v_u_24.GetData(_) -- name: GetData
		-- upvalues: (copy) v_u_24
		return v_u_24.data
	end
	return v_u_24
end
local function v_u_38(p30, p31, p32) -- name: createChatLine
	local v37 = {
		["ComputeBubbleLifetime"] = function(_, p33, p34) -- name: ComputeBubbleLifetime
			if p34 then
				local v35 = utf8.len(utf8.nfcnormalize(p33)) / 75
				return 8 + 7 * math.min(v35, 1)
			else
				local v36 = utf8.len(utf8.nfcnormalize(p33)) / 75
				return 12 + 8 * math.min(v36, 1)
			end
		end,
		["Origin"] = nil,
		["RenderBubble"] = nil,
		["Message"] = p30
	}
	v37.BubbleDieDelay = v37:ComputeBubbleLifetime(p30, p32)
	v37.BubbleColor = p31
	v37.IsLocalPlayer = p32
	return v37
end
function createChatBubbleMain(p39, p40) -- name: createChatBubbleMain
	local v41 = Instance.new("ImageLabel")
	v41.Name = "ChatBubble"
	v41.ScaleType = Enum.ScaleType.Slice
	v41.SliceCenter = p40
	v41.Image = "rbxasset://textures/" .. tostring(p39) .. ".png"
	v41.BackgroundTransparency = 1
	v41.BorderSizePixel = 0
	v41.Size = UDim2.new(1, 0, 1, 0)
	v41.Position = UDim2.new(0, 0, 0, 0)
	return v41
end
function createChatBubbleTail(p42, p43) -- name: createChatBubbleTail
	local v44 = Instance.new("ImageLabel")
	v44.Name = "ChatBubbleTail"
	v44.Image = "rbxasset://textures/ui/dialog_tail.png"
	v44.BackgroundTransparency = 1
	v44.BorderSizePixel = 0
	v44.Position = p42
	v44.Size = p43
	return v44
end
function createChatBubbleWithTail(p45, p46, p47, p48) -- name: createChatBubbleWithTail
	local v49 = createChatBubbleMain(p45, p48)
	createChatBubbleTail(p46, p47).Parent = v49
	return v49
end
function createScaledChatBubbleWithTail(p50, p51, p52, p53) -- name: createScaledChatBubbleWithTail
	local v54 = createChatBubbleMain(p50, p53)
	local v55 = Instance.new("Frame")
	v55.Name = "ChatBubbleTailFrame"
	v55.BackgroundTransparency = 1
	v55.SizeConstraint = Enum.SizeConstraint.RelativeXX
	v55.Position = UDim2.new(0.5, 0, 1, 0)
	v55.Size = UDim2.new(p51, 0, p51, 0)
	v55.Parent = v54
	createChatBubbleTail(p52, UDim2.new(1, 0, 0.5, 0)).Parent = v55
	return v54
end
function createChatImposter(p56, p57, p58) -- name: createChatImposter
	local v59 = Instance.new("ImageLabel")
	v59.Name = "DialogPlaceholder"
	v59.Image = "rbxasset://textures/" .. tostring(p56) .. ".png"
	v59.BackgroundTransparency = 1
	v59.BorderSizePixel = 0
	v59.Position = UDim2.new(0, 0, -1.25, 0)
	v59.Size = UDim2.new(1, 0, 1, 0)
	local v60 = Instance.new("ImageLabel")
	v60.Name = "DotDotDot"
	v60.Image = "rbxasset://textures/" .. tostring(p57) .. ".png"
	v60.BackgroundTransparency = 1
	v60.BorderSizePixel = 0
	v60.Position = UDim2.new(0.001, 0, p58, 0)
	v60.Size = UDim2.new(1, 0, 0.7, 0)
	v60.Parent = v59
	return v59
end
local v_u_68 = {
	["ChatBubble"] = {},
	["ChatBubbleWithTail"] = {},
	["ScalingChatBubbleWithTail"] = {},
	["CharacterSortedMsg"] = (function() -- name: createMap
		-- upvalues: (copy) v_u_29
		local v_u_61 = {
			["data"] = {}
		}
		local v_u_62 = 0
		function v_u_61.Size(_) -- name: Size
			-- upvalues: (ref) v_u_62
			return v_u_62
		end
		function v_u_61.Erase(_, p63) -- name: Erase
			-- upvalues: (copy) v_u_61, (ref) v_u_62
			if v_u_61.data[p63] then
				v_u_62 = v_u_62 - 1
			end
			v_u_61.data[p63] = nil
		end
		function v_u_61.Set(_, p64, p65) -- name: Set
			-- upvalues: (copy) v_u_61, (ref) v_u_62
			v_u_61.data[p64] = p65
			if p65 then
				v_u_62 = v_u_62 + 1
			end
		end
		function v_u_61.Get(_, p_u_66) -- name: Get
			-- upvalues: (copy) v_u_61, (ref) v_u_29
			if p_u_66 then
				if not v_u_61.data[p_u_66] then
					v_u_61.data[p_u_66] = {
						["Fifo"] = v_u_29(),
						["BillboardGui"] = nil
					}
					local v_u_67 = nil
					v_u_67 = v_u_61.data[p_u_66].Fifo.Emptied:connect(function()
						-- upvalues: (ref) v_u_67, (ref) v_u_61, (copy) p_u_66
						v_u_67:disconnect()
						v_u_61:Erase(p_u_66)
					end)
				end
				return v_u_61.data[p_u_66]
			end
		end
		function v_u_61.GetData(_) -- name: GetData
			-- upvalues: (copy) v_u_61
			return v_u_61.data
		end
		return v_u_61
	end)()
}
local function v73(p69, p70, _, p71, p72) -- name: initChatBubbleType
	-- upvalues: (copy) v_u_68
	v_u_68.ChatBubble[p69] = createChatBubbleMain(p70, p72)
	v_u_68.ChatBubbleWithTail[p69] = createChatBubbleWithTail(p70, UDim2.new(0.5, -14, 1, p71 and -1 or 0), UDim2.new(0, 30, 0, 14), p72)
	v_u_68.ScalingChatBubbleWithTail[p69] = createScaledChatBubbleWithTail(p70, 0.5, UDim2.new(-0.5, 0, 0, p71 and -1 or 0), p72)
end
v73("dub", "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15))
v73("blu", "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33))
v73("red", "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33))
v73("gre", "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33))
function v_u_68.SanitizeChatLine(_, p74) -- name: SanitizeChatLine
	-- upvalues: (copy) v_u_21
	if v_u_21 >= utf8.len(utf8.nfcnormalize(p74)) then
		return p74
	end
	local v75 = utf8.offset(p74, v_u_21 + utf8.len(utf8.nfcnormalize("...")) + 1) - 1
	return string.sub(p74, 1, v75)
end
local function v_u_80(p76) -- name: createBillboardInstance
	-- upvalues: (copy) v_u_23, (copy) v_u_68
	local v_u_77 = Instance.new("BillboardGui")
	v_u_77.Adornee = p76
	v_u_77.Size = UDim2.new(0, 400, 0, 250)
	v_u_77.StudsOffset = Vector3.new(0, 1.5, 2)
	v_u_77.Parent = v_u_23
	local v_u_78 = Instance.new("Frame")
	v_u_78.Name = "BillboardFrame"
	v_u_78.Size = UDim2.new(1, 0, 1, 0)
	v_u_78.Position = UDim2.new(0, 0, -0.5, 0)
	v_u_78.BackgroundTransparency = 1
	v_u_78.Parent = v_u_77
	local v_u_79 = nil
	v_u_79 = v_u_78.ChildRemoved:connect(function()
		-- upvalues: (copy) v_u_78, (ref) v_u_79, (copy) v_u_77
		if #v_u_78:GetChildren() <= 1 then
			v_u_79:disconnect()
			v_u_77:Destroy()
		end
	end)
	v_u_68:CreateSmallTalkBubble("dub").Parent = v_u_78
	return v_u_77
end
function v_u_68.CreateBillboardGuiHelper(_, p81, p82) -- name: CreateBillboardGuiHelper
	-- upvalues: (copy) v_u_68, (copy) v_u_80
	if p81 and not v_u_68.CharacterSortedMsg:Get(p81).BillboardGui then
		if not p82 and p81:IsA("BasePart") then
			local v83 = v_u_80(p81)
			v_u_68.CharacterSortedMsg:Get(p81).BillboardGui = v83
			return
		end
		if p81:IsA("Model") then
			local v84 = p81:FindFirstChild("Head")
			if v84 and v84:IsA("BasePart") then
				local v85 = v_u_80(v84)
				v_u_68.CharacterSortedMsg:Get(p81).BillboardGui = v85
			end
		end
	end
end
function v_u_68.SetBillboardLODNear(_, p86) -- name: SetBillboardLODNear
	-- upvalues: (copy) v_u_1
	local v87 = p86.Adornee
	local v88
	if v87 and v_u_1.LocalPlayer.Character then
		v88 = v87:IsDescendantOf(v_u_1.LocalPlayer.Character)
	else
		v88 = nil
	end
	p86.Size = UDim2.new(0, 400, 0, 250)
	p86.StudsOffset = Vector3.new(0, v88 and 1.5 or 2.5, v88 and 2 or 0.1)
	p86.Enabled = true
	local v89 = p86.BillboardFrame:GetChildren()
	for v90 = 1, #v89 do
		v89[v90].Visible = true
	end
	p86.BillboardFrame.SmallTalkBubble.Visible = false
end
function v_u_68.SetBillboardLODDistant(_, p91) -- name: SetBillboardLODDistant
	-- upvalues: (copy) v_u_1
	local v92 = p91.Adornee
	local v93
	if v92 and v_u_1.LocalPlayer.Character then
		v93 = v92:IsDescendantOf(v_u_1.LocalPlayer.Character)
	else
		v93 = nil
	end
	p91.Size = UDim2.new(4, 0, 3, 0)
	p91.StudsOffset = Vector3.new(0, 3, v93 and 2 or 0.1)
	p91.Enabled = true
	local v94 = p91.BillboardFrame:GetChildren()
	for v95 = 1, #v94 do
		v94[v95].Visible = false
	end
	p91.BillboardFrame.SmallTalkBubble.Visible = true
end
function v_u_68.SetBillboardLODVeryFar(_, p96) -- name: SetBillboardLODVeryFar
	p96.Enabled = false
end
function v_u_68.SetBillboardGuiLOD(_, p97, p98) -- name: SetBillboardGuiLOD
	-- upvalues: (copy) v_u_68
	if p98 then
		if p98:IsA("Model") then
			p98 = p98:FindFirstChild("Head") or p98.PrimaryPart
		end
		local v99 = not p98 and 100000 or (p98.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude
		if v99 < 65 then
			v_u_68:SetBillboardLODNear(p97)
			return
		elseif v99 >= 65 and v99 < 100 then
			v_u_68:SetBillboardLODDistant(p97)
		else
			v_u_68:SetBillboardLODVeryFar(p97)
		end
	else
		return
	end
end
function v_u_68.CameraCFrameChanged(_) -- name: CameraCFrameChanged
	-- upvalues: (copy) v_u_68
	for v100, v101 in pairs(v_u_68.CharacterSortedMsg:GetData()) do
		local v102 = v101.BillboardGui
		if not v102 then
			continue
		end
		v_u_68:SetBillboardGuiLOD(v102, v100)
	end
end
function v_u_68.CreateBubbleText(_, p103, p104) -- name: CreateBubbleText
	-- upvalues: (ref) v_u_12, (copy) v_u_19, (copy) v_u_20
	local v105 = Instance.new("TextLabel")
	v105.Name = "BubbleText"
	v105.BackgroundTransparency = 1
	if v_u_12 then
		v105.Size = UDim2.fromScale(1, 1)
	else
		v105.Position = UDim2.new(0, 15, 0, 0)
		v105.Size = UDim2.new(1, -30, 1, 0)
	end
	v105.Font = v_u_19
	v105.ClipsDescendants = true
	v105.TextWrapped = true
	v105.FontSize = v_u_20
	v105.Text = p103
	v105.Visible = false
	v105.AutoLocalize = p104
	if v_u_12 then
		local v106 = Instance.new("UIPadding")
		v106.PaddingTop = UDim.new(0, 12)
		v106.PaddingRight = UDim.new(0, 12)
		v106.PaddingBottom = UDim.new(0, 12)
		v106.PaddingLeft = UDim.new(0, 12)
		v106.Parent = v105
	end
	return v105
end
function v_u_68.CreateSmallTalkBubble(_, p107) -- name: CreateSmallTalkBubble
	-- upvalues: (copy) v_u_68
	local v108 = v_u_68.ScalingChatBubbleWithTail[p107]:Clone()
	v108.Name = "SmallTalkBubble"
	v108.AnchorPoint = Vector2.new(0, 0.5)
	v108.Position = UDim2.new(0, 0, 0.5, 0)
	v108.Visible = false
	local v109 = v_u_68:CreateBubbleText("...")
	v109.TextScaled = true
	v109.TextWrapped = false
	v109.Visible = true
	v109.Parent = v108
	return v108
end
function v_u_68.UpdateChatLinesForOrigin(_, p110, p111) -- name: UpdateChatLinesForOrigin
	-- upvalues: (copy) v_u_68
	local v112 = v_u_68.CharacterSortedMsg:Get(p110).Fifo
	local v113 = v112:Size()
	local v114 = v112:GetData()
	if #v114 > 1 then
		for v115 = #v114 - 1, 1, -1 do
			local v116 = v114[v115].RenderBubble
			if not v116 then
				return
			end
			if v113 - v115 + 1 > 1 then
				local v117 = v116:FindFirstChild("ChatBubbleTail")
				if v117 then
					v117:Destroy()
				end
				local v118 = v116:FindFirstChild("BubbleText")
				if v118 then
					v118.TextTransparency = 0.5
				end
			end
			v116:TweenPosition(UDim2.new(v116.Position.X.Scale, v116.Position.X.Offset, 1, p111 - v116.Size.Y.Offset - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true)
			p111 = p111 - v116.Size.Y.Offset - 14
		end
	end
end
function v_u_68.DestroyBubble(_, p_u_119, p_u_120) -- name: DestroyBubble
	if p_u_119 then
		if p_u_119:Empty() then
			return
		else
			local v_u_121 = p_u_119:Front().RenderBubble
			if v_u_121 then
				spawn(function()
					-- upvalues: (copy) p_u_119, (copy) p_u_120, (ref) v_u_121
					while p_u_119:Front().RenderBubble ~= p_u_120 do
						wait()
					end
					v_u_121 = p_u_119:Front().RenderBubble
					local v122 = v_u_121:FindFirstChild("BubbleText")
					local v123 = v_u_121:FindFirstChild("ChatBubbleTail")
					while v_u_121 and v_u_121.ImageTransparency < 1 do
						local v124 = wait()
						if not v_u_121 then
							continue
						end
						local v125 = v124 * 1.5
						v_u_121.ImageTransparency = v_u_121.ImageTransparency + v125
						if v122 then
							v122.TextTransparency = v122.TextTransparency + v125
						end
						if not v123 then
							continue
						end
						v123.ImageTransparency = v123.ImageTransparency + v125
					end
					if v_u_121 then
						v_u_121:Destroy()
						p_u_119:PopFront()
					end
				end)
			else
				p_u_119:PopFront()
			end
		end
	else
		return
	end
end
function v_u_68.CreateChatLineRender(_, p126, p127, p128, p_u_129, p130) -- name: CreateChatLineRender
	-- upvalues: (copy) v_u_68, (copy) v_u_4, (copy) v_u_19, (ref) v_u_12
	if p126 then
		if not v_u_68.CharacterSortedMsg:Get(p126).BillboardGui then
			v_u_68:CreateBillboardGuiHelper(p126, p128)
		end
		local v131 = v_u_68.CharacterSortedMsg:Get(p126).BillboardGui
		if v131 then
			local v_u_132 = v_u_68.ChatBubbleWithTail[p127.BubbleColor]:Clone()
			v_u_132.Visible = false
			local v_u_133 = v_u_68:CreateBubbleText(p127.Message, p130)
			v_u_133.Parent = v_u_132
			v_u_132.Parent = v131.BillboardFrame
			p127.RenderBubble = v_u_132
			local v134 = v_u_4:GetTextSize(v_u_133.Text, 24, v_u_19, Vector2.new(400, 250))
			local v135 = v134.Y / 24
			if v_u_12 then
				local v136 = v134.X + 24
				local v137 = math.ceil(v136)
				local v138 = v135 * 34
				v_u_132.Size = UDim2.fromOffset(0, 0)
				v_u_132.Position = UDim2.fromScale(0.5, 1)
				v_u_132:TweenSizeAndPosition(UDim2.fromOffset(v137, v138), UDim2.new(0.5, -v137 / 2, 1, -v138), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
					-- upvalues: (copy) v_u_133
					v_u_133.Visible = true
				end)
				v_u_68:SetBillboardGuiLOD(v131, p127.Origin)
				v_u_68:UpdateChatLinesForOrigin(p127.Origin, -v138)
			else
				local v139 = (v134.X + 30) / 400
				local v140 = math.max(v139, 0.1)
				v_u_132.Size = UDim2.new(0, 0, 0, 0)
				v_u_132.Position = UDim2.new(0.5, 0, 1, 0)
				local v141 = v135 * 34
				v_u_132:TweenSizeAndPosition(UDim2.new(v140, 0, 0, v141), UDim2.new((1 - v140) / 2, 0, 1, -v141), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
					-- upvalues: (copy) v_u_133
					v_u_133.Visible = true
				end)
				v_u_68:SetBillboardGuiLOD(v131, p127.Origin)
				v_u_68:UpdateChatLinesForOrigin(p127.Origin, -v141)
			end
			delay(p127.BubbleDieDelay, function()
				-- upvalues: (ref) v_u_68, (copy) p_u_129, (copy) v_u_132
				v_u_68:DestroyBubble(p_u_129, v_u_132)
			end)
		end
	end
end
function v_u_68.OnPlayerChatMessage(_, p142, p143, _) -- name: OnPlayerChatMessage
	-- upvalues: (copy) v_u_68, (copy) v_u_1, (copy) v_u_38, (copy) v_u_22
	if v_u_68:BubbleChatEnabled() then
		local v144 = v_u_1.LocalPlayer
		local v145
		if v144 == nil then
			v145 = false
		else
			v145 = p142 ~= v144
		end
		local v146 = v_u_38(v_u_68:SanitizeChatLine(p143), v_u_22.WHITE, not v145)
		if p142 then
			v146.User = p142.Name
			v146.Origin = p142.Character
		end
		if p142 and v146.Origin then
			local v147 = v_u_68.CharacterSortedMsg:Get(v146.Origin).Fifo
			v147:PushBack(v146)
			v_u_68:CreateChatLineRender(p142.Character, v146, true, v147, false)
		end
	end
end
function v_u_68.OnGameChatMessage(_, p148, p149, p150) -- name: OnGameChatMessage
	-- upvalues: (ref) v_u_15, (ref) v_u_18, (copy) v_u_3, (copy) v_u_1, (copy) v_u_68, (copy) v_u_38, (copy) v_u_9
	if v_u_15 or v_u_18 and v_u_3.BubbleChatEnabled then
		return
	else
		local v151 = v_u_1.LocalPlayer
		local v152
		if v151 == nil then
			v152 = false
		else
			v152 = v151.Character ~= p148
		end
		local v153 = p150 == Enum.ChatColor.Blue and "blu" or (p150 == Enum.ChatColor.Green and "gre" or (p150 == Enum.ChatColor.Red and "red" or "dub"))
		local v154 = v_u_38(v_u_68:SanitizeChatLine(p149), v153, not v152)
		v154.Origin = p148
		v_u_68.CharacterSortedMsg:Get(v154.Origin).Fifo:PushBack(v154)
		if v_u_9 then
			v_u_68:CreateChatLineRender(p148, v154, false, v_u_68.CharacterSortedMsg:Get(v154.Origin).Fifo, true)
		else
			v_u_68:CreateChatLineRender(p148, v154, false, v_u_68.CharacterSortedMsg:Get(v154.Origin).Fifo, false)
		end
	end
end
function v_u_68.BubbleChatEnabled(_) -- name: BubbleChatEnabled
	-- upvalues: (ref) v_u_15, (ref) v_u_18, (copy) v_u_3, (copy) v_u_1
	if v_u_15 or v_u_18 and v_u_3.BubbleChatEnabled then
		return false
	end
	local v155 = v_u_3:FindFirstChild("ClientChatModules")
	local v156 = v155 and v155:FindFirstChild("ChatSettings")
	if v156 then
		local v157 = require(v156)
		if v157.BubbleChatEnabled ~= nil then
			return v157.BubbleChatEnabled
		end
	end
	return v_u_1.BubbleChat
end
function v_u_68.ShowOwnFilteredMessage(_) -- name: ShowOwnFilteredMessage
	-- upvalues: (copy) v_u_3
	local v158 = v_u_3:FindFirstChild("ClientChatModules")
	local v159 = v158 and v158:FindFirstChild("ChatSettings")
	if v159 then
		return require(v159).ShowUserOwnFilteredMessage
	else
		return false
	end
end
function findPlayer(p160) -- name: findPlayer
	-- upvalues: (copy) v_u_1
	for _, v161 in pairs(v_u_1:GetPlayers()) do
		if v161.Name ~= p160 then
			continue
		end
		return v161
	end
end
v_u_3.Chatted:connect(function(p162, p163, p164)
	-- upvalues: (copy) v_u_68
	v_u_68:OnGameChatMessage(p162, p163, p164)
end)
local v_u_165
if game.Workspace.CurrentCamera then
	v_u_165 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
		-- upvalues: (copy) v_u_68
		v_u_68:CameraCFrameChanged()
	end)
else
	v_u_165 = nil
end
game.Workspace.Changed:Connect(function(p166)
	-- upvalues: (ref) v_u_165, (copy) v_u_68
	if p166 == "CurrentCamera" then
		if v_u_165 then
			v_u_165:disconnect()
		end
		if game.Workspace.CurrentCamera then
			v_u_165 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
				-- upvalues: (ref) v_u_68
				v_u_68:CameraCFrameChanged()
			end)
		end
	end
end)
local v_u_167 = nil
function getAllowedMessageTypes() -- name: getAllowedMessageTypes
	-- upvalues: (ref) v_u_167, (copy) v_u_3
	if v_u_167 then
		return v_u_167
	end
	local v168 = v_u_3:FindFirstChild("ClientChatModules")
	if not v168 then
		return { "Message", "Whisper" }
	end
	local v169 = v168:FindFirstChild("ChatSettings")
	if v169 then
		local v170 = require(v169)
		if v170.BubbleChatMessageTypes then
			v_u_167 = v170.BubbleChatMessageTypes
			return v_u_167
		end
	end
	local v171 = v168:FindFirstChild("ChatConstants")
	if v171 then
		local v172 = require(v171)
		v_u_167 = { v172.MessageTypeDefault, v172.MessageTypeWhisper }
	end
	return v_u_167
end
function checkAllowedMessageType(p173) -- name: checkAllowedMessageType
	local v174 = getAllowedMessageTypes()
	for v175 = 1, #v174 do
		if v174[v175] ~= p173.MessageType then
			continue
		end
		return true
	end
	return false
end
local v176 = v2:WaitForChild("DefaultChatSystemChatEvents")
local v177 = v176:WaitForChild("OnMessageDoneFiltering")
v176:WaitForChild("OnNewMessage").OnClientEvent:connect(function(p178, _)
	-- upvalues: (ref) v_u_5, (copy) v_u_68
	if checkAllowedMessageType(p178) then
		local v179 = findPlayer(p178.FromSpeaker)
		if v179 then
			if p178.IsFiltered and p178.FromSpeaker ~= v_u_5.Name or p178.FromSpeaker == v_u_5.Name and not v_u_68:ShowOwnFilteredMessage() then
				v_u_68:OnPlayerChatMessage(v179, p178.Message, nil)
			end
		else
			return
		end
	else
		return
	end
end)
v177.OnClientEvent:connect(function(p180, _)
	-- upvalues: (ref) v_u_5, (copy) v_u_68
	if checkAllowedMessageType(p180) then
		local v181 = findPlayer(p180.FromSpeaker)
		if v181 then
			if p180.FromSpeaker ~= v_u_5.Name or v_u_68:ShowOwnFilteredMessage() then
				v_u_68:OnPlayerChatMessage(v181, p180.Message, nil)
			end
		else
			return
		end
	else
		return
	end
end)