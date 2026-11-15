-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadMenu.MenuHeader
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = v5.Utility.normalizeFontFace
local v_u_7 = v5.Utility.Flags.FoundationFontFaceMigration
local v8 = require(v1.Packages.RoactRodux)
local v_u_9 = v4.Core.Style.withStyle
local v10 = v4.App.ImageSet.Images
local v_u_11 = v4.Core.ImageSet.ImageSetLabel
local v_u_12 = v10["icons/imageUnavailable"]
local v_u_13 = v10["component_assets/circle_17"]
local v_u_14 = Rect.new(8, 8, 9, 9)
local v15 = v_u_2.PureComponent:extend("MenuHeader")
v15.validateProps = v3.strictInterface({
	["gameName"] = v3.string,
	["layoutOrder"] = v3.integer,
	["height"] = v3.numberPositive
})
function v15.render(p_u_16) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_11, (copy) v_u_13, (copy) v_u_14, (copy) v_u_12, (copy) v_u_7, (copy) v_u_6
	return v_u_9(function(p17)
		-- upvalues: (ref) v_u_2, (ref) v_u_11, (ref) v_u_13, (ref) v_u_14, (ref) v_u_12, (copy) p_u_16, (ref) v_u_7, (ref) v_u_6
		local v18 = p17.Theme
		local v19 = p17.Font
		local v20
		if game.GameId == 0 then
			v20 = v_u_2.createElement(v_u_11, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["SliceCenter"] = nil,
				["ScaleType"] = nil,
				["Size"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["Image"] = v_u_13,
				["SliceCenter"] = v_u_14,
				["ScaleType"] = Enum.ScaleType.Slice,
				["Size"] = UDim2.fromOffset(80, 80),
				["ImageColor3"] = p17.Theme.PlaceHolder.Color,
				["ImageTransparency"] = p17.Theme.PlaceHolder.Transparency
			}, {
				["PlaceholderIcon"] = v_u_2.createElement(v_u_11, {
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["Position"] = nil,
					["Image"] = nil,
					["ImageColor3"] = nil,
					["ImageTransparency"] = nil,
					["AnchorPoint"] = nil,
					["Size"] = UDim2.fromOffset(44, 44),
					["Position"] = UDim2.fromScale(0.5, 0.5),
					["Image"] = v_u_12,
					["ImageColor3"] = p17.Theme.UIDefault.Color,
					["ImageTransparency"] = p17.Theme.UIDefault.Transparency,
					["AnchorPoint"] = Vector2.new(0.5, 0.5)
				})
			})
		else
			local v21 = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(game.GameId, 128, 128)
			v20 = v_u_2.createElement("ImageLabel", {
				["LayoutOrder"] = 1,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Image"] = nil,
				["Size"] = UDim2.fromOffset(80, 80),
				["Image"] = v21
			})
		end
		local v22 = v_u_2.createElement
		local v23 = "Frame"
		local v24 = {
			["LayoutOrder"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = p_u_16.props.layoutOrder,
			["Size"] = UDim2.new(1, 0, 0, p_u_16.props.height)
		}
		local v25 = {}
		local v26 = v_u_2.createElement
		local v27 = "Frame"
		local v28 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromScale(1, 1)
		}
		local v29 = {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 20)
			}),
			["Padding"] = v_u_2.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 20),
				["PaddingRight"] = UDim.new(0, 20)
			}),
			["GameIcon"] = v20
		}
		local v30 = v_u_2.createElement
		local v31 = "Frame"
		local v32 = {
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.new(1, -100, 1, 0)
		}
		local v33 = {}
		local v34 = v_u_2.createElement
		local v35 = "TextLabel"
		local v36 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["Text"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["TextTruncate"] = nil,
			["TextWrapped"] = true,
			["Size"] = UDim2.new(1, 0, 1, -45),
			["Position"] = UDim2.fromOffset(0, 25)
		}
		local v37
		if v_u_7 then
			v37 = nil
		else
			v37 = v19.Header1.Font
		end
		v36.Font = v37
		local v38
		if v_u_7 then
			v38 = v_u_6(p17.Tokens.Typography.HeadingSmall.Font)
		else
			v38 = nil
		end
		v36.FontFace = v38
		v36.Text = p_u_16.props.gameName
		v36.TextSize = v19.BaseSize * v19.Header1.RelativeSize
		v36.TextColor3 = v18.TextEmphasis.Color
		v36.TextTransparency = v18.TextEmphasis.TextTransparency
		v36.TextXAlignment = Enum.TextXAlignment.Left
		v36.TextYAlignment = Enum.TextYAlignment.Top
		v36.TextTruncate = Enum.TextTruncate.AtEnd
		v33.TextLabel = v34(v35, v36)
		v29.TextFrame = v30(v31, v32, v33)
		v25.ContentsFrame = v26(v27, v28, v29)
		v25.Divider = v_u_2.createElement("Frame", {
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 1),
			["Position"] = UDim2.fromScale(0, 1),
			["AnchorPoint"] = Vector2.new(0, 1),
			["BackgroundTransparency"] = v18.Divider.Transparency,
			["BackgroundColor3"] = v18.Divider.Color
		})
		return v22(v23, v24, v25)
	end)
end
return v8.UNSTABLE_connect2(function(p39) -- name: mapStateToProps
	return {
		["gameName"] = p39.gameInfo.name
	}
end, nil)(v15)