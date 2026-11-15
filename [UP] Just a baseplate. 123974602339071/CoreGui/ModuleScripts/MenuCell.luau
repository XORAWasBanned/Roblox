-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadMenu.MenuCell
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = v5.Utility.normalizeFontFace
local v_u_7 = v5.Utility.Flags.FoundationFontFaceMigration
local v_u_8 = v4.Core.Style.withStyle
local v_u_9 = v4.Core.ImageSet.ImageSetLabel
local v_u_10 = require(v1.Workspace.Packages.RobloxTranslator)
local v11 = v_u_2.PureComponent:extend("MenuCell")
v11.validateProps = v3.strictInterface({
	["layoutOrder"] = v3.integer,
	["icon"] = v3.optional(v3.union(v3.table, v3.string)),
	["iconComponent"] = v3.optional(v3.table),
	["localizationKey"] = v3.string,
	["height"] = v3.numberPositive,
	["hasDivider"] = v3.boolean,
	["isSelected"] = v3.boolean
})
function v11.render(p_u_12) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_2, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6
	return v_u_8(function(p13)
		-- upvalues: (ref) v_u_10, (copy) p_u_12, (ref) v_u_2, (ref) v_u_9, (ref) v_u_7, (ref) v_u_6
		local v14 = p13.Theme
		local v15 = p13.Font
		local v16 = v_u_10:FormatByKey(p_u_12.props.localizationKey)
		local v17 = v_u_2.createElement
		local v18 = "Frame"
		local v19 = {
			["LayoutOrder"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = p_u_12.props.layoutOrder,
			["Size"] = UDim2.new(1, 0, 0, p_u_12.props.height)
		}
		local v20 = {}
		local v21 = p_u_12.props.isSelected
		if v21 then
			v21 = v_u_2.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = UDim2.new(1, 4, 1, 4),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["AnchorPoint"] = Vector2.new(0.5, 0.5)
			}, {
				["TopBorder"] = v_u_2.createElement("Frame", {
					["BorderSizePixel"] = 0,
					["Size"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["Size"] = UDim2.new(1, 0, 0, 2),
					["BackgroundTransparency"] = v14.SystemPrimaryOnHover.Transparency,
					["BackgroundColor3"] = v14.SystemPrimaryOnHover.Color
				}),
				["LeftBorder"] = v_u_2.createElement("Frame", {
					["BorderSizePixel"] = 0,
					["Size"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["Size"] = UDim2.new(0, 2, 1, 0),
					["BackgroundTransparency"] = v14.SystemPrimaryOnHover.Transparency,
					["BackgroundColor3"] = v14.SystemPrimaryOnHover.Color
				}),
				["RightBorder"] = v_u_2.createElement("Frame", {
					["BorderSizePixel"] = 0,
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["Size"] = UDim2.new(0, 2, 1, 0),
					["Position"] = UDim2.fromScale(1, 0),
					["AnchorPoint"] = Vector2.new(1, 0),
					["BackgroundTransparency"] = v14.SystemPrimaryOnHover.Transparency,
					["BackgroundColor3"] = v14.SystemPrimaryOnHover.Color
				}),
				["BottomBorder"] = v_u_2.createElement("Frame", {
					["BorderSizePixel"] = 0,
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["Size"] = UDim2.new(1, 0, 0, 2),
					["Position"] = UDim2.fromScale(0, 1),
					["AnchorPoint"] = Vector2.new(0, 1),
					["BackgroundTransparency"] = v14.SystemPrimaryOnHover.Transparency,
					["BackgroundColor3"] = v14.SystemPrimaryOnHover.Color
				})
			})
		end
		v20.SelectedFrame = v21
		local v22 = v_u_2.createElement
		local v23 = "Frame"
		local v24 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromScale(1, 1)
		}
		local v25 = {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 12)
			}),
			["Padding"] = v_u_2.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 12),
				["PaddingRight"] = UDim.new(0, 12)
			})
		}
		local v26 = v_u_2.createElement
		local v27 = "Frame"
		local v28 = {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromOffset(36, 36)
		}
		local v29 = {}
		local v30
		if p_u_12.props.icon == nil then
			v30 = false
		else
			v30 = v_u_2.createElement(v_u_9, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["Size"] = nil,
				["ImageTransparency"] = nil,
				["ImageColor3"] = nil,
				["Image"] = p_u_12.props.icon,
				["Size"] = UDim2.fromScale(1, 1),
				["ImageTransparency"] = v14.IconEmphasis.Transparency,
				["ImageColor3"] = v14.IconEmphasis.Color
			})
		end
		v29.IconLabel = v30
		local v31
		if p_u_12.props.iconComponent == nil then
			v31 = false
		else
			v31 = v_u_2.createElement(p_u_12.props.iconComponent)
		end
		v29.IconComponent = v31
		v25.IconFrame = v26(v27, v28, v29)
		local v32 = v_u_2.createElement
		local v33 = "TextLabel"
		local v34 = {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["TextTruncate"] = nil,
			["Size"] = UDim2.new(1, -48, 1, 0),
			["Text"] = v16
		}
		local v35
		if v_u_7 then
			v35 = nil
		else
			v35 = v15.Header2.Font
		end
		v34.Font = v35
		local v36
		if v_u_7 then
			v36 = v_u_6(p13.Tokens.Typography.TitleLarge.Font)
		else
			v36 = nil
		end
		v34.FontFace = v36
		v34.TextSize = v15.BaseSize * v15.Header2.RelativeSize
		v34.TextColor3 = v14.TextEmphasis.Color
		v34.TextTransparency = v14.TextEmphasis.TextTransparency
		v34.TextXAlignment = Enum.TextXAlignment.Left
		v34.TextYAlignment = Enum.TextYAlignment.Center
		v34.TextTruncate = Enum.TextTruncate.AtEnd
		v25.Text = v32(v33, v34)
		v20.CellContents = v22(v23, v24, v25)
		local v37 = p_u_12.props.hasDivider
		if v37 then
			v37 = v_u_2.createElement("Frame", {
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = nil,
				["BackgroundColor3"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["Position"] = UDim2.fromScale(0, 1),
				["AnchorPoint"] = Vector2.new(0, 1),
				["BackgroundTransparency"] = v14.Divider.Transparency,
				["BackgroundColor3"] = v14.Divider.Color
			})
		end
		v20.Divider = v37
		return v17(v18, v19, v20)
	end)
end
return v11