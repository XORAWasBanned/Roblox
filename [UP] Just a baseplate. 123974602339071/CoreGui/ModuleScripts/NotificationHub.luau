-- Path: CoreGui.RobloxGui.Modules.VR.NotificationHub
local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v4 = v2:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.Settings.Utility)
local v_u_6 = require(v3.Workspace.Packages.VrCommon).Panel3D
local v_u_7 = require(v3.Workspace.Packages.VrCommon).VRHub
local v_u_8 = require(v3.Workspace.Packages.AppCommonLib).Create
local _ = CFrame.Angles(-0.08726646259971647, 0, 0) * CFrame.new(0, 4, 0) * CFrame.Angles(-0.2617993877991494, 0, 0)
local v_u_9 = Color3.new(0.3058823529411765, 0.32941176470588235, 0.3764705882352941)
local v_u_10 = Color3.new(0.3215686274509804, 0.396078431372549, 0.5529411764705883)
local v_u_11 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196)
local v_u_12 = Color3.new(0.2, 0.2, 0.2)
local v_u_13 = v_u_8("ImageLabel")({
	["BackgroundTransparency"] = 1,
	["Image"] = ""
})
local v_u_14 = Color3.new(1, 1, 1)
local v_u_15 = {
	["ModuleName"] = "Notifications",
	["KeepVRTopbarOpen"] = true,
	["VRIsExclusive"] = true,
	["VRClosesNonExclusive"] = true,
	["UnreadCountChanged"] = function(...) end,
	["SetVisible"] = nil
}
v_u_7:RegisterModule(v_u_15)
local v_u_16 = v_u_6.Get("Notifications")
local v_u_17 = v_u_6.Get("NotificationDetails")
local v18 = {}
local v_u_19 = {}
local v_u_20 = {
	["__index"] = v18
}
function v18.new(p21, p22, p23) -- name: new
	-- upvalues: (copy) v_u_19, (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_11, (copy) v_u_20
	local v_u_24 = {}
	local v25 = v_u_19
	table.insert(v25, v_u_24)
	v_u_24.zeroCF = p21.localCF
	v_u_24.zOffset = 0
	v_u_24.isPopping = false
	v_u_24.isAnimating = false
	v_u_24.tweener = nil
	v_u_24.panel = p21
	v_u_24.SetPopOut = nil
	function v_u_24.panel.OnMouseEnter()
		-- upvalues: (ref) v_u_19, (copy) v_u_24
		for _, v26 in pairs(v_u_19) do
			if v26 == v_u_24 then
				continue
			end
			v26:SetPopOut(false)
		end
		v_u_24:SetPopOut(true)
	end
	v_u_24.titlebar = v_u_8("ImageLabel")({
		["Parent"] = nil,
		["Name"] = "TitlebarBackground",
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		["ImageColor3"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["Parent"] = p22,
		["Position"] = UDim2.new(0, -1, 0, -1),
		["Size"] = UDim2.new(1, 2, 0, 74),
		["ImageColor3"] = v_u_9,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(10, 10, 10, 10)
	})
	v_u_24.titleText = v_u_8("TextLabel")({
		["Parent"] = nil,
		["Name"] = "TitleText",
		["Position"] = nil,
		["Size"] = nil,
		["Text"] = nil,
		["TextColor3"] = nil,
		["Font"] = nil,
		["FontSize"] = nil,
		["BackgroundTransparency"] = 1,
		["Parent"] = v_u_24.titlebar,
		["Position"] = UDim2.new(0, 1, 0, 1),
		["Size"] = UDim2.new(1, -2, 1, -2),
		["Text"] = p23,
		["TextColor3"] = v_u_14,
		["Font"] = Enum.Font.SourceSans,
		["FontSize"] = Enum.FontSize.Size36
	})
	v_u_24.content = v_u_8("ImageLabel")({
		["Parent"] = nil,
		["Name"] = "ContentFrame",
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		["ImageColor3"] = nil,
		["ImageTransparency"] = 0.5,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["Parent"] = p22,
		["Position"] = UDim2.new(0, -1, 0, 74),
		["Size"] = UDim2.new(1, 2, 1, -76),
		["ImageColor3"] = v_u_11,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(10, 10, 10, 10)
	})
	local v27 = v_u_20
	return setmetatable(v_u_24, v27)
end
function v18.SetTitle(p28, p29) -- name: SetTitle
	p28.titleText.Text = p29
end
function v18.AddCloseButton(p30, p31) -- name: AddCloseButton
	-- upvalues: (copy) v_u_8
	local v32 = v_u_8("ImageButton")
	local v33 = {
		["Parent"] = nil,
		["Name"] = "CloseButton",
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/Keyboard/close_button_icon.png",
		["SelectionImageObject"] = nil,
		["Parent"] = p30.titlebar,
		["Position"] = UDim2.new(0, 22, 0, 22),
		["Size"] = UDim2.new(0, 32, 0, 32),
		["SelectionImageObject"] = v_u_8("ImageButton")({
			["Name"] = "CloseButtonHover",
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/Keyboard/close_button_selection.png",
			["Position"] = UDim2.new(0, -11, 0, -11),
			["Size"] = UDim2.new(1, 22, 1, 22)
		})
	}
	p30.closeButton = v32(v33)
	p30.closeButton.MouseButton1Click:connect(p31)
end
function v18.TweenZOffsetTo(p34, p35, p36, p37, p38) -- name: TweenZOffsetTo
	-- upvalues: (copy) v_u_5
	if p34.tweener and not p34.tweener:IsFinished() then
		p34.tweener:Cancel()
	end
	p34.tweener = v_u_5:TweenProperty(p34, "zOffset", p34.zOffset, p35, p36, p37, p38)
end
function v18.AnimateOut(p_u_39, p_u_40) -- name: AnimateOut
	-- upvalues: (copy) v_u_5
	p_u_39.isAnimating = true
	p_u_39:TweenZOffsetTo(-100, 0.25, v_u_5:GetEaseInOutQuad(), function()
		-- upvalues: (copy) p_u_40, (copy) p_u_39
		if p_u_40 then
			p_u_40()
		end
		p_u_39.isAnimating = false
	end)
end
function v18.AnimateIn(p_u_41, p_u_42) -- name: AnimateIn
	-- upvalues: (copy) v_u_5
	p_u_41.zOffset = -100
	p_u_41:OnUpdate(0)
	p_u_41.isAnimating = true
	p_u_41:TweenZOffsetTo(0, 0.25, v_u_5:GetEaseInOutQuad(), function()
		-- upvalues: (copy) p_u_42, (copy) p_u_41
		if p_u_42 then
			p_u_42()
		end
		p_u_41.isAnimating = false
	end)
end
function v18.SetPopOut(p_u_43, p44) -- name: SetPopOut
	-- upvalues: (copy) v_u_5
	if p_u_43.isAnimating then
		return
	elseif p44 then
		p_u_43.isPopping = true
		p_u_43:TweenZOffsetTo(0.25, 0.25, v_u_5:GetEaseInOutQuad(), function()
			-- upvalues: (copy) p_u_43
			p_u_43.isPopping = false
		end)
	else
		p_u_43.isPopping = true
		p_u_43:TweenZOffsetTo(0, 0.25, v_u_5:GetEaseInOutQuad(), function()
			-- upvalues: (copy) p_u_43
			p_u_43.isPopping = false
		end)
	end
end
function v18.OnUpdate(p45, _) -- name: OnUpdate
	-- upvalues: (copy) v_u_9, (copy) v_u_10
	p45.panel.localCF = p45.zeroCF * CFrame.new(0, 0, p45.zOffset)
	p45.panel.needsLocalPositionUpdate = p45.isAnimating or p45.isPopping
	if p45.isPopping then
		local v46 = p45.zOffset / 0.25
		local v47 = math.min(1, v46)
		local v48 = math.max(0, v47)
		p45.titlebar.ImageColor3 = v_u_9:lerp(v_u_10, v48)
	end
end
v_u_16:SetType(v_u_6.Type.Standard)
v_u_16:SetVisible(false)
v_u_16:SetCanFade(false)
v_u_16:ResizeStuds(2.277333324, 3.5, 150)
local v49 = v_u_8("TextButton")({
	["Parent"] = nil,
	["Name"] = "NotificationsListFrame",
	["Position"] = nil,
	["Size"] = nil,
	["BackgroundTransparency"] = 1,
	["Text"] = "",
	["Selectable"] = true,
	["SelectionImageObject"] = nil,
	["Parent"] = v_u_16:GetGUI(),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["Size"] = UDim2.new(1, -4, 1, 0),
	["SelectionImageObject"] = v_u_13
})
local v_u_50 = v18.new(v_u_16, v49, "Notifications")
v_u_50:AddCloseButton(function()
	-- upvalues: (copy) v_u_15
	v_u_15:SetVisible(false)
end)
function v_u_16.OnUpdate(_, p51) -- name: OnUpdate
	-- upvalues: (ref) v_u_50
	v_u_50:OnUpdate(p51)
end
v_u_17:SetType(v_u_6.Type.Standard)
v_u_17:SetVisible(false)
v_u_17:SetCanFade(false)
v_u_17:ResizeStuds(3.4159999859999997, 3.5, 150)
local v52 = v_u_8("TextButton")({
	["Parent"] = nil,
	["Name"] = "NotificationsDetailFrame",
	["Position"] = nil,
	["Size"] = nil,
	["BackgroundTransparency"] = 1,
	["Text"] = "",
	["Selectable"] = true,
	["SelectionImageObject"] = nil,
	["Parent"] = v_u_17:GetGUI(),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["Size"] = UDim2.new(1, 0, 1, 0),
	["SelectionImageObject"] = v_u_13
})
local v_u_53 = v18.new(v_u_17, v52, "Friend Requests")
function v_u_17.OnUpdate(_, p54) -- name: OnUpdate
	-- upvalues: (ref) v_u_53
	v_u_53:OnUpdate(p54)
end
local v_u_55 = {}
local v_u_56 = {}
local function v59(p57, p58) -- name: groupSort
	return p57.order < p58.order
end
local v_u_60 = nil
local function v_u_77() -- name: layoutNotificationsGroups
	-- upvalues: (copy) v_u_56, (copy) v_u_16, (ref) v_u_60
	local v61 = 20
	for _, v62 in ipairs(v_u_56) do
		if #v62.notifications <= 0 then
			continue
		end
		local v63 = #v62.notifications
		local v64 = (math.min(3, v63) - 1) * 20 + 80
		v62.frame.Position = UDim2.new(0.07500000000000001, 0, 0, v61)
		v62.frame.Size = UDim2.new(0.85, -40, 0, v64)
		v61 = v61 + v64 + 20
		if not v62.notificationsDirty then
			continue
		end
		v62.notificationsDirty = false
		local v65 = 0
		local v66 = 0
		local v67 = #v62.notifications
		if v67 <= 0 then
			continue
		end
		local v68 = v67 - 3 + 1
		local v69 = math.max(1, v68)
		for v70 = 1, v67 do
			local v71 = v62.notifications[v70]
			if v69 <= v70 then
				v71.frame.Visible = true
				v71.frame.Position = UDim2.new(0, v65, 0, v65)
				v65 = v65 + 20
				v_u_16:SetSubpanelDepth(v71.frame, v66)
				v66 = v66 + 0.25
			else
				v71.frame.Visible = false
			end
		end
		if v_u_60 ~= v62 then
			break
		end
		local v72 = v67 - 2 + 1
		local v73 = math.max(1, v72)
		local v74 = 0
		for v75 = 1, v67 do
			local v76 = v62.notifications[v75]
			if v73 <= v75 then
				v76.detailsFrame.Visible = true
				v76.detailsFrame.Position = UDim2.new(0, 20, v74, 20)
				v76.detailsFrame.Size = UDim2.new(1, -40, 0.5, -40)
				v74 = v74 + 0.5
			else
				v76.detailsFrame.Visible = false
			end
		end
	end
end
local v78 = {}
local v_u_79 = {
	["__index"] = v78
}
function v78.new(p80, p81, p82) -- name: new
	-- upvalues: (copy) v_u_79, (copy) v_u_8, (ref) v_u_50, (copy) v_u_55, (copy) v_u_56
	local v83 = v_u_79
	local v84 = setmetatable({}, v83)
	v84.key = p80
	v84.title = p81
	v84.order = p82
	v84.notifications = {}
	v84.notificationsDirty = false
	v84.frame = v_u_8("Frame")({
		["Parent"] = nil,
		["Name"] = "NotificationGroup",
		["BackgroundTransparency"] = 1,
		["Parent"] = v_u_50.content
	})
	v84.detailsFrame = v_u_8("Frame")({
		["Parent"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(1, 0, 1, 0)
	})
	v_u_55[p80] = v84
	local v85 = v_u_56
	table.insert(v85, v84)
	return v84
end
function v78.Deactivate(p86) -- name: Deactivate
	-- upvalues: (copy) v_u_17
	p86.detailsFrame.Parent = nil
	for _, v87 in pairs(p86.detailsFrame:GetChildren()) do
		v_u_17:RemoveSubpanel(v87)
	end
end
function v78.SwitchTo(p88) -- name: SwitchTo
	-- upvalues: (ref) v_u_53, (copy) v_u_55, (ref) v_u_60
	v_u_53:SetTitle(p88.title)
	for _, v89 in pairs(v_u_55) do
		if v89 == p88 then
			continue
		end
		v89:Deactivate()
	end
	p88.detailsFrame.Parent = v_u_53.content
	v_u_60 = p88
	p88.notificationsDirty = true
end
function v78.BringNotificationToFront(p90, p91) -- name: BringNotificationToFront
	-- upvalues: (ref) v_u_60, (copy) v_u_77
	if v_u_60 ~= p90 then
		p90:SwitchTo()
	end
	if #p90.notifications == 0 or p91 ~= p90.notifications[#p90.notifications] then
		for v92, v93 in ipairs(p90.notifications) do
			if v93 ~= p91 then
				continue
			end
			table.remove(p90.notifications, v92)
		end
		local v94 = p90.notifications
		table.insert(v94, p91)
		p90.notificationsDirty = true
		v_u_77()
	else
		v_u_77()
	end
end
function v78.RemoveNotification(p95, p96) -- name: RemoveNotification
	-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_77
	for v97, v98 in ipairs(p95.notifications) do
		if v98 ~= p96 then
			continue
		end
		table.remove(p95.notifications, v97)
		v_u_16:RemoveSubpanel(p96.frame)
		v_u_17:RemoveSubpanel(p96.detailsFrame)
		p96.detailsFrame:Destroy()
		p96.frame:Destroy()
		p95.notificationsDirty = true
		v_u_77()
		return
	end
end
function v78.GetTopNotification(p99) -- name: GetTopNotification
	local v100 = #p99.notifications
	if v100 <= 0 then
		return nil
	else
		return p99.notifications[v100]
	end
end
v78.new("Friends", "Friends", 1)
v78.new("BadgeAwards", "Badges", 2)
v78.new("PlayerPoints", "Points", 3)
if false then
	v78.new("Developer", "Other", 4)
end
table.sort(v_u_56, v59)
local function v_u_102(p101, ...) -- name: doCallback
	if p101 then
		if type(p101) == "function" then
			p101(...)
			return
		elseif p101:IsA("BindableEvent") then
			p101:Fire(...)
			return
		elseif p101:IsA("BindableFunction") then
			p101:Invoke(...)
		end
	else
		return
	end
end
local v_u_103 = {}
local v_u_104 = {
	["__index"] = v_u_103
}
function v_u_103.new(p105, p_u_106) -- name: new
	-- upvalues: (copy) v_u_104, (copy) v_u_8, (copy) v_u_13, (copy) v_u_12, (copy) v_u_14, (copy) v_u_17, (copy) v_u_102, (copy) v_u_77
	local v107 = v_u_104
	local v_u_108 = setmetatable({}, v107)
	v_u_108.group = p105
	v_u_108.frame = v_u_8("ImageButton")({
		["Parent"] = nil,
		["Size"] = nil,
		["SelectionImageObject"] = nil,
		["BackgroundTransparency"] = 1,
		["Parent"] = p105.frame,
		["Size"] = UDim2.new(1, 0, 0, 80),
		["SelectionImageObject"] = v_u_13
	})
	v_u_108.frame.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_108
		v_u_108:OnClicked()
	end)
	v_u_108.background = v_u_8("ImageLabel")({
		["Parent"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/vr/rectBackgroundWhite.png",
		["ImageColor3"] = nil,
		["ImageTransparency"] = 0.1,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["Parent"] = v_u_108.frame,
		["Position"] = UDim2.new(0, -1, 0, -1),
		["Size"] = UDim2.new(1, 2, 1, 2),
		["ImageColor3"] = v_u_12,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(10, 10, 10, 10)
	})
	v_u_108.imageBackground = v_u_8("ImageLabel")({
		["Parent"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/VR/circleWhite.png",
		["ImageColor3"] = nil,
		["Parent"] = v_u_108.frame,
		["Position"] = UDim2.new(0, 5, 0, 5),
		["Size"] = UDim2.new(0, 70, 0, 70),
		["ImageColor3"] = p_u_106.imgBackgroundColor or Color3.new(1, 1, 1)
	})
	v_u_108.image = v_u_8("ImageLabel")({
		["Parent"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["Parent"] = v_u_108.imageBackground,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Image"] = p_u_106.Image
	})
	local v109 = p_u_106.Text
	if p_u_106.Title and p_u_106.Text then
		v109 = ("%s\n%s"):format(p_u_106.Title, p_u_106.Text)
	end
	v_u_108.text = v_u_8("TextLabel")({
		["Parent"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["TextXAlignment"] = nil,
		["Text"] = nil,
		["TextWrapped"] = true,
		["Font"] = nil,
		["FontSize"] = nil,
		["TextColor3"] = nil,
		["Parent"] = v_u_108.frame,
		["Position"] = UDim2.new(0, 80, 0, 0),
		["Size"] = UDim2.new(1, -80, 1, 0),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Text"] = v109,
		["Font"] = Enum.Font.SourceSans,
		["FontSize"] = Enum.FontSize.Size18,
		["TextColor3"] = v_u_14
	})
	v_u_108.detailsFrame = v_u_8("Frame")({
		["Parent"] = nil,
		["BackgroundTransparency"] = 1,
		["Parent"] = p105.detailsFrame
	})
	v_u_108.detailsFrame.MouseEnter:connect(function()
		-- upvalues: (ref) v_u_17, (copy) v_u_108
		v_u_17:SetSubpanelDepth(v_u_108.detailsFrame, 0.25)
	end)
	v_u_108.detailsFrame.MouseLeave:connect(function()
		-- upvalues: (ref) v_u_17, (copy) v_u_108
		v_u_17:SetSubpanelDepth(v_u_108.detailsFrame, 0)
	end)
	v_u_108.detailsBackground = v_u_8("ImageLabel")({
		["Parent"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		["ImageColor3"] = nil,
		["ImageTransparency"] = 0.1,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["Parent"] = v_u_108.detailsFrame,
		["Position"] = UDim2.new(0, -1, 0, -1),
		["Size"] = UDim2.new(1, 2, 1, 2),
		["ImageColor3"] = Color3.new(0.2, 0.2, 0.2),
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(10, 10, 10, 10)
	})
	v_u_108.detailsIconBackground = v_u_8("ImageLabel")({
		["Parent"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/VR/circleWhite.png",
		["ImageColor3"] = nil,
		["Parent"] = v_u_108.detailsFrame,
		["Position"] = UDim2.new(0, 20, 0, 10),
		["Size"] = UDim2.new(0, 80, 0, 80),
		["ImageColor3"] = p_u_106.imgBackgroundColor or Color3.new(1, 1, 1)
	})
	v_u_108.detailsIcon = v_u_8("ImageLabel")({
		["Parent"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["Parent"] = v_u_108.detailsIconBackground,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Image"] = p_u_106.Image
	})
	local v110 = p_u_106.DetailText or p_u_106.Title
	v_u_108.detailsText = v_u_8("TextLabel")({
		["Parent"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextWrapped"] = true,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Font"] = nil,
		["FontSize"] = nil,
		["Parent"] = v_u_108.detailsFrame,
		["Position"] = UDim2.new(0, 110, 0, 10),
		["Size"] = UDim2.new(1, -120, 0, 90),
		["Text"] = v110,
		["TextColor3"] = v_u_14,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Font"] = Enum.Font.SourceSansBold,
		["FontSize"] = Enum.FontSize.Size36
	})
	local function v116(p111, p112, p113) -- name: createButton
		-- upvalues: (ref) v_u_8, (copy) v_u_108, (ref) v_u_13, (ref) v_u_14
		local v_u_114 = v_u_8("ImageButton")({
			["Parent"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["SelectionImageObject"] = nil,
			["Parent"] = v_u_108.detailsFrame,
			["Position"] = UDim2.new(p111, 0, 0.55, 0),
			["Size"] = UDim2.new(p112, 0, 0.29, 0),
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(8, 6, 46, 44),
			["SelectionImageObject"] = v_u_13
		})
		local v115 = v_u_8("TextLabel")({
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["TextColor3"] = nil,
			["Font"] = nil,
			["FontSize"] = nil,
			["Position"] = UDim2.new(0, 0, 0, 0),
			["Size"] = UDim2.new(1, 0, 1, -6),
			["Text"] = p113,
			["TextColor3"] = v_u_14,
			["Font"] = Enum.Font.SourceSansBold,
			["FontSize"] = Enum.FontSize.Size24
		})
		v115.Parent = v_u_114
		v_u_114.SelectionGained:connect(function()
			-- upvalues: (copy) v_u_114
			v_u_114.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
		end)
		v_u_114.SelectionLost:connect(function()
			-- upvalues: (copy) v_u_114
			v_u_114.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
		end)
		return v_u_114, v115
	end
	if p_u_106.Button1Text and p_u_106.Button2Text then
		local v117, v118 = v116(0.07, 0.415, p_u_106.Button1Text)
		v_u_108.detailsButton1 = v117
		v_u_108.detailsButton1Text = v118
		local v119, v120 = v116(0.511, 0.415, p_u_106.Button2Text)
		v_u_108.detailsButton2 = v119
		v_u_108.detailsButton2Text = v120
		v_u_108.detailsButton1.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_102, (copy) p_u_106, (copy) v_u_108
			v_u_102(p_u_106.Callback, p_u_106.Button1Text)
			v_u_108:Dismiss()
		end)
		v_u_108.detailsButton2.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_102, (copy) p_u_106, (copy) v_u_108
			v_u_102(p_u_106.Callback, p_u_106.Button2Text)
			v_u_108:Dismiss()
		end)
	elseif not p_u_106.button2Text then
		local v121, v122 = v116(0.07, 0.86, p_u_106.Button1Text or "Dismiss")
		v_u_108.detailsButton1 = v121
		v_u_108.detailsButton1Text = v122
		v_u_108.detailsButton1.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_102, (copy) p_u_106, (copy) v_u_108
			v_u_102(p_u_106.Callback, p_u_106.Button1Text)
			v_u_108:Dismiss()
		end)
	end
	local v123 = p105.notifications
	table.insert(v123, v_u_108)
	p105.notificationsDirty = true
	v_u_77()
	return v_u_108
end
function v_u_103.OnClicked(p124) -- name: OnClicked
	-- upvalues: (copy) v_u_77
	p124.group:SwitchTo()
	v_u_77()
end
function v_u_103.Dismiss(p125) -- name: Dismiss
	p125.group:RemoveNotification(p125)
end
local v_u_126 = {}
local v_u_127 = false
local v_u_128 = 0
v4:WaitForChild("SendNotificationInfo").Event:connect(function(p129)
	-- upvalues: (copy) v_u_55, (copy) v_u_103, (ref) v_u_127, (ref) v_u_128, (copy) v_u_15
	local v130 = p129.GroupName
	if v130 then
		v130 = v_u_55[p129.GroupName]
	end
	if not v130 then
		if true then
			return
		end
		v130 = v_u_55.Developer
	end
	v_u_103.new(v130, p129)
	if not v_u_127 then
		v_u_128 = v_u_128 + 1
		v_u_15.UnreadCountChanged(v_u_128)
	end
end)
local function v_u_132(_, p131, _) -- name: onMenuCloseShortcut
	-- upvalues: (copy) v_u_15
	if p131 == Enum.UserInputState.Begin then
		v_u_15:SetVisible(false)
	end
end
v_u_15.VisibilityStateChanged = v_u_8("BindableEvent")({
	["Name"] = "VisibilityStateChanged"
})
function v_u_15.GetNumberOfPendingNotifications(_) -- name: GetNumberOfPendingNotifications
	-- upvalues: (copy) v_u_126
	return #v_u_126
end
function v_u_15.IsVisible(_) -- name: IsVisible
	-- upvalues: (ref) v_u_127
	return v_u_127
end
function v_u_15.SetVisible(_, p133) -- name: SetVisible
	-- upvalues: (ref) v_u_127, (copy) v_u_6, (ref) v_u_128, (copy) v_u_15, (copy) v_u_16, (ref) v_u_50, (copy) v_u_17, (ref) v_u_53, (copy) v_u_1, (copy) v_u_132, (copy) v_u_7
	if v_u_127 ~= p133 then
		v_u_127 = p133
		v_u_6.Get("Topbar3D"):SetCanFade(not p133)
		if p133 then
			v_u_128 = 0
			v_u_15.UnreadCountChanged(v_u_128)
			v_u_16.localCF = CFrame.new(-1.7079999929999998, 0, 0)
			v_u_50.zeroCF = v_u_16.localCF
			v_u_50:AnimateIn(nil)
			v_u_17.localCF = CFrame.new(1.138666662, 0, 0)
			v_u_53.zeroCF = v_u_17.localCF
			v_u_53:AnimateIn(nil)
			v_u_16:SetVisible(true)
			v_u_17:SetVisible(true)
			v_u_1:BindCoreAction("NotificationsMenuCloseShortcut", v_u_132, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
			v_u_7:FireModuleOpened(v_u_15.ModuleName)
		else
			spawn(function()
				-- upvalues: (ref) v_u_50, (ref) v_u_16, (ref) v_u_53, (ref) v_u_17
				v_u_50:AnimateOut(function()
					-- upvalues: (ref) v_u_16
					v_u_16:SetVisible(false)
				end)
				v_u_53:AnimateOut(function()
					-- upvalues: (ref) v_u_17
					v_u_17:SetVisible(false)
				end)
			end)
			v_u_1:UnbindCoreAction("NotificationsMenuCloseShortcut")
			v_u_7:FireModuleClosed(v_u_15.ModuleName)
		end
		v_u_15.VisibilityStateChanged:Fire(p133)
	end
end
v_u_7.ModuleOpened.Event:connect(function(p134, _, _, _)
	-- upvalues: (copy) v_u_15
	if p134 ~= v_u_15.ModuleName then
		v_u_15:SetVisible(false)
	end
end)
return v_u_15