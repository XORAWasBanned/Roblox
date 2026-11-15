-- Path: CoreGui.RobloxGui.Modules.PromptCreator
local v1 = {}
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("ContextActionService")
local v_u_5 = game:GetService("TextService")
local v_u_6 = game:GetService("GuiService")
local v_u_7 = game:DefineFastFlag("PromptCreatorTransientDialog", false)
local v_u_8 = v2:WaitForChild("RobloxGui")
local v9 = v_u_8:WaitForChild("Modules")
local v10 = require(v9:WaitForChild("TenFootInterface"))
local v11 = v9:WaitForChild("VR")
local v_u_12 = require(v11:WaitForChild("Dialog"))
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
function getViewportSize() -- name: getViewportSize
	while not game.Workspace.CurrentCamera do
		game.Workspace.Changed:Wait()
	end
	local v16 = game.Workspace.CurrentCamera
	assert(v16, "")
	while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or game.Workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
		game.Workspace.CurrentCamera.Changed:Wait()
	end
	return game.Workspace.CurrentCamera.ViewportSize
end
local v_u_17 = v10:IsEnabled()
local v_u_18 = false
local v_u_19
if v_u_3.TouchEnabled == true then
	v_u_19 = v_u_3.MouseEnabled == false
else
	v_u_19 = false
end
local v_u_20
if v_u_19 then
	v_u_20 = getViewportSize().Y <= 370
else
	v_u_20 = v_u_19
end
if v_u_19 then
	v_u_19 = not v_u_20
end
local v_u_21 = false
local v_u_22 = false
local v_u_23 = false
local v_u_24 = false
local v_u_25 = false
local v_u_26 = {
	["WindowTitle"] = "Confirm",
	["MainText"] = "Is this okay?",
	["ConfirmationText"] = "Confirm",
	["CancelText"] = "Cancel",
	["CancelActive"] = true,
	["StripeColor"] = nil,
	["Image"] = nil,
	["ImageConsoleVR"] = nil,
	["PromptCompletedCallback"] = nil,
	["StripeColor"] = Color3.new(0.01, 0.72, 0.34)
}
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = {}
local v_u_30 = UDim2.new(0, 438, 0, 300)
local v_u_31 = UDim2.new(0.5, -219, 0, -300)
local v_u_32 = UDim2.new(0.5, -219, 0.5, -150)
local v33 = 52
local v34 = 24
if v_u_17 or v_u_18 then
	v_u_30 = UDim2.new(1, 0, 0, 690)
	v_u_31 = UDim2.new(0, 0, 0, -690)
	v_u_32 = UDim2.new(0, 0, 0.5, -345)
elseif v_u_20 then
	v_u_30 = UDim2.new(0.9, 0, 0.9, 0)
	v_u_31 = UDim2.new(0.05, 0, -0.9, 0)
	v_u_32 = UDim2.new(0.05, 0, 0.05, 0)
elseif v_u_19 then
	v_u_30 = UDim2.new(0, 400, 0, 305)
	v_u_31 = UDim2.new(0.5, -200, 0, -305)
	v_u_32 = UDim2.new(0.5, -200, 0.5, -152)
end
local v_u_35 = v_u_20 and 44 or v33
local v_u_36 = (v_u_17 or v_u_18) and 42 or v34
local function v_u_43(p37, p38, p39, p40, p41) -- name: createFrame
	local v42 = Instance.new("Frame")
	v42.Name = p37
	v42.Size = p38
	v42.Position = p39 or UDim2.new(0, 0, 0, 0)
	v42.BackgroundTransparency = p40
	v42.BackgroundColor3 = p41 or Color3.new()
	v42.BorderSizePixel = 0
	v42.ZIndex = 8
	return v42
end
local function v_u_51(p44, p45, p46, p47, p48, p49) -- name: createTextLabel
	local v50 = Instance.new("TextLabel")
	v50.Name = p44
	v50.Size = p45 or UDim2.new(0, 0, 0, 0)
	v50.Position = p46
	v50.BackgroundTransparency = 1
	v50.Font = p47
	v50.TextSize = p48
	v50.TextColor3 = Color3.new(1, 1, 1)
	v50.Text = p49
	v50.ZIndex = 8
	return v50
end
local function v_u_64(p52, p53, p54, p55, p56, p57, p58) -- name: createScrollingTextLabel
	-- upvalues: (copy) v_u_51, (copy) v_u_5
	local v59 = v_u_51(p52, p53, p54, p55, p56, p57)
	v59.TextXAlignment = Enum.TextXAlignment.Left
	v59.TextYAlignment = Enum.TextYAlignment.Top
	v59.TextWrapped = true
	if v_u_5:GetTextSize(p57, p56, p55, Vector2.new(p53.X.Offset, 10000)).Y <= p53.Y.Offset then
		return v59
	end
	local v60 = Vector2.new(p53.X.Offset - (p58 + 20), 10000)
	local v61 = v_u_5:GetTextSize(p57, p56, p55, v60)
	local v_u_62 = Instance.new("Frame")
	v_u_62.Name = "ScrollingTextParent"
	v_u_62.BackgroundTransparency = 1
	v_u_62.BackgroundColor3 = Color3.new(1, 1, 1)
	v_u_62.BorderSizePixel = 0
	v_u_62.Position = p54
	v_u_62.Size = p53 - UDim2.new(0, p58 * 2, 0, 0)
	local v63 = Instance.new("ScrollingFrame")
	v63.Selectable = true
	v63.Name = "ScrollingFrame"
	v63.BackgroundTransparency = 1
	v63.BackgroundColor3 = Color3.new(1, 1, 1)
	v63.BorderSizePixel = 0
	v63.Position = UDim2.new(0, 0, 0, 0)
	v63.Size = p53
	v63.CanvasSize = UDim2.new(0, v60.X - p58 * 2, 0, v61.Y)
	v63.ScrollBarThickness = p58
	v63.SelectionImageObject = Instance.new("ImageLabel")
	v63.SelectionImageObject.Name = "EmptySelectionImage"
	v63.SelectionImageObject.BackgroundTransparency = 1
	v63.SelectionImageObject.Image = ""
	v63.Active = false
	v63.SelectionGained:connect(function()
		-- upvalues: (copy) v_u_62
		v_u_62.BackgroundTransparency = 0.15
	end)
	v63.SelectionLost:connect(function()
		-- upvalues: (copy) v_u_62
		v_u_62.BackgroundTransparency = 1
	end)
	v59.Position = UDim2.new(0, 10, 0, 0)
	v59.Size = UDim2.new(0, v60.X, 0, v61.Y)
	v59.Parent = v63
	v63.Parent = v_u_62
	return v_u_62
end
local function v_u_74(p65, p66, p67, p_u_68, p_u_69, p70, p71) -- name: createImageButtonWithText
	-- upvalues: (copy) v_u_51, (ref) v_u_36
	local v_u_72 = Instance.new("ImageButton")
	v_u_72.Name = p65
	v_u_72.Size = p66
	v_u_72.Position = p67
	v_u_72.Image = p_u_68
	v_u_72.BackgroundTransparency = 1
	v_u_72.AutoButtonColor = false
	v_u_72.ZIndex = 8
	v_u_72.Modal = true
	v_u_72.Selectable = true
	v_u_72.SelectionImageObject = Instance.new("ImageLabel")
	v_u_72.SelectionImageObject.Name = "EmptySelectionImage"
	v_u_72.SelectionImageObject.BackgroundTransparency = 1
	v_u_72.SelectionImageObject.Image = ""
	local v73 = v_u_51(p65 .. "Text", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), p71, v_u_36, p70)
	v73.ZIndex = 9
	v73.Parent = v_u_72
	v_u_72.MouseEnter:connect(function()
		-- upvalues: (copy) v_u_72, (copy) p_u_69
		v_u_72.Image = p_u_69
	end)
	v_u_72.MouseLeave:connect(function()
		-- upvalues: (copy) v_u_72, (copy) p_u_68
		v_u_72.Image = p_u_68
	end)
	v_u_72.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_72, (copy) p_u_68
		v_u_72.Image = p_u_68
	end)
	v_u_72.SelectionGained:connect(function()
		-- upvalues: (copy) v_u_72, (copy) p_u_69
		v_u_72.Image = p_u_69
	end)
	v_u_72.SelectionLost:connect(function()
		-- upvalues: (copy) v_u_72, (copy) p_u_68
		v_u_72.Image = p_u_68
	end)
	return v_u_72
end
local function v_u_75() -- name: createPromptDialog
	-- upvalues: (ref) v_u_14, (copy) v_u_43, (ref) v_u_30, (ref) v_u_31, (copy) v_u_8, (ref) v_u_15
	v_u_14 = v_u_43("PromptDialog", v_u_30, v_u_31, 1, nil)
	v_u_14.Visible = false
	v_u_14.Active = true
	v_u_14.Parent = v_u_8
	v_u_15 = v_u_43("ContainerFrame", UDim2.new(1, 0, 1, 0), nil, 0.36, Color3.new(0, 0, 0))
	v_u_15.ZIndex = 8
	v_u_15.Parent = v_u_14
end
function AddDefaultsToPromptOptions(p76, p77) -- name: AddDefaultsToPromptOptions
	for v78, v79 in pairs(p77) do
		if p76[v78] ~= nil then
			continue
		end
		p76[v78] = v79
	end
end
function CreatePromptVRorConsole(p80) -- name: CreatePromptVRorConsole
	-- upvalues: (ref) v_u_15, (copy) v_u_51, (copy) v_u_43, (copy) v_u_64, (copy) v_u_74
	local v81
	if p80.ImageConsoleVR then
		local v82 = UDim2.new(0, 600, 0, 600)
		local v83 = UDim2.new(0, 100, 0, 45)
		local v84 = p80.ImageConsoleVR
		local v85 = p80.FetchImageFunctionConsoleVR
		local v86 = Instance.new("ImageLabel")
		v86.Name = "Image"
		v86.Size = v82
		v86.BackgroundTransparency = 1
		v86.Position = v83
		v86.Image = v84
		if v85 then
			v85(v86)
		end
		v86.ZIndex = 9
		v86.Parent = v_u_15
		v81 = 800
	else
		v81 = 90
	end
	local v87 = v_u_51("WindowTitle", UDim2.new(0, 800, 0, 60), UDim2.new(0, v81, 0, 60), Enum.Font.SourceSansBold, 48, p80.WindowTitle)
	v87.TextXAlignment = Enum.TextXAlignment.Left
	v87.TextYAlignment = Enum.TextYAlignment.Center
	v87.Parent = v_u_15
	v87.ZIndex = 9
	local v88 = v_u_43("ColorStripe", UDim2.new(0, 832, 0, 4), UDim2.new(0, v81, 0, 120), 0, p80.StripeColor)
	v88.ZIndex = 9
	v88.Parent = v_u_15
	v_u_64("MainText", UDim2.new(0, 800, 0, 450), UDim2.new(0, v81, 0, 152), Enum.Font.SourceSansBold, 44, p80.MainText, 16).Parent = v_u_15
	local v89 = Rect.new(8, 8, 56, 56)
	local v90 = Enum.ScaleType.Slice
	local v91 = v_u_74("ConfirmButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, v81, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p80.ConfirmationText, Enum.Font.SourceSans)
	v91.Parent = v_u_15
	v91.ScaleType = v90
	v91.SliceCenter = v89
	v91.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	if p80.CancelActive then
		local v92 = v_u_74("CancelButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, v81 + 340, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p80.CancelText, Enum.Font.SourceSans)
		v92.Parent = v_u_15
		v92.ScaleType = v90
		v92.SliceCenter = v89
		v92.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
	end
end
function CreatePromptPCorTablet(p93) -- name: CreatePromptPCorTablet
	-- upvalues: (copy) v_u_51, (ref) v_u_35, (ref) v_u_15, (copy) v_u_43, (copy) v_u_19, (copy) v_u_64, (copy) v_u_74
	local v94 = v_u_51("WindowTitle", UDim2.new(1, 0, 0, v_u_35), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p93.WindowTitle)
	v94.Parent = v_u_15
	v94.ZIndex = 9
	local v95 = v_u_43("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p93.StripeColor)
	v95.Position = UDim2.new(0, 0, 0, v_u_35)
	v95.ZIndex = 9
	v95.Parent = v_u_15
	local v96
	if p93.Image then
		local v97 = UDim2.new(0, 150, 0, 150)
		local v98 = UDim2.new(0, 15, 0, v_u_35 + 17)
		local v99 = p93.Image
		local v100 = p93.FetchImageFunction
		local v101 = Instance.new("ImageLabel")
		v101.Name = "Image"
		v101.Size = v97
		v101.BackgroundTransparency = 1
		v101.Position = v98
		v101.Image = v99
		if v100 then
			v100(v101)
		end
		v101.ZIndex = 9
		v101.Parent = v_u_15
		if v_u_19 then
			v96 = v_u_64("MainText", UDim2.new(0, 195, 0, 150), UDim2.new(0, 185, 0, v_u_35 + 17), Enum.Font.SourceSansBold, 22, p93.MainText, 8)
		else
			v96 = v_u_64("MainText", UDim2.new(0, 233, 0, 150), UDim2.new(0, 185, 0, v_u_35 + 17), Enum.Font.SourceSansBold, 22, p93.MainText, 8)
		end
	elseif v_u_19 then
		v96 = v_u_64("MainText", UDim2.new(0, 360, 0, 150), UDim2.new(0, 20, 0, v_u_35 + 17), Enum.Font.SourceSansBold, 22, p93.MainText, 8)
	else
		v96 = v_u_64("MainText", UDim2.new(0, 398, 0, 150), UDim2.new(0, 20, 0, v_u_35 + 17), Enum.Font.SourceSansBold, 22, p93.MainText, 8)
	end
	v96.Parent = v_u_15
	local v102 = Rect.new(8, 8, 56, 56)
	local v103 = Enum.ScaleType.Slice
	local v104
	if v_u_19 then
		if p93.CancelActive then
			v104 = v_u_74("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p93.ConfirmationText, Enum.Font.SourceSansBold)
		else
			v104 = v_u_74("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p93.ConfirmationText, Enum.Font.SourceSans)
		end
	elseif p93.CancelActive then
		v104 = v_u_74("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -138, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p93.ConfirmationText, Enum.Font.SourceSansBold)
	else
		v104 = v_u_74("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -64, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p93.ConfirmationText, Enum.Font.SourceSans)
	end
	v104.Parent = v_u_15
	v104.ScaleType = v103
	v104.SliceCenter = v102
	v104.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	if p93.CancelActive then
		local v105
		if v_u_19 then
			v105 = v_u_74("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p93.CancelText, Enum.Font.SourceSans)
		else
			v105 = v_u_74("CancelButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, 10, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p93.CancelText, Enum.Font.SourceSans)
		end
		v105.Parent = v_u_15
		v105.ScaleType = v103
		v105.SliceCenter = v102
		v105.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
		v105.NextSelectionLeft = v104
		v104.NextSelectionRight = v105
	end
end
function CreatePromptPhone(p106) -- name: CreatePromptPhone
	-- upvalues: (copy) v_u_51, (ref) v_u_35, (ref) v_u_15, (copy) v_u_43, (copy) v_u_64, (copy) v_u_74
	local v107 = v_u_51("WindowTitle", UDim2.new(1, 0, 0, v_u_35), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p106.WindowTitle)
	v107.Parent = v_u_15
	v107.ZIndex = 9
	local v108 = v_u_43("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p106.StripeColor)
	v108.Position = UDim2.new(0, 0, 0, v_u_35)
	v108.ZIndex = 9
	v108.Parent = v_u_15
	local v109
	if p106.Image then
		local v110 = UDim2.new(0, 120, 0, 120)
		local v111 = UDim2.new(0, 15, 0, v_u_35 + 17)
		local v112 = p106.Image
		local v113 = p106.FetchImageFunction
		local v114 = Instance.new("ImageLabel")
		v114.Name = "Image"
		v114.Size = v110
		v114.BackgroundTransparency = 1
		v114.Position = v111
		v114.Image = v112
		if v113 then
			v113(v114)
		end
		v114.ZIndex = 9
		v114.Parent = v_u_15
		v109 = v_u_64("MainText", UDim2.new(0, v_u_15.AbsoluteSize.X - 175, 0, 120), UDim2.new(0, 155, 0, v_u_35 + 17), Enum.Font.SourceSansBold, 20, p106.MainText, 8)
	else
		v109 = v_u_64("MainText", UDim2.new(1, v_u_15.AbsoluteSize.X - 40, 0, 120), UDim2.new(0, 20, 0, v_u_35 + 17), Enum.Font.SourceSansBold, 20, p106.MainText, 8)
	end
	v109.Parent = v_u_15
	local v115 = Rect.new(8, 8, 56, 56)
	local v116 = Enum.ScaleType.Slice
	local v117
	if p106.CancelActive then
		v117 = v_u_74("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p106.ConfirmationText, Enum.Font.SourceSansBold)
	else
		v117 = v_u_74("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p106.ConfirmationText, Enum.Font.SourceSans)
	end
	v117.Parent = v_u_15
	v117.ScaleType = v116
	v117.SliceCenter = v115
	v117.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	if p106.CancelActive then
		local v118 = v_u_74("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p106.CancelText, Enum.Font.SourceSans)
		v118.Parent = v_u_15
		v118.ScaleType = v116
		v118.SliceCenter = v115
		v118.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
	end
end
function CreatePromptFromOptions(p119) -- name: CreatePromptFromOptions
	-- upvalues: (ref) v_u_15, (ref) v_u_18, (copy) v_u_17, (copy) v_u_20
	v_u_15:ClearAllChildren()
	if v_u_18 or v_u_17 then
		CreatePromptVRorConsole(p119)
		return
	elseif v_u_20 then
		CreatePromptPhone(p119)
	else
		CreatePromptPCorTablet(p119)
	end
end
function SetSelectedObject() -- name: SetSelectedObject
	-- upvalues: (ref) v_u_15, (copy) v_u_6
	local v120 = v_u_15:FindFirstChild("CancelButton")
	if v120 then
		v_u_6.SelectedCoreObject = v120
	else
		local v121 = v_u_15:FindFirstChild("ConfirmButton")
		if v121 then
			v_u_6.SelectedCoreObject = v121
		end
	end
end
function OnTweenInFinished() -- name: OnTweenInFinished
	-- upvalues: (ref) v_u_22, (copy) v_u_17
	if v_u_22 or v_u_17 then
		SetSelectedObject()
	end
end
function ConnectActiveEvents() -- name: ConnectActiveEvents
	-- upvalues: (ref) v_u_18, (ref) v_u_22, (ref) v_u_29, (copy) v_u_3, (copy) v_u_6, (ref) v_u_21, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25
	local function v128(p122) -- name: OnInputChanged
		-- upvalues: (ref) v_u_18, (ref) v_u_22
		local v123 = p122.UserInputType
		local v124 = Enum.UserInputType
		if v_u_18 or not valueInTable(v123, {
			v124.Gamepad1,
			v124.Gamepad2,
			v124.Gamepad3,
			v124.Gamepad4
		}) then
			v_u_22 = false
			return
		else
			if p122.KeyCode ~= Enum.KeyCode.Thumbstick1 and p122.KeyCode ~= Enum.KeyCode.Thumbstick2 then
				v_u_22 = true
				return
			end
			local v125 = p122.Position.X
			if math.abs(v125) > 0.1 then
				v_u_22 = true
				return
			else
				local v126 = p122.Position.Z
				if math.abs(v126) > 0.1 then
					v_u_22 = true
					return
				else
					local v127 = p122.Position.Y
					if math.abs(v127) > 0.1 then
						v_u_22 = true
					end
				end
			end
		end
	end
	local v129 = v_u_29
	local v130 = v_u_3.InputChanged
	table.insert(v129, v130:connect(v128))
	local v131 = v_u_29
	local v132 = v_u_3.InputBegan
	table.insert(v131, v132:connect(v128))
	local v133 = v_u_29
	local v134 = v_u_6.Changed
	local function v136(p135)
		-- upvalues: (ref) v_u_21, (ref) v_u_6, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25
		if v_u_21 then
			if p135 == "CoreGuiNavigationEnabled" then
				if v_u_6.CoreGuiNavigationEnabled ~= true then
					v_u_23 = v_u_6.CoreGuiNavigationEnabled
					v_u_6.CoreGuiNavigationEnabled = true
					return
				end
			elseif p135 == "GuiNavigationEnabled" then
				if v_u_6.GuiNavigationEnabled ~= false then
					v_u_24 = v_u_6.GuiNavigationEnabled
					v_u_6.GuiNavigationEnabled = false
					return
				end
			elseif p135 == "AutoSelectGuiEnabled" and v_u_6.AutoSelectGuiEnabled ~= false then
				v_u_25 = v_u_6.AutoSelectGuiEnabled
				v_u_6.AutoSelectGuiEnabled = false
			end
		end
	end
	table.insert(v133, v134:connect(v136))
end
function DisconnectActiveEvents() -- name: DisconnectActiveEvents
	-- upvalues: (ref) v_u_29
	for _, v137 in ipairs(v_u_29) do
		v137:Disconnect()
	end
	v_u_29 = {}
end
function ShowPrompt() -- name: ShowPrompt
	-- upvalues: (ref) v_u_14, (copy) v_u_17, (copy) v_u_3, (ref) v_u_18, (ref) v_u_13, (copy) v_u_12, (ref) v_u_32
	v_u_14.Visible = true
	if v_u_17 then
		v_u_3.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
	if v_u_18 then
		if not v_u_13 then
			v_u_13 = v_u_12.new()
		end
		v_u_14.Position = v_u_32
		v_u_13:SetContent(v_u_14)
		v_u_13:Show(true)
		DisableControllerMovement()
	else
		v_u_14:TweenPositionInternal(v_u_32, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished)
		DisableControllerMovement()
		EnableControllerInput()
	end
end
function HidePrompt() -- name: HidePrompt
	-- upvalues: (ref) v_u_21, (copy) v_u_6, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (copy) v_u_17, (copy) v_u_3, (copy) v_u_7, (ref) v_u_14, (ref) v_u_15, (ref) v_u_18, (ref) v_u_31, (ref) v_u_13
	local function v138() -- name: onClosed
		-- upvalues: (ref) v_u_21, (ref) v_u_6, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (ref) v_u_17, (ref) v_u_3, (ref) v_u_7, (ref) v_u_14, (ref) v_u_15
		v_u_21 = false
		v_u_6.CoreGuiNavigationEnabled = v_u_23
		v_u_6.GuiNavigationEnabled = v_u_24
		v_u_6.AutoSelectGuiEnabled = v_u_25
		v_u_6.SelectedCoreObject = nil
		if v_u_17 then
			v_u_3.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
		if v_u_7 then
			DisconnectActiveEvents()
			if v_u_14 then
				v_u_14:Destroy()
				v_u_14 = nil
				v_u_15 = nil
				return
			end
		else
			v_u_14.Visible = false
		end
	end
	if v_u_18 then
		v_u_14.Position = v_u_31
		if v_u_13 then
			v_u_13:Close()
		end
		v_u_21 = false
		v_u_6.CoreGuiNavigationEnabled = v_u_23
		v_u_6.GuiNavigationEnabled = v_u_24
		v_u_6.AutoSelectGuiEnabled = v_u_25
		v_u_6.SelectedCoreObject = nil
		if v_u_17 then
			v_u_3.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
		if not v_u_7 then
			v_u_14.Visible = false
			return
		end
		DisconnectActiveEvents()
		if v_u_14 then
			v_u_14:Destroy()
			v_u_14 = nil
			v_u_15 = nil
			return
		end
	else
		v_u_14:TweenPositionInternal(v_u_31, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, v138)
	end
end
function DoCreatePrompt(p139) -- name: DoCreatePrompt
	-- upvalues: (ref) v_u_27, (copy) v_u_26, (ref) v_u_28
	v_u_27 = p139.PromptCompletedCallback
	AddDefaultsToPromptOptions(p139, v_u_26)
	v_u_28 = p139
	CreatePromptFromOptions(p139)
	ShowPrompt()
end
function OnPromptEnded(p_u_140) -- name: OnPromptEnded
	-- upvalues: (ref) v_u_27, (ref) v_u_28
	if v_u_27 then
		if v_u_28.CancelActive then
			spawn(function()
				-- upvalues: (ref) v_u_27, (copy) p_u_140
				v_u_27(p_u_140)
			end)
		else
			spawn(function()
				-- upvalues: (ref) v_u_27
				v_u_27(true)
			end)
		end
	end
	HidePrompt()
	EnableControllerMovement()
	DisableControllerInput()
end
function NoOpFunc() -- name: NoOpFunc end
function EnableControllerMovement() -- name: EnableControllerMovement
	-- upvalues: (copy) v_u_4
	v_u_4:UnbindCoreAction("doNothingThumbstick2PromptCreator")
	v_u_4:UnbindCoreAction("doNothingAButtonPromptCreator")
end
function DisableControllerMovement() -- name: DisableControllerMovement
	-- upvalues: (copy) v_u_4
	v_u_4:BindCoreAction("doNothingThumbstick2PromptCreator", NoOpFunc, false, Enum.KeyCode.Thumbstick2)
	v_u_4:BindCoreAction("doNothingAButtonPromptCreator", NoOpFunc, false, Enum.KeyCode.ButtonA)
end
function EnableControllerInput() -- name: EnableControllerInput
	-- upvalues: (copy) v_u_4, (ref) v_u_28, (copy) v_u_6
	v_u_4:BindCoreAction("CoreScriptPromptCreatorCancel", function(_, p141, _)
		-- upvalues: (ref) v_u_28
		if p141 == Enum.UserInputState.Begin then
			if v_u_28.CancelActive then
				OnPromptEnded(false)
			end
		end
	end, false, Enum.KeyCode.ButtonB)
	v_u_4:BindCoreAction("CoreScriptPromptCreatorSelect", function(_, p142, _)
		-- upvalues: (ref) v_u_6
		if p142 == Enum.UserInputState.Begin then
			if v_u_6.SelectedCoreObject == nil then
				SetSelectedObject()
			end
		end
	end, false, Enum.KeyCode.ButtonSelect)
end
function DisableControllerInput() -- name: DisableControllerInput
	-- upvalues: (copy) v_u_4
	v_u_4:UnbindCoreAction("CoreScriptPromptCreatorCancel")
	v_u_4:UnbindCoreAction("CoreScriptPromptCreatorSelect")
end
function valueInTable(p143, p144) -- name: valueInTable
	for _, v145 in pairs(p144) do
		if v145 ~= p143 then
			continue
		end
		return true
	end
	return false
end
function SetupGamepadSelection() -- name: SetupGamepadSelection
	-- upvalues: (ref) v_u_23, (copy) v_u_6, (ref) v_u_24, (ref) v_u_25
	v_u_23 = v_u_6.CoreGuiNavigationEnabled
	v_u_24 = v_u_6.GuiNavigationEnabled
	v_u_25 = v_u_6.AutoSelectGuiEnabled
	v_u_6.SelectedCoreObject = nil
	v_u_6.CoreGuiNavigationEnabled = true
	v_u_6.GuiNavigationEnabled = false
	v_u_6.AutoSelectGuiEnabled = false
end
if not v_u_7 then
	v_u_75()
	local function v152(p146) -- name: OnInputChanged
		-- upvalues: (ref) v_u_18, (ref) v_u_22
		local v147 = p146.UserInputType
		local v148 = Enum.UserInputType
		if v_u_18 or not valueInTable(v147, {
			v148.Gamepad1,
			v148.Gamepad2,
			v148.Gamepad3,
			v148.Gamepad4
		}) then
			v_u_22 = false
			return
		else
			if p146.KeyCode ~= Enum.KeyCode.Thumbstick1 and p146.KeyCode ~= Enum.KeyCode.Thumbstick2 then
				v_u_22 = true
				return
			end
			local v149 = p146.Position.X
			if math.abs(v149) > 0.1 then
				v_u_22 = true
				return
			else
				local v150 = p146.Position.Z
				if math.abs(v150) > 0.1 then
					v_u_22 = true
					return
				else
					local v151 = p146.Position.Y
					if math.abs(v151) > 0.1 then
						v_u_22 = true
					end
				end
			end
		end
	end
	v_u_3.InputChanged:connect(v152)
	v_u_3.InputBegan:connect(v152)
	spawn(function()
		-- upvalues: (copy) v_u_3, (ref) v_u_13, (copy) v_u_12, (ref) v_u_14, (ref) v_u_18, (copy) v_u_8
		if v_u_3.VREnabled then
			if not v_u_13 then
				v_u_13 = v_u_12.new()
			end
			v_u_13:SetContent(v_u_14)
			v_u_18 = true
		else
			v_u_18 = false
			if v_u_13 then
				v_u_13:SetContent(nil)
			end
			v_u_14.Parent = v_u_8
		end
	end)
	v_u_3.Changed:connect(function(p153)
		-- upvalues: (copy) v_u_3, (ref) v_u_13, (copy) v_u_12, (ref) v_u_14, (ref) v_u_18, (copy) v_u_8
		if p153 == "VREnabled" then
			if v_u_3.VREnabled then
				if not v_u_13 then
					v_u_13 = v_u_12.new()
				end
				v_u_13:SetContent(v_u_14)
				v_u_18 = true
				return
			end
			v_u_18 = false
			if v_u_13 then
				v_u_13:SetContent(nil)
			end
			v_u_14.Parent = v_u_8
		end
	end)
	v_u_6.Changed:connect(function(p154)
		-- upvalues: (ref) v_u_21, (copy) v_u_6, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25
		if v_u_21 then
			if p154 == "CoreGuiNavigationEnabled" then
				if v_u_6.CoreGuiNavigationEnabled ~= true then
					v_u_23 = v_u_6.CoreGuiNavigationEnabled
					v_u_6.CoreGuiNavigationEnabled = true
					return
				end
			elseif p154 == "GuiNavigationEnabled" then
				if v_u_6.GuiNavigationEnabled ~= false then
					v_u_24 = v_u_6.GuiNavigationEnabled
					v_u_6.GuiNavigationEnabled = false
					return
				end
			elseif p154 == "AutoSelectGuiEnabled" and v_u_6.AutoSelectGuiEnabled ~= false then
				v_u_25 = v_u_6.AutoSelectGuiEnabled
				v_u_6.AutoSelectGuiEnabled = false
			end
		end
	end)
end
function v1.CreatePrompt(_, p155) -- name: CreatePrompt
	-- upvalues: (ref) v_u_21, (copy) v_u_7, (copy) v_u_75
	if v_u_21 then
		return false
	end
	v_u_21 = true
	if v_u_7 then
		v_u_75()
		ConnectActiveEvents()
	end
	SetupGamepadSelection()
	DoCreatePrompt(p155)
	return true
end
function v1.IsCurrentlyPrompting(_) -- name: IsCurrentlyPrompting
	-- upvalues: (ref) v_u_21
	return v_u_21
end
return v1