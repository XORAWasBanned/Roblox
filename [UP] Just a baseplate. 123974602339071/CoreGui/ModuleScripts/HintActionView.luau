-- Path: CoreGui.RobloxGui.Modules.Shell.HintActionView
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("TextService")
local v_u_5 = require(v2:FindFirstChild("GlobalSettings"))
local v_u_6 = require(v2:FindFirstChild("Utility"))
local v_u_7 = require(v1.Packages.RoactGamepad)
local v_u_8 = require(v1.Workspace.Packages.AppCommonLib).Create
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad
return function(p10, p11, p_u_12) -- name: createHintActionView
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_9, (copy) v_u_7
	if p_u_12 == nil then
		p_u_12 = UDim2.new(1, -1, 1, -1)
	end
	local v13 = {}
	local v_u_14 = (p11 == nil or #p11 == 0) and "DefaultHintAction" or p11
	local v_u_15 = v_u_8("Frame")({
		["Name"] = "HintActionContainer",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Parent"] = nil,
		["Size"] = UDim2.new(0, 0, 0, 0),
		["Parent"] = p10
	})
	local v_u_16 = v_u_8("TextLabel")({
		["Name"] = "HintActionText",
		["BackgroundTransparency"] = 1,
		["Font"] = nil,
		["FontSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Text"] = "",
		["ZIndex"] = 10,
		["Parent"] = nil,
		["Font"] = v_u_5.RegularFont,
		["FontSize"] = v_u_5.TitleSize,
		["TextColor3"] = v_u_5.WhiteTextColor,
		["TextXAlignment"] = Enum.TextXAlignment.Right,
		["Parent"] = v_u_15
	})
	local v_u_17 = v_u_8("ImageLabel")({
		["Name"] = "HintActionImage",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "",
		["ZIndex"] = 10,
		["Parent"] = nil,
		["Size"] = UDim2.new(0, 83, 0, 83),
		["Parent"] = v_u_15
	})
	local function v_u_20() -- name: updateLayout
		-- upvalues: (ref) v_u_4, (copy) v_u_16, (ref) v_u_6, (copy) v_u_17, (copy) v_u_15, (ref) p_u_12
		local v18 = v_u_4:GetTextSize(v_u_16.Text, v_u_6.ConvertFontSizeEnumToInt(v_u_16.FontSize), v_u_16.Font, Vector2.new(0, 0))
		v_u_16.Size = UDim2.new(0, v18.x, 0, v_u_17.Size.Y.Offset)
		v_u_16.Position = UDim2.new(1, -v18.x, 0, -4)
		local v19 = v18.x + v_u_17.Size.X.Offset + 8
		v_u_15.Size = UDim2.new(0, v19, 0, v_u_17.Size.Y.Offset)
		v_u_15.Position = UDim2.new(p_u_12.X.Scale, p_u_12.X.Offset * v_u_15.Size.X.Offset, p_u_12.Y.Scale, p_u_12.Y.Offset * v_u_15.Size.Y.Offset)
	end
	function v13.BindAction(_, p21, p22) -- name: BindAction
		-- upvalues: (ref) v_u_3, (ref) v_u_14, (ref) v_u_9, (ref) v_u_7
		if p21 then
			v_u_3:UnbindCoreAction(v_u_14)
			if v_u_9() and v_u_7.Config.DebugKeyboardBindings then
				local v23 = v_u_7.Config.DebugKeyboardBindings[p22] or {}
				v_u_3:BindCoreAction(v_u_14, p21, false, p22, table.unpack(v23))
			else
				v_u_3:BindCoreAction(v_u_14, p21, false, p22)
			end
		else
			return
		end
	end
	function v13.UnbindAction(_) -- name: UnbindAction
		-- upvalues: (ref) v_u_3, (ref) v_u_14
		v_u_3:UnbindCoreAction(v_u_14)
	end
	function v13.SetParent(_, p24) -- name: SetParent
		-- upvalues: (copy) v_u_15
		v_u_15.Parent = p24
	end
	function v13.SetVisible(_, p25) -- name: SetVisible
		-- upvalues: (copy) v_u_15
		v_u_15.Visible = p25
	end
	function v13.SetTransparency(_, p26) -- name: SetTransparency
		-- upvalues: (copy) v_u_16, (copy) v_u_17
		v_u_16.TextTransparency = p26
		v_u_17.ImageTransparency = p26
	end
	function v13.SetVisibleWithTween(_, p27) -- name: SetVisibleWithTween
		-- upvalues: (ref) v_u_6, (copy) v_u_16, (copy) v_u_17
		v_u_6.PropertyTweener(v_u_16, "TextTransparency", v_u_16.TextTransparency, p27, 0.25, v_u_6.EaseOutQuad, true)
		v_u_6.PropertyTweener(v_u_17, "ImageTransparency", v_u_17.ImageTransparency, p27, 0.25, v_u_6.EaseOutQuad, true)
	end
	function v13.SetText(_, p28) -- name: SetText
		-- upvalues: (copy) v_u_16, (copy) v_u_20
		if p28 ~= v_u_16.Text then
			v_u_16.Text = p28
			v_u_20()
		end
	end
	function v13.SetImage(_, p29) -- name: SetImage
		-- upvalues: (copy) v_u_17
		if p29 ~= v_u_17.Image then
			v_u_17.Image = p29
		end
	end
	return v13
end