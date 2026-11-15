-- Path: CoreGui.RobloxGui.Modules.Settings.Utility
local v_u_1 = require(script.Parent.Theme)
local v_u_2 = v_u_1.color("SELECTED_COLOR", Color3.fromRGB(0, 162, 255))
local v_u_3 = v_u_1.color("NON_SELECTED_COLOR", Color3.fromRGB(78, 84, 96))
local v_u_4 = v_u_1.color("ARROW_COLOR", Color3.fromRGB(204, 204, 204))
local v_u_5 = v_u_1.color("ARROW_COLOR_HOVER", Color3.fromRGB(255, 255, 255))
local v_u_6 = v_u_1.color("ARROW_COLOR_INACTIVE", Color3.fromRGB(150, 150, 150))
local v_u_7 = UDim.new(0, 14)
local v_u_8 = game:GetService("HttpService")
local v_u_9 = game:GetService("UserInputService")
local v_u_10 = game:GetService("GuiService")
local v_u_11 = game:GetService("RunService")
local v_u_12 = game:GetService("CoreGui")
local v_u_13 = v_u_12:FindFirstChild("RobloxGui")
local v_u_14 = game:GetService("ContextActionService")
local v_u_15 = game:GetService("VRService")
local v_u_16 = game:GetService("Workspace")
local v17 = game:GetService("CorePackages")
local v_u_18 = UserSettings():GetService("UserGameSettings")
local v19 = require(v_u_13.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local v_u_20 = game:DefineFastFlag("RepositionDropDownScrim", false)
local v_u_21 = require(v17.Workspace.Packages.SharedFlags).FFlagUIScaleEngineOptions
local v22 = v_u_13.Modules.Chrome
local v_u_23
if require(v17.Workspace.Packages.Chrome).Enabled() then
	v_u_23 = require(v22.Service)
else
	v_u_23 = nil
end
local v24 = require(v17.Packages.Signals)
local v_u_25 = require(v17.Workspace.Packages.Responsive)
local v_u_26 = require(v22.Flags).FFlagHideShortcutsWhileIemDropdownActive
local v_u_27 = game:GetEngineFeature("EnablePreferredTextSizeAccessGuiService")
local v_u_28 = require(v17.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_29 = game:DefineFastFlag("IncreaseLegacyPeopleRowButtonSize", false)
local v_u_30 = require(v17.Workspace.Packages.RobloxTranslator)
local v_u_31 = game:GetService("CorePackages")
local v32 = require(v_u_31.Workspace.Packages.AppCommonLib)
local v_u_33 = v32.Signal
local v_u_34 = v32.Create
local v_u_35 = require(v_u_31.Packages.BuilderIcons)
local v_u_36 = v_u_35.Migration
local v37 = require(v_u_31.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
local v_u_38 = require(v_u_13.Modules:WaitForChild("TenFootInterface")):IsEnabled()
if v_u_38 then
	v_u_38 = not v37
end
local v_u_40 = v24.createComputed(function(p39)
	-- upvalues: (copy) v_u_25
	return v_u_25.GetInputModeStore(p39).getLastInputType(p39) == v_u_25.Input.Touch
end)
local v_u_42 = v24.createComputed(function(p41)
	-- upvalues: (copy) v_u_25
	return v_u_25.GetInputModeStore(p41).getLastInputType(p41) == v_u_25.Input.Pointer
end)
local v_u_43 = {}
setmetatable(v_u_43, {
	["__mode"] = "k"
})
local v_u_44 = v_u_34("ImageLabel")({
	["Image"] = "",
	["BackgroundTransparency"] = 1
})
function clamp(p45, p46, p47) -- name: clamp
	local v48 = math.min(p46, p47)
	return math.max(p45, v48)
end
local function v_u_53(p49, p50, p51, p52) -- name: Linear
	if p52 <= p49 then
		return p50 + p51
	else
		return p51 * p49 / p52 + p50
	end
end
local function v_u_59(p54, p55, p56, p57) -- name: EaseOutQuad
	if p57 <= p54 then
		return p55 + p56
	end
	local v58 = p54 / p57
	return p55 - p56 * v58 * (v58 - 2)
end
local function v_u_65(p60, p61, p62, p63) -- name: EaseInOutQuad
	if p63 <= p60 then
		return p61 + p62
	else
		local v64 = p60 / p63
		if v64 < 0.5 then
			return 2 * p62 * v64 * v64 + p61
		else
			return p61 + p62 * (2 * (2 - v64) * v64 - 1)
		end
	end
end
function PropertyTweener(p_u_66, p_u_67, p_u_68, p_u_69, p_u_70, p_u_71, p_u_72) -- name: PropertyTweener
	-- upvalues: (copy) v_u_11
	local v_u_73 = {
		["StartTime"] = tick()
	}
	v_u_73.EndTime = v_u_73.StartTime + p_u_70
	v_u_73.Cancelled = false
	local v_u_74 = false
	local v_u_75 = 0
	p_u_66[p_u_67] = p_u_71(0, p_u_68, p_u_69 - p_u_68, p_u_70)
	coroutine.wrap(function()
		-- upvalues: (copy) v_u_73, (copy) p_u_66, (copy) p_u_67, (copy) p_u_71, (copy) p_u_68, (copy) p_u_69, (copy) p_u_70, (ref) v_u_75, (ref) v_u_11, (ref) v_u_74, (copy) p_u_72
		local v76 = tick()
		while v76 < v_u_73.EndTime and p_u_66 do
			if v_u_73.Cancelled then
				return
			end
			p_u_66[p_u_67] = p_u_71(v76 - v_u_73.StartTime, p_u_68, p_u_69 - p_u_68, p_u_70)
			v_u_75 = clamp(0, 1, (v76 - v_u_73.StartTime) / p_u_70)
			v_u_11.RenderStepped:Wait()
			v76 = tick()
		end
		if v_u_73.Cancelled == false and p_u_66 then
			if p_u_66 then
				p_u_66[p_u_67] = p_u_71(1, p_u_68, p_u_69 - p_u_68, 1)
			end
			v_u_74 = true
			v_u_75 = 1
			if p_u_72 then
				p_u_72()
			end
		end
	end)()
	function v_u_73.GetFinal(_) -- name: GetFinal
		-- upvalues: (copy) p_u_69
		return p_u_69
	end
	function v_u_73.GetPercentComplete(_) -- name: GetPercentComplete
		-- upvalues: (ref) v_u_75
		return v_u_75
	end
	function v_u_73.IsFinished(_) -- name: IsFinished
		-- upvalues: (ref) v_u_74
		return v_u_74
	end
	function v_u_73.Finish(p77) -- name: Finish
		-- upvalues: (ref) v_u_74, (copy) p_u_66, (copy) p_u_67, (copy) p_u_71, (copy) p_u_68, (copy) p_u_69, (ref) v_u_75, (copy) p_u_72
		if not v_u_74 then
			p77:Cancel()
			if p_u_66 then
				p_u_66[p_u_67] = p_u_71(1, p_u_68, p_u_69 - p_u_68, 1)
			end
			v_u_74 = true
			v_u_75 = 1
			if p_u_72 then
				p_u_72()
			end
		end
	end
	function v_u_73.Cancel(_) -- name: Cancel
		-- upvalues: (copy) v_u_73
		v_u_73.Cancelled = true
	end
	return v_u_73
end
local function v_u_87() -- name: CreateSignal
	local v78 = {}
	local v_u_79 = Instance.new("BindableEvent")
	local v_u_80 = nil
	local v_u_81 = nil
	function v78.fire(_, ...) -- name: fire
		-- upvalues: (ref) v_u_80, (ref) v_u_81, (copy) v_u_79
		v_u_80 = { ... }
		v_u_81 = select("#", ...)
		v_u_79:Fire()
	end
	function v78.connect(_, p_u_82) -- name: connect
		-- upvalues: (copy) v_u_79, (ref) v_u_80, (ref) v_u_81
		if not p_u_82 then
			error("connect(nil)", 2)
		end
		return v_u_79.Event:Connect(function()
			-- upvalues: (copy) p_u_82, (ref) v_u_80, (ref) v_u_81
			local v83 = v_u_80
			local v84 = v_u_81
			p_u_82(unpack(v83, 1, v84))
		end)
	end
	function v78.wait(_) -- name: wait
		-- upvalues: (copy) v_u_79, (ref) v_u_80, (ref) v_u_81
		v_u_79.Event:wait()
		if not v_u_80 then
			error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		end
		local v85 = v_u_80
		local v86 = v_u_81
		return unpack(v85, 1, v86)
	end
	return v78
end
local function v_u_94(p_u_88, p_u_89, p_u_90, p_u_91) -- name: addHoverState
	local function v92() -- name: onNormalButtonStateCallback
		-- upvalues: (copy) p_u_88, (copy) p_u_90, (copy) p_u_89
		if p_u_88.Active then
			p_u_90(p_u_89)
		end
	end
	local function v93() -- name: onHoverButtonStateCallback
		-- upvalues: (copy) p_u_88, (copy) p_u_91, (copy) p_u_89
		if p_u_88.Active then
			p_u_91(p_u_89)
		end
	end
	p_u_88.MouseEnter:Connect(v93)
	p_u_88.SelectionGained:Connect(v93)
	p_u_88.MouseLeave:Connect(v92)
	p_u_88.SelectionLost:Connect(v92)
	p_u_90(p_u_89)
end
local function v_u_99(p95, p96) -- name: addOnResizedCallback
	-- upvalues: (copy) v_u_43, (copy) v_u_10
	v_u_43[p95] = p96
	local v97
	if _G.__TESTEZ_RUNNING_TEST__ then
		v97 = Vector2.new(1024, 1024)
	else
		v97 = v_u_10:GetHardwareSafeViewport()
	end
	local v98
	if _G.__TESTEZ_RUNNING_TEST__ then
		v98 = Vector2.new(1024, 1024)
	else
		v98 = v_u_10:GetHardwareSafeViewport()
	end
	p96(v97, v98.Y > v98.X)
end
local v_u_100 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local function v_u_123(p101, p102, p_u_103, p_u_104, p_u_105, p106) -- name: MakeDefaultButton
	-- upvalues: (copy) v_u_34, (copy) v_u_1, (copy) v_u_100, (copy) v_u_9, (copy) v_u_10, (copy) v_u_15
	local v107 = v_u_34("ImageLabel")({
		["Image"] = "",
		["BackgroundTransparency"] = 1
	})
	local v108, v109
	if p101 == "DropDownFrame" then
		v108 = "ControlInputBackground"
		v109 = "ControlInputStroke"
	else
		v108 = "DefaultButton"
		v109 = "DefaultButtonStroke"
	end
	local v_u_110 = p106 == "ImageButton" and "ImageButton" or v108
	local v_u_111 = v_u_34("ImageButton")({
		["Name"] = nil,
		["AutoButtonColor"] = false,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["Size"] = nil,
		["ZIndex"] = 2,
		["SelectionImageObject"] = nil,
		["Name"] = p101 .. "Button",
		["BackgroundColor3"] = v_u_1.color(v_u_110),
		["BackgroundTransparency"] = v_u_1.transparency(v_u_110),
		["Size"] = p102,
		["SelectionImageObject"] = v107
	})
	v_u_34("UICorner")({
		["CornerRadius"] = v_u_1.DefaultCornerRadius,
		["Parent"] = v_u_111
	})
	local v112 = v_u_34("UIStroke")({
		["Name"] = "Border",
		["Color"] = nil,
		["Transparency"] = nil,
		["Thickness"] = nil,
		["Parent"] = nil,
		["Color"] = v_u_1.color(v109),
		["Transparency"] = v_u_1.transparency(v109),
		["Thickness"] = v_u_1.DefaultStokeThickness,
		["Parent"] = v_u_111
	})
	v_u_34("BoolValue")({
		["Name"] = "Enabled",
		["Parent"] = nil,
		["Value"] = true,
		["Parent"] = v_u_111
	})
	if p_u_103 then
		v_u_111.MouseButton1Click:Connect(function()
			-- upvalues: (copy) p_u_103, (ref) v_u_100, (ref) v_u_9
			p_u_103(v_u_100[v_u_9:GetLastInputType()] or false)
		end)
	else
		if v112 then
			v112.Enabled = false
		end
		v_u_111.Selectable = false
	end
	local v_u_113 = nil
	local function v115(p114) -- name: setRowRef
		-- upvalues: (ref) v_u_113
		v_u_113 = p114
	end
	local function v_u_118() -- name: selectButton
		-- upvalues: (copy) p_u_105, (copy) p_u_104, (ref) v_u_111, (ref) v_u_1, (ref) v_u_113
		local v116 = p_u_105
		if v116 == nil and p_u_104 then
			v116 = p_u_104.HubRef
		end
		if v116 and v116.Active or v116 == nil then
			v_u_111.BackgroundColor3 = v_u_1.color("DefaultButtonHover")
			v_u_111.BackgroundTransparency = v_u_1.transparency("DefaultButtonHover")
			local v117 = v_u_111
			if v_u_113 then
				v117 = v_u_113
			end
			if v116 then
				v116:ScrollToFrame(v117)
			end
		end
	end
	v_u_111.InputBegan:Connect(function(p119)
		-- upvalues: (ref) v_u_111, (copy) v_u_118
		if v_u_111.Selectable and (p119.UserInputType == Enum.UserInputType.MouseMovement or p119.UserInputType == Enum.UserInputType.Touch) then
			v_u_118()
		end
	end)
	v_u_111.InputEnded:Connect(function(p120)
		-- upvalues: (ref) v_u_111, (ref) v_u_10, (ref) v_u_1, (ref) v_u_110
		if v_u_111.Selectable and v_u_10.SelectedCoreObject ~= v_u_111 and (p120.UserInputType == Enum.UserInputType.MouseMovement or p120.UserInputType == Enum.UserInputType.Touch) then
			v_u_111.BackgroundColor3 = v_u_1.color(v_u_110)
			v_u_111.BackgroundTransparency = v_u_1.transparency(v_u_110)
		end
	end)
	v_u_111.SelectionGained:Connect(function()
		-- upvalues: (copy) v_u_118
		v_u_118()
	end)
	v_u_111.SelectionLost:Connect(function()
		-- upvalues: (ref) v_u_111, (ref) v_u_1, (ref) v_u_110
		v_u_111.BackgroundColor3 = v_u_1.color(v_u_110)
		v_u_111.BackgroundTransparency = v_u_1.transparency(v_u_110)
	end)
	v_u_10.Changed:Connect(function(p121)
		-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (ref) v_u_111, (ref) v_u_1, (ref) v_u_110, (copy) v_u_118
		if p121 == "SelectedCoreObject" then
			local v122
			if v_u_15.VREnabled then
				v122 = false
			else
				v122 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v122 then
				if v_u_10.SelectedCoreObject == nil or v_u_10.SelectedCoreObject ~= v_u_111 then
					v_u_111.BackgroundColor3 = v_u_1.color(v_u_110)
					v_u_111.BackgroundTransparency = v_u_1.transparency(v_u_110)
				elseif v_u_111.Selectable then
					v_u_118()
				end
			else
				return
			end
		else
			return
		end
	end)
	return v_u_111, v115
end
local function v_u_138(p124, p125, p126, p127, p128, p129) -- name: MakeButton
	-- upvalues: (copy) v_u_123, (copy) v_u_34, (copy) v_u_1, (copy) v_u_10, (copy) v_u_9, (copy) v_u_38, (copy) v_u_27
	local v130, v131 = v_u_123(p124, p126, p127, p128, p129)
	local v132 = v_u_34("TextLabel")({
		["Name"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = nil,
		["Position"] = nil,
		["TextColor3"] = nil,
		["TextTransparency"] = nil,
		["TextYAlignment"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["Text"] = nil,
		["TextScaled"] = false,
		["TextWrapped"] = true,
		["ZIndex"] = 2,
		["Parent"] = nil,
		["Name"] = p124 .. "TextLabel",
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["TextColor3"] = v_u_1.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)),
		["TextTransparency"] = v_u_1.transparency("WhiteButtonText", 0),
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["Font"] = v_u_1.font(Enum.Font.SourceSansBold, "Button"),
		["TextSize"] = v_u_1.textSize(24, "Button"),
		["Text"] = p125,
		["Parent"] = v130
	})
	local v_u_133 = Instance.new("UITextSizeConstraint", v132)
	local v134
	if _G.__TESTEZ_RUNNING_TEST__ then
		v134 = Vector2.new(1024, 1024)
	else
		v134 = v_u_10:GetHardwareSafeViewport()
	end
	local v135 = v_u_9.TouchEnabled
	if v135 then
		v135 = v134.Y < 500 and true or v134.X < 700
	end
	if v135 then
		v132.TextSize = v_u_1.textSize(18)
	elseif v_u_38 and (p124 ~= "FriendStatus" and p124 ~= "BlockButton") then
		v132.TextSize = v_u_1.textSize(36)
	end
	if v_u_27 then
		local v_u_136 = (v_u_10.PreferredTextSize.Value - 1) * 3
		v_u_133.MaxTextSize = v132.TextSize + v_u_136
		local v_u_137 = v132.TextSize
		v_u_10:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
			-- upvalues: (ref) v_u_136, (ref) v_u_10, (copy) v_u_133, (copy) v_u_137
			v_u_136 = (v_u_10.PreferredTextSize.Value - 1) * 3
			v_u_133.MaxTextSize = v_u_137 + v_u_136
		end)
	else
		v_u_133.MaxTextSize = v132.TextSize
	end
	return v130, v132, v131
end
local function v_u_157(p139, p140, p141, p142, p143, p144, p145, p146) -- name: MakeImageButton
	-- upvalues: (copy) v_u_123, (copy) v_u_36, (copy) v_u_1, (copy) v_u_34, (copy) v_u_29, (copy) v_u_35
	local v147 = p146 or "ImageButton"
	local v148, v149 = v_u_123(p139, p141, p143, p144, p145, v147)
	local v150 = nil
	local v151 = nil
	local v152 = v_u_36.uiblox[p140] or v_u_36.luaApps[p140]
	if not string.match(p140, "^rbxasset://") then
		p140 = v_u_1.Images[p140]
	end
	if typeof(p140) == "table" then
		v150 = p140.ImageRectOffset
		v151 = p140.ImageRectSize
		p140 = p140.Image
	end
	local v153
	if v152 then
		local v154 = v_u_34("TextLabel")
		local v155 = {
			["Name"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["TextSize"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["TextColor3"] = nil,
			["Text"] = nil,
			["FontFace"] = nil,
			["Parent"] = nil,
			["ZIndex"] = 2,
			["Name"] = p139 .. "TextLabel",
			["Size"] = p142
		}
		local v156
		if v_u_29 then
			v156 = p142.Y.Offset * 0.8571428571428571
		else
			v156 = p142.Y.Offset * 0.6666666666666666
		end
		v155.TextSize = v156
		v155.Position = UDim2.new(0.5, 0, 0.5, 0)
		v155.AnchorPoint = Vector2.new(0.5, 0.5)
		v155.TextColor3 = Color3.new(1, 1, 1)
		v155.Text = v152.name
		v155.FontFace = v_u_35.Font[v152.variant]
		v155.Parent = v148
		v153 = v154(v155)
	else
		v153 = v_u_34("ImageLabel")({
			["Name"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Image"] = nil,
			["ImageRectOffset"] = nil,
			["ImageRectSize"] = nil,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Name"] = p139 .. "ImageLabel",
			["Size"] = p142,
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Image"] = p140,
			["ImageRectOffset"] = v150,
			["ImageRectSize"] = v151,
			["Parent"] = v148
		})
	end
	if v147 == "ImageButton" then
		v148.Border.Thickness = 0
		v148.Border.Transparency = 1
	end
	return v148, v153, v149
end
local function v_u_168(p158, p159, p160, p161, p162, p163) -- name: AddButtonRow
	-- upvalues: (copy) v_u_138, (copy) v_u_34
	local v164, v165, v166 = v_u_138(p159, p160, p161, p162, p158, p163)
	local v167 = v_u_34("Frame")({
		["Name"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Parent"] = nil,
		["Name"] = p159 .. "Row",
		["Size"] = UDim2.new(1, 0, p161.Y.Scale, p161.Y.Offset),
		["Parent"] = p158.Page
	})
	v164.Parent = v167
	v164.AnchorPoint = Vector2.new(1, 0)
	v164.Position = UDim2.new(1, -20, 0, 0)
	return v167, v164, v165, v166
end
local function v_u_185(p169, p_u_170) -- name: MakeRoundedRectFocusState
	-- upvalues: (copy) v_u_34, (copy) v_u_7, (copy) v_u_1, (copy) v_u_11, (copy) v_u_18
	local v171 = v_u_34("Frame")({
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(1, 12, 1, 12),
		["Position"] = UDim2.fromOffset(-6, -6)
	})
	local v172 = {
		["CornerRadius"] = v_u_7,
		["Parent"] = v171
	}
	v_u_34("UICorner")(v172)
	local v173 = v_u_34("UIStroke")({
		["Color"] = nil,
		["Transparency"] = 0,
		["Thickness"] = 3,
		["Parent"] = nil,
		["Color"] = v_u_1.selectionCursor.AnimatedColor,
		["Parent"] = v171
	})
	local v_u_174 = v_u_34("UIGradient")({
		["Rotation"] = 0,
		["Color"] = nil,
		["Transparency"] = nil,
		["Parent"] = nil,
		["Color"] = v_u_1.selectionCursor.GradientColorSequence,
		["Transparency"] = v_u_1.selectionCursor.GradientTransparencySequence,
		["Parent"] = v173
	})
	v_u_11:UnbindFromRenderStep(p_u_170)
	v_u_11:BindToRenderStep(p_u_170, Enum.RenderPriority.Last.Value, function()
		-- upvalues: (copy) v_u_174, (ref) v_u_1, (ref) v_u_18
		local v175 = v_u_174.Rotation + 2
		local v176 = v_u_1.selectionCursor.GradientColorSequence
		local v177 = v_u_1.selectionCursor.GradientTransparencySequence
		if v_u_18.ReducedMotion then
			local v178 = math.rad(v175)
			local v179 = (math.sin(v178) + 1) / 2
			local v180 = v176.Keypoints[1].Value
			local v181 = v176.Keypoints[#v176.Keypoints].Value
			v176 = ColorSequence.new(v180:lerp(v181, v179))
			local v182 = v177.Keypoints[1].Value
			local v183 = v177.Keypoints[#v177.Keypoints].Value
			v177 = NumberSequence.new(v182 + (v183 - v182) * v179)
		end
		v_u_174.Rotation = v175
		v_u_174.Color = v176
		v_u_174.Transparency = v177
	end)
	p169.AncestryChanged:Connect(function(_, p184)
		-- upvalues: (ref) v_u_11, (copy) p_u_170
		if not p184 then
			v_u_11:UnbindFromRenderStep(p_u_170)
		end
	end)
	p169.SelectionImageObject = v171
end
local function v_u_267(p186, p_u_187, p_u_188) -- name: CreateDropDown
	-- upvalues: (copy) v_u_1, (copy) v_u_8, (copy) v_u_10, (copy) v_u_34, (copy) v_u_20, (copy) v_u_12, (copy) v_u_15, (copy) v_u_28, (copy) v_u_31, (copy) v_u_9, (copy) v_u_14, (copy) v_u_26, (copy) v_u_23, (copy) v_u_30, (copy) v_u_138
	local v_u_189 = v_u_1.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178))
	local v_u_190 = Color3.fromRGB(229, 229, 229)
	local v_u_191 = v_u_1.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255))
	local v_u_192 = nil
	local v_u_193 = {
		["CurrentIndex"] = nil,
		["UpdateDropDownList"] = nil,
		["DropDownFrame"] = nil,
		["Selections"] = nil
	}
	Instance.new("BindableEvent").Name = "IndexChanged"
	if type(p186) ~= "table" then
		error("CreateDropDown dropDownStringTable (first arg) is not a table", 2)
		return v_u_193
	end
	local v_u_194 = Instance.new("BindableEvent")
	v_u_194.Name = "IndexChanged"
	local v_u_195 = true
	local v_u_196 = v_u_8:GenerateGUID(false)
	local v_u_197 = nil
	local v_u_198 = p186
	local v199, _ = v_u_10:GetGuiInset()
	local v200 = v_u_34("ImageButton")
	local v201 = {
		["Name"] = "DropDownFullscreenFrame",
		["BackgroundTransparency"] = 0.2,
		["BorderSizePixel"] = 0,
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["ZIndex"] = 10,
		["Active"] = true,
		["Visible"] = false,
		["Selectable"] = false,
		["AutoButtonColor"] = false,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, 0, 1, not v_u_20 and 0 or v199.Y)
	}
	local v202
	if v_u_20 then
		v202 = UDim2.new(0, 0, 0, -v199.Y)
	else
		v202 = nil
	end
	v201.Position = v202
	v201.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	v201.Parent = v_u_12.RobloxGui
	local v_u_203 = v200(v201)
	local function v207(p204) -- name: onVREnabled
		-- upvalues: (ref) v_u_15, (ref) v_u_28, (ref) v_u_31, (copy) v_u_203, (ref) v_u_12, (copy) v_u_193, (ref) v_u_198
		if p204 == "VREnabled" then
			if v_u_15.VREnabled then
				if v_u_28 then
					local v205 = require(v_u_31.Workspace.Packages.VrSpatialUi)
					local v206 = v205.Constants.PanelType
					v_u_203.Parent = v205.UIManager.getInstance():getPanelObject(v206.MoreMenu)
					v_u_203.BackgroundTransparency = 0.2
				else
					v_u_203.Parent = require(v_u_31.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI()
					v_u_203.BackgroundTransparency = 1
				end
			else
				v_u_203.Parent = v_u_12.RobloxGui
				v_u_203.BackgroundTransparency = 0.2
			end
			if v_u_193.UpdateDropDownList then
				v_u_193:UpdateDropDownList(v_u_198)
			end
		end
	end
	v_u_15.Changed:Connect(v207)
	v207("VREnabled")
	local v_u_208 = v_u_34("ImageLabel")({
		["Name"] = "DropDownSelectionFrame",
		["Image"] = "",
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["BackgroundTransparency"] = nil,
		["BackgroundColor3"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["ZIndex"] = 10,
		["Parent"] = nil,
		["ScaleType"] = Enum.ScaleType.Stretch,
		["SliceCenter"] = Rect.new(8, 6, 46, 44),
		["BackgroundTransparency"] = v_u_1.transparency("DropdownListBg", 1),
		["BackgroundColor3"] = v_u_1.color("DropdownListBg"),
		["Size"] = UDim2.new(0.6, 0, 0.9, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Parent"] = v_u_203
	})
	v_u_34("UICorner")({
		["CornerRadius"] = v_u_1.DefaultCornerRadius,
		["Parent"] = v_u_208
	})
	local v_u_209 = v_u_34("ScrollingFrame")({
		["Name"] = "DropDownScrollingFrame",
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = nil,
		["Position"] = nil,
		["ZIndex"] = 10,
		["ScrollBarThickness"] = nil,
		["ScrollingDirection"] = nil,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, -20, 1, -25),
		["Position"] = UDim2.new(0, 10, 0, 10),
		["ScrollBarThickness"] = v_u_1.DefaultScrollBarThickness,
		["ScrollingDirection"] = Enum.ScrollingDirection.Y,
		["Parent"] = v_u_208
	})
	local v_u_210 = nil
	local v_u_211 = false
	local function v_u_215(p212, p213)
		-- upvalues: (copy) v_u_193, (ref) v_u_195, (copy) p_u_188, (copy) v_u_203, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (ref) v_u_192, (ref) v_u_210, (ref) v_u_14, (copy) v_u_196, (ref) v_u_197, (ref) v_u_211, (ref) v_u_28, (ref) v_u_31
		if p212 == nil or p213 == Enum.UserInputState.Begin then
			v_u_193.DropDownFrame.Selectable = v_u_195
			p_u_188:SetActive(true)
			if v_u_203.Visible then
				local v214
				if v_u_15.VREnabled then
					v214 = false
				else
					v214 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
				end
				if v214 then
					v_u_10.SelectedCoreObject = v_u_192
				end
			end
			v_u_203.Visible = false
			if v_u_210 then
				v_u_210:Disconnect()
			end
			v_u_14:UnbindCoreAction(v_u_196 .. "Action")
			v_u_14:UnbindCoreAction(v_u_196 .. "FreezeAction")
			v_u_197.Value = v_u_195
			v_u_211 = false
			if v_u_15.VREnabled and not v_u_28 then
				require(v_u_31.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v_u_203, 0)
			end
		end
	end
	local function v_u_216() end
	local function v221()
		-- upvalues: (ref) v_u_195, (copy) v_u_193, (ref) v_u_211, (copy) v_u_203, (ref) v_u_15, (ref) v_u_28, (ref) v_u_31, (ref) v_u_192, (ref) v_u_10, (ref) v_u_210, (copy) v_u_191, (copy) v_u_190, (copy) v_u_189, (copy) v_u_215, (ref) v_u_26, (ref) v_u_23, (ref) v_u_14, (copy) v_u_196, (copy) v_u_216, (copy) p_u_188, (ref) v_u_197
		if v_u_195 then
			v_u_193.DropDownFrame.Selectable = false
			v_u_211 = true
			v_u_203.Visible = true
			if v_u_15.VREnabled and not v_u_28 then
				require(v_u_31.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v_u_203, 0.5)
			end
			v_u_192 = v_u_193.DropDownFrame
			if v_u_193.CurrentIndex and v_u_193.CurrentIndex > 0 then
				v_u_10.SelectedCoreObject = v_u_193.Selections[v_u_193.CurrentIndex]
			elseif #v_u_193.Selections > 0 then
				v_u_10.SelectedCoreObject = v_u_193.Selections[1]
			end
			v_u_210 = v_u_10:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: (ref) v_u_193, (ref) v_u_10, (ref) v_u_191, (ref) v_u_15, (ref) v_u_190, (ref) v_u_189
				for v217 = 1, #v_u_193.Selections do
					if v_u_10.SelectedCoreObject == v_u_193.Selections[v217] then
						v_u_193.Selections[v217].TextColor3 = v_u_191
					else
						v_u_193.Selections[v217].TextColor3 = v_u_15.VREnabled and v_u_190 or v_u_189
					end
				end
			end)
			local v218 = v_u_215
			if v_u_26 then
				v_u_23:setHideShortcutBar("InExperienceMenuDropdown", true)
				v218 = function(p219, p220)
					-- upvalues: (ref) v_u_215, (ref) v_u_23
					v_u_215(p219, p220)
					v_u_23:setHideShortcutBar("InExperienceMenuDropdown", false)
				end
			end
			v_u_14:BindCoreAction(v_u_196 .. "FreezeAction", v_u_216, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1)
			v_u_14:BindCoreAction(v_u_196 .. "Action", v218, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
			p_u_188:SetActive(false)
			v_u_197.Value = false
		end
	end
	local v_u_222 = v_u_30:FormatByKey("Feature.SettingsHub.Label.ChooseOne")
	v_u_193.DropDownFrame = v_u_138("DropDownFrame", v_u_222, UDim2.new(0.6, 0, 0, 40), v221, nil, p_u_188)
	v_u_193.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0)
	v_u_193.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5)
	local v_u_223 = v_u_193.DropDownFrame.Enabled
	local v_u_224 = v_u_193.DropDownFrame.DropDownFrameTextLabel
	v_u_224.Position = UDim2.new(0, 15, 0, 0)
	v_u_224.Size = UDim2.new(1, -50, 1, 0)
	v_u_224.ClipsDescendants = true
	v_u_224.TextXAlignment = Enum.TextXAlignment.Left
	local v_u_225 = v_u_34("ImageLabel")({
		["Name"] = "DropDownImage",
		["Image"] = "rbxasset://textures/ui/Settings/DropDown/DropDown.png",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["ZIndex"] = 2,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["Size"] = UDim2.new(0, 15, 0, 10),
		["Position"] = UDim2.new(1, -12, 0.5, 0),
		["Parent"] = v_u_193.DropDownFrame
	})
	v_u_193.DropDownImage = v_u_225
	local function v_u_230(p226) -- name: setSelection
		-- upvalues: (copy) v_u_193, (copy) v_u_224, (copy) v_u_194
		local v227 = false
		for v228, v229 in pairs(v_u_193.Selections) do
			if v228 ~= p226 then
				continue
			end
			v_u_224.Text = v229.Text
			v_u_193.CurrentIndex = v228
			v227 = true
		end
		if v227 then
			v_u_194:Fire(p226)
		end
	end
	local function v_u_235(p231) -- name: setSelectionByValue
		-- upvalues: (copy) v_u_193, (copy) v_u_224, (copy) v_u_194
		local v232 = false
		for v233, v234 in pairs(v_u_193.Selections) do
			if v234.Text ~= p231 then
				continue
			end
			v_u_224.Text = v234.Text
			v_u_193.CurrentIndex = v233
			v232 = true
		end
		if v232 then
			v_u_194:Fire(v_u_193.CurrentIndex)
		end
		return v232
	end
	v_u_193.IndexChanged = v_u_194.Event
	function v_u_193.SetSelectionIndex(_, p236) -- name: SetSelectionIndex
		-- upvalues: (copy) v_u_230
		v_u_230(p236)
	end
	function v_u_193.SetSelectionByValue(_, p237) -- name: SetSelectionByValue
		-- upvalues: (copy) v_u_235
		return v_u_235(p237)
	end
	function v_u_193.ResetSelectionIndex(_) -- name: ResetSelectionIndex
		-- upvalues: (copy) v_u_193, (copy) v_u_224, (copy) v_u_222, (copy) v_u_215
		v_u_193.CurrentIndex = nil
		v_u_224.Text = v_u_222
		v_u_215()
	end
	function v_u_193.GetSelectedIndex(_) -- name: GetSelectedIndex
		-- upvalues: (copy) v_u_193
		return v_u_193.CurrentIndex
	end
	function v_u_193.SetZIndex(_, p238) -- name: SetZIndex
		-- upvalues: (copy) v_u_193, (copy) v_u_225, (copy) v_u_224
		v_u_193.DropDownFrame.ZIndex = p238
		v_u_225.ZIndex = p238
		v_u_224.ZIndex = p238
	end
	function v_u_193.SetInteractable(_, p239) -- name: SetInteractable
		-- upvalues: (ref) v_u_195, (copy) v_u_193, (copy) v_u_215, (ref) v_u_15, (ref) v_u_223, (ref) v_u_211
		v_u_195 = p239
		v_u_193.DropDownFrame.Selectable = v_u_195
		if v_u_195 then
			v_u_193.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
			v_u_193.DropDownFrame.ImageTransparency = 0
			v_u_193.DropDownImage.ImageTransparency = 0
			if not v_u_15.VREnabled then
				v_u_193:SetZIndex(2)
			end
		else
			v_u_215()
			if v_u_15.VREnabled then
				v_u_193.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5
				v_u_193.DropDownFrame.ImageTransparency = 0.5
				v_u_193.DropDownImage.ImageTransparency = 0.5
			else
				v_u_193.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
				v_u_193.DropDownFrame.ImageTransparency = 0
				v_u_193.DropDownImage.ImageTransparency = 0
			end
			if not v_u_15.VREnabled then
				v_u_193:SetZIndex(1)
			end
		end
		local v240 = v_u_223
		local v241
		if p239 then
			v241 = not v_u_211
		else
			v241 = p239
		end
		v240.Value = v241
		v_u_193.DropDownImage.Visible = p239
		if p239 then
			v_u_193.DropDownFrame.ImageTransparency = 0
		else
			v_u_193.DropDownFrame.ImageTransparency = 0.5
		end
	end
	function v_u_193.SetAutoLocalize(_, p242) -- name: SetAutoLocalize
		-- upvalues: (copy) v_u_203
		v_u_203.AutoLocalize = p242
	end
	function v_u_193.UpdateDropDownList(_, p243) -- name: UpdateDropDownList
		-- upvalues: (ref) v_u_198, (copy) v_u_193, (ref) v_u_15, (ref) v_u_1, (ref) v_u_34, (copy) v_u_190, (copy) v_u_189, (copy) v_u_209, (copy) p_u_187, (copy) v_u_224, (copy) v_u_191, (copy) v_u_215, (copy) v_u_194, (ref) v_u_9, (ref) v_u_10, (copy) v_u_196, (copy) v_u_203, (copy) v_u_208
		v_u_198 = p243
		if v_u_193.Selections then
			for v244 = 1, #v_u_193.Selections do
				v_u_193.Selections[v244]:Destroy()
			end
		end
		v_u_193.Selections = {}
		v_u_193.SelectionInfo = {}
		local v245 = v_u_15.VREnabled
		local v246 = v245 and v_u_1.font(Enum.Font.SourceSansBold, "Bold") or v_u_1.font(Enum.Font.SourceSans, "UtilityText")
		local v247 = v245 and v_u_1.textSize(36) or v_u_1.textSize(24, "UtilityText")
		local v248 = v245 and 70 or 50
		local v249 = v248 + 1
		local v250 = 0
		local v_u_251 = v245 and 600 or 400
		for v_u_252, v253 in pairs(p243) do
			local v254 = v_u_34("Frame")({
				["BackgroundTransparency"] = 0.7,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0)
			})
			v_u_34("UICorner")({
				["CornerRadius"] = v_u_1.DefaultCornerRadius,
				["Parent"] = v254
			})
			local v255 = typeof(v253) == "table"
			local v256, v257
			if v255 then
				v256 = v253.title
				v257 = v253.subtitle
				v250 = v250 + 10
			else
				v256 = v253
				v257 = ""
			end
			local v_u_258
			if v255 then
				v_u_258 = v_u_34("TextButton")({
					["Name"] = nil,
					["BackgroundTransparency"] = 1,
					["BorderSizePixel"] = 0,
					["AutoButtonColor"] = false,
					["TextYAlignment"] = nil,
					["Size"] = nil,
					["Position"] = nil,
					["TextColor3"] = nil,
					["Font"] = nil,
					["TextSize"] = nil,
					["Text"] = nil,
					["ZIndex"] = 10,
					["SelectionImageObject"] = nil,
					["Parent"] = nil,
					["Name"] = "Selection" .. tostring(v_u_252),
					["TextYAlignment"] = Enum.TextYAlignment.Top,
					["Size"] = UDim2.new(1, -28, 0, v248 + 10),
					["Position"] = UDim2.new(0, 14, 0, (v_u_252 - 1) * (v249 + 10)),
					["TextColor3"] = v_u_15.VREnabled and v_u_190 or v_u_189,
					["Font"] = v246,
					["TextSize"] = v247,
					["Text"] = v256,
					["SelectionImageObject"] = v254,
					["Parent"] = v_u_209
				})
				v_u_34("TextLabel")({
					["Name"] = nil,
					["BackgroundTransparency"] = 1,
					["BorderSizePixel"] = 0,
					["Size"] = nil,
					["Position"] = nil,
					["TextColor3"] = nil,
					["Font"] = nil,
					["TextSize"] = nil,
					["Text"] = nil,
					["ZIndex"] = 10,
					["Parent"] = nil,
					["Name"] = "Subtitle" .. tostring(v_u_252),
					["Size"] = UDim2.new(1, -28, 0, v248 * 0.8),
					["Position"] = UDim2.new(0, 14, 0, 15),
					["TextColor3"] = v_u_15.VREnabled and v_u_190 or v_u_189,
					["Font"] = v246,
					["TextSize"] = v247 * 0.8,
					["Text"] = v257,
					["Parent"] = v_u_258
				})
			else
				v_u_258 = v_u_34("TextButton")({
					["Name"] = nil,
					["BackgroundTransparency"] = 1,
					["BorderSizePixel"] = 0,
					["AutoButtonColor"] = false,
					["Size"] = nil,
					["Position"] = nil,
					["TextColor3"] = nil,
					["Font"] = nil,
					["TextSize"] = nil,
					["Text"] = nil,
					["ZIndex"] = 10,
					["SelectionImageObject"] = nil,
					["Parent"] = nil,
					["Name"] = "Selection" .. tostring(v_u_252),
					["Size"] = UDim2.new(1, -28, 0, v248),
					["Position"] = UDim2.new(0, 14, 0, (v_u_252 - 1) * v249),
					["TextColor3"] = v_u_15.VREnabled and v_u_190 or v_u_189,
					["Font"] = v246,
					["TextSize"] = v247,
					["Text"] = v253,
					["SelectionImageObject"] = v254,
					["Parent"] = v_u_209
				})
			end
			if v_u_252 == p_u_187 then
				v_u_193.CurrentIndex = v_u_252
				v_u_224.Text = v256
				v_u_258.TextColor3 = v_u_191
			elseif not p_u_187 and v_u_252 == 1 then
				v_u_258.TextColor3 = v_u_191
			end
			local function v259()
				-- upvalues: (ref) v_u_224, (ref) v_u_258, (ref) v_u_215, (ref) v_u_193, (copy) v_u_252, (ref) v_u_194
				v_u_224.Text = v_u_258.Text
				v_u_215()
				v_u_193.CurrentIndex = v_u_252
				v_u_194:Fire(v_u_252)
			end
			v_u_258.MouseButton1Click:Connect(v259)
			v_u_258.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (ref) v_u_258
				local v260
				if v_u_15.VREnabled then
					v260 = false
				else
					v260 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
				end
				if v260 then
					v_u_10.SelectedCoreObject = v_u_258
				end
			end)
			v_u_193.Selections[v_u_252] = v_u_258
			v_u_193.SelectionInfo[v_u_258] = {
				["Clicked"] = v259
			}
		end
		v_u_10:RemoveSelectionGroup(v_u_196)
		local v261 = v_u_10
		local v262 = v_u_196
		local v263 = v_u_193.Selections
		v261:AddSelectionTuple(v262, unpack(v263))
		v_u_209.CanvasSize = UDim2.new(1, -20, 0, #p243 * v249 + v250)
		local function v_u_264() -- name: updateDropDownSize
			-- upvalues: (ref) v_u_209, (ref) v_u_203, (ref) v_u_208, (copy) v_u_251
			if v_u_209.CanvasSize.Y.Offset < v_u_203.AbsoluteSize.Y - 10 then
				v_u_208.Size = UDim2.new(0, v_u_251, 0, v_u_209.CanvasSize.Y.Offset + 25)
			else
				v_u_208.Size = UDim2.new(0, v_u_251, 0.9, 0)
			end
		end
		v_u_203.Changed:Connect(function(p265)
			-- upvalues: (copy) v_u_264
			if p265 == "AbsoluteSize" then
				v_u_264()
			end
		end)
		v_u_264()
	end
	v_u_193:UpdateDropDownList(p186)
	v_u_203.MouseButton1Click:Connect(v_u_215)
	p_u_188.PoppedMenu:Connect(function(p266)
		-- upvalues: (copy) v_u_203, (copy) v_u_215
		if p266 == v_u_203 then
			v_u_215()
		end
	end)
	return v_u_193
end
local function v_u_346(p268, p_u_269) -- name: CreateSelector
	-- upvalues: (copy) v_u_34, (copy) v_u_44, (copy) v_u_1, (copy) v_u_4, (copy) v_u_9, (copy) v_u_5, (copy) v_u_94, (copy) v_u_15, (copy) v_u_10, (copy) v_u_59, (copy) v_u_6, (copy) v_u_38, (copy) v_u_40, (copy) v_u_42, (copy) v_u_43
	local v_u_270 = 0
	local v_u_271 = {
		["HubRef"] = nil,
		["SetSelectionIndex"] = nil
	}
	if type(p268) ~= "table" then
		error("CreateSelector selectionStringTable (first arg) is not a table", 2)
		return v_u_271
	end
	local v_u_272 = Instance.new("BindableEvent")
	v_u_272.Name = "IndexChanged"
	local v_u_273 = true
	v_u_271.CurrentIndex = 0
	v_u_271.SelectorFrame = v_u_34("ImageButton")({
		["Name"] = "Selector",
		["Image"] = "",
		["AutoButtonColor"] = false,
		["NextSelectionLeft"] = nil,
		["NextSelectionRight"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["ZIndex"] = 2,
		["SelectionImageObject"] = nil,
		["NextSelectionLeft"] = v_u_271.SelectorFrame,
		["NextSelectionRight"] = v_u_271.SelectorFrame,
		["Size"] = UDim2.new(0.6, 0, 0, 50),
		["Position"] = UDim2.new(1, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["SelectionImageObject"] = v_u_44
	})
	local v_u_274 = v_u_34("ImageButton")({
		["Name"] = "LeftButton",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Image"] = "",
		["ZIndex"] = 3,
		["Selectable"] = false,
		["SelectionImageObject"] = nil,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(0, 0.5),
		["Position"] = UDim2.new(0, 0, 0.5, 0),
		["Size"] = UDim2.new(0, v_u_1.SelectorArrowButtonWidth, 0, 50),
		["SelectionImageObject"] = v_u_44,
		["Parent"] = v_u_271.SelectorFrame
	})
	local v_u_275 = v_u_34("ImageButton")({
		["Name"] = "RightButton",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Image"] = "",
		["ZIndex"] = 3,
		["Selectable"] = false,
		["SelectionImageObject"] = nil,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["Position"] = UDim2.new(1, 0, 0.5, 0),
		["Size"] = UDim2.new(0, v_u_1.SelectorArrowButtonWidth, 0, 50),
		["SelectionImageObject"] = v_u_44,
		["Parent"] = v_u_271.SelectorFrame
	})
	local v_u_276 = v_u_34("ImageLabel")({
		["Name"] = "LeftButton",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Image"] = "rbxasset://textures/ui/Settings/Slider/Left.png",
		["ImageColor3"] = nil,
		["ZIndex"] = 4,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(0, 18, 0, 30),
		["ImageColor3"] = v_u_4,
		["Parent"] = v_u_274
	})
	local v_u_277 = v_u_34("ImageLabel")({
		["Name"] = "RightButton",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Image"] = "rbxasset://textures/ui/Settings/Slider/Right.png",
		["ImageColor3"] = nil,
		["ZIndex"] = 4,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(0, 18, 0, 30),
		["ImageColor3"] = v_u_4,
		["Parent"] = v_u_275
	})
	if v_u_9.PreferredInput ~= Enum.PreferredInput.Touch then
		local function v279(p278)
			-- upvalues: (ref) v_u_4
			p278.ImageColor3 = v_u_4
		end
		local function v281(p280)
			-- upvalues: (ref) v_u_5
			p280.ImageColor3 = v_u_5
		end
		v_u_94(v_u_274, v_u_276, v279, v281)
		v_u_94(v_u_275, v_u_277, v279, v281)
	end
	v_u_271.Selections = {}
	local v_u_282 = {}
	local v_u_283 = {}
	local v_u_284 = v_u_34("ImageButton")({
		["Name"] = "AutoSelectButton",
		["BackgroundTransparency"] = 1,
		["Image"] = "",
		["Position"] = nil,
		["Size"] = nil,
		["Parent"] = nil,
		["ZIndex"] = 2,
		["SelectionImageObject"] = nil,
		["Position"] = UDim2.new(0, v_u_274.Size.X.Offset, 0, 0),
		["Size"] = UDim2.new(1, v_u_274.Size.X.Offset * -2, 1, 0),
		["Parent"] = v_u_271.SelectorFrame,
		["SelectionImageObject"] = v_u_44
	})
	v_u_284.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_273, (copy) v_u_271, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10
		if v_u_273 then
			if #v_u_271.Selections > 1 then
				local v285 = v_u_271.CurrentIndex + 1
				v_u_271:SetSelectionIndex(#v_u_271.Selections < v285 and 1 or v285)
				local v286
				if v_u_15.VREnabled then
					v286 = false
				else
					v286 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
				end
				if v286 then
					v_u_10.SelectedCoreObject = v_u_271.SelectorFrame
				end
			end
		else
			return
		end
	end)
	v_u_283[v_u_284] = true
	local function v_u_294(p287, p288) -- name: setSelection
		-- upvalues: (copy) v_u_271, (copy) v_u_274, (ref) v_u_282, (ref) v_u_59, (copy) v_u_272
		for v289, v290 in pairs(v_u_271.Selections) do
			local v291 = v289 == p287
			local v292 = UDim2.new(0, v_u_274.Size.X.Offset, 0, 0)
			local v293 = UDim2.new(0, v_u_274.Size.X.Offset * p288 * 3, 0, 0)
			if v_u_282[v290] then
				v293 = UDim2.new(0, v_u_274.Size.X.Offset * -p288 * 3, 0, 0)
			end
			if v293.X.Offset < 0 then
				v293 = UDim2.new(0, v293.X.Offset + v290.AbsoluteSize.X / 4, 0, 0)
			end
			if v291 then
				v_u_282[v290] = true
				v290.Position = v293
				v290.Visible = true
				PropertyTweener(v290, "TextTransparency", 1, 0, 0.165, v_u_59)
				if v290:IsDescendantOf(game) then
					v290:TweenPositionInternal(v292, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true)
				else
					v290.Position = v292
				end
				v_u_271.CurrentIndex = v289
				v_u_272:Fire(p287)
			else
				if not v_u_282[v290] then
					continue
				end
				v_u_282[v290] = false
				PropertyTweener(v290, "TextTransparency", 0, 1, 0.165, v_u_59)
				if v290:IsDescendantOf(game) then
					v290:TweenPositionInternal(v293, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
				else
					v290.Position = v293
				end
			end
		end
	end
	local function v_u_300(p295, p296) -- name: stepFunc
		-- upvalues: (ref) v_u_273, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (copy) v_u_271, (copy) v_u_294
		if v_u_273 then
			if p295 == nil or (p295.UserInputType == Enum.UserInputType.MouseButton1 or (p295.UserInputType == Enum.UserInputType.Gamepad1 or (p295.UserInputType == Enum.UserInputType.Gamepad2 or (p295.UserInputType == Enum.UserInputType.Gamepad3 or (p295.UserInputType == Enum.UserInputType.Gamepad4 or p295.UserInputType == Enum.UserInputType.Keyboard))))) then
				local v297
				if v_u_15.VREnabled then
					v297 = false
				else
					v297 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
				end
				if v297 then
					v_u_10.SelectedCoreObject = v_u_271.SelectorFrame
				end
				local v298 = p296 + v_u_271.CurrentIndex
				local v299 = v_u_271.CurrentIndex < v298 and 1 or -1
				v_u_294(#v_u_271.Selections < v298 and 1 or (v298 < 1 and #v_u_271.Selections or v298), v299)
			end
		else
			return
		end
	end
	local v_u_301 = nil
	v_u_271.IndexChanged = v_u_272.Event
	function v_u_271.SetSelectionIndex(_, p302) -- name: SetSelectionIndex
		-- upvalues: (copy) v_u_294
		v_u_294(p302, 1)
	end
	function v_u_271.GetSelectedIndex(_) -- name: GetSelectedIndex
		-- upvalues: (copy) v_u_271
		return v_u_271.CurrentIndex
	end
	function v_u_271.SetZIndex(_, p303) -- name: SetZIndex
		-- upvalues: (copy) v_u_274, (copy) v_u_275, (copy) v_u_276, (copy) v_u_277, (copy) v_u_271
		v_u_274.ZIndex = p303
		v_u_275.ZIndex = p303
		v_u_276.ZIndex = p303
		v_u_277.ZIndex = p303
		for v304 = 1, #v_u_271.Selections do
			v_u_271.Selections[v304].ZIndex = p303
		end
	end
	function v_u_271.SetInteractable(_, p305) -- name: SetInteractable
		-- upvalues: (ref) v_u_273, (copy) v_u_271, (copy) v_u_274, (copy) v_u_275, (ref) v_u_1, (copy) v_u_276, (ref) v_u_6, (copy) v_u_277, (ref) v_u_4
		v_u_273 = p305
		v_u_271.SelectorFrame.Selectable = v_u_273
		v_u_274.Active = v_u_273
		v_u_275.Active = v_u_273
		v_u_274.Visible = v_u_273
		v_u_275.Visible = v_u_273
		if v_u_273 then
			for _, v306 in pairs(v_u_271.Selections) do
				v306.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
			v_u_276.ImageColor3 = v_u_4
			v_u_277.ImageColor3 = v_u_4
		else
			for _, v307 in pairs(v_u_271.Selections) do
				v307.TextColor3 = v_u_1.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255))
			end
			v_u_276.ImageColor3 = v_u_6
			v_u_277.ImageColor3 = v_u_6
		end
	end
	function v_u_271.UpdateOptions(_, p308) -- name: UpdateOptions
		-- upvalues: (copy) v_u_271, (ref) v_u_282, (ref) v_u_34, (copy) v_u_274, (ref) v_u_1, (ref) v_u_38, (copy) p_u_269, (copy) v_u_275
		for _, v309 in pairs(v_u_271.Selections) do
			v309:Destroy()
		end
		v_u_282 = {}
		v_u_271.Selections = {}
		for v310, v311 in pairs(p308) do
			local v312 = v_u_34("TextLabel")({
				["Name"] = nil,
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Position"] = nil,
				["TextColor3"] = nil,
				["TextYAlignment"] = nil,
				["Font"] = nil,
				["TextSize"] = nil,
				["TextWrapped"] = true,
				["Text"] = nil,
				["ZIndex"] = 2,
				["Visible"] = false,
				["Parent"] = nil,
				["Name"] = "Selection" .. tostring(v310),
				["Size"] = UDim2.new(1, v_u_274.Size.X.Offset * -2, 1, 0),
				["Position"] = UDim2.new(1, 0, 0, 0),
				["TextColor3"] = Color3.fromRGB(255, 255, 255),
				["TextYAlignment"] = Enum.TextYAlignment.Center,
				["Font"] = v_u_1.font(Enum.Font.SourceSans, "UtilityText"),
				["TextSize"] = v_u_1.textSize(24, "UtilityText"),
				["Text"] = v311,
				["Parent"] = v_u_271.SelectorFrame
			})
			if v_u_38 then
				v312.TextSize = v_u_1.textSize(36)
			end
			if v310 == p_u_269 then
				v_u_271.CurrentIndex = v310
				v312.Position = UDim2.new(0, v_u_274.Size.X.Offset, 0, 0)
				v312.Visible = true
				v_u_282[v312] = true
			else
				v_u_282[v312] = false
			end
			v_u_271.Selections[v310] = v312
		end
		local v313 = #v_u_271.Selections > 1
		v_u_274.Visible = v313
		v_u_275.Visible = v313
	end
	local function v316(p314) -- name: onVREnabled
		-- upvalues: (ref) v_u_15, (copy) v_u_274, (copy) v_u_275, (copy) v_u_284
		if p314 == "VREnabled" then
			local v315 = v_u_15.VREnabled
			v_u_274.Selectable = v315
			v_u_275.Selectable = v315
			v_u_284.Selectable = v315
		end
	end
	v_u_15.Changed:Connect(v316)
	local v317 = v_u_15.VREnabled
	v_u_274.Selectable = v317
	v_u_275.Selectable = v317
	v_u_284.Selectable = v317
	v_u_274.InputBegan:Connect(function(p318)
		-- upvalues: (ref) v_u_40, (ref) v_u_42, (ref) v_u_273, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (copy) v_u_271, (copy) v_u_294
		local v319 = not v_u_40(false) and v_u_42(false)
		if v319 then
			v319 = p318.UserInputType == Enum.UserInputType.MouseButton1
		end
		if v319 then
			if not v_u_273 then
				return
			end
			local v320
			if v_u_15.VREnabled then
				v320 = false
			else
				v320 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v320 then
				v_u_10.SelectedCoreObject = v_u_271.SelectorFrame
			end
			local v321 = -1 + v_u_271.CurrentIndex
			local v322 = v_u_271.CurrentIndex < v321 and 1 or -1
			v_u_294(#v_u_271.Selections < v321 and 1 or (v321 < 1 and #v_u_271.Selections or v321), v322)
		end
	end)
	v_u_275.InputBegan:Connect(function(p323)
		-- upvalues: (ref) v_u_40, (ref) v_u_42, (ref) v_u_273, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (copy) v_u_271, (copy) v_u_294
		local v324 = not v_u_40(false) and v_u_42(false)
		if v324 then
			v324 = p323.UserInputType == Enum.UserInputType.MouseButton1
		end
		if v324 then
			if not v_u_273 then
				return
			end
			local v325
			if v_u_15.VREnabled then
				v325 = false
			else
				v325 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v325 then
				v_u_10.SelectedCoreObject = v_u_271.SelectorFrame
			end
			local v326 = 1 + v_u_271.CurrentIndex
			local v327 = v_u_271.CurrentIndex < v326 and 1 or -1
			v_u_294(#v_u_271.Selections < v326 and 1 or (v326 < 1 and #v_u_271.Selections or v326), v327)
		end
	end)
	local v_u_328 = true
	v_u_271:UpdateOptions(p268)
	v_u_9.InputBegan:Connect(function(p329)
		-- upvalues: (ref) v_u_273, (ref) v_u_328, (ref) v_u_10, (copy) v_u_271, (ref) v_u_15, (ref) v_u_9, (copy) v_u_294
		if v_u_273 then
			if v_u_328 then
				if p329.UserInputType == Enum.UserInputType.Gamepad1 or p329.UserInputType == Enum.UserInputType.Keyboard then
					if v_u_10.SelectedCoreObject == v_u_271.SelectorFrame then
						if p329.KeyCode == Enum.KeyCode.DPadLeft or (p329.KeyCode == Enum.KeyCode.Left or p329.KeyCode == Enum.KeyCode.A) then
							if v_u_273 then
								if p329 == nil or (p329.UserInputType == Enum.UserInputType.MouseButton1 or (p329.UserInputType == Enum.UserInputType.Gamepad1 or (p329.UserInputType == Enum.UserInputType.Gamepad2 or (p329.UserInputType == Enum.UserInputType.Gamepad3 or (p329.UserInputType == Enum.UserInputType.Gamepad4 or p329.UserInputType == Enum.UserInputType.Keyboard))))) then
									local v330
									if v_u_15.VREnabled then
										v330 = false
									else
										v330 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
									end
									if v330 then
										v_u_10.SelectedCoreObject = v_u_271.SelectorFrame
									end
									local v331 = -1 + v_u_271.CurrentIndex
									local v332 = v_u_271.CurrentIndex < v331 and 1 or -1
									v_u_294(#v_u_271.Selections < v331 and 1 or (v331 < 1 and #v_u_271.Selections or v331), v332)
								end
							else
								return
							end
						else
							if p329.KeyCode == Enum.KeyCode.DPadRight or (p329.KeyCode == Enum.KeyCode.Right or p329.KeyCode == Enum.KeyCode.D) then
								if not v_u_273 then
									return
								end
								if p329 ~= nil and (p329.UserInputType ~= Enum.UserInputType.MouseButton1 and (p329.UserInputType ~= Enum.UserInputType.Gamepad1 and (p329.UserInputType ~= Enum.UserInputType.Gamepad2 and (p329.UserInputType ~= Enum.UserInputType.Gamepad3 and (p329.UserInputType ~= Enum.UserInputType.Gamepad4 and p329.UserInputType ~= Enum.UserInputType.Keyboard))))) then
									return
								end
								local v333
								if v_u_15.VREnabled then
									v333 = false
								else
									v333 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
								end
								if v333 then
									v_u_10.SelectedCoreObject = v_u_271.SelectorFrame
								end
								local v334 = 1 + v_u_271.CurrentIndex
								local v335 = v_u_271.CurrentIndex < v334 and 1 or -1
								v_u_294(#v_u_271.Selections < v334 and 1 or (v334 < 1 and #v_u_271.Selections or v334), v335)
							end
							return
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	end)
	v_u_9.InputChanged:Connect(function(p336)
		-- upvalues: (ref) v_u_273, (ref) v_u_328, (ref) v_u_270, (ref) v_u_10, (copy) v_u_271, (copy) v_u_300
		if v_u_273 then
			if v_u_328 then
				if p336.UserInputType == Enum.UserInputType.Gamepad1 then
					local v337 = v_u_10.SelectedCoreObject
					if v337 and v337:IsDescendantOf(v_u_271.SelectorFrame.Parent) then
						if p336.KeyCode == Enum.KeyCode.Thumbstick1 then
							if p336.Position.X > 0.8 and (p336.Delta.X > 0 and v_u_270 ~= 1) then
								v_u_270 = 1
								v_u_300(p336, v_u_270)
								return
							elseif p336.Position.X < -0.8 and (p336.Delta.X < 0 and v_u_270 ~= -1) then
								v_u_270 = -1
								v_u_300(p336, v_u_270)
							else
								local v338 = p336.Position.X
								if math.abs(v338) < 0.8 then
									v_u_270 = 0
								end
							end
						else
							return
						end
					else
						return
					end
				else
					return
				end
			else
				v_u_270 = 0
				return
			end
		else
			return
		end
	end)
	v_u_271.SelectorFrame.AncestryChanged:Connect(function(_, p339)
		-- upvalues: (ref) v_u_328, (ref) v_u_301, (ref) v_u_10, (copy) v_u_271, (copy) v_u_283, (ref) v_u_15
		v_u_328 = p339
		if v_u_328 then
			v_u_301 = v_u_10:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: (ref) v_u_271, (ref) v_u_10, (ref) v_u_283, (ref) v_u_15
				if #v_u_271.Selections > 0 then
					if v_u_10.SelectedCoreObject ~= nil and (v_u_283[v_u_10.SelectedCoreObject] and not v_u_15.VREnabled) then
						v_u_10.SelectedCoreObject = v_u_271.SelectorFrame
					end
				end
			end)
		elseif v_u_301 then
			v_u_301:Disconnect()
			return
		end
	end)
	local function v343(_, p340) -- name: onResized
		-- upvalues: (ref) v_u_1, (ref) v_u_38, (copy) v_u_271
		local v341
		if p340 then
			v341 = v_u_1.textSize(16)
		else
			v341 = v_u_38 and v_u_1.textSize(36) or v_u_1.textSize(24, "UtilityText")
		end
		for _, v342 in pairs(v_u_271.Selections) do
			v342.TextSize = v341
		end
	end
	v_u_43[v_u_271.SelectorFrame] = v343
	local v344
	if _G.__TESTEZ_RUNNING_TEST__ then
		v344 = Vector2.new(1024, 1024)
	else
		v344 = v_u_10:GetHardwareSafeViewport()
	end
	local v345
	if _G.__TESTEZ_RUNNING_TEST__ then
		v345 = Vector2.new(1024, 1024)
	else
		v345 = v_u_10:GetHardwareSafeViewport()
	end
	v343(v344, v345.Y > v345.X)
	v_u_301 = v_u_10:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
		-- upvalues: (copy) v_u_271, (ref) v_u_10, (copy) v_u_283, (ref) v_u_15
		if #v_u_271.Selections > 0 then
			if v_u_10.SelectedCoreObject ~= nil and (v_u_283[v_u_10.SelectedCoreObject] and not v_u_15.VREnabled) then
				v_u_10.SelectedCoreObject = v_u_271.SelectorFrame
			end
		end
	end)
	return v_u_271
end
local function v_u_369(p347, p348, p_u_349, p_u_350, p351) -- name: ShowAlert
	-- upvalues: (copy) v_u_12, (copy) v_u_15, (copy) v_u_28, (copy) v_u_31, (copy) v_u_34, (copy) v_u_1, (copy) v_u_8, (copy) v_u_14, (copy) v_u_10, (copy) v_u_138, (copy) v_u_9
	local v_u_352 = v_u_12.RobloxGui
	if v_u_352:FindFirstChild("AlertViewFullScreen") then
		return
	end
	local v_u_353 = nil
	local function v358(p354) -- name: onVREnabled
		-- upvalues: (ref) v_u_15, (ref) v_u_28, (ref) v_u_31, (ref) v_u_352, (ref) v_u_12, (ref) v_u_353
		if p354 == "VREnabled" then
			local v355 = nil
			if v_u_15.VREnabled then
				if v_u_28 then
					local v356 = require(v_u_31.Workspace.Packages.VrSpatialUi)
					local v357 = v356.Constants.PanelType
					v_u_352 = v356.UIManager.getInstance():getPanelObject(v357.MoreMenu)
				else
					v355 = require(v_u_31.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu")
					v_u_352 = v355:GetGUI()
				end
			else
				v_u_352 = v_u_12.RobloxGui
			end
			if v_u_353 and v_u_353.Parent ~= nil then
				v_u_353.Parent = v_u_352
				if v_u_15.VREnabled and not v_u_28 then
					v355:SetSubpanelDepth(v_u_353, 0.5)
				end
			end
		end
	end
	local v_u_359 = v_u_15.Changed:Connect(v358)
	v_u_353 = v_u_34("ImageLabel")({
		["Name"] = "AlertViewBacking",
		["Image"] = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["BackgroundTransparency"] = 1,
		["ImageTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["ZIndex"] = 9,
		["Parent"] = nil,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(8, 6, 46, 44),
		["Size"] = UDim2.new(0, 400, 0, 350),
		["Position"] = UDim2.new(0.5, -200, 0.5, -175),
		["Parent"] = v_u_352
	})
	v358("VREnabled")
	if p351 then
		v_u_353.ImageTransparency = 0
	else
		local v360
		if v_u_28 then
			v360 = false
		else
			v360 = v_u_15.VREnabled
		end
		if v360 then
			v_u_353.ImageTransparency = 0
		else
			v_u_353.Size = UDim2.new(0.8, 0, 0, 350)
			v_u_353.Position = UDim2.new(0.1, 0, 0.1, 0)
		end
	end
	if v_u_12.RobloxGui.AbsoluteSize.Y <= v_u_353.Size.Y.Offset then
		v_u_353.Size = UDim2.new(v_u_353.Size.X.Scale, v_u_353.Size.X.Offset, v_u_353.Size.Y.Scale, v_u_12.RobloxGui.AbsoluteSize.Y)
		v_u_353.Position = UDim2.new(v_u_353.Position.X.Scale, -v_u_353.Size.X.Offset / 2, 0.5, -v_u_353.Size.Y.Offset / 2)
	end
	if not p351 then
		v_u_34("UICorner")({
			["CornerRadius"] = v_u_1.DefaultCornerRadius,
			["Parent"] = v_u_353
		})
		v_u_353.BackgroundColor3 = v_u_1.color("MenuContainer")
		v_u_353.BackgroundTransparency = v_u_1.transparency("MenuContainer")
	end
	v_u_34("TextLabel")({
		["Name"] = "AlertViewText",
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["Text"] = nil,
		["TextWrapped"] = true,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["ZIndex"] = 10,
		["Parent"] = nil,
		["Size"] = UDim2.new(0.95, 0, 0.6, 0),
		["Position"] = UDim2.new(0.025, 0, 0.05, 0),
		["Font"] = v_u_1.font(Enum.Font.SourceSansBold, "Bold"),
		["TextSize"] = v_u_1.textSize(36),
		["Text"] = p347,
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["TextXAlignment"] = Enum.TextXAlignment.Center,
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["Parent"] = v_u_353
	})
	v_u_34("ImageLabel")({
		["Image"] = "",
		["BackgroundTransparency"] = 1
	})
	local v_u_361 = v_u_8:GenerateGUID(false)
	local function v363(_, p362)
		-- upvalues: (ref) v_u_15, (ref) v_u_353, (ref) v_u_28, (ref) v_u_31, (copy) p_u_350, (ref) v_u_14, (copy) v_u_361, (ref) v_u_10, (copy) p_u_349, (copy) v_u_359
		if v_u_15.VREnabled and (p362 == Enum.UserInputState.Begin or p362 == Enum.UserInputState.Cancel) then
			return
		elseif v_u_353 then
			if v_u_15.VREnabled and not v_u_28 then
				require(v_u_31.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v_u_353, 0)
			end
			v_u_353:Destroy()
			v_u_353 = nil
			if p_u_350 then
				p_u_350()
			end
			v_u_14:UnbindCoreAction(v_u_361)
			v_u_10.SelectedCoreObject = nil
			if p_u_349 then
				p_u_349:ShowBar()
			end
			if v_u_359 then
				v_u_359:Disconnect()
			end
		end
	end
	local v364 = UDim2.new(1, -20, 0, 60)
	local v365 = UDim2.new(0, 10, 0.65, 0)
	if not p351 then
		v364 = UDim2.new(0, 200, 0, 50)
		v365 = UDim2.new(0.5, -100, 0.65, 0)
	end
	local v366, v367 = v_u_138("AlertViewButton", p348, v364, v363)
	v366.Position = v365
	v366.NextSelectionLeft = v366
	v366.NextSelectionRight = v366
	v366.NextSelectionUp = v366
	v366.NextSelectionDown = v366
	v366.ZIndex = 9
	v367.ZIndex = v366.ZIndex
	v366.Parent = v_u_353
	local v368
	if v_u_15.VREnabled then
		v368 = false
	else
		v368 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
	end
	if v368 then
		v_u_10.SelectedCoreObject = v366
	end
	v_u_10.SelectedCoreObject = v366
	v_u_14:BindCoreAction(v_u_361, v363, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA)
	if p_u_349 and (v_u_28 or not v_u_15.VREnabled) then
		p_u_349:HideBar()
		p_u_349.Pages.CurrentPage:Hide(1, 1)
	end
end
local function v_u_502(p370, p371, p_u_372, p373, p374) -- name: CreateNewSlider
	-- upvalues: (copy) v_u_8, (copy) v_u_33, (copy) v_u_34, (copy) v_u_44, (copy) v_u_13, (copy) v_u_1, (copy) v_u_9, (copy) v_u_5, (copy) v_u_4, (copy) v_u_5, (copy) v_u_94, (copy) v_u_2, (copy) v_u_3, (copy) v_u_21, (copy) v_u_15, (copy) v_u_10, (copy) v_u_11
	local v_u_375 = {}
	local v_u_376 = tonumber(p370)
	local v_u_377 = p371
	local v_u_378 = 0
	local v_u_379 = nil
	local v_u_380 = true
	local v_u_381 = nil
	local v_u_382 = v_u_8:GenerateGUID(false)
	if v_u_376 > 0 then
		local v383 = p373 or p374
		local v_u_384 = Instance.new("BindableEvent")
		v_u_384.Name = "ValueChanged"
		local v_u_385 = v_u_33.new()
		local v386 = v_u_34("ImageButton")
		local v387 = {
			["Name"] = "Slider",
			["Image"] = "",
			["AutoButtonColor"] = false,
			["NextSelectionLeft"] = nil,
			["NextSelectionRight"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["SelectionImageObject"] = nil,
			["ZIndex"] = 2,
			["NextSelectionLeft"] = v_u_375.SliderFrame,
			["NextSelectionRight"] = v_u_375.SliderFrame,
			["Size"] = UDim2.new(0.6, 0, 0, 50)
		}
		local v388
		if v383 then
			v388 = Enum.AutomaticSize.Y
		else
			v388 = nil
		end
		v387.AutomaticSize = v388
		v387.Position = UDim2.new(1, 0, 0.5, 0)
		v387.AnchorPoint = Vector2.new(1, 0.5)
		v387.SelectionImageObject = v_u_44
		v_u_375.SliderFrame = v386(v387)
		local v389
		if v383 then
			v389 = v_u_34("Frame")({
				["Name"] = "StepsAndButtonsContainer",
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Parent"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 50),
				["Parent"] = v_u_375.SliderFrame
			})
			v_u_34("UIListLayout")({
				["Name"] = "UIListLayout",
				["VerticalAlignment"] = nil,
				["SortOrder"] = nil,
				["Parent"] = nil,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Parent"] = v_u_375.SliderFrame
			})
			local v390 = v_u_34("Frame")({
				["Name"] = "SliderLabels",
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["BackgroundTransparency"] = 1,
				["Parent"] = nil,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(1, 0, 0, 0),
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["Parent"] = v_u_375.SliderFrame
			})
			v_u_34("UIPadding")({
				["Name"] = "UIPadding",
				["PaddingRight"] = nil,
				["PaddingLeft"] = nil,
				["Parent"] = nil,
				["PaddingRight"] = UDim.new(0, 50),
				["PaddingLeft"] = UDim.new(0, 50),
				["Parent"] = v390
			})
			if p373 then
				v_u_375.LeftLabel = v_u_34("TextLabel")({
					["Name"] = "LeftLabel",
					["Text"] = nil,
					["Font"] = nil,
					["TextSize"] = nil,
					["TextColor3"] = nil,
					["TextTransparency"] = 0.25,
					["TextXAlignment"] = nil,
					["TextWrapped"] = true,
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["AutomaticSize"] = nil,
					["Parent"] = nil,
					["Visible"] = nil,
					["Text"] = p373,
					["Font"] = v_u_1.font(Enum.Font.SourceSans, "UtilityRow"),
					["TextSize"] = v_u_1.textSize(18, "UtilityRow"),
					["TextColor3"] = Color3.fromRGB(255, 255, 255),
					["TextXAlignment"] = Enum.TextXAlignment.Left,
					["Size"] = UDim2.fromScale(1, 0),
					["AutomaticSize"] = Enum.AutomaticSize.Y,
					["Parent"] = v390,
					["Visible"] = v_u_13.AbsoluteSize.X > 460
				})
			end
			if p374 then
				v_u_375.RightLabel = v_u_34("TextLabel")({
					["Name"] = "RightLabel",
					["Text"] = nil,
					["Font"] = nil,
					["TextSize"] = nil,
					["TextColor3"] = nil,
					["TextTransparency"] = 0.25,
					["TextXAlignment"] = nil,
					["TextWrapped"] = true,
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["AutomaticSize"] = nil,
					["Parent"] = nil,
					["Visible"] = nil,
					["Text"] = p374,
					["Font"] = v_u_1.font(Enum.Font.SourceSans, "UtilityRow"),
					["TextSize"] = v_u_1.textSize(18, "UtilityRow"),
					["TextColor3"] = Color3.fromRGB(255, 255, 255),
					["TextXAlignment"] = Enum.TextXAlignment.Right,
					["Size"] = UDim2.fromScale(1, 0),
					["AutomaticSize"] = Enum.AutomaticSize.Y,
					["Parent"] = v390,
					["Visible"] = v_u_13.AbsoluteSize.X > 460
				})
			end
			v_u_13:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
				-- upvalues: (copy) v_u_375, (ref) v_u_13
				if v_u_375.LeftLabel then
					v_u_375.LeftLabel.Visible = v_u_13.AbsoluteSize.X > 460
				end
				if v_u_375.RightLabel then
					v_u_375.RightLabel.Visible = v_u_13.AbsoluteSize.X > 460
				end
			end)
		else
			v389 = nil
		end
		local v391 = v_u_34("Frame")
		local v392 = {
			["Name"] = "StepsContainer",
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Parent"] = nil,
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(1, -100, 1, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5)
		}
		local v393
		if v383 then
			v393 = v389
		else
			v393 = v_u_375.SliderFrame
		end
		v392.Parent = v393
		v_u_375.StepsContainer = v391(v392)
		local v394 = v_u_34("ImageButton")
		local v395 = {
			["Name"] = "LeftButton",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Image"] = "",
			["ZIndex"] = 3,
			["Selectable"] = false,
			["SelectionImageObject"] = nil,
			["Active"] = true,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 0, 0.5, 0),
			["Size"] = UDim2.new(0, v_u_1.SelectorArrowButtonWidth, 0, 50),
			["SelectionImageObject"] = v_u_44
		}
		local v396
		if v383 then
			v396 = v389
		else
			v396 = v_u_375.SliderFrame
		end
		v395.Parent = v396
		local v_u_397 = v394(v395)
		local v398 = v_u_34("ImageButton")
		local v399 = {
			["Name"] = "RightButton",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Image"] = "",
			["ZIndex"] = 3,
			["Selectable"] = false,
			["SelectionImageObject"] = nil,
			["Active"] = true,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Size"] = UDim2.new(0, v_u_1.SelectorArrowButtonWidth, 0, 50),
			["SelectionImageObject"] = v_u_44
		}
		if not v383 then
			v389 = v_u_375.SliderFrame
		end
		v399.Parent = v389
		local v_u_400 = v398(v399)
		local v_u_401 = v_u_34("ImageLabel")({
			["Name"] = "LeftButton",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Image"] = "rbxasset://textures/ui/Settings/Slider/Less.png",
			["ZIndex"] = 4,
			["Parent"] = nil,
			["ImageColor3"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 30, 0, 30),
			["Parent"] = v_u_397,
			["ImageColor3"] = v_u_9.PreferredInput == Enum.PreferredInput.Touch and v_u_5 or v_u_4
		})
		local v_u_402 = v_u_34("ImageLabel")({
			["Name"] = "RightButton",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Image"] = "rbxasset://textures/ui/Settings/Slider/More.png",
			["ZIndex"] = 4,
			["Parent"] = nil,
			["ImageColor3"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 30, 0, 30),
			["Parent"] = v_u_400,
			["ImageColor3"] = v_u_9.PreferredInput == Enum.PreferredInput.Touch and v_u_5 or v_u_4
		})
		if v_u_9.PreferredInput ~= Enum.PreferredInput.Touch then
			local function v404(p403)
				-- upvalues: (ref) v_u_4
				p403.ImageColor3 = v_u_4
			end
			local function v406(p405)
				-- upvalues: (ref) v_u_5
				p405.ImageColor3 = v_u_5
			end
			v_u_94(v_u_397, v_u_401, v404, v406)
			v_u_94(v_u_400, v_u_402, v404, v406)
		end
		v_u_375.Steps = {}
		local v407 = 1 / v_u_376
		for v408 = 1, v_u_376 do
			local v409 = v_u_34("ImageButton")({
				["Name"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 0,
				["BorderSizePixel"] = 0,
				["AutoButtonColor"] = false,
				["Active"] = false,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["Image"] = "",
				["ZIndex"] = 3,
				["Selectable"] = false,
				["ImageTransparency"] = 0.36,
				["Parent"] = nil,
				["SelectionImageObject"] = nil,
				["Name"] = "Step" .. tostring(v408),
				["BackgroundColor3"] = v_u_2,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new((v408 - 1) * v407, 2, 0.5, 0),
				["Size"] = UDim2.new(v407, -4, 0, 24),
				["Parent"] = v_u_375.StepsContainer,
				["SelectionImageObject"] = v_u_44
			})
			if v_u_377 < v408 then
				v409.BackgroundColor3 = v_u_3
			end
			if v408 == 1 or v408 == v_u_376 then
				v_u_34("UICorner")({
					["CornerRadius"] = v_u_1.DefaultCornerRadius,
					["Parent"] = v409
				})
				local v410 = v_u_34("Frame")
				local v411 = {
					["Name"] = "Filler",
					["BackgroundColor3"] = nil,
					["Parent"] = nil,
					["Size"] = nil,
					["BorderSizePixel"] = 0,
					["Position"] = nil,
					["BackgroundColor3"] = v409.BackgroundColor3,
					["Parent"] = v409,
					["Size"] = UDim2.new(0.25, 0, 1, 0)
				}
				local v412
				if v408 == 1 then
					v412 = UDim2.new(0.75, 0, 0, 0)
				else
					v412 = UDim2.new(0, 0, 0, 0)
				end
				v411.Position = v412
				v410(v411)
			end
			v_u_375.Steps[#v_u_375.Steps + 1] = v409
		end
		local function v_u_414() -- name: hideSelection
			-- upvalues: (copy) v_u_376, (copy) v_u_375, (ref) v_u_3, (ref) v_u_21, (ref) v_u_381
			for v413 = 1, v_u_376 do
				v_u_375.Steps[v413].BackgroundColor3 = v_u_3
				if v_u_21 and v_u_381 then
					v_u_375.Steps[v413].BackgroundTransparency = v_u_381[v413] and 0 or 0.8
				else
					if v413 ~= 1 and v413 ~= v_u_376 then
						continue
					end
					v_u_375.Steps[v413].Filler.BackgroundColor3 = v_u_3
				end
			end
		end
		local function v_u_416() -- name: showSelection
			-- upvalues: (copy) v_u_376, (ref) v_u_377, (ref) v_u_21, (ref) v_u_381, (copy) v_u_375, (ref) v_u_2
			for v415 = 1, v_u_376 do
				if v_u_377 < v415 then
					break
				end
				if v_u_21 and v_u_381 then
					if not v_u_381[v415] and v415 ~= v_u_377 then
						continue
					end
					v_u_375.Steps[v415].BackgroundTransparency = 0
					v_u_375.Steps[v415].BackgroundColor3 = v_u_2
				else
					v_u_375.Steps[v415].BackgroundColor3 = v_u_2
					if v415 ~= 1 and v415 ~= v_u_376 then
						continue
					end
					v_u_375.Steps[v415].Filler.BackgroundColor3 = v_u_2
				end
			end
		end
		local function v_u_429(p417, p418) -- name: setCurrentStep
			-- upvalues: (ref) v_u_21, (ref) v_u_381, (ref) v_u_377, (copy) v_u_376, (ref) p_u_372, (copy) v_u_397, (copy) v_u_400, (ref) v_u_380, (copy) v_u_414, (copy) v_u_416, (ref) v_u_379, (copy) v_u_385, (copy) v_u_384
			if v_u_21 and (v_u_381 and (not p418 and p417 ~= v_u_377)) then
				local v419 = v_u_376
				p417 = math.clamp(p417, 1, v419)
				local v420
				if p417 < v_u_377 then
					v420 = -1
				else
					v420 = 1
				end
				if not v_u_381[p417] then
					p417 = p417 + v420
					if p417 >= 1 and v_u_376 >= p417 then
						continue
					end
					return
				end
			end
			if not p_u_372 then
				p_u_372 = 0
			end
			v_u_397.Visible = true
			v_u_400.Visible = true
			if p417 <= p_u_372 then
				p417 = p_u_372
				v_u_397.Visible = false
			end
			if v_u_376 <= p417 then
				p417 = v_u_376
				v_u_400.Visible = false
			end
			if v_u_377 == p417 then
				if v_u_21 and v_u_381 then
					local v421 = false
					local v422 = false
					for v423, v424 in v_u_381 do
						if not v424 then
							continue
						end
						v421 = v421 or v423 < v_u_377
						v422 = v422 or v_u_377 < v423
					end
					v_u_397.Visible = v_u_380 and v421
					v_u_400.Visible = v_u_380 and v422
				end
				return
			else
				v_u_377 = p417
				if v_u_21 and v_u_381 then
					local v425 = false
					local v426 = false
					for v427, v428 in v_u_381 do
						if not v428 then
							continue
						end
						v425 = v425 or v427 < v_u_377
						v426 = v426 or v_u_377 < v427
					end
					v_u_397.Visible = v_u_380 and v425
					v_u_400.Visible = v_u_380 and v426
				end
				v_u_414()
				v_u_416()
				v_u_379 = tick()
				if v_u_385 then
					v_u_385:fire(v_u_377)
				else
					v_u_384:Fire(v_u_377)
				end
			end
		end
		local function v_u_444(p430, p431, p432) -- name: mouseDownFunc
			-- upvalues: (ref) v_u_380, (ref) v_u_21, (ref) v_u_381, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (copy) v_u_375, (ref) v_u_378, (ref) v_u_377, (copy) v_u_376, (copy) v_u_429
			if v_u_380 then
				if v_u_21 and (v_u_381 and not (p432 or v_u_381[p431])) then
					return
				elseif p430 == nil then
					return
				else
					local v433
					if p430 then
						if p430.UserInputType == Enum.UserInputType.MouseButton1 or p430.UserInputType == Enum.UserInputType.Touch then
							v433 = true
						elseif p430.UserInputType == Enum.UserInputType.Gamepad1 then
							v433 = p430.KeyCode == Enum.KeyCode.ButtonA
						else
							v433 = false
						end
					else
						v433 = false
					end
					if v433 then
						local v434
						if v_u_15.VREnabled then
							v434 = false
						else
							v434 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
						end
						if v434 and not v_u_15.VREnabled then
							v_u_10.SelectedCoreObject = v_u_375.SliderFrame
						end
						if v_u_15.VREnabled then
							v_u_378 = 0
						elseif p432 then
							v_u_378 = p431 - v_u_377
						else
							v_u_378 = 0
							local v_u_435 = nil
							local v_u_441 = v_u_9.InputChanged:Connect(function(p436)
								-- upvalues: (ref) v_u_376, (ref) v_u_375, (ref) v_u_429
								if p436.UserInputType == Enum.UserInputType.MouseMovement then
									local v437 = p436.Position.X
									for v438 = 1, v_u_376 do
										local v439 = v_u_375.Steps[v438].AbsolutePosition.X
										local v440 = v_u_375.Steps[v438].AbsoluteSize.X
										if v439 <= v437 and v437 <= v439 + v440 then
											v_u_429(v438)
											return
										elseif v438 == 1 and v437 < v439 then
											v_u_429(0)
										else
											if v438 ~= v_u_376 or v439 > v437 then
												continue
											end
											v_u_429(v438)
										end
									end
								end
							end)
							v_u_435 = v_u_9.InputEnded:Connect(function(p442)
								-- upvalues: (ref) v_u_378, (ref) v_u_435, (ref) v_u_441
								local v443
								if p442 then
									if p442.UserInputType == Enum.UserInputType.MouseButton1 or p442.UserInputType == Enum.UserInputType.Touch then
										v443 = true
									elseif p442.UserInputType == Enum.UserInputType.Gamepad1 then
										v443 = p442.KeyCode == Enum.KeyCode.ButtonA
									else
										v443 = false
									end
								else
									v443 = false
								end
								if v443 then
									v_u_378 = 0
									v_u_435:Disconnect()
									v_u_441:Disconnect()
								end
							end)
						end
						v_u_429(p431)
					end
				end
			else
				return
			end
		end
		v_u_375.ValueChanged = v_u_384.Event
		if v_u_385 then
			v_u_375.ValueChanged = v_u_385
		end
		function v_u_375.SetValue(_, p445) -- name: SetValue
			-- upvalues: (ref) v_u_21, (copy) v_u_429, (ref) v_u_381
			if v_u_21 then
				v_u_429(p445, v_u_381 ~= nil)
			else
				v_u_429(p445)
			end
		end
		function v_u_375.GetValue(_) -- name: GetValue
			-- upvalues: (ref) v_u_377
			return v_u_377
		end
		function v_u_375.SetEnabledSteps(_, p446) -- name: SetEnabledSteps
			-- upvalues: (ref) v_u_21, (ref) v_u_381, (copy) v_u_375, (ref) v_u_1, (copy) v_u_376, (ref) v_u_380, (ref) v_u_377, (ref) v_u_15, (copy) v_u_414, (copy) v_u_416, (copy) v_u_397, (copy) v_u_400
			if v_u_21 then
				v_u_381 = p446
				for v447, v448 in v_u_375.Steps do
					local v449 = v448:FindFirstChild("Filler")
					if v449 then
						local v450 = v448:FindFirstChildOfClass("UICorner")
						local v451
						if v447 == 1 then
							v451 = v_u_1.DefaultCornerRadius
						else
							v451 = UDim.new(0, 0)
						end
						v450.TopLeftRadius = v451
						v450.BottomLeftRadius = v450.TopLeftRadius
						local v452
						if v447 == v_u_376 then
							v452 = v_u_1.DefaultCornerRadius
						else
							v452 = UDim.new(0, 0)
						end
						v450.TopRightRadius = v452
						v450.BottomRightRadius = v450.TopRightRadius
						v449:Destroy()
					end
					local v453 = v_u_380
					if v453 then
						v453 = p446[v447]
					end
					v448.BackgroundTransparency = (p446[v447] or v447 == v_u_377) and 0 or 0.8
					v448.Active = v_u_15.VREnabled and v453
					v448.Selectable = v_u_15.VREnabled and v453
				end
				v_u_414()
				v_u_416()
				local v454 = false
				local v455 = false
				for v456, v457 in v_u_381 do
					if not v457 then
						continue
					end
					v454 = v454 or v456 < v_u_377
					v455 = v455 or v_u_377 < v456
				end
				v_u_397.Visible = v_u_380 and v454
				v_u_400.Visible = v_u_380 and v455
			end
		end
		function v_u_375.SetInteractable(_, p458) -- name: SetInteractable
			-- upvalues: (ref) v_u_378, (ref) v_u_380, (copy) v_u_375, (copy) v_u_414, (copy) v_u_416
			v_u_378 = 0
			v_u_380 = p458
			v_u_375.SliderFrame.Selectable = p458
			if v_u_380 then
				v_u_416()
			else
				v_u_414()
			end
		end
		function v_u_375.SetZIndex(_, p459) -- name: SetZIndex
			-- upvalues: (copy) v_u_397, (copy) v_u_400, (copy) v_u_401, (copy) v_u_402, (copy) v_u_375
			v_u_397.ZIndex = p459
			v_u_400.ZIndex = p459
			v_u_401.ZIndex = p459
			v_u_402.ZIndex = p459
			for v460 = 1, #v_u_375.Steps do
				v_u_375.Steps[v460].ZIndex = p459
			end
		end
		function v_u_375.SetMinStep(_, p461) -- name: SetMinStep
			-- upvalues: (copy) v_u_376, (ref) p_u_372, (ref) v_u_377, (copy) v_u_397, (copy) v_u_400
			if p461 >= 0 and p461 <= v_u_376 then
				p_u_372 = p461
			end
			if v_u_377 <= p_u_372 then
				v_u_377 = p_u_372
				v_u_397.Visible = false
			end
			if v_u_376 <= v_u_377 then
				v_u_377 = v_u_376
				v_u_400.Visible = false
			end
		end
		v_u_397.InputBegan:Connect(function(p462)
			-- upvalues: (ref) v_u_377, (ref) v_u_380, (ref) v_u_21, (ref) v_u_381, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (copy) v_u_375, (ref) v_u_378, (copy) v_u_429
			local v463 = v_u_377 - 1
			if v_u_380 then
				if p462 == nil then
					return
				else
					local v464
					if p462 then
						if p462.UserInputType == Enum.UserInputType.MouseButton1 or p462.UserInputType == Enum.UserInputType.Touch then
							v464 = true
						elseif p462.UserInputType == Enum.UserInputType.Gamepad1 then
							v464 = p462.KeyCode == Enum.KeyCode.ButtonA
						else
							v464 = false
						end
					else
						v464 = false
					end
					if v464 then
						local v465
						if v_u_15.VREnabled then
							v465 = false
						else
							v465 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
						end
						if v465 and not v_u_15.VREnabled then
							v_u_10.SelectedCoreObject = v_u_375.SliderFrame
						end
						if v_u_15.VREnabled then
							v_u_378 = 0
						else
							v_u_378 = v463 - v_u_377
						end
						v_u_429(v463)
					end
				end
			else
				return
			end
		end)
		v_u_397.InputEnded:Connect(function(p466)
			-- upvalues: (ref) v_u_380, (ref) v_u_378
			if v_u_380 then
				local v467
				if p466 then
					if p466.UserInputType == Enum.UserInputType.MouseButton1 or p466.UserInputType == Enum.UserInputType.Touch then
						v467 = true
					elseif p466.UserInputType == Enum.UserInputType.Gamepad1 then
						v467 = p466.KeyCode == Enum.KeyCode.ButtonA
					else
						v467 = false
					end
				else
					v467 = false
				end
				if v467 then
					v_u_378 = 0
				end
			else
				return
			end
		end)
		v_u_400.InputBegan:Connect(function(p468)
			-- upvalues: (ref) v_u_377, (ref) v_u_380, (ref) v_u_21, (ref) v_u_381, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (copy) v_u_375, (ref) v_u_378, (copy) v_u_429
			local v469 = v_u_377 + 1
			if v_u_380 then
				if p468 == nil then
					return
				else
					local v470
					if p468 then
						if p468.UserInputType == Enum.UserInputType.MouseButton1 or p468.UserInputType == Enum.UserInputType.Touch then
							v470 = true
						elseif p468.UserInputType == Enum.UserInputType.Gamepad1 then
							v470 = p468.KeyCode == Enum.KeyCode.ButtonA
						else
							v470 = false
						end
					else
						v470 = false
					end
					if v470 then
						local v471
						if v_u_15.VREnabled then
							v471 = false
						else
							v471 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
						end
						if v471 and not v_u_15.VREnabled then
							v_u_10.SelectedCoreObject = v_u_375.SliderFrame
						end
						if v_u_15.VREnabled then
							v_u_378 = 0
						else
							v_u_378 = v469 - v_u_377
						end
						v_u_429(v469)
					end
				end
			else
				return
			end
		end)
		v_u_400.InputEnded:Connect(function(p472)
			-- upvalues: (ref) v_u_380, (ref) v_u_378
			if v_u_380 then
				local v473
				if p472 then
					if p472.UserInputType == Enum.UserInputType.MouseButton1 or p472.UserInputType == Enum.UserInputType.Touch then
						v473 = true
					elseif p472.UserInputType == Enum.UserInputType.Gamepad1 then
						v473 = p472.KeyCode == Enum.KeyCode.ButtonA
					else
						v473 = false
					end
				else
					v473 = false
				end
				if v473 then
					v_u_378 = 0
				end
			else
				return
			end
		end)
		local function v478(p474) -- name: onVREnabled
			-- upvalues: (ref) v_u_15, (copy) v_u_397, (ref) v_u_380, (copy) v_u_400, (copy) v_u_375, (copy) v_u_376, (ref) v_u_21, (ref) v_u_381
			if p474 == "VREnabled" then
				if v_u_15.VREnabled then
					v_u_397.Selectable = v_u_380
					v_u_400.Selectable = v_u_380
					v_u_375.SliderFrame.Selectable = v_u_380
					for v475 = 1, v_u_376 do
						if v_u_21 and v_u_381 then
							local v476 = v_u_380
							if v476 then
								v476 = v_u_381[v475]
							end
							v_u_375.Steps[v475].Selectable = v476
							v_u_375.Steps[v475].Active = v476
						else
							v_u_375.Steps[v475].Selectable = v_u_380
							v_u_375.Steps[v475].Active = v_u_380
						end
					end
				else
					v_u_397.Selectable = false
					v_u_400.Selectable = false
					v_u_375.SliderFrame.Selectable = v_u_380
					for v477 = 1, v_u_376 do
						v_u_375.Steps[v477].Selectable = false
						v_u_375.Steps[v477].Active = false
					end
				end
			else
				return
			end
		end
		v_u_15.Changed:Connect(v478)
		v478("VREnabled")
		for v_u_479 = 1, v_u_376 do
			v_u_375.Steps[v_u_479].InputBegan:Connect(function(p480)
				-- upvalues: (copy) v_u_444, (copy) v_u_479
				v_u_444(p480, v_u_479)
			end)
			v_u_375.Steps[v_u_479].InputEnded:Connect(function(p481)
				-- upvalues: (ref) v_u_380, (ref) v_u_378
				if v_u_380 then
					local v482
					if p481 then
						if p481.UserInputType == Enum.UserInputType.MouseButton1 or p481.UserInputType == Enum.UserInputType.Touch then
							v482 = true
						elseif p481.UserInputType == Enum.UserInputType.Gamepad1 then
							v482 = p481.KeyCode == Enum.KeyCode.ButtonA
						else
							v482 = false
						end
					else
						v482 = false
					end
					if v482 then
						v_u_378 = 0
					end
				else
					return
				end
			end)
		end
		v_u_375.SliderFrame.InputBegan:Connect(function(p483)
			-- upvalues: (ref) v_u_15, (ref) v_u_10, (copy) v_u_375, (copy) v_u_444, (ref) v_u_377
			if v_u_15.VREnabled then
				local v484 = v_u_10.SelectedCoreObject
				if not (v484 and v484:IsDescendantOf(v_u_375.SliderFrame.Parent)) then
					return
				end
			end
			v_u_444(p483, v_u_377)
		end)
		v_u_375.SliderFrame.InputEnded:Connect(function(p485)
			-- upvalues: (ref) v_u_15, (ref) v_u_10, (copy) v_u_375, (ref) v_u_380, (ref) v_u_378
			if v_u_15.VREnabled then
				local v486 = v_u_10.SelectedCoreObject
				if not (v486 and v486:IsDescendantOf(v_u_375.SliderFrame.Parent)) then
					return
				end
			end
			if v_u_380 then
				local v487
				if p485 then
					if p485.UserInputType == Enum.UserInputType.MouseButton1 or p485.UserInputType == Enum.UserInputType.Touch then
						v487 = true
					elseif p485.UserInputType == Enum.UserInputType.Gamepad1 then
						v487 = p485.KeyCode == Enum.KeyCode.ButtonA
					else
						v487 = false
					end
				else
					v487 = false
				end
				if v487 then
					v_u_378 = 0
				end
			else
				return
			end
		end)
		local function v_u_488()
			-- upvalues: (ref) v_u_379, (copy) v_u_429, (ref) v_u_377, (ref) v_u_378
			if v_u_379 ~= nil then
				if tick() - v_u_379 >= 0.2 then
					v_u_429(v_u_377 + v_u_378)
				end
			end
		end
		local v_u_489 = true
		local v_u_490 = {
			[Enum.KeyCode.Thumbstick1] = true,
			[Enum.KeyCode.DPadLeft] = -1,
			[Enum.KeyCode.DPadRight] = 1,
			[Enum.KeyCode.Left] = -1,
			[Enum.KeyCode.Right] = 1,
			[Enum.KeyCode.A] = -1,
			[Enum.KeyCode.D] = 1,
			[Enum.KeyCode.ButtonA] = true
		}
		v_u_9.InputBegan:Connect(function(p491)
			-- upvalues: (ref) v_u_380, (ref) v_u_489, (ref) v_u_10, (copy) v_u_375, (copy) v_u_490, (ref) v_u_378, (copy) v_u_429, (ref) v_u_377
			if v_u_380 then
				if v_u_489 then
					if p491.UserInputType == Enum.UserInputType.Gamepad1 or p491.UserInputType == Enum.UserInputType.Keyboard then
						local v492 = v_u_10.SelectedCoreObject
						if v492 and v492:IsDescendantOf(v_u_375.SliderFrame.Parent) then
							if v_u_490[p491.KeyCode] == -1 then
								v_u_378 = -1
								v_u_429(v_u_377 - 1)
							elseif v_u_490[p491.KeyCode] == 1 then
								v_u_378 = 1
								v_u_429(v_u_377 + 1)
							end
						else
							return
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		end)
		v_u_9.InputEnded:Connect(function(p493)
			-- upvalues: (ref) v_u_380, (ref) v_u_10, (copy) v_u_375, (copy) v_u_490, (ref) v_u_378
			if v_u_380 then
				if p493.UserInputType == Enum.UserInputType.Gamepad1 or p493.UserInputType == Enum.UserInputType.Keyboard then
					local v494 = v_u_10.SelectedCoreObject
					if v494 and v494:IsDescendantOf(v_u_375.SliderFrame.Parent) then
						if v_u_490[p493.KeyCode] then
							v_u_378 = 0
						end
					end
				else
					return
				end
			else
				return
			end
		end)
		v_u_9.InputChanged:Connect(function(p495)
			-- upvalues: (ref) v_u_380, (ref) v_u_378, (ref) v_u_489, (ref) v_u_10, (copy) v_u_375, (copy) v_u_429, (ref) v_u_377
			if v_u_380 then
				if v_u_489 then
					if p495.UserInputType == Enum.UserInputType.Gamepad1 then
						local v496 = v_u_10.SelectedCoreObject
						if v496 and v496:IsDescendantOf(v_u_375.SliderFrame.Parent) then
							if p495.KeyCode == Enum.KeyCode.Thumbstick1 then
								if p495.Position.X > 0.8 and (p495.Delta.X > 0 and v_u_378 ~= 1) then
									v_u_378 = 1
									v_u_429(v_u_377 + 1)
									return
								elseif p495.Position.X < -0.8 and (p495.Delta.X < 0 and v_u_378 ~= -1) then
									v_u_378 = -1
									v_u_429(v_u_377 - 1)
								else
									local v497 = p495.Position.X
									if math.abs(v497) < 0.8 then
										v_u_378 = 0
									end
								end
							else
								return
							end
						else
							return
						end
					else
						return
					end
				else
					v_u_378 = 0
					return
				end
			else
				v_u_378 = 0
				return
			end
		end)
		local v_u_498 = false
		v_u_10.Changed:Connect(function(p499)
			-- upvalues: (ref) v_u_10, (copy) v_u_375, (ref) v_u_498, (ref) v_u_379, (ref) v_u_11, (copy) v_u_382, (copy) v_u_488
			if p499 == "SelectedCoreObject" then
				local v500 = v_u_10.SelectedCoreObject
				if v500 then
					v500 = v500:IsDescendantOf(v_u_375.SliderFrame.Parent)
				end
				if v500 then
					if not v_u_498 then
						v_u_498 = true
						v_u_379 = tick()
						v_u_11:BindToRenderStep(v_u_382, Enum.RenderPriority.Input.Value + 1, v_u_488)
						return
					end
				elseif v_u_498 then
					v_u_498 = false
					v_u_11:UnbindFromRenderStep(v_u_382)
				end
			end
		end)
		v_u_375.SliderFrame.AncestryChanged:Connect(function(_, p501)
			-- upvalues: (ref) v_u_489
			v_u_489 = p501
		end)
		v_u_429(v_u_377)
		return v_u_375
	end
	error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2)
end
local v_u_503 = v_u_38 and 90 or 50
local v_u_504 = {}
local function v_u_571(p_u_505, p_u_506, p507, p508, p509, p510, p511, p512, p513, p514) -- name: AddNewRow
	-- upvalues: (copy) v_u_504, (copy) v_u_34, (ref) v_u_503, (copy) v_u_44, (copy) v_u_1, (copy) v_u_38, (copy) v_u_10, (copy) v_u_43, (copy) v_u_502, (copy) v_u_346, (copy) v_u_267, (copy) v_u_15, (copy) v_u_9, (copy) v_u_12
	local v515 = p507 ~= "TextBox"
	local v516 = not v_u_504[p_u_505] and 0 or v_u_504[p_u_505]
	local v517 = v_u_34("ImageButton")
	local v518 = {
		["Name"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Image"] = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["ImageTransparency"] = 1,
		["Active"] = false,
		["AutoButtonColor"] = false,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["Position"] = nil,
		["ZIndex"] = 2,
		["Selectable"] = false,
		["SelectionImageObject"] = nil,
		["Parent"] = nil,
		["Name"] = p_u_506 .. "Frame",
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(2, 2, 18, 18),
		["Size"] = UDim2.new(1, 0, 0, v_u_503)
	}
	local v519
	if p511 or (p512 or p513) then
		v519 = Enum.AutomaticSize.Y
	else
		v519 = nil
	end
	v518.AutomaticSize = v519
	v518.Position = UDim2.new(0, 0, 0, v516)
	v518.SelectionImageObject = v_u_44
	v518.Parent = p_u_505.Page
	local v_u_520 = v517(v518)
	v_u_520.BackgroundColor3 = v_u_1.color("RowFrameBackground")
	v_u_520.ImageColor3 = v_u_520.BackgroundColor3
	v_u_34("UICorner")({
		["CornerRadius"] = v_u_1.DefaultCornerRadius,
		["Parent"] = v_u_520
	})
	if v_u_520 and p510 then
		v_u_520.Position = UDim2.new(v_u_520.Position.X.Scale, v_u_520.Position.X.Offset, v_u_520.Position.Y.Scale, v_u_520.Position.Y.Offset + p510)
	end
	local v_u_521
	if p511 then
		local v522 = v_u_34("Frame")({
			["Name"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Parent"] = nil,
			["Name"] = p_u_506 .. "RowLabelAndDescriptionFrame",
			["Position"] = UDim2.new(0, 10, 0, 0),
			["Size"] = UDim2.new(0.4, -20, 0, 50),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Parent"] = v_u_520
		})
		v_u_521 = v_u_34("TextLabel")({
			["Name"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["TextWrapped"] = true,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["LayoutOrder"] = 1,
			["Name"] = p_u_506 .. "Label",
			["Text"] = p_u_506,
			["Font"] = v_u_1.font(Enum.Font.SourceSansBold, "UtilityRow"),
			["TextSize"] = v_u_1.textSize(16, "UtilityRow"),
			["TextColor3"] = Color3.fromRGB(255, 255, 255),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Size"] = UDim2.fromScale(1, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Parent"] = v522
		})
		v_u_34("TextLabel")({
			["Name"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = 0.25,
			["TextXAlignment"] = nil,
			["TextWrapped"] = true,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["LayoutOrder"] = 2,
			["Name"] = p_u_506 .. "Description",
			["Text"] = p511,
			["Font"] = v_u_1.font(Enum.Font.SourceSans, "UtilityRow"),
			["TextSize"] = v_u_1.textSize(18, "UtilityRow"),
			["TextColor3"] = Color3.fromRGB(255, 255, 255),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Size"] = UDim2.fromScale(1, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Parent"] = v522
		})
		v_u_34("UIListLayout")({
			["Name"] = p_u_506 .. "UIListLayout",
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 8),
			["Parent"] = v522
		})
		v_u_34("UIPadding")({
			["Name"] = p_u_506 .. "UIListLayout",
			["PaddingBottom"] = UDim.new(0, 10),
			["PaddingTop"] = UDim.new(0, 10),
			["Parent"] = v522
		})
	else
		v_u_521 = v_u_34("TextLabel")({
			["Name"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["TextWrapped"] = true,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Name"] = p_u_506 .. "Label",
			["Text"] = p_u_506,
			["Font"] = v_u_1.font(Enum.Font.SourceSansBold, "UtilityRow"),
			["TextSize"] = v_u_1.textSize(16, "UtilityRow"),
			["TextColor3"] = Color3.fromRGB(255, 255, 255),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Size"] = UDim2.new(0.4, -20, 1, 0),
			["Position"] = UDim2.new(0, 10, 0, 0),
			["Parent"] = v_u_520
		})
		v_u_34("UIPadding")({
			["Name"] = p_u_506 .. "UIPadding",
			["PaddingBottom"] = UDim.new(0, 10),
			["PaddingTop"] = UDim.new(0, 10),
			["Parent"] = v_u_521
		})
	end
	if not v515 then
		v_u_521.Text = ""
	end
	local function v524(_, p523) -- name: onResized
		-- upvalues: (ref) v_u_521, (ref) v_u_1, (ref) v_u_38
		if p523 then
			v_u_521.TextSize = v_u_1.textSize(16, "UtilityRow")
		else
			v_u_521.TextSize = v_u_38 and v_u_1.textSize(36) or v_u_1.textSize(24, "UtilityText")
		end
	end
	if _G.__TESTEZ_RUNNING_TEST__ then
		Vector2.new(1024, 1024)
	else
		v_u_10:GetHardwareSafeViewport()
	end
	local v525
	if _G.__TESTEZ_RUNNING_TEST__ then
		v525 = Vector2.new(1024, 1024)
	else
		v525 = v_u_10:GetHardwareSafeViewport()
	end
	if v525.Y > v525.X then
		v_u_521.TextSize = v_u_1.textSize(16, "UtilityRow")
	else
		v_u_521.TextSize = v_u_38 and v_u_1.textSize(36) or v_u_1.textSize(24, "UtilityText")
	end
	v_u_43[v_u_520] = v524
	if _G.__TESTEZ_RUNNING_TEST__ then
		Vector2.new(1024, 1024)
	else
		v_u_10:GetHardwareSafeViewport()
	end
	local v526
	if _G.__TESTEZ_RUNNING_TEST__ then
		v526 = Vector2.new(1024, 1024)
	else
		v526 = v_u_10:GetHardwareSafeViewport()
	end
	if v526.Y > v526.X then
		v_u_521.TextSize = v_u_1.textSize(16, "UtilityRow")
	else
		v_u_521.TextSize = v_u_38 and v_u_1.textSize(36) or v_u_1.textSize(24, "UtilityText")
	end
	local v_u_527 = nil
	local v_u_528 = nil
	if p507 == "Slider" then
		v_u_528 = v_u_502(p508, p509, nil, p512, p513)
		v_u_528.SliderFrame.Parent = v_u_520
		v_u_527 = v_u_528.SliderFrame
	elseif p507 == "Selector" then
		v_u_528 = v_u_346(p508, p509)
		v_u_528.SelectorFrame.Parent = v_u_520
		v_u_527 = v_u_528.SelectorFrame
	elseif p507 == "DropDown" then
		v_u_528 = v_u_267(p508, p509, p_u_505.HubRef)
		v_u_528.DropDownFrame.Parent = v_u_520
		v_u_527 = v_u_528.DropDownFrame
	elseif p507 == "TextBox" then
		local v529 = v_u_34("ImageLabel")({
			["Image"] = "",
			["BackgroundTransparency"] = 1
		})
		v_u_528 = {
			["HubRef"] = nil
		}
		local v_u_530 = v_u_34("TextBox")({
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["TextYAlignment"] = nil,
			["TextXAlignment"] = nil,
			["TextWrapped"] = true,
			["Font"] = nil,
			["TextSize"] = nil,
			["ZIndex"] = 2,
			["SelectionImageObject"] = nil,
			["ClearTextOnFocus"] = false,
			["Interactable"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Size"] = UDim2.new(0.6, 0, 1, 0),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Text"] = p_u_506,
			["TextColor3"] = Color3.fromRGB(49, 49, 49),
			["BackgroundTransparency"] = v_u_1.transparency("ControlInputBackground", 0.5),
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Font"] = v_u_1.font(Enum.Font.SourceSans, "UtilityText"),
			["TextSize"] = v_u_1.textSize(24, "UtilityText"),
			["SelectionImageObject"] = v529,
			["Interactable"] = p514,
			["Parent"] = v_u_520
		})
		v_u_527 = v_u_530
		v_u_530.Focused:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (copy) v_u_530, (copy) p_u_506
			local v531
			if v_u_15.VREnabled then
				v531 = false
			else
				v531 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v531 then
				v_u_10.SelectedCoreObject = v_u_530
			end
			if v_u_530.Text == p_u_506 then
				v_u_530.Text = ""
			end
		end)
		if p510 then
			v_u_530.Position = UDim2.new(v_u_530.Position.X.Scale, v_u_530.Position.X.Offset, v_u_530.Position.Y.Scale, v_u_530.Position.Y.Offset + p510)
		end
		v_u_527.SelectionGained:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (copy) v_u_530, (ref) v_u_1, (ref) v_u_528, (ref) v_u_527
			local v532
			if v_u_15.VREnabled then
				v532 = false
			else
				v532 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v532 then
				v_u_530.BackgroundTransparency = v_u_1.transparency("ControlInputBackground", 0.1)
				if v_u_528.HubRef then
					v_u_528.HubRef:ScrollToFrame(v_u_527)
				end
			end
		end)
		v_u_527.SelectionLost:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (copy) v_u_530, (ref) v_u_1
			local v533
			if v_u_15.VREnabled then
				v533 = false
			else
				v533 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v533 then
				v_u_530.BackgroundTransparency = v_u_1.transparency("ControlInputBackground", 0.5)
			end
		end)
		local function v537()
			-- upvalues: (ref) v_u_12, (ref) v_u_527, (ref) v_u_15, (ref) v_u_9, (copy) p_u_505, (ref) v_u_10
			local v534 = v_u_12.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			if not (v534 and v534.Visible) then
				local v535 = v_u_527
				if v535 and (v535.Visible and v535.ZIndex > 1) then
					local v536
					if v_u_15.VREnabled then
						v536 = false
					else
						v536 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
					end
					if v536 and p_u_505.Active then
						v_u_10.SelectedCoreObject = v535
					end
				end
			end
		end
		local function v539(p538) -- name: processInput
			-- upvalues: (ref) v_u_10, (ref) v_u_527, (copy) v_u_530
			if p538.UserInputState == Enum.UserInputState.Begin and (p538.KeyCode == Enum.KeyCode.Return and v_u_10.SelectedCoreObject == v_u_527) then
				v_u_530:CaptureFocus()
			end
		end
		v_u_530.MouseEnter:Connect(v537)
		v_u_9.InputBegan:Connect(v539)
	elseif p507 == "TextEntry" then
		local v540 = v_u_34("ImageLabel")({
			["Image"] = "",
			["BackgroundTransparency"] = 1
		})
		v_u_528 = {
			["HubRef"] = nil
		}
		local v_u_541 = v_u_34("TextBox")({
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["TextYAlignment"] = nil,
			["TextXAlignment"] = nil,
			["TextWrapped"] = false,
			["Font"] = nil,
			["TextSize"] = nil,
			["ZIndex"] = 2,
			["SelectionImageObject"] = nil,
			["ClearTextOnFocus"] = false,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Size"] = UDim2.new(0.4, -10, 0, 40),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Text"] = p_u_506,
			["TextColor3"] = Color3.fromRGB(178, 178, 178),
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["Font"] = v_u_1.font(Enum.Font.SourceSans, "UtilityText"),
			["TextSize"] = v_u_1.textSize(24, "UtilityText"),
			["SelectionImageObject"] = v540,
			["Parent"] = v_u_520
		})
		v_u_527 = v_u_541
		v_u_541.Focused:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (copy) v_u_541, (copy) p_u_506
			local v542
			if v_u_15.VREnabled then
				v542 = false
			else
				v542 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v542 then
				v_u_10.SelectedCoreObject = v_u_541
			end
			if v_u_541.Text == p_u_506 then
				v_u_541.Text = ""
			end
		end)
		if p510 then
			v_u_541.Position = UDim2.new(v_u_541.Position.X.Scale, v_u_541.Position.X.Offset, v_u_541.Position.Y.Scale, v_u_541.Position.Y.Offset + p510)
		end
		v_u_527.SelectionGained:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (copy) v_u_541, (ref) v_u_528, (ref) v_u_527
			local v543
			if v_u_15.VREnabled then
				v543 = false
			else
				v543 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v543 then
				v_u_541.BackgroundTransparency = 0.8
				if v_u_528.HubRef then
					v_u_528.HubRef:ScrollToFrame(v_u_527)
				end
			end
		end)
		v_u_527.SelectionLost:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (copy) v_u_541
			local v544
			if v_u_15.VREnabled then
				v544 = false
			else
				v544 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v544 then
				v_u_541.BackgroundTransparency = 1
			end
		end)
		local function v548()
			-- upvalues: (ref) v_u_12, (ref) v_u_527, (ref) v_u_15, (ref) v_u_9, (copy) p_u_505, (ref) v_u_10
			local v545 = v_u_12.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			if not (v545 and v545.Visible) then
				local v546 = v_u_527
				if v546 and (v546.Visible and v546.ZIndex > 1) then
					local v547
					if v_u_15.VREnabled then
						v547 = false
					else
						v547 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
					end
					if v547 and p_u_505.Active then
						v_u_10.SelectedCoreObject = v546
					end
				end
			end
		end
		local function v550(p549) -- name: processInput
			-- upvalues: (ref) v_u_10, (ref) v_u_527, (copy) v_u_541
			if p549.UserInputState == Enum.UserInputState.Begin and (p549.KeyCode == Enum.KeyCode.Return and v_u_10.SelectedCoreObject == v_u_527) then
				v_u_541:CaptureFocus()
			end
		end
		v_u_520.MouseEnter:Connect(v548)
		function v_u_528.SetZIndex(_, p551) -- name: SetZIndex
			-- upvalues: (copy) v_u_541
			v_u_541.ZIndex = p551
		end
		function v_u_528.SetInteractable(_, p552) -- name: SetInteractable
			-- upvalues: (copy) v_u_541
			v_u_541.Selectable = p552
			if p552 then
				v_u_541.TextColor3 = Color3.fromRGB(178, 178, 178)
				v_u_541.ZIndex = 2
			else
				v_u_541.TextColor3 = Color3.fromRGB(49, 49, 49)
				v_u_541.ZIndex = 1
			end
		end
		function v_u_528.SetValue(_, p553) -- name: SetValue
			-- upvalues: (copy) v_u_541
			v_u_541.Text = p553
		end
		local v_u_554 = Instance.new("BindableEvent")
		v_u_554.Name = "ValueChanged"
		v_u_541.FocusLost:Connect(function()
			-- upvalues: (copy) v_u_554, (copy) v_u_541
			v_u_554:Fire(v_u_541.Text)
		end)
		v_u_528.ValueChanged = v_u_554.Event
		v_u_9.InputBegan:Connect(v550)
	end
	v_u_528.Name = p_u_506 .. "ValueChanger"
	local v_u_555 = v_u_528.SetAutoLocalize
	function v_u_528.SetAutoLocalize(p556, p557)
		-- upvalues: (ref) v_u_520, (copy) v_u_555
		v_u_520.AutoLocalize = p557
		if v_u_555 then
			v_u_555(p556, p557)
		end
	end
	local v558 = v516 + v_u_503
	if p510 then
		v558 = v558 + p510
	end
	v_u_504[p_u_505] = v558
	if v515 then
		local function v562()
			-- upvalues: (ref) v_u_12, (ref) v_u_528, (ref) v_u_15, (ref) v_u_9, (copy) p_u_505, (ref) v_u_10
			local v559 = v_u_12.RobloxGui:FindFirstChild("DropDownFullscreenFrame")
			if not (v559 and v559.Visible) then
				local v560 = v_u_528.SliderFrame or v_u_528.SliderFrame or v_u_528.DropDownFrame or v_u_528.SelectorFrame
				if v560 and (v560.Visible and v560.ZIndex > 1) then
					local v561
					if v_u_15.VREnabled then
						v561 = false
					else
						v561 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
					end
					if v561 and p_u_505.Active then
						v_u_10.SelectedCoreObject = v560
					end
				end
			end
		end
		v_u_520.MouseEnter:Connect(v562)
		local function v566(p563) -- name: onVREnabled
			-- upvalues: (ref) v_u_15, (ref) v_u_520, (ref) v_u_527, (ref) v_u_10, (ref) v_u_1
			if p563 == "VREnabled" then
				if v_u_15.VREnabled then
					v_u_520.Selectable = true
					v_u_520.Active = true
					v_u_527.Active = true
					v_u_10.Changed:Connect(function(p564)
						-- upvalues: (ref) v_u_10, (ref) v_u_520, (ref) v_u_1
						if p564 == "SelectedCoreObject" then
							local v565 = v_u_10.SelectedCoreObject
							if v565 and (v565 == v_u_520 or v565:IsDescendantOf(v_u_520)) then
								v_u_520.ImageTransparency = v_u_1.transparency("RowFrameBackground", 0.5)
								v_u_520.BackgroundTransparency = 1
								return
							end
							v_u_520.ImageTransparency = 1
							v_u_520.BackgroundTransparency = 1
						end
					end)
					return
				end
				v_u_520.Selectable = false
				v_u_520.Active = false
			end
		end
		v_u_15.Changed:Connect(v566)
		if v_u_15.VREnabled then
			v_u_520.Selectable = true
			v_u_520.Active = true
			v_u_527.Active = true
			v_u_10.Changed:Connect(function(p567)
				-- upvalues: (ref) v_u_10, (ref) v_u_520, (ref) v_u_1
				if p567 == "SelectedCoreObject" then
					local v568 = v_u_10.SelectedCoreObject
					if v568 and (v568 == v_u_520 or v568:IsDescendantOf(v_u_520)) then
						v_u_520.ImageTransparency = v_u_1.transparency("RowFrameBackground", 0.5)
						v_u_520.BackgroundTransparency = 1
						return
					end
					v_u_520.ImageTransparency = 1
					v_u_520.BackgroundTransparency = 1
				end
			end)
		else
			v_u_520.Selectable = false
			v_u_520.Active = false
		end
		v_u_527.SelectionGained:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_520, (ref) v_u_1, (ref) v_u_528
			local v569
			if v_u_15.VREnabled then
				v569 = false
			else
				v569 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v569 then
				if v_u_15.VREnabled then
					v_u_520.ImageTransparency = 0.5
					v_u_520.BackgroundTransparency = 1
				else
					v_u_520.ImageTransparency = 1
					v_u_520.BackgroundTransparency = v_u_1.transparency("RowFrameBackground", 0.5)
				end
				if v_u_528.HubRef then
					v_u_528.HubRef:ScrollToFrame(v_u_520)
				end
			end
		end)
		v_u_527.SelectionLost:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_9, (ref) v_u_520
			local v570
			if v_u_15.VREnabled then
				v570 = false
			else
				v570 = (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
			end
			if v570 then
				v_u_520.ImageTransparency = 1
				v_u_520.BackgroundTransparency = 1
			end
		end)
	end
	p_u_505:AddRow(v_u_520, v_u_521, v_u_528, p510, false)
	v_u_528.Selection = v_u_527
	return v_u_520, v_u_521, v_u_528
end
local function v_u_586(p572, p573, p574, p575, p_u_576) -- name: AddNewRowObject
	-- upvalues: (copy) v_u_504, (copy) v_u_34, (ref) v_u_503, (copy) v_u_44, (copy) v_u_1, (copy) v_u_38, (copy) v_u_43, (copy) v_u_10, (copy) v_u_15
	local v577 = not v_u_504[p572] and 0 or v_u_504[p572]
	local v_u_578 = v_u_34("ImageButton")({
		["Name"] = nil,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["BorderSizePixel"] = 0,
		["Image"] = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["ImageTransparency"] = 1,
		["Active"] = false,
		["AutoButtonColor"] = false,
		["Size"] = nil,
		["Position"] = nil,
		["ZIndex"] = 2,
		["Selectable"] = false,
		["SelectionImageObject"] = nil,
		["Parent"] = nil,
		["Name"] = p573 .. "Frame",
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(10, 10, 10, 10),
		["Size"] = UDim2.new(1, 0, 0, v_u_503),
		["Position"] = UDim2.new(0, 0, 0, v577),
		["SelectionImageObject"] = v_u_44,
		["Parent"] = p572.Page
	})
	v_u_578.BackgroundColor3 = v_u_1.color("RowFrameBackground")
	v_u_578.ImageColor3 = v_u_578.BackgroundColor3
	v_u_578.SelectionGained:Connect(function()
		-- upvalues: (copy) v_u_578, (ref) v_u_1
		v_u_578.BackgroundTransparency = v_u_1.transparency("RowFrameBackground", 0.5)
	end)
	v_u_578.SelectionLost:Connect(function()
		-- upvalues: (copy) v_u_578
		v_u_578.BackgroundTransparency = 1
	end)
	v_u_34("UICorner")({
		["CornerRadius"] = v_u_1.DefaultCornerRadius,
		["Parent"] = v_u_578
	})
	local v_u_579 = v_u_34("TextLabel")({
		["Name"] = nil,
		["Text"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["TextWrapped"] = true,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["ZIndex"] = 2,
		["Parent"] = nil,
		["Name"] = p573 .. "Label",
		["Text"] = p573,
		["Font"] = v_u_1.font(Enum.Font.SourceSansBold, "UtilityRow"),
		["TextSize"] = v_u_1.textSize(16, "UtilityRow"),
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["Size"] = UDim2.new(0.4, -20, 1, 0),
		["Position"] = UDim2.new(0, 10, 0, 0),
		["Parent"] = v_u_578
	})
	v_u_34("UIPadding")({
		["Name"] = p573 .. "UIPadding",
		["PaddingBottom"] = UDim.new(0, 10),
		["PaddingTop"] = UDim.new(0, 10),
		["Parent"] = v_u_579
	})
	local function v581(_, p580) -- name: onResized
		-- upvalues: (copy) p_u_576, (copy) v_u_579, (ref) v_u_1, (ref) v_u_38
		if p_u_576 then
			UDim2.new(0, 200, 1, 0)
		end
		if p580 then
			v_u_579.TextSize = v_u_1.textSize(16, "UtilityRow")
		else
			v_u_579.TextSize = v_u_38 and v_u_1.textSize(36) or v_u_1.textSize(24, "UtilityText")
		end
	end
	v_u_43[v_u_578] = v581
	local v582
	if _G.__TESTEZ_RUNNING_TEST__ then
		v582 = Vector2.new(1024, 1024)
	else
		v582 = v_u_10:GetHardwareSafeViewport()
	end
	local v583
	if _G.__TESTEZ_RUNNING_TEST__ then
		v583 = Vector2.new(1024, 1024)
	else
		v583 = v_u_10:GetHardwareSafeViewport()
	end
	v581(v582, v583.Y > v583.X)
	if p575 then
		v_u_578.Position = UDim2.new(v_u_578.Position.X.Scale, v_u_578.Position.X.Offset, v_u_578.Position.Y.Scale, v_u_578.Position.Y.Offset + p575)
	end
	local v584 = v577 + v_u_503
	if p575 then
		v584 = v584 + p575
	end
	v_u_504[p572] = v584
	local function v585()
		-- upvalues: (copy) v_u_578, (ref) v_u_10
		if v_u_578.Visible then
			v_u_10.SelectedCoreObject = v_u_578
		end
	end
	v_u_578.MouseEnter:Connect(v585)
	p574.SelectionImageObject = v_u_44
	p574.SelectionGained:Connect(function()
		-- upvalues: (ref) v_u_15, (copy) v_u_578, (ref) v_u_1
		if v_u_15.VREnabled then
			v_u_578.ImageTransparency = v_u_1.transparency("RowFrameBackground", 0.5)
			v_u_578.BackgroundTransparency = 1
		else
			v_u_578.ImageTransparency = 1
			v_u_578.BackgroundTransparency = v_u_1.transparency("RowFrameBackground", 0.5)
		end
	end)
	p574.SelectionLost:Connect(function()
		-- upvalues: (copy) v_u_578
		v_u_578.ImageTransparency = 1
		v_u_578.BackgroundTransparency = 1
	end)
	p574.Parent = v_u_578
	p572:AddRow(v_u_578, v_u_579, p574, p575, true)
	return v_u_578
end
local v_u_619 = {
	["GetEaseLinear"] = function(_) -- name: GetEaseLinear
		-- upvalues: (copy) v_u_53
		return v_u_53
	end,
	["GetEaseOutQuad"] = function(_) -- name: GetEaseOutQuad
		-- upvalues: (copy) v_u_59
		return v_u_59
	end,
	["GetEaseInOutQuad"] = function(_) -- name: GetEaseInOutQuad
		-- upvalues: (copy) v_u_65
		return v_u_65
	end,
	["CreateNewSlider"] = function(_, p587, p588, p589, p590, p591) -- name: CreateNewSlider
		-- upvalues: (copy) v_u_502
		return v_u_502(p587, p588, p589, p590, p591)
	end,
	["CreateNewSelector"] = function(_, p592, p593) -- name: CreateNewSelector
		-- upvalues: (copy) v_u_346
		return v_u_346(p592, p593)
	end,
	["CreateNewDropDown"] = function(_, p594, p595) -- name: CreateNewDropDown
		-- upvalues: (copy) v_u_267
		return v_u_267(p594, p595, nil)
	end,
	["AddNewRow"] = function(_, p596, p597, p598, p599, p600, p601, p602, p603, p604, p605) -- name: AddNewRow
		-- upvalues: (copy) v_u_571
		return v_u_571(p596, p597, p598, p599, p600, p601, p602, p603, p604, p605)
	end,
	["AddNewRowObject"] = function(_, p606, p607, p608, p609, p610) -- name: AddNewRowObject
		-- upvalues: (copy) v_u_586
		return v_u_586(p606, p607, p608, p609, p610)
	end,
	["ShowAlert"] = function(_, p611, p612, p613, p614, p615) -- name: ShowAlert
		-- upvalues: (copy) v_u_369
		v_u_369(p611, p612, p613, p614, p615)
	end,
	["IsSmallTouchScreen"] = function(_) -- name: IsSmallTouchScreen
		-- upvalues: (copy) v_u_10, (copy) v_u_9
		local v616
		if _G.__TESTEZ_RUNNING_TEST__ then
			v616 = Vector2.new(1024, 1024)
		else
			v616 = v_u_10:GetHardwareSafeViewport()
		end
		local v617 = v_u_9.TouchEnabled
		if v617 then
			v617 = v616.Y < 500 and true or v616.X < 700
		end
		return v617
	end,
	["IsPortrait"] = function(_) -- name: IsPortrait
		-- upvalues: (copy) v_u_10
		local v618
		if _G.__TESTEZ_RUNNING_TEST__ then
			v618 = Vector2.new(1024, 1024)
		else
			v618 = v_u_10:GetHardwareSafeViewport()
		end
		return v618.Y > v618.X
	end
}
if v19 then
	function v_u_619.IsUsingGamepad(_) -- name: IsUsingGamepad
		-- upvalues: (copy) v_u_100, (copy) v_u_9
		return v_u_100[v_u_9:GetLastInputType()] or false
	end
end
function v_u_619.MakeStyledButton(_, p620, p621, p622, p623, p624, p625) -- name: MakeStyledButton
	-- upvalues: (copy) v_u_138
	return v_u_138(p620, p621, p622, p623, p624, p625)
end
function v_u_619.MakeStyledImageButton(_, p626, p627, p628, p629, p630, p631, p632, p633) -- name: MakeStyledImageButton
	-- upvalues: (copy) v_u_157
	return v_u_157(p626, p627, p628, p629, p630, p631, p632, p633)
end
function v_u_619.AddButtonRow(_, p634, p635, p636, p637, p638, p639) -- name: AddButtonRow
	-- upvalues: (copy) v_u_168
	return v_u_168(p634, p635, p636, p637, p638, p639)
end
function v_u_619.MakeFocusState(_, p640, p641) -- name: MakeFocusState
	-- upvalues: (copy) v_u_185
	return v_u_185(p640, p641)
end
function v_u_619.CreateSignal(_) -- name: CreateSignal
	-- upvalues: (copy) v_u_87
	return v_u_87()
end
function v_u_619.UsesSelectedObject(_) -- name: UsesSelectedObject
	-- upvalues: (copy) v_u_15, (copy) v_u_9
	if v_u_15.VREnabled then
		return false
	else
		return (v_u_9.PreferredInput ~= Enum.PreferredInput.Touch or v_u_9.GamepadEnabled) and true or false
	end
end
function v_u_619.TweenProperty(_, p642, p643, p644, p645, p646, p647, p648) -- name: TweenProperty
	return PropertyTweener(p642, p643, p644, p645, p646, p647, p648)
end
function v_u_619.OnResized(_, p649, p650) -- name: OnResized
	-- upvalues: (copy) v_u_99
	return v_u_99(p649, p650)
end
function v_u_619.FireOnResized(_) -- name: FireOnResized
	-- upvalues: (copy) v_u_10, (copy) v_u_619, (copy) v_u_43
	local v651
	if _G.__TESTEZ_RUNNING_TEST__ then
		v651 = Vector2.new(1024, 1024)
	else
		v651 = v_u_10:GetHardwareSafeViewport()
	end
	local v652 = v_u_619:IsPortrait()
	for _, v653 in pairs(v_u_43) do
		v653(v651, v652)
	end
end
function v_u_619.Lerp(_, p654, p655, p656) -- name: Lerp
	return (1 - p654) * p655 + p654 * p656
end
function v_u_619.Round(_, p657) -- name: Round
	return p657 % 1 >= 0.5 and math.ceil(p657) or math.floor(p657)
end
function v_u_619.IsExperienceOlderThanOneWeek(_, p658) -- name: IsExperienceOlderThanOneWeek
	-- upvalues: (copy) v_u_16
	if p658 ~= nil and p658.Created ~= nil then
		local v659 = DateTime.fromIsoDate(p658.Created).UnixTimestampMillis
		if v_u_16:GetServerTimeNow() * 1000 - v659 > 604800000 then
			return true
		end
	end
	return false
end
return v_u_619