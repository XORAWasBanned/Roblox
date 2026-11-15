-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.KeyLabel
local v_u_1 = game:GetService("TextService")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("CorePackages")
local v4 = require(v3.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.UIBlox
local v7 = v4.t
local v_u_8 = v6.Core.Style.withStyle
local v9 = script.Parent.Parent
local v_u_10 = require(v9.Resources.Assets)
local v_u_11 = require(v9.GlobalConfig)
local v_u_12 = require(v9.Components.ThemedTextLabel)
local v_u_13 = v6.Core.ImageSet.ImageSetLabel
local v_u_14 = {
	[Enum.KeyCode.Escape] = {
		["text"] = "ESC",
		["fontKey"] = "Footer",
		["width"] = 36
	},
	[Enum.KeyCode.Space] = {
		["text"] = "Space",
		["width"] = 92
	},
	[Enum.KeyCode.LeftShift] = {
		["text"] = "Shift",
		["width"] = 66,
		["alignment"] = nil,
		["alignment"] = Enum.TextXAlignment.Left
	},
	[Enum.KeyCode.LeftControl] = {
		["text"] = "Ctrl",
		["width"] = 66,
		["alignment"] = nil,
		["alignment"] = Enum.TextXAlignment.Left
	},
	[Enum.KeyCode.LeftSuper] = {
		["text"] = "Command"
	},
	[Enum.KeyCode.LeftMeta] = {
		["text"] = "fn"
	},
	[Enum.KeyCode.LeftAlt] = {
		["text"] = "Opt"
	},
	[Enum.KeyCode.Tilde] = {
		["text"] = "~",
		["fontKey"] = "CaptionHeader"
	},
	[Enum.KeyCode.F10] = {
		["fontKey"] = "CaptionHeader",
		["width"] = 36
	},
	[Enum.KeyCode.F11] = {
		["fontKey"] = "CaptionHeader",
		["width"] = 36
	},
	[Enum.KeyCode.Up] = {
		["image"] = v_u_10.Images.UpArrow
	},
	[Enum.KeyCode.Down] = {
		["image"] = v_u_10.Images.DownArrow
	},
	[Enum.KeyCode.Left] = {
		["image"] = v_u_10.Images.LeftArrow
	},
	[Enum.KeyCode.Right] = {
		["image"] = v_u_10.Images.RightArrow
	}
}
local v_u_15 = v7.strictInterface({
	["input"] = v7.enum(Enum.KeyCode),
	["borderThemeKey"] = v7.optional(v7.string),
	["textThemeKey"] = v7.optional(v7.string),
	["AnchorPoint"] = v7.optional(v7.Vector2),
	["Position"] = v7.optional(v7.UDim2),
	["LayoutOrder"] = v7.optional(v7.integer),
	["ZIndex"] = v7.optional(v7.integer)
})
local function v_u_26(p16, p17, p18) -- name: getLabelWidthAndContent
	-- upvalues: (copy) v_u_14, (copy) v_u_5, (copy) v_u_13, (copy) v_u_2, (copy) v_u_1, (copy) v_u_12
	local v19 = v_u_14[p16]
	if v19 and v19.image then
		return 36, v_u_5.createElement(v_u_13, {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Image"] = v19.image,
			["ImageColor3"] = p17.Theme.IconEmphasis.Color,
			["ImageTransparency"] = p17.Theme.IconEmphasis.Transparency,
			["Position"] = UDim2.new(0.5, 0, 0.5, -1),
			["Size"] = UDim2.new(0, 16, 0, 16)
		})
	end
	local v20 = nil
	local v21 = v_u_2:GetStringForKeyCode(p16)
	if v19 and v19.text then
		v21 = v19.text
	elseif not v21 or v21 == "" then
		v21 = p16.Name
	end
	local v22 = v21:len() < 3
	local v23 = not (v19 and v19.fontKey) and (v22 and "CaptionHeader" or "Footer") or v19.fontKey
	local v24
	if v19 and v19.width then
		v24 = v19.width
	elseif v22 then
		v24 = 36
	else
		local v25 = p17.Font[v23]
		v24 = v_u_1:GetTextSize(v21, v25.RelativeSize * p17.Font.BaseSize, v25.Font, Vector2.new((1 / 0), 36)).X + 28
	end
	if v19 and v19.alignment then
		v20 = v19.alignment
	end
	return v24, v_u_5.createElement(v_u_12, {
		["fontKey"] = v23,
		["themeKey"] = p18 or "TextEmphasis",
		["Text"] = v21,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, -1),
		["TextXAlignment"] = v20
	}), v20
end
return function(p_u_27) -- name: KeyLabel
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_8, (copy) v_u_26, (copy) v_u_5, (copy) v_u_13, (copy) v_u_10
	if v_u_11.propValidation then
		local v28 = v_u_15
		assert(v28(p_u_27))
	end
	return v_u_8(function(p29)
		-- upvalues: (copy) p_u_27, (ref) v_u_26, (ref) v_u_5, (ref) v_u_13, (ref) v_u_10
		local v30 = p29.Theme[p_u_27.borderThemeKey or "UIEmphasis"]
		local v31, v32, v33 = v_u_26(p_u_27.input, p29, p_u_27.textThemeKey)
		local v34 = v33 and 9 or nil
		local v35 = v_u_5.createElement
		local v36 = v_u_13
		local v37 = {
			["BackgroundTransparency"] = 1,
			["ImageTransparency"] = nil,
			["ImageColor3"] = nil,
			["Image"] = nil,
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["LayoutOrder"] = nil,
			["ZIndex"] = nil,
			["ImageTransparency"] = v30.Transparency,
			["ImageColor3"] = v30.Color,
			["Image"] = v_u_10.Images.KeyBorder,
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(Vector2.new(9, 7), Vector2.new(26, 26)),
			["Size"] = UDim2.new(0, v31, 0, 36),
			["Position"] = p_u_27.Position,
			["AnchorPoint"] = p_u_27.AnchorPoint,
			["LayoutOrder"] = p_u_27.LayoutOrder,
			["ZIndex"] = p_u_27.ZIndex
		}
		local v38 = {}
		if v34 then
			v34 = v_u_5.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, v34),
				["PaddingRight"] = UDim.new(0, v34)
			})
		end
		v38.Padding = v34
		v38.LabelContent = v32
		return v35(v36, v37, v38)
	end)
end