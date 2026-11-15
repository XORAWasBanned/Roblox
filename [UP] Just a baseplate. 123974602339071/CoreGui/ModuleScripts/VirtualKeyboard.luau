-- Path: CoreGui.RobloxGui.Modules.VR.VirtualKeyboard
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("RunService")
game:GetService("UserInputService")
game:GetService("GuiService")
local v3 = game:GetService("HttpService")
local v_u_4 = game:GetService("ContextActionService")
game:GetService("Players")
local v_u_5 = game:GetService("SoundService")
local v_u_6 = game:GetService("TextService")
local v_u_7 = game:GetService("CorePackages")
v1:WaitForChild("RobloxGui")
local v_u_8 = require(v_u_7.Workspace.Packages.AppCommonLib).Create
local v_u_9 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805)
local v_u_10 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805)
local v_u_11 = Color3.new(0, 0.6352941176470588, 1)
local v_u_12 = Color3.new(0, 0.6352941176470588, 1)
local v_u_13 = Color3.new(1, 1, 1)
local v14 = v3:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"Q\",\n    \"W\",\n    \"E\",\n    \"R\",\n    \"T\",\n    \"Y\",\n    \"U\",\n    \"I\",\n    \"O\",\n    \"P\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"Caps\",\n    \"A\",\n    \"S\",\n    \"D\",\n    \"F\",\n    \"G\",\n    \"H\",\n    \"J\",\n    \"K\",\n    \"L\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"Shift\",\n    \"Z\",\n    \"X\",\n    \"C\",\n    \"V\",\n    \"B\",\n    \"N\",\n    \"M\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"123/sym\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n")
local v15 = v3:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"1\",\n    \"2\",\n    \"3\",\n    \"4\",\n    \"5\",\n    \"6\",\n    \"7\",\n    \"8\",\n    \"9\",\n    \"0\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"!\",\n    \"@\",\n    \"#\",\n    \"$\",\n    \"%\",\n    \"^\",\n    \"&\",\n    \"(\",\n    \")\",\n    \"=\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 1.2\n    },\n    \"/\",\n    \"-\",\n    \"+\",\n    \"_\",\n    \":\",\n    \";\",\n    \"\'\",\n    \"\\\"\",\n    \",\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"abc\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n")
local v_u_16 = {}
for v17, v18 in pairs({
	"ASR_STATUS_OK",
	"ASR_STATUS_CANCELLED",
	"ASR_STATUS_UNKNOWN",
	"ASR_STATUS_INVALID_ARGUMENTS",
	"ASR_STATUS_DEADLINE_EXCEEDED",
	"ASR_STATUS_NOT_FOUND",
	"ASR_STATUS_ALREADY_EXISTS",
	"ASR_STATUS_PERMISSION_DENIED",
	"ASR_STATUS_UNAUTHENTICATED",
	"ASR_STATUS_RESOURCE_EXHAUSTED",
	"ASR_STATUS_FAILED_PRECONDITION",
	"ASR_STATUS_ABORTED",
	"ASR_STATUS_OUT_OF_RANGE",
	"ASR_STATUS_UNIMPLEMENTED",
	"ASR_STATUS_INTERNAL",
	"ASR_STATUS_UNAVAILABLE",
	"ASR_STATUS_DATA_LOSS",
	"ASR_STATUS_NOT_ENABLED",
	"ASR_STATUS_LOW_CONFIDENCE",
	"ASR_STATUS_INVALID_JSON"
}) do
	v_u_16[v18] = v17 - 1
end
function Clamp(p19, p20, p21) -- name: Clamp
	local v22 = math.min(p20, p21)
	return math.max(p19, v22)
end
local function v_u_26(p23, p24) -- name: FindAncestorOfType
	-- upvalues: (copy) v_u_26
	if p23 then
		local v25 = p23.Parent
		if v25 and v25:IsA(p24) then
			return v25
		else
			return v_u_26(v25, p24)
		end
	else
		return nil
	end
end
local function v_u_32(p_u_27) -- name: ExtendedInstance
	local v28 = {}
	setmetatable(v28, {
		["__index"] = function(_, p29) -- name: __index
			-- upvalues: (copy) p_u_27
			return p_u_27[p29]
		end,
		["__newindex"] = function(_, p30, p31) -- name: __newindex
			-- upvalues: (copy) p_u_27
			p_u_27[p30] = p31
		end
	})
	return v28
end
local function v_u_40(p_u_33) -- name: CreateVRButton
	-- upvalues: (copy) v_u_32
	local v34 = v_u_32(p_u_33)
	rawset(v34, "OnEnter", function(_) end)
	rawset(v34, "OnLeave", function(_) end)
	rawset(v34, "OnDown", function(_) end)
	rawset(v34, "OnUp", function(_) end)
	rawset(v34, "ContainsPoint", function(_, p35, p36)
		-- upvalues: (copy) p_u_33
		local v37 = p_u_33
		local v38 = v37.AbsolutePosition
		local v39 = v37.AbsolutePosition + v37.AbsoluteSize
		return v38.X <= p35 and (p35 <= v39.X and (v38.Y <= p36 and p36 <= v39.Y))
	end)
	rawset(v34, "Update", function(_) end)
	return v34
end
v_u_8("ImageLabel")({
	["Name"] = "SelectionRing",
	["Size"] = nil,
	["Position"] = nil,
	["Image"] = "rbxasset://textures/ui/menu/buttonHover.png",
	["ScaleType"] = nil,
	["SliceCenter"] = nil,
	["BackgroundTransparency"] = 1,
	["Size"] = UDim2.new(1, -6, 1, -6),
	["Position"] = UDim2.new(0, 4, 0, 3),
	["ScaleType"] = Enum.ScaleType.Slice,
	["SliceCenter"] = Rect.new(47, 47, 47, 47)
})
local v_u_41 = {
	["<Speaker>"] = {
		["Asset"] = "rbxasset://textures/ui/Keyboard/mic_icon.png",
		["AspectRatio"] = 0.615
	}
}
local function v_u_87(p_u_42, p43, p_u_44) -- name: CreateKeyboardKey
	-- upvalues: (copy) v_u_8, (copy) v_u_13, (copy) v_u_9, (copy) v_u_40, (copy) v_u_41, (copy) v_u_11, (copy) v_u_10, (copy) v_u_12
	local v_u_45 = p43.width2 and (p43.height2 and p43.x2)
	if v_u_45 then
		v_u_45 = p43.y2
	end
	local v_u_46 = v_u_8("ImageButton")({
		["Name"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["Image"] = "",
		["BackgroundTransparency"] = 1,
		["ZIndex"] = 1,
		["Name"] = p_u_44[1],
		["Position"] = UDim2.new(p43.x, 0, p43.y, 0),
		["Size"] = UDim2.new(p43.width, 0, p43.height, 0)
	})
	local v_u_47 = v_u_8("TextLabel")({
		["Name"] = "KeyText",
		["Text"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Font"] = nil,
		["FontSize"] = nil,
		["TextColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["Selectable"] = true,
		["ZIndex"] = 2,
		["Parent"] = nil,
		["Text"] = p_u_44[#p_u_44],
		["Position"] = UDim2.new(0, -10, 0, -10),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Font"] = Enum.Font.SourceSansBold,
		["FontSize"] = Enum.FontSize.Size96,
		["TextColor3"] = v_u_13,
		["Parent"] = v_u_46
	})
	local v_u_48 = v_u_8("Frame")({
		["Name"] = "KeyBackground",
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.3,
		["BorderSizePixel"] = 0,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, -10, 1, -10),
		["Position"] = UDim2.new(0, -5, 0, -5),
		["BackgroundColor3"] = v_u_9,
		["Parent"] = v_u_46
	})
	local v_u_49 = v_u_8("ImageLabel")({
		["Name"] = "SelectionObject",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png",
		["ImageTransparency"] = 0,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(12, 12, 52, 52)
	})
	v_u_46.SelectionImageObject = v_u_8("ImageLabel")({
		["Visible"] = false
	})
	local v_u_50, v_u_51, v_u_52, v_u_53
	if v_u_45 then
		v_u_50 = v_u_8("ImageButton")({
			["Name"] = "KeyBackground",
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.3,
			["BorderSizePixel"] = 0,
			["AutoButtonColor"] = false,
			["SelectionImageObject"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.new(p43.x2 / p43.width, -5, p43.y2 / p43.height, -5),
			["Size"] = UDim2.new(p43.width2 / p43.width, 0, p43.height2 / p43.height, -10),
			["BackgroundColor3"] = v_u_9,
			["SelectionImageObject"] = v_u_46.SelectionImageObject,
			["Parent"] = v_u_46
		})
		if p43.x2 <= 0 then
			v_u_47.Size = v_u_50.Size - UDim2.new(0, 10, 0, 0)
			v_u_47.Position = v_u_50.Position
			v_u_50.Size = v_u_50.Size - UDim2.new(1, 0, 0, 0)
		end
		v_u_51 = v_u_8("Frame")({
			["Name"] = "SpecialSelectionObject",
			["Size"] = UDim2.new(1, 0, 0.5, 0),
			["Position"] = UDim2.new(0, 0, 0.5, 0),
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			v_u_8("ImageLabel")({
				["Name"] = "Borders",
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png",
				["ImageTransparency"] = 0,
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["Position"] = UDim2.new(-1, 0, -1, 0),
				["Size"] = UDim2.new(2, 0, 2, 0),
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = Rect.new(12, 12, 52, 52)
			})
		})
		v_u_52 = v_u_51:Clone()
		v_u_52.Size = UDim2.new(1, 0, 0.5, 5)
		v_u_52.Position = UDim2.new(0, 0, 0, 0)
		v_u_52.Borders.Size = UDim2.new(1, 0, 1, 30)
		v_u_52.Borders.Position = UDim2.new(0, 0, 0, 0)
		v_u_53 = v_u_51:Clone()
		v_u_53.Size = UDim2.new(1, 5, 1, 0)
		v_u_53.Position = UDim2.new(0, 0, 0, 0)
		v_u_53.Borders.Size = UDim2.new(1, 30, 1, 0)
		v_u_53.Borders.Position = UDim2.new(0, 0, 0, 0)
	else
		v_u_50 = nil
		v_u_52 = nil
		v_u_53 = nil
		v_u_51 = nil
	end
	local v_u_54 = v_u_40(v_u_46)
	local v_u_55 = false
	local v_u_56 = false
	local v_u_57
	if #p_u_44 == 1 then
		local v58 = p_u_44[1]
		if type(v58) == "string" and #p_u_44[1] == 1 then
			local v59 = p_u_44[1]
			if string.byte(v59) >= 65 then
				local v60 = p_u_44[1]
				v_u_57 = string.byte(v60) <= 122
			else
				v_u_57 = false
			end
		else
			v_u_57 = false
		end
	else
		v_u_57 = false
	end
	local v_u_61
	if p_u_44[1] and v_u_41[p_u_44[1]] then
		v_u_47.Visible = false
		v_u_61 = v_u_8("ImageLabel")({
			["Name"] = "KeyIcon",
			["Size"] = nil,
			["SizeConstraint"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(v_u_41[p_u_44[1]].AspectRatio, -20, 1, -20),
			["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
			["Image"] = v_u_41[p_u_44[1]].Asset,
			["Parent"] = v_u_48
		})
		local function v63(p62) -- name: onChanged
			-- upvalues: (ref) v_u_61
			if p62 == "AbsoluteSize" then
				v_u_61.Position = UDim2.new(0.5, -v_u_61.AbsoluteSize.X / 2, 0.5, -v_u_61.AbsoluteSize.Y / 2)
			end
		end
		v_u_61.Changed:connect(v63)
		v_u_61.Position = UDim2.new(0.5, -v_u_61.AbsoluteSize.X / 2, 0.5, -v_u_61.AbsoluteSize.Y / 2)
	else
		v_u_61 = nil
	end
	local function v_u_66() -- name: onClicked
		-- upvalues: (copy) v_u_54, (copy) p_u_42, (copy) v_u_57
		local v64 = nil
		local v65 = v_u_54:GetCurrentKeyValue()
		if v65 == "Shift" then
			p_u_42:SetShift(not p_u_42:GetShift())
		elseif v65 == "Caps" then
			p_u_42:SetCaps(not p_u_42:GetCaps())
		elseif v65 == "Enter" then
			p_u_42:SubmitText(true, true)
		elseif v65 == "Delete" then
			p_u_42:BackspaceAtCursor()
		elseif v65 == "123/sym" then
			p_u_42:SetCurrentKeyset(2)
		elseif v65 == "abc" then
			p_u_42:SetCurrentKeyset(1)
		elseif v65 == "<Speaker>" then
			p_u_42:SetVoiceMode(true)
		else
			v64 = v65 == "Tab" and "\t" or v65
		end
		if v64 ~= nil then
			p_u_42:SubmitCharacter(v64, v_u_57)
		end
	end
	local function v_u_74() -- name: update
		-- upvalues: (copy) v_u_54, (ref) v_u_56, (ref) v_u_11, (copy) v_u_48, (ref) v_u_50, (copy) v_u_45, (ref) v_u_51, (ref) v_u_52, (ref) v_u_53, (copy) v_u_49, (ref) v_u_55, (ref) v_u_10, (copy) p_u_42, (ref) v_u_12, (ref) v_u_9, (ref) v_u_61, (copy) v_u_47
		local v67 = v_u_54:GetCurrentKeyValue()
		if v_u_56 then
			local v68 = v_u_11
			v_u_48.BackgroundColor3 = v68
			if v_u_50 then
				v_u_50.BackgroundColor3 = v68
			end
			if v_u_45 then
				v_u_51.Parent = nil
				v_u_52.Parent = nil
				v_u_53.Parent = nil
			else
				v_u_49.Parent = nil
			end
		elseif v_u_55 then
			local v69 = v_u_10
			v_u_48.BackgroundColor3 = v69
			if v_u_50 then
				v_u_50.BackgroundColor3 = v69
			end
			if v_u_45 then
				v_u_51.Parent = v_u_48 or nil
				v_u_52.Parent = v_u_48 or nil
				v_u_53.Parent = v_u_50 or nil
			else
				v_u_49.Parent = v_u_48 or nil
			end
		elseif v67 == "Caps" and p_u_42:GetCaps() then
			local v70 = v_u_12
			v_u_48.BackgroundColor3 = v70
			if v_u_50 then
				v_u_50.BackgroundColor3 = v70
			end
			if v_u_45 then
				v_u_51.Parent = nil
				v_u_52.Parent = nil
				v_u_53.Parent = nil
			else
				v_u_49.Parent = nil
			end
		elseif v67 == "Shift" and p_u_42:GetShift() then
			local v71 = v_u_12
			v_u_48.BackgroundColor3 = v71
			if v_u_50 then
				v_u_50.BackgroundColor3 = v71
			end
			if v_u_45 then
				v_u_51.Parent = nil
				v_u_52.Parent = nil
				v_u_53.Parent = nil
			else
				v_u_49.Parent = nil
			end
		elseif v67 == "abc" then
			local v72 = v_u_12
			v_u_48.BackgroundColor3 = v72
			if v_u_50 then
				v_u_50.BackgroundColor3 = v72
			end
			if v_u_45 then
				v_u_51.Parent = nil
				v_u_52.Parent = nil
				v_u_53.Parent = nil
			else
				v_u_49.Parent = nil
			end
		else
			local v73 = v_u_9
			v_u_48.BackgroundColor3 = v73
			if v_u_50 then
				v_u_50.BackgroundColor3 = v73
			end
			if v_u_45 then
				v_u_51.Parent = nil
				v_u_52.Parent = nil
				v_u_53.Parent = nil
			else
				v_u_49.Parent = nil
			end
		end
		if v_u_61 then
			v_u_61.ImageTransparency = 0.5
		end
		v_u_47.Text = v_u_54:GetCurrentKeyValue()
	end
	local v_u_75 = {}
	rawset(v_u_54, "OnEnter", function(_)
		-- upvalues: (ref) v_u_55, (copy) v_u_74
		v_u_55 = true
		v_u_74()
	end)
	rawset(v_u_54, "OnLeave", function(_)
		-- upvalues: (copy) v_u_75, (ref) v_u_55, (ref) v_u_56, (copy) v_u_74
		if not next(v_u_75) then
			v_u_55 = false
			v_u_56 = false
			v_u_74()
		end
	end)
	rawset(v_u_54, "OnDown", function(_)
		-- upvalues: (ref) v_u_56, (copy) v_u_74, (copy) v_u_66
		v_u_56 = true
		v_u_74()
		v_u_66()
	end)
	rawset(v_u_54, "OnUp", function(_)
		-- upvalues: (ref) v_u_56, (copy) v_u_74
		v_u_56 = false
		v_u_74()
	end)
	rawset(v_u_54, "GetCurrentKeyValue", function(_)
		-- upvalues: (copy) p_u_42, (copy) v_u_57, (copy) p_u_44
		local v76 = p_u_42:GetShift()
		local v77 = p_u_42:GetCaps()
		if v_u_57 then
			if v77 and v76 then
				return string.lower(p_u_44[#p_u_44])
			elseif v77 or v76 then
				return p_u_44[1]
			else
				return string.lower(p_u_44[#p_u_44])
			end
		elseif v76 then
			return p_u_44[1]
		else
			return p_u_44[#p_u_44]
		end
	end)
	rawset(v_u_54, "ContainsPoint", function(_, p78, p79)
		-- upvalues: (copy) v_u_48, (ref) v_u_50
		local v80 = v_u_48
		local v81 = v80.AbsolutePosition
		local v82 = v80.AbsolutePosition + v80.AbsoluteSize
		local v83 = (v81.X > p78 or (p78 > v82.X or (v81.Y > p79 or p79 > v82.Y))) and v_u_50
		if v83 then
			local v84 = v_u_50
			local v85 = v84.AbsolutePosition
			local v86 = v84.AbsolutePosition + v84.AbsoluteSize
			if v85.X <= p78 and (p78 <= v86.X and (v85.Y <= p79 and p79 <= v86.Y)) then
				return true
			end
			v83 = false
		end
		return v83
	end)
	rawset(v_u_54, "Update", function(_)
		-- upvalues: (copy) v_u_74
		v_u_74()
	end)
	rawset(v_u_54, "GetInstance", function(_)
		-- upvalues: (copy) v_u_46
		return v_u_46
	end)
	v_u_46.MouseButton1Down:connect(function()
		-- upvalues: (copy) v_u_54
		v_u_54:OnDown()
	end)
	v_u_46.MouseButton1Up:connect(function()
		-- upvalues: (copy) v_u_54
		v_u_54:OnUp()
	end)
	v_u_46.SelectionGained:connect(function()
		-- upvalues: (copy) v_u_75, (copy) v_u_46, (copy) v_u_54
		v_u_75[v_u_46] = true
		v_u_54:OnEnter()
	end)
	v_u_46.SelectionLost:connect(function()
		-- upvalues: (copy) v_u_75, (copy) v_u_46, (copy) v_u_54
		v_u_75[v_u_46] = nil
		v_u_54:OnLeave()
	end)
	if v_u_50 then
		v_u_50.MouseButton1Down:connect(function()
			-- upvalues: (copy) v_u_54
			v_u_54:OnDown()
		end)
		v_u_50.MouseButton1Up:connect(function()
			-- upvalues: (copy) v_u_54
			v_u_54:OnUp()
		end)
		v_u_50.SelectionGained:connect(function()
			-- upvalues: (copy) v_u_75, (ref) v_u_50, (copy) v_u_54
			v_u_75[v_u_50] = true
			v_u_54:OnEnter()
		end)
		v_u_50.SelectionLost:connect(function()
			-- upvalues: (copy) v_u_75, (ref) v_u_50, (copy) v_u_54
			v_u_75[v_u_50] = nil
			v_u_54:OnLeave()
		end)
	end
	v_u_74()
	return v_u_54
end
local function v_u_88() -- name: CreateBaseVoiceState
	return {
		["Name"] = "Base",
		["TransitionFrom"] = function(_) -- name: TransitionFrom end,
		["TransitionTo"] = function(_) -- name: TransitionTo end
	}
end
local v_u_89 = {
	["Listening"] = {
		["Processing"] = true
	},
	["Processing"] = {
		["Waiting"] = true
	},
	["Waiting"] = {
		["Listening"] = true
	}
}
local v_u_90 = {}
local v91 = v_u_88()
v91.Name = "Waiting"
v_u_90.CurrentState = v91
local v_u_92 = Instance.new("BindableEvent")
function v_u_90.TransitionState(p93, p94) -- name: TransitionState
	-- upvalues: (copy) v_u_89, (copy) v_u_92
	if not v_u_89[p93.CurrentState.Name][p94.Name] then
		return false
	end
	p93.CurrentState:TransitionFrom()
	p93.CurrentState = p94
	p93.CurrentState:TransitionTo()
	v_u_92:Fire(p93.CurrentState)
	return true
end
function v_u_90.GetCurrentState(p95) -- name: GetCurrentState
	return p95.CurrentState
end
v_u_90.StateTransitionedEvent = v_u_92.Event
local function v259(p96) -- name: ConstructKeyboardUI
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_12, (copy) v_u_40, (copy) v_u_9, (copy) v_u_13, (copy) v_u_2, (copy) v_u_32, (copy) v_u_6, (copy) v_u_90, (copy) v_u_88, (copy) v_u_5, (copy) v_u_4, (copy) v_u_87, (copy) v_u_16
	local v_u_97 = require(v_u_7.Workspace.Packages.VrCommon).Panel3D
	local v_u_98 = v_u_97.Get("Keyboard")
	v_u_98:SetVisible(false)
	local v99 = {}
	local v_u_100 = v_u_8("Frame")({
		["Name"] = "VirtualKeyboard",
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Active"] = true,
		["Visible"] = false,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, 0)
	})
	local v101 = v_u_8("ImageLabel")({
		["Name"] = "TextEntryBackground",
		["Size"] = nil,
		["Position"] = nil,
		["Image"] = "",
		["BackgroundTransparency"] = 0.5,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ClipsDescendants"] = true,
		["Parent"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.125, 0),
		["Position"] = UDim2.new(0.25, 0, 0, 0),
		["BackgroundColor3"] = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039),
		["Parent"] = v_u_100
	})
	local v102 = v_u_8("Frame")({
		["Name"] = "TextfieldBackground",
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Visible"] = true,
		["Parent"] = nil,
		["Position"] = UDim2.new(0, 2, 0, 2),
		["Size"] = UDim2.new(1, -4, 1, -4),
		["BackgroundColor3"] = Color3.new(0.8196078431372549, 0.8470588235294118, 0.8666666666666667),
		["Parent"] = v101
	})
	local v_u_103 = v_u_8("TextButton")({
		["Name"] = "TextEntryField",
		["Text"] = "",
		["Position"] = nil,
		["Size"] = nil,
		["Font"] = nil,
		["FontSize"] = nil,
		["TextXAlignment"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Parent"] = nil,
		["Position"] = UDim2.new(0, 4, 0, 4),
		["Size"] = UDim2.new(1, -8, 1, -8),
		["Font"] = Enum.Font.SourceSans,
		["FontSize"] = Enum.FontSize.Size60,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Parent"] = v102
	})
	local v_u_104 = v_u_8("Frame")({
		["Name"] = "TextfieldCursor",
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Visible"] = true,
		["ZIndex"] = 2,
		["Parent"] = nil,
		["Size"] = UDim2.new(0, 5, 0.9, 0),
		["Position"] = UDim2.new(0, 0, 0.05, 0),
		["BackgroundColor3"] = v_u_12,
		["Parent"] = v_u_103
	})
	local v105 = v_u_8("ImageButton")({
		["Name"] = "CloseButton",
		["Size"] = nil,
		["Position"] = nil,
		["Image"] = "rbxasset://textures/ui/Keyboard/close_button_background.png",
		["BackgroundTransparency"] = 1,
		["AutoButtonColor"] = false,
		["Parent"] = nil,
		["Size"] = UDim2.new(0.075, -10, 0.198, -10),
		["Position"] = UDim2.new(0, -5, 0, -35),
		["Parent"] = v_u_100
	})
	v105.SelectionImageObject = v_u_8("ImageLabel")({
		["Name"] = "Selection",
		["Size"] = nil,
		["Position"] = nil,
		["Image"] = "rbxasset://textures/ui/Keyboard/close_button_selection.png",
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0.9, 0, 0.9, 0),
		["Position"] = UDim2.new(0.05, 0, 0.05, 0)
	})
	v_u_8("ImageLabel")({
		["Name"] = "Icon",
		["Size"] = nil,
		["Position"] = nil,
		["Image"] = "rbxasset://textures/ui/Keyboard/close_button_icon.png",
		["BackgroundTransparency"] = 1,
		["Parent"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["Position"] = UDim2.new(0.25, 0, 0.25, 0),
		["Parent"] = v105
	})
	local v106 = v_u_40(v105)
	table.insert(v99, v106)
	local v_u_107 = v_u_8("Frame")({
		["Name"] = "VoiceRecognitionContainer",
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Active"] = true,
		["Visible"] = false,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, 0, 0.85, 0),
		["Position"] = UDim2.new(0, 0, 0.15, 0),
		["Parent"] = v_u_100
	})
	local v108 = v_u_8("Frame")({
		["Name"] = "voiceRecognitionBackground1",
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.3,
		["BorderSizePixel"] = 0,
		["Active"] = true,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, 0, 0.75, 0),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["BackgroundColor3"] = v_u_9,
		["Parent"] = v_u_107
	}):Clone()
	v108.Size = UDim2.new(0.8, 0, 0.25, 0)
	v108.Position = UDim2.new(0, 0, 0.75, 0)
	v108.Parent = v_u_107
	local v109 = v_u_40(v_u_8("TextButton")({
		["Name"] = "DoneButton",
		["Size"] = nil,
		["Position"] = nil,
		["Text"] = "Done",
		["BackgroundColor3"] = nil,
		["Font"] = nil,
		["FontSize"] = nil,
		["TextColor3"] = nil,
		["BackgroundTransparency"] = 0,
		["AutoButtonColor"] = false,
		["BorderSizePixel"] = 0,
		["Parent"] = nil,
		["Size"] = UDim2.new(0.2, -5, 0.25, -5),
		["Position"] = UDim2.new(0.8, 5, 0.75, 5),
		["BackgroundColor3"] = v_u_12,
		["Font"] = Enum.Font.SourceSansBold,
		["FontSize"] = Enum.FontSize.Size96,
		["TextColor3"] = v_u_13,
		["Parent"] = v_u_107
	}))
	table.insert(v99, v109)
	local v_u_110 = v_u_8("TextLabel")({
		["Name"] = "VoiceProcessingStatus",
		["Size"] = nil,
		["Position"] = nil,
		["Text"] = "",
		["Font"] = nil,
		["FontSize"] = nil,
		["TextColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Parent"] = nil,
		["Size"] = UDim2.new(0, 0, 0, 0),
		["Position"] = UDim2.new(0.5, 0, 0.33, 0),
		["Font"] = Enum.Font.SourceSansBold,
		["FontSize"] = Enum.FontSize.Size96,
		["TextColor3"] = v_u_13,
		["Parent"] = v_u_107
	})
	local v_u_124 = (function() -- name: CreateVoiceVisualizerWidget
		-- upvalues: (ref) v_u_8, (ref) v_u_13, (ref) v_u_2
		local v111 = {}
		local v112 = v_u_8("Frame")({
			["Name"] = "VoiceVisualizerContainer",
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0)
		})
		v111.Container = v112
		local v_u_113 = {}
		for v114 = 1, 50 do
			local v115 = v_u_8("Frame")({
				["Name"] = "Bar",
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 0,
				["BackgroundColor3"] = nil,
				["Parent"] = nil,
				["Size"] = UDim2.new(0.02, -4, 1, 0),
				["Position"] = UDim2.new(v114 / 50, 0, 0, 0),
				["BackgroundColor3"] = v_u_13,
				["Parent"] = v112
			})
			table.insert(v_u_113, v115)
		end
		function v111.StartAnimation(_) -- name: StartAnimation
			-- upvalues: (ref) v_u_2, (copy) v_u_113
			v_u_2:UnbindFromRenderStep("VoiceVisualizerWidget")
			v_u_2:BindToRenderStep("VoiceVisualizerWidget", Enum.RenderPriority.First.Value, function()
				-- upvalues: (ref) v_u_113
				for v116, v117 in pairs(v_u_113) do
					local v118 = tick() * 2.5 + v116 * 0.5026548245743669
					local v119 = math.sin(v118)
					local v120 = math.abs(v119)
					local v121 = tick() * 2.5 + v116 * 0.5026548245743669
					local v122 = math.cos(v121)
					local v123 = ((v120 + math.abs(v122)) / 2 - 0.3) * 1.4285714285714286
					v117.Size = UDim2.new(0.02, -4, v123, 0)
					v117.Position = UDim2.new(v116 / 50, 0, (1 - v123) / 2, 0)
				end
			end)
		end
		function v111.StopAnimation(_) -- name: StopAnimation
			-- upvalues: (ref) v_u_2
			v_u_2:UnbindFromRenderStep("VoiceVisualizerWidget")
		end
		return v111
	end)()
	v_u_124.Container.Parent = v_u_107
	v_u_124.Container.Size = UDim2.new(0.5, 0, 0.4, 0)
	v_u_124.Container.Position = UDim2.new(0.25, 0, 0.4, 0)
	local v_u_125 = v_u_32(v_u_100)
	local v_u_126 = nil
	local v_u_127 = {}
	local v_u_128 = false
	local v_u_129 = false
	local v_u_130 = 0
	local v_u_131 = Instance.new("BindableEvent")
	local v_u_132 = Instance.new("BindableEvent")
	local v_u_133 = false
	local function v_u_142(p134) -- name: SetTextFieldCursorPosition
		-- upvalues: (ref) v_u_130, (copy) v_u_103, (ref) v_u_6, (copy) v_u_104
		v_u_130 = Clamp(0, #v_u_103.Text, p134)
		if not v_u_103.TextFits then
			v_u_130 = #v_u_103.Text
		end
		local v135 = v_u_6
		local v136 = v_u_103.Text
		local v137 = v_u_130
		local v138 = string.sub(v136, 1, v137)
		local v139 = v_u_103.FontSize
		local v140 = string.match(v139.Name, "%d+")
		local v141 = v135:GetTextSize(v138, v140 and tostring(v140) or 12, v_u_103.Font, v_u_103.AbsoluteSize)
		v_u_104.Position = UDim2.new(0, v141.x, v_u_104.Position.Y.Scale, v_u_104.Position.Y.Offset)
	end
	local v_u_143 = ""
	local function v_u_153(p144, p145) -- name: calculateTextCursorPosition
		-- upvalues: (copy) v_u_103, (ref) v_u_6
		local v146 = p144 - v_u_103.AbsolutePosition.x
		local _ = p145 - v_u_103.AbsolutePosition.y
		for v147 = 1, #v_u_103.Text do
			local v148 = v_u_6
			local v149 = v_u_103.Text
			local v150 = string.sub(v149, 1, v147)
			local v151 = v_u_103.FontSize
			local v152 = string.match(v151.Name, "%d+")
			if v146 >= v148:GetTextSize(v150, v152 and tostring(v152) or 12, v_u_103.Font, v_u_103.AbsoluteSize).x then
				continue
			end
			return v147 - 1
		end
		return #v_u_103.Text
	end
	local v_u_154 = nil
	local v155 = v_u_131.Event
	rawset(v_u_125, "OpenedEvent", v155)
	local v156 = v_u_132.Event
	rawset(v_u_125, "ClosedEvent", v156)
	local function v157(_)
		-- upvalues: (copy) v_u_127, (ref) v_u_154
		return v_u_127[v_u_154]
	end
	rawset(v_u_125, "GetCurrentKeyset", v157)
	local function v159(_, p158)
		-- upvalues: (ref) v_u_154, (copy) v_u_127
		if p158 ~= v_u_154 and v_u_127[p158] ~= nil then
			if v_u_127[v_u_154] and v_u_127[v_u_154].container then
				v_u_127[v_u_154].container.Visible = false
			end
			v_u_154 = p158
			if v_u_127[v_u_154] and v_u_127[v_u_154].container then
				v_u_127[v_u_154].container.Visible = true
			end
		end
	end
	rawset(v_u_125, "SetCurrentKeyset", v159)
	local function v166(p160, _)
		-- upvalues: (copy) v_u_107, (ref) v_u_90, (ref) v_u_88, (ref) v_u_5
		local v161 = false
		local v162 = p160:GetCurrentKeyset()
		if v162 and v162.container then
			v162.container.Visible = not v161
		end
		v_u_107.Visible = v161
		if v161 then
			local v163 = v_u_90
			local v164 = v_u_88()
			v164.Name = "Listening"
			function v164.TransitionTo(_) -- name: TransitionTo
				-- upvalues: (ref) v_u_5
				local function v165()
					-- upvalues: (ref) v_u_5
					v_u_5:BeginRecording()
				end
				pcall(v165)
			end
			v163:TransitionState(v164)
		end
	end
	rawset(v_u_125, "SetVoiceMode", v166)
	local function v167(_)
		-- upvalues: (ref) v_u_128
		return v_u_128
	end
	rawset(v_u_125, "GetCaps", v167)
	local function v171(p168, p169)
		-- upvalues: (ref) v_u_128
		v_u_128 = p169
		for _, v170 in pairs(p168:GetCurrentKeyset().keys) do
			v170:Update()
		end
	end
	rawset(v_u_125, "SetCaps", v171)
	local function v172(_)
		-- upvalues: (ref) v_u_129
		return v_u_129
	end
	rawset(v_u_125, "GetShift", v172)
	local function v176(p173, p174)
		-- upvalues: (ref) v_u_129
		v_u_129 = p174
		for _, v175 in pairs(p173:GetCurrentKeyset().keys) do
			v175:Update()
		end
	end
	rawset(v_u_125, "SetShift", v176)
	local v_u_177 = false
	local v_u_178 = nil
	local v_u_179 = nil
	local v_u_180 = nil
	local function v191(p_u_181, p_u_182)
		-- upvalues: (ref) v_u_133, (ref) v_u_126, (copy) v_u_100, (copy) v_u_98, (ref) v_u_178, (ref) v_u_179, (ref) v_u_180, (copy) v_u_103, (copy) v_u_142, (ref) v_u_130, (ref) v_u_177, (ref) v_u_143, (copy) v_u_97, (ref) v_u_4, (ref) v_u_154, (copy) v_u_127, (copy) v_u_131
		if not v_u_133 then
			v_u_133 = true
			v_u_126 = p_u_182
			p_u_181:SetCurrentKeyset(1)
			p_u_181:SetVoiceMode(false)
			v_u_100.Visible = true
			v_u_98:ResizeStuds(5.9, 2.25, 320)
			local v183 = CFrame.new()
			if v_u_178 then
				v_u_178:disconnect()
			end
			v_u_178 = nil
			if v_u_179 then
				v_u_179:disconnect()
			end
			v_u_179 = nil
			if v_u_180 then
				v_u_180:disconnect()
			end
			v_u_180 = nil
			if p_u_182.TextBox then
				v_u_178 = p_u_182.TextBox.Changed:connect(function(p184)
					-- upvalues: (copy) p_u_182, (ref) v_u_103, (ref) v_u_142, (ref) v_u_130
					if p184 == "Text" then
						v_u_103:SetTextFromInput(p_u_182.TextBox.Text)
						v_u_142(v_u_130)
					end
				end)
				v_u_179 = p_u_182.TextBox.FocusLost:connect(function(p185)
					-- upvalues: (ref) v_u_177, (copy) p_u_181
					if not v_u_177 then
						p_u_181:Close(p185)
					end
				end)
				if p_u_182.TextBox.ClearTextOnFocus then
					if v_u_126 and v_u_126.TextBox then
						v_u_126.TextBox.Text = ""
					elseif v_u_143 ~= "" then
						v_u_143 = ""
						v_u_103:SetTextFromInput(v_u_143)
						v_u_142(v_u_130)
					end
				else
					v_u_103:SetTextFromInput(p_u_182.TextBox.Text)
					v_u_142(v_u_130)
				end
				local v_u_186 = v_u_97.FindContainerOf(p_u_182.TextBox)
				if v_u_186 then
					v_u_180 = v_u_97.OnPanelClosed.Event:connect(function(p187)
						-- upvalues: (copy) v_u_186, (copy) p_u_181
						if p187 == v_u_186.name then
							p_u_181:Close(false)
						end
					end)
					local v188 = p_u_182.TextBox.AbsolutePosition + Vector2.new(0.5, 1) * p_u_182.TextBox.AbsoluteSize
					v183 = v_u_186:GetCFrameInCameraSpace() * CFrame.new(v_u_186:GetGuiPositionInPanelSpace(v188)) * CFrame.new(0, -v_u_98.height * 0.65, 0.5) * CFrame.Angles(-0.39269908169872414, 0, 0)
				else
					v183 = v_u_97.GetHeadLookXZ(true) * CFrame.Angles(0.39269908169872414, 0, 0) * CFrame.new(0, -1, -5)
				end
			elseif v_u_126 and v_u_126.TextBox then
				v_u_126.TextBox.Text = ""
			elseif v_u_143 ~= "" then
				v_u_143 = ""
				v_u_103:SetTextFromInput(v_u_143)
				v_u_142(v_u_130)
			end
			v_u_4:BindCoreAction("VirtualKeyboardControllerInput", function(_, p189, p190)
				-- upvalues: (ref) v_u_142, (ref) v_u_130, (copy) p_u_181, (ref) v_u_154, (ref) v_u_127
				if p189 == Enum.UserInputState.End then
					if p190.KeyCode == Enum.KeyCode.ButtonL1 then
						v_u_142(v_u_130 - 1)
						return
					end
					if p190.KeyCode == Enum.KeyCode.ButtonR1 then
						v_u_142(v_u_130 + 1)
						return
					end
					if p190.KeyCode == Enum.KeyCode.ButtonX then
						p_u_181:BackspaceAtCursor()
						return
					end
					if p190.KeyCode == Enum.KeyCode.ButtonY then
						p_u_181:SubmitCharacter(" ", false)
						return
					end
					if p190.KeyCode == Enum.KeyCode.ButtonL2 then
						if v_u_154 then
							p_u_181:SetCurrentKeyset(v_u_154 % #v_u_127 + 1)
							return
						end
					else
						if p190.KeyCode == Enum.KeyCode.ButtonL3 then
							p_u_181:SetCaps(not p_u_181:GetCaps())
							return
						end
						if p190.KeyCode == Enum.KeyCode.ButtonB then
							p_u_181:Close(false)
						end
					end
				end
			end, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL2, Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonB)
			p_u_181.Parent = v_u_98:GetGUI()
			v_u_98:SetType(v_u_97.Type.Fixed, {
				["CFrame"] = v183
			})
			v_u_98:SetCanFade(false)
			v_u_98:SetVisible(true, true)
			v_u_98:ForceShowUntilLookedAt()
			function v_u_98.OnUpdate(_) -- name: OnUpdate end
			v_u_131:Fire()
		end
	end
	rawset(v_u_125, "Open", v191)
	local function v195(p192, p193)
		-- upvalues: (ref) v_u_133, (ref) v_u_178, (ref) v_u_179, (ref) v_u_180, (ref) v_u_4, (copy) v_u_98, (copy) v_u_100, (copy) v_u_97, (copy) v_u_132
		local v194 = p193 == true
		if v_u_133 then
			v_u_133 = false
			if v_u_178 then
				v_u_178:disconnect()
			end
			v_u_178 = nil
			if v_u_179 then
				v_u_179:disconnect()
			end
			v_u_179 = nil
			if v_u_180 then
				v_u_180:disconnect()
			end
			v_u_180 = nil
			v_u_4:UnbindCoreAction("VirtualKeyboardControllerInput")
			v_u_98:OnMouseLeave()
			v_u_98:SetVisible(false, true)
			v_u_100.Visible = false
			v_u_97.Get("Topbar3D"):SetVisible(true)
			p192:SubmitText(v194, false)
			v_u_132:Fire()
		end
	end
	rawset(v_u_125, "Close", v195)
	local function v201(_, p196, p197)
		-- upvalues: (ref) v_u_126, (ref) v_u_143, (copy) v_u_97, (copy) v_u_98, (ref) v_u_177
		local v198 = v_u_126
		if v198 then
			v198 = v_u_126.TextBox
		end
		if v198 then
			if p196 then
				local v199
				if v_u_126 and v_u_126.TextBox then
					v199 = v_u_126.TextBox.Text
				else
					v199 = v_u_143
				end
				v198.Text = v199
			end
			local v200 = v_u_97.FindContainerOf(v198)
			if p197 then
				if v200 then
					v200 = v200.linkedTo == v_u_98
				end
			else
				v200 = p197
			end
			if v200 then
				v_u_177 = true
			end
			v198:ReleaseFocus(p196)
			if v200 then
				v198:CaptureFocus()
				v_u_177 = false
			end
		end
	end
	rawset(v_u_125, "SubmitText", v201)
	local function v202(_)
		-- upvalues: (ref) v_u_126
		return v_u_126
	end
	rawset(v_u_125, "GetCurrentOptions", v202)
	local function v210(_)
		-- upvalues: (ref) v_u_130, (ref) v_u_126, (ref) v_u_143, (copy) v_u_103, (copy) v_u_142
		if v_u_130 >= 1 then
			local v203
			if v_u_126 and v_u_126.TextBox then
				v203 = v_u_126.TextBox.Text
			else
				v203 = v_u_143
			end
			local v204 = v_u_130 - 1
			local v205 = string.sub(v203, 1, v204)
			local v206 = v_u_130 + 1
			local v207 = #v203
			local v208 = v205 .. string.sub(v203, v206, v207)
			local v209 = v_u_130 - 1
			if v_u_126 and v_u_126.TextBox then
				v_u_126.TextBox.Text = v208
			elseif v_u_143 ~= v208 then
				v_u_143 = v208
				v_u_103:SetTextFromInput(v_u_143)
				v_u_142(v_u_130)
			end
			v_u_142(v209)
		end
	end
	rawset(v_u_125, "BackspaceAtCursor", v210)
	local function v220(p211, p212, p213)
		-- upvalues: (ref) v_u_126, (ref) v_u_143, (ref) v_u_130, (copy) v_u_103, (copy) v_u_142
		local v214
		if v_u_126 and v_u_126.TextBox then
			v214 = v_u_126.TextBox.Text
		else
			v214 = v_u_143
		end
		local v215 = v_u_130
		local v216 = string.sub(v214, 1, v215)
		local v217 = v_u_130 + 1
		local v218 = #v214
		local v219 = v216 .. p212 .. string.sub(v214, v217, v218)
		if v_u_126 and v_u_126.TextBox then
			v_u_126.TextBox.Text = v219
		elseif v_u_143 ~= v219 then
			v_u_143 = v219
			v_u_103:SetTextFromInput(v_u_143)
			v_u_142(v_u_130)
		end
		v_u_142(v_u_130 + #p212)
		if p213 and p211:GetShift() then
			p211:SetShift(false)
		end
	end
	rawset(v_u_125, "SubmitCharacter", v220)
	local v_u_221 = v_u_130
	local v_u_222 = v_u_143
	local v_u_223 = v_u_126
	for _, v224 in pairs(p96) do
		local v225 = v_u_8("Frame")({
			["Name"] = "KeyboardSizeConstrainer",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 1, -20),
			["Position"] = UDim2.new(0, 0, 0, 20),
			["Parent"] = v_u_100
		})
		local v226 = 0
		local v227 = 0
		local v228 = {}
		local v229 = 0
		for _, v230 in pairs(v224) do
			local v231 = 0
			local v232 = 1
			local v233 = 1
			local v234 = nil
			local v235 = nil
			local v236 = nil
			local v237 = nil
			for _, v238 in pairs(v230) do
				if type(v238) == "table" then
					if v238.w then
						v232 = v238.w
					end
					if v238.h then
						v233 = v238.h
					end
					if v238.x then
						v231 = v231 + v238.x
					end
					if v238.y then
						v226 = v226 + v238.y
					end
					if v238.x2 then
						v234 = v238.x2
					end
					if v238.y2 then
						v235 = v238.y2
					end
					if v238.w2 then
						v236 = v238.w2
					end
					if not v238.h2 then
						continue
					end
					v237 = v238.h2
				else
					if type(v238) ~= "string" then
						continue
					end
					local v239 = v238 == "" and " " or v238
					local v240 = v_u_87
					local v241 = v_u_125
					local v242 = {}
					local v243 = {
						["x"] = v231,
						["y"] = v226,
						["width"] = v232,
						["height"] = v233,
						["x2"] = v234,
						["y2"] = v235,
						["width2"] = v236,
						["height2"] = v237
					}
					for v244 in string.gmatch(v239, "([^\n]+)") do
						table.insert(v242, v244)
					end
					local v245 = v240(v_u_125, v243, v242)
					table.insert(v228, v245)
					v231 = v231 + v232
					v229 = math.max(v229, v231)
					local v246 = v226 + v233
					v227 = math.max(v227, v246)
					v_u_125 = v241
					v232 = 1
					v233 = 1
					v234 = nil
					v235 = nil
					v236 = nil
					v237 = nil
				end
			end
			v226 = v226 + 1
		end
		for _, v247 in pairs(v228) do
			v247.Position = UDim2.new(v247.Position.X.Scale / v229, 0, v247.Position.Y.Scale / v227, 0)
			v247.Size = UDim2.new(v247.Size.X.Scale / v229, 0, v247.Size.Y.Scale / v227, 0)
			v247.Parent = v225
		end
		v225.SizeConstraint = Enum.SizeConstraint.RelativeXX
		v225.Size = UDim2.new(1, 0, -v227 / v229, 0)
		v225.Position = UDim2.new(0, 0, 1, 0)
		v225.Visible = false
		table.insert(v_u_127, {
			["keys"] = v228,
			["container"] = v225
		})
	end
	v_u_125:SetCurrentKeyset(1)
	v_u_103.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_142, (copy) v_u_153, (copy) v_u_98
		v_u_142((v_u_153(v_u_98.lookAtPixel.X, v_u_98.lookAtPixel.Y)))
	end)
	v106.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_125
		v_u_125:Close(false)
	end)
	v109.MouseButton1Click:connect(function()
		-- upvalues: (ref) v_u_90, (ref) v_u_88, (ref) v_u_5
		if v_u_90:GetCurrentState().Name == "Listening" then
			local v248 = v_u_90
			local v249 = v_u_88()
			v249.Name = "Processing"
			local v_u_250 = false
			local v_u_251 = nil
			function v249.TransitionTo(_) -- name: TransitionTo
				-- upvalues: (ref) v_u_251, (ref) v_u_5, (ref) v_u_250
				coroutine.wrap(function()
					-- upvalues: (ref) v_u_251, (ref) v_u_5, (ref) v_u_250
					local function v252()
						-- upvalues: (ref) v_u_251, (ref) v_u_5
						v_u_251 = v_u_5:EndRecording()
					end
					pcall(v252)
					v_u_250 = true
				end)()
			end
			function v249.GetResultAsync(_) -- name: GetResultAsync
				-- upvalues: (ref) v_u_250, (ref) v_u_251
				while not v_u_250 do
					wait()
				end
				return v_u_251
			end
			v248:TransitionState(v249)
		end
	end)
	local function v258(p_u_253) -- name: onVoiceProcessingStateChanged
		-- upvalues: (copy) v_u_110, (copy) v_u_124, (ref) v_u_16, (ref) v_u_223, (ref) v_u_222, (copy) v_u_103, (copy) v_u_142, (ref) v_u_221, (ref) v_u_90, (ref) v_u_88, (copy) v_u_125
		if p_u_253.Name == "Listening" then
			v_u_110.Text = "Listening..."
		elseif p_u_253.Name == "Processing" then
			v_u_110.Text = "Processing..."
		elseif p_u_253.Name == "Waiting" then
			v_u_110.Text = "Done"
		end
		if p_u_253.Name == "Processing" then
			coroutine.wrap(function()
				-- upvalues: (ref) v_u_124, (copy) p_u_253, (ref) v_u_16, (ref) v_u_223, (ref) v_u_222, (ref) v_u_103, (ref) v_u_142, (ref) v_u_221, (ref) v_u_110, (ref) v_u_90, (ref) v_u_88
				v_u_124:StopAnimation()
				local v254 = p_u_253:GetResultAsync()
				if v254 and v254.Status == v_u_16.ASR_STATUS_OK then
					local v255 = v254.Response
					if v_u_223 and v_u_223.TextBox then
						v_u_223.TextBox.Text = v255
					elseif v_u_222 ~= v255 then
						v_u_222 = v255
						v_u_103:SetTextFromInput(v_u_222)
						v_u_142(v_u_221)
					end
				else
					v_u_110.Text = "An error occurred, please try again."
					wait(2)
				end
				local v256 = v_u_90
				local v257 = v_u_88()
				v257.Name = "Waiting"
				v256:TransitionState(v257)
			end)()
			return
		elseif p_u_253.Name == "Listening" then
			v_u_124:StartAnimation()
		elseif p_u_253.Name == "Waiting" then
			v_u_125:SetVoiceMode(false)
		end
	end
	v_u_90.StateTransitionedEvent:connect(v258)
	v258(v_u_90:GetCurrentState())
	return v_u_125
end
local v260 = nil
local v262 = {
	["CreateVirtualKeyboardOptions"] = function(_, p261) -- name: CreateVirtualKeyboardOptions
		return {
			["TextBox"] = p261
		}
	end,
	["ShowVirtualKeyboard"] = function(_, _) -- name: ShowVirtualKeyboard end,
	["CloseVirtualKeyboard"] = function(_) -- name: CloseVirtualKeyboard end
}
if v260 == nil then
	v260 = v259({ v14, v15 })
end
v262.OpenedEvent = v260.OpenedEvent
if v260 == nil then
	v260 = v259({ v14, v15 })
end
v262.ClosedEvent = v260.ClosedEvent
return v262