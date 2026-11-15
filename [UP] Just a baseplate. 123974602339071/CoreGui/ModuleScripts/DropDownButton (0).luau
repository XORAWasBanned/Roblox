-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationMobile.DropDownButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v7 = require(v1.Workspace.Packages.PlayerList)
local v_u_8 = require(v1.Packages.Foundation)
local v_u_9 = v_u_8.Enums.IconName
local v_u_10 = v_u_8.Enums.IconVariant
local v_u_11 = v_u_8.Enums.IconSize
local v_u_12 = v_u_8.Utility.normalizeFontFace
local v_u_13 = v_u_8.Utility.Flags.FoundationFontFaceMigration
local v_u_14 = v7.Common.useLayoutValues
local v_u_15 = v6.Style.withStyle
local v16 = script.Parent.Parent
local v17 = v16.Connection
local v_u_18 = require(v17.LayoutValues).WithLayoutValues
local v_u_19 = require(v16.PresentationCommon.IconButton)
local v_u_20 = require(v1.Workspace.Packages.Style).Colors
local v_u_21 = v6.Core.ImageSet.ImageSetLabel
local v_u_22 = v6.App.ImageSet.Images
local v_u_23 = v7.Flags.FFlagEnableMobilePlayerListOnConsole
local v24 = v16.Parent
local v_u_25 = require(v24.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)
local v_u_26 = v_u_3.PureComponent:extend("DropDownButton")
v_u_26.validateProps = v5.strictInterface({
	["contentVisible"] = v5.boolean,
	["buttonTransparency"] = v5.any,
	["text"] = v5.string,
	["layoutOrder"] = v5.optional(v5.integer),
	["icon"] = v5.union(v5.string, v5.table),
	["lastButton"] = v5.boolean,
	["forceShowOptions"] = v5.boolean,
	["screenSizeX"] = v5.number,
	["screenSizeY"] = v5.number,
	["onActivated"] = v5.optional(v5.callback),
	["onDecline"] = v5.optional(v5.callback),
	["onDismiss"] = v5.optional(v5.callback),
	["animatingAccept"] = v5.optional(v5.boolean),
	["animatingDecline"] = v5.optional(v5.boolean),
	["animatingPercentage"] = v5.optional(v5.number),
	["layoutValues"] = v5.optional(v5.table)
})
function v_u_26.init(p27) -- name: init
	p27.state = {
		["isHovered"] = false,
		["isPressed"] = false,
		["sizeX"] = 100,
		["absolutePosX"] = 0,
		["absolutePosY"] = 0
	}
end
function v_u_26.getColorBackgroundAnimation(p28, p29) -- name: getColorBackgroundAnimation
	if p28.props.animatingPercentage == nil then
		return 0, 0
	end
	local v30 = p28.state.sizeX - p29.DropDownRightOptionSize
	local v31 = p29.DropDownRightOptionSize
	if p28.props.animatingDecline then
		v30 = v30 - p29.DropDownRightOptionSize
	end
	local v32 = p28.state.sizeX - p29.DropDownRightOptionSize
	local v33 = v31 + v32 * p28.props.animatingPercentage
	local v34 = v30 - v32 * p28.props.animatingPercentage * 0.5
	if v34 + v33 > p28.state.sizeX then
		v34 = v34 - (v34 + v33 - p28.state.sizeX)
	end
	return v34, v33
end
function v_u_26.render(p_u_35) -- name: render
	-- upvalues: (copy) v_u_18, (copy) v_u_15, (copy) v_u_20, (copy) v_u_25, (copy) v_u_9, (copy) v_u_3, (copy) v_u_8, (copy) v_u_10, (copy) v_u_11, (copy) v_u_21, (copy) v_u_13, (copy) v_u_12, (copy) v_u_23, (copy) v_u_19, (copy) v_u_22
	return v_u_18(function(p_u_36)
		-- upvalues: (ref) v_u_15, (copy) p_u_35, (ref) v_u_20, (ref) v_u_25, (ref) v_u_9, (ref) v_u_3, (ref) v_u_8, (ref) v_u_10, (ref) v_u_11, (ref) v_u_21, (ref) v_u_13, (ref) v_u_12, (ref) v_u_23, (ref) v_u_19, (ref) v_u_22
		return v_u_15(function(p37)
			-- upvalues: (ref) p_u_36, (ref) p_u_35, (ref) v_u_20, (ref) v_u_25, (ref) v_u_9, (ref) v_u_3, (ref) v_u_8, (ref) v_u_10, (ref) v_u_11, (ref) v_u_21, (ref) v_u_13, (ref) v_u_12, (ref) v_u_23, (ref) v_u_19, (ref) v_u_22
			p_u_36 = p_u_35.props.layoutValues
			local v38 = {
				["Transparency"] = 1,
				["Color"] = nil,
				["Color"] = Color3.new(1, 1, 1)
			}
			if p_u_35.state.isPressed then
				v38 = p37.Theme.BackgroundOnPress
			elseif p_u_35.state.isHovered then
				v38 = p37.Theme.BackgroundOnHover
			end
			local v39 = p_u_35.props.lastButton and "rbxasset://textures/ui/BottomRoundedRect8px.png" or ""
			local v40 = p_u_35.props.onActivated ~= nil and true or p_u_35.props.animatingAccept
			local v41 = p_u_35.props.onDecline ~= nil and true or p_u_35.props.animatingDecline
			local v_u_42 = (p_u_35.props.onDecline ~= nil or p_u_35.props.animatingPercentage ~= nil) and true or p_u_35.props.forceShowOptions
			local v43, v44 = p_u_35:getColorBackgroundAnimation(p_u_36)
			local v45 = v_u_20.Green
			if p_u_35.props.animatingDecline then
				v45 = v_u_20.Red
			elseif p_u_35.props.forceShowOptions then
				v45 = v_u_20.White
			end
			local v46 = p_u_36.DropDownPadding * 2 + p_u_36.DropDownIconSize
			local v47 = p_u_36.DropDownRightOptionSize * 2
			if v_u_42 then
				v46 = v46 + v47
			end
			local v48 = p_u_35.props.icon
			local v49
			if v_u_25 and v_u_9[v48] ~= nil then
				v49 = v_u_3.createElement("Frame", {
					["LayoutOrder"] = 1,
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Size"] = UDim2.new(0, p_u_36.DropDownIconSize, 0, p_u_36.DropDownIconSize)
				}, {
					["Icon"] = v_u_3.createElement(v_u_8.Icon, {
						["name"] = v_u_9[v48],
						["variant"] = v_u_10.Regular,
						["size"] = v_u_11.Large,
						["style"] = {
							["Color3"] = p37.Theme.IconEmphasis.Color,
							["Transparency"] = p37.Theme.IconEmphasis.Transparency
						},
						["AnchorPoint"] = Vector2.new(0.5, 0.5),
						["Position"] = UDim2.new(0.5, 0, 0.5, 0)
					})
				})
			else
				v49 = v_u_3.createElement(v_u_21, {
					["LayoutOrder"] = 1,
					["Size"] = nil,
					["ImageColor3"] = nil,
					["Image"] = nil,
					["BackgroundTransparency"] = 1,
					["Size"] = UDim2.new(0, p_u_36.DropDownIconSize, 0, p_u_36.DropDownIconSize),
					["ImageColor3"] = p37.Theme.IconEmphasis.Color,
					["Image"] = p_u_35.props.icon
				})
			end
			local function v50() -- name: onMouseButton1Down
				-- upvalues: (copy) v_u_42, (ref) p_u_35
				if not v_u_42 then
					p_u_35:setState({
						["isPressed"] = true
					})
				end
			end
			local function v51() -- name: onMouseButton1Up
				-- upvalues: (ref) p_u_35
				p_u_35:setState({
					["isPressed"] = false
				})
			end
			local v52 = v_u_3.createElement
			local v53 = "ImageButton"
			local v54 = {
				["LayoutOrder"] = p_u_35.props.layoutOrder,
				["Image"] = v39,
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = Rect.new(8, 8, 24, 16),
				["SliceScale"] = 0.5,
				["ImageTransparency"] = p_u_35.props.lastButton and p_u_35.props.buttonTransparency or 1,
				["ImageColor3"] = Color3.fromRGB(0, 0, 0),
				["Size"] = UDim2.new(1, 0, 0, p_u_36.DropDownButtonSizeY),
				["BackgroundTransparency"] = p_u_35.props.lastButton and 1 or p_u_35.props.buttonTransparency,
				["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
				["AutoButtonColor"] = false,
				["BorderSizePixel"] = 0,
				["Selectable"] = not v_u_42
			}
			local v55 = v_u_3.Event.Activated
			local v56
			if v_u_42 then
				v56 = nil
			else
				v56 = p_u_35.props.onActivated or nil
			end
			v54[v55] = v56
			v54[v_u_3.Event.MouseEnter] = function()
				-- upvalues: (copy) v_u_42, (ref) p_u_35
				if not v_u_42 then
					p_u_35:setState({
						["isHovered"] = true
					})
				end
			end
			v54[v_u_3.Event.MouseLeave] = function()
				-- upvalues: (ref) p_u_35
				p_u_35:setState({
					["isHovered"] = false,
					["isPressed"] = false
				})
			end
			v54[v_u_3.Change.AbsoluteSize] = function(p57)
				-- upvalues: (ref) p_u_35
				p_u_35:setState({
					["sizeX"] = p57.AbsoluteSize.X
				})
			end
			v54[v_u_3.Change.AbsolutePosition] = function(p58)
				-- upvalues: (ref) p_u_35
				p_u_35:setState({
					["absolutePosX"] = p58.AbsolutePosition.X,
					["absolutePosY"] = p58.AbsolutePosition.Y
				})
			end
			v54[v_u_3.Event.MouseButton1Down] = v50
			v54[v_u_3.Event.MouseButton1Up] = v51
			local v59 = {}
			local v60 = v_u_3.createElement
			local v61 = "ImageLabel"
			local v62 = {
				["Visible"] = nil,
				["ZIndex"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Image"] = nil,
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["SliceScale"] = 0.5,
				["ImageTransparency"] = nil,
				["ImageColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0
			}
			local v63
			if p_u_35.props.animatingPercentage == nil then
				v63 = false
			else
				v63 = p_u_35.props.contentVisible
			end
			v62.Visible = v63
			v62.Size = UDim2.new(0, v44, 1, 0)
			v62.Position = UDim2.fromOffset(v43, 0)
			v62.Image = v39
			v62.ScaleType = Enum.ScaleType.Slice
			v62.SliceCenter = Rect.new(8, 8, 24, 16)
			v62.ImageTransparency = p_u_35.props.lastButton and p_u_36.IconButtonBackgroundTransparency or 1
			v62.ImageColor3 = v45
			v62.BackgroundTransparency = p_u_35.props.lastButton and 1 or p_u_36.IconButtonBackgroundTransparency
			v62.BackgroundColor3 = v45
			v59.ColorBackground = v60(v61, v62)
			local v64 = v_u_3.createElement
			local v65 = "ImageLabel"
			local v66 = {
				["ZIndex"] = 2,
				["Size"] = nil,
				["Visible"] = nil,
				["Image"] = nil,
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["SliceScale"] = 0.5,
				["ImageTransparency"] = nil,
				["ImageColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.fromScale(1, 1),
				["Visible"] = p_u_35.props.contentVisible,
				["Image"] = v39,
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = Rect.new(8, 8, 24, 16),
				["ImageTransparency"] = p_u_35.props.lastButton and (v38.Transparency or 1) or 1,
				["ImageColor3"] = v38.Color,
				["BackgroundTransparency"] = p_u_35.props.lastButton and 1 or v38.Transparency,
				["BackgroundColor3"] = v38.Color
			}
			local v67 = {
				["InitalPadding"] = v_u_3.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, p_u_36.DropDownPadding)
				}),
				["ListLayout"] = v_u_3.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["Padding"] = UDim.new(0, p_u_36.DropDownPadding)
				}),
				["Icon"] = v49
			}
			local v68 = v_u_3.createElement
			local v69 = "TextLabel"
			local v70 = {
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Text"] = nil,
				["Font"] = nil,
				["FontFace"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["TextXAlignment"] = nil,
				["TextTruncate"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, -v46, 1, 0),
				["Text"] = p_u_35.props.text
			}
			local v71
			if v_u_13 then
				v71 = nil
			else
				v71 = p37.Font.Header2.Font
			end
			v70.Font = v71
			local v72
			if v_u_13 then
				v72 = v_u_12(p37.Tokens.Typography.TitleLarge.Font)
			else
				v72 = nil
			end
			v70.FontFace = v72
			local v73
			if v_u_23 then
				v73 = p_u_36.DropDownButtonTextSize
			else
				v73 = p37.Font.BaseSize * p37.Font.Header2.RelativeSize
			end
			v70.TextSize = v73
			v70.TextColor3 = p37.Theme.TextEmphasis.Color
			v70.TextTransparency = p37.Theme.TextEmphasis.Transparency
			v70.TextXAlignment = Enum.TextXAlignment.Left
			v70.TextTruncate = Enum.TextTruncate.AtEnd
			v67.Text = v68(v69, v70)
			local v74 = v_u_3.createElement
			local v75 = "Frame"
			local v76 = {
				["LayoutOrder"] = 3,
				["Visible"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Visible"] = v_u_42,
				["Size"] = UDim2.new(0, v47, 1, 0)
			}
			local v77 = {}
			local v78
			if v40 then
				v78 = v_u_3.createElement(v_u_19, {
					["size"] = UDim2.fromScale(0.5, 1),
					["position"] = UDim2.fromScale(0.5, 0),
					["backgroundColor"] = p_u_35.props.onDecline and v_u_20.Green or v_u_20.White,
					["icon"] = v_u_22["icons/actions/accept"],
					["showBackground"] = p_u_35.props.animatingPercentage == nil,
					["onActivated"] = p_u_35.props.onActivated
				}) or nil
			else
				v78 = nil
			end
			v77.ConfirmButton = v78
			local v79
			if v41 then
				v79 = v_u_3.createElement(v_u_19, {
					["size"] = UDim2.fromScale(0.5, 1),
					["position"] = UDim2.new(0, 0, 0, 0),
					["backgroundColor"] = v_u_20.Red,
					["icon"] = v_u_22["icons/actions/reject"],
					["showBackground"] = p_u_35.props.animatingPercentage == nil,
					["onActivated"] = p_u_35.props.onDecline
				}) or nil
			else
				v79 = nil
			end
			v77.DeclineButton = v79
			v67.ButtonContainer = v74(v75, v76, v77)
			v59.HoverBackground = v64(v65, v66, v67)
			local v80 = v_u_3.createElement
			local v81 = "ImageButton"
			local v82 = {
				["Image"] = "",
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.fromOffset(p_u_35.props.screenSizeX, p_u_35.props.screenSizeY),
				["Position"] = UDim2.fromOffset(-p_u_35.state.absolutePosX, -p_u_35.state.absolutePosY)
			}
			local v83
			if p_u_35.props.onDismiss == nil then
				v83 = false
			else
				v83 = p_u_35.props.contentVisible
			end
			v82.Visible = v83
			v82[v_u_3.Event.Activated] = p_u_35.props.onDismiss
			v59.DismissInputHandler = v80(v81, v82)
			local v84 = not p_u_35.props.lastButton
			if v84 then
				v84 = v_u_3.createElement("Frame", {
					["Visible"] = nil,
					["ZIndex"] = 3,
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["BorderSizePixel"] = 0,
					["Visible"] = p_u_35.props.contentVisible,
					["Size"] = UDim2.new(1, 0, 0, 1),
					["Position"] = UDim2.fromScale(0, 1),
					["AnchorPoint"] = Vector2.new(0, 1),
					["BackgroundTransparency"] = p37.Theme.Divider.Transparency,
					["BackgroundColor3"] = p37.Theme.Divider.Color
				})
			end
			v59.Divider = v84
			return v52(v53, v54, v59)
		end)
	end)
end
return v4.connect(function(p85) -- name: mapStateToProps
	return {
		["screenSizeX"] = p85.screenSize.X,
		["screenSizeY"] = p85.screenSize.Y
	}
end, nil)(function(p86)
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_26, (copy) v_u_2
	local v87 = {
		["layoutValues"] = v_u_14()
	}
	return v_u_3.createElement(v_u_26, v_u_2.Dictionary.join(p86, v87))
end)