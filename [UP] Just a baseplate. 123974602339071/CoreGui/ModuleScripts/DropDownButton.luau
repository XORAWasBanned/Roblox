-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Presentation.DropDownButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = require(v1.Packages.t)
local v5 = require(v1.Packages.UIBlox)
local v_u_6 = require(v1.Packages.Foundation)
local v_u_7 = v_u_6.Enums.IconName
local v_u_8 = v_u_6.Enums.IconVariant
local v_u_9 = v_u_6.Enums.IconSize
local v_u_10 = v_u_6.Utility.normalizeFontFace
local v_u_11 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_12 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_13 = v_u_6.Utility.Flags.FoundationFontFaceMigration
local v14 = script.Parent.Parent
local v15 = v14.Connection
local v_u_16 = require(v15.LayoutValues).WithLayoutValues
local v_u_17 = require(v14.PresentationCommon.IconButton)
local v_u_18 = require(v1.Workspace.Packages.Style).Colors
local v_u_19 = v5.Core.ImageSet.ImageSetLabel
local v_u_20 = v5.App.ImageSet.Images
local v_u_21 = require(v1.Workspace.Packages.Chrome).Enabled
local v22 = v14.Parent
local v_u_23 = require(v22.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)
local v24 = v_u_2.PureComponent:extend("DropDownButton")
v24.validateProps = v4.strictInterface({
	["text"] = v4.string,
	["layoutOrder"] = v4.optional(v4.integer),
	["icon"] = v4.union(v4.string, v4.table),
	["lastButton"] = v4.boolean,
	["forceShowOptions"] = v4.boolean,
	["screenSizeX"] = v4.number,
	["screenSizeY"] = v4.number,
	["onActivated"] = v4.optional(v4.callback),
	["onDecline"] = v4.optional(v4.callback),
	["onDismiss"] = v4.optional(v4.callback),
	["animatingAccept"] = v4.optional(v4.boolean),
	["animatingDecline"] = v4.optional(v4.boolean),
	["animatingPercentage"] = v4.optional(v4.number)
})
function v24.init(p25) -- name: init
	p25.state = {
		["isHovered"] = false,
		["isPressed"] = false,
		["sizeX"] = 100,
		["absolutePosX"] = 0,
		["absolutePosY"] = 0
	}
end
function v24.getColorBackgroundAnimation(p26, p27) -- name: getColorBackgroundAnimation
	if p26.props.animatingPercentage == nil then
		return 0, 0
	end
	local v28 = p26.state.sizeX - p27.DropDownRightOptionSize
	local v29 = p27.DropDownRightOptionSize
	if p26.props.animatingDecline then
		v28 = v28 - p27.DropDownRightOptionSize
	end
	local v30 = p26.state.sizeX - p27.DropDownRightOptionSize
	local v31 = v29 + v30 * p26.props.animatingPercentage
	local v32 = v28 - v30 * p26.props.animatingPercentage * 0.5
	if v32 + v31 > p26.state.sizeX then
		v32 = v32 - (v32 + v31 - p26.state.sizeX)
	end
	return v32, v31
end
function v24.render(p_u_33) -- name: render
	-- upvalues: (copy) v_u_16, (copy) v_u_11, (copy) v_u_13, (copy) v_u_21, (copy) v_u_18, (copy) v_u_23, (copy) v_u_7, (copy) v_u_12, (copy) v_u_9, (copy) v_u_2, (copy) v_u_6, (copy) v_u_8, (copy) v_u_19, (copy) v_u_10, (copy) v_u_17, (copy) v_u_20
	return v_u_16(function(p_u_34)
		-- upvalues: (ref) v_u_11, (ref) v_u_13, (ref) v_u_21, (copy) p_u_33, (ref) v_u_18, (ref) v_u_23, (ref) v_u_7, (ref) v_u_12, (ref) v_u_9, (ref) v_u_2, (ref) v_u_6, (ref) v_u_8, (ref) v_u_19, (ref) v_u_10, (ref) v_u_17, (ref) v_u_20
		return v_u_11(function(p35, p36)
			-- upvalues: (ref) v_u_13
			local v37 = {}
			local v38
			if v_u_13 then
				v38 = p35
			else
				v38 = nil
			end
			v37.Tokens = v38
			v37.Theme = {
				["BackgroundContrast"] = {
					["Color"] = p35.Color.Surface.Surface_100.Color3,
					["Transparency"] = p35.Color.Surface.Surface_100.Transparency
				},
				["BackgroundOnHover"] = {
					["Color"] = p35.Color.State.Hover.Color3,
					["Transparency"] = p35.Color.State.Hover.Transparency
				},
				["BackgroundOnPress"] = {
					["Color"] = p35.Color.State.Press.Color3,
					["Transparency"] = p35.Color.State.Press.Transparency
				},
				["BackgroundUIContrast"] = {
					["Color"] = p35.Color.OverMedia.OverMedia_0.Color3,
					["Transparency"] = p35.Color.OverMedia.OverMedia_0.Transparency
				},
				["Divider"] = {
					["Color"] = p35.Color.Stroke.Emphasis.Color3,
					["Transparency"] = p35.Color.Stroke.Emphasis.Transparency
				},
				["IconEmphasis"] = {
					["Color"] = p35.Color.Content.Emphasis.Color3,
					["Transparency"] = p35.Color.Content.Emphasis.Transparency
				},
				["TextEmphasis"] = {
					["Color"] = p35.Color.Content.Emphasis.Color3,
					["Transparency"] = p35.Color.Content.Emphasis.Transparency
				}
			}
			v37.Font = {
				["BaseSize"] = 1,
				["Header2"] = nil,
				["Header2"] = {
					["Font"] = p35.Typography.TitleLarge.Font,
					["RelativeSize"] = p35.Typography.TitleLarge.FontSize
				}
			}
			v37.Settings = {
				["PreferredTransparency"] = p36.preferredTransparency
			}
			return v37
		end, function(p39)
			-- upvalues: (ref) v_u_21, (copy) p_u_34, (ref) p_u_33, (ref) v_u_18, (ref) v_u_23, (ref) v_u_7, (ref) v_u_12, (ref) v_u_9, (ref) v_u_2, (ref) v_u_6, (ref) v_u_8, (ref) v_u_19, (ref) v_u_13, (ref) v_u_10, (ref) v_u_17, (ref) v_u_20
			local v40
			if v_u_21() then
				v40 = p39.Theme.BackgroundUIContrast.Color
			else
				v40 = p39.Theme.BackgroundContrast.Color
			end
			local v41 = {
				["Color"] = v40,
				["Transparency"] = p_u_34.OverrideBackgroundTransparency * p39.Settings.PreferredTransparency
			}
			local v42 = {
				["Transparency"] = 1,
				["Color"] = nil,
				["Color"] = Color3.new(1, 1, 1)
			}
			if p_u_33.state.isPressed then
				v42 = p39.Theme.BackgroundOnPress
			elseif p_u_33.state.isHovered then
				v42 = p39.Theme.BackgroundOnHover
			end
			local v43 = p_u_33.props.lastButton and "rbxasset://textures/ui/BottomRoundedRect8px.png" or ""
			local v44 = p_u_33.props.onActivated ~= nil and true or p_u_33.props.animatingAccept
			local v45 = p_u_33.props.onDecline ~= nil and true or p_u_33.props.animatingDecline
			local v_u_46 = (p_u_33.props.onDecline ~= nil or p_u_33.props.animatingPercentage ~= nil) and true or p_u_33.props.forceShowOptions
			local v47, v48 = p_u_33:getColorBackgroundAnimation(p_u_34)
			local v49 = v_u_18.Green
			if p_u_33.props.animatingDecline then
				v49 = v_u_18.Red
			elseif p_u_33.props.forceShowOptions then
				v49 = v_u_18.White
			end
			local v50 = p_u_34.DropDownPadding * 2 + p_u_34.DropDownIconSize
			local v51 = p_u_34.DropDownRightOptionSize * 2
			if v_u_46 then
				v50 = v50 + v51
			end
			local function v52() -- name: onMouseButton1Down
				-- upvalues: (copy) v_u_46, (ref) p_u_33
				if not v_u_46 then
					p_u_33:setState({
						["isPressed"] = true
					})
				end
			end
			local function v53() -- name: onMouseButton1Up
				-- upvalues: (ref) p_u_33
				p_u_33:setState({
					["isPressed"] = false
				})
			end
			local v54 = p_u_33.props.icon
			local v55
			if v_u_23 and v_u_7[v54] ~= nil or v_u_12 then
				local v56 = nil
				local v57 = nil
				if v_u_7[v54] ~= nil then
					v56 = v_u_7[v54]
					v57 = v_u_9.Large
				elseif v_u_12 then
					if typeof(v54) == "string" then
						v56 = v54
					else
						v56 = nil
					end
					v57 = v_u_9.Medium
				end
				if v56 then
					v55 = v_u_2.createElement("Frame", {
						["LayoutOrder"] = 1,
						["Size"] = nil,
						["BackgroundTransparency"] = 1,
						["Size"] = UDim2.new(0, p_u_34.DropDownIconSize, 0, p_u_34.DropDownIconSize)
					}, {
						["Icon"] = v_u_2.createElement(v_u_6.Icon, {
							["name"] = v56,
							["variant"] = v_u_8.Regular,
							["size"] = v57,
							["style"] = {
								["Color3"] = p39.Theme.IconEmphasis.Color,
								["Transparency"] = p39.Theme.IconEmphasis.Transparency
							},
							["AnchorPoint"] = Vector2.new(0.5, 0.5),
							["Position"] = UDim2.new(0.5, 0, 0.5, 0)
						})
					})
				else
					v55 = v_u_2.createElement(v_u_6.Image, {
						["Image"] = nil,
						["imageRect"] = nil,
						["Size"] = nil,
						["imageStyle"] = nil,
						["BackgroundTransparency"] = 1,
						["LayoutOrder"] = 1,
						["Image"] = v54.Image,
						["imageRect"] = {
							["offset"] = v54.ImageRectOffset,
							["size"] = v54.ImageRectSize
						},
						["Size"] = UDim2.new(0, p_u_34.DropDownIconSize, 0, p_u_34.DropDownIconSize),
						["imageStyle"] = {
							["Color3"] = p39.Theme.IconEmphasis.Color,
							["Transparency"] = p39.Theme.IconEmphasis.Transparency
						}
					})
				end
			else
				v55 = v_u_2.createElement(v_u_19, {
					["LayoutOrder"] = 1,
					["Size"] = nil,
					["ImageColor3"] = nil,
					["Image"] = nil,
					["BackgroundTransparency"] = 1,
					["Size"] = UDim2.new(0, p_u_34.DropDownIconSize, 0, p_u_34.DropDownIconSize),
					["ImageColor3"] = p39.Theme.IconEmphasis.Color,
					["Image"] = p_u_33.props.icon
				})
			end
			local v58 = v_u_2.createElement
			local v59 = "ImageButton"
			local v60 = {
				["LayoutOrder"] = p_u_33.props.layoutOrder,
				["Image"] = v43,
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = Rect.new(8, 8, 24, 16),
				["SliceScale"] = 0.5,
				["ImageTransparency"] = p_u_33.props.lastButton and (v41.Transparency or 1) or 1,
				["ImageColor3"] = v41.Color,
				["Size"] = UDim2.new(1, 0, 0, p_u_34.DropDownButtonSizeY),
				["BackgroundTransparency"] = p_u_33.props.lastButton and 1 or v41.Transparency,
				["BackgroundColor3"] = v41.Color,
				["AutoButtonColor"] = false,
				["BorderSizePixel"] = 0
			}
			local v61 = v_u_2.Event.Activated
			local v62
			if v_u_46 then
				v62 = nil
			else
				v62 = p_u_33.props.onActivated or nil
			end
			v60[v61] = v62
			v60[v_u_2.Event.MouseEnter] = function()
				-- upvalues: (copy) v_u_46, (ref) p_u_33
				if not v_u_46 then
					p_u_33:setState({
						["isHovered"] = true
					})
				end
			end
			v60[v_u_2.Event.MouseLeave] = function()
				-- upvalues: (ref) p_u_33
				p_u_33:setState({
					["isHovered"] = false,
					["isPressed"] = false
				})
			end
			v60[v_u_2.Change.AbsoluteSize] = function(p63)
				-- upvalues: (ref) p_u_33
				p_u_33:setState({
					["sizeX"] = p63.AbsoluteSize.X
				})
			end
			v60[v_u_2.Change.AbsolutePosition] = function(p64)
				-- upvalues: (ref) p_u_33
				p_u_33:setState({
					["absolutePosX"] = p64.AbsolutePosition.X,
					["absolutePosY"] = p64.AbsolutePosition.Y
				})
			end
			v60[v_u_2.Event.MouseButton1Down] = v52
			v60[v_u_2.Event.MouseButton1Up] = v53
			local v65 = {
				["ColorBackground"] = v_u_2.createElement("ImageLabel", {
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
					["BorderSizePixel"] = 0,
					["Visible"] = p_u_33.props.animatingPercentage ~= nil,
					["Size"] = UDim2.new(0, v48, 1, 0),
					["Position"] = UDim2.new(0, v47, 0, 0),
					["Image"] = v43,
					["ScaleType"] = Enum.ScaleType.Slice,
					["SliceCenter"] = Rect.new(8, 8, 24, 16),
					["ImageTransparency"] = p_u_33.props.lastButton and p_u_34.IconButtonBackgroundTransparency or 1,
					["ImageColor3"] = v49,
					["BackgroundTransparency"] = p_u_33.props.lastButton and 1 or p_u_34.IconButtonBackgroundTransparency,
					["BackgroundColor3"] = v49
				})
			}
			local v66 = v_u_2.createElement
			local v67 = "ImageLabel"
			local v68 = {
				["ZIndex"] = 2,
				["Size"] = nil,
				["Image"] = nil,
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["SliceScale"] = 0.5,
				["ImageTransparency"] = nil,
				["ImageColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Image"] = v43,
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = Rect.new(8, 8, 24, 16),
				["ImageTransparency"] = p_u_33.props.lastButton and (v42.Transparency or 1) or 1,
				["ImageColor3"] = v42.Color,
				["BackgroundTransparency"] = p_u_33.props.lastButton and 1 or v42.Transparency,
				["BackgroundColor3"] = v42.Color
			}
			local v69 = {
				["InitalPadding"] = v_u_2.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, p_u_34.DropDownPadding)
				}),
				["ListLayout"] = v_u_2.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["Padding"] = UDim.new(0, p_u_34.DropDownPadding)
				}),
				["Icon"] = v55
			}
			local v70 = v_u_2.createElement
			local v71 = "TextLabel"
			local v72 = {
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
				["Size"] = UDim2.new(1, -v50, 1, 0),
				["Text"] = p_u_33.props.text
			}
			local v73
			if v_u_13 then
				v73 = nil
			else
				v73 = p39.Font.Header2.Font
			end
			v72.Font = v73
			local v74
			if v_u_13 then
				v74 = v_u_10(p39.Tokens.Typography.TitleLarge.Font)
			else
				v74 = nil
			end
			v72.FontFace = v74
			v72.TextSize = p39.Font.BaseSize * p39.Font.Header2.RelativeSize
			v72.TextColor3 = p39.Theme.TextEmphasis.Color
			v72.TextTransparency = p39.Theme.TextEmphasis.Transparency
			v72.TextXAlignment = Enum.TextXAlignment.Left
			v72.TextTruncate = Enum.TextTruncate.AtEnd
			v69.Text = v70(v71, v72)
			local v75 = v_u_2.createElement
			local v76 = "Frame"
			local v77 = {
				["LayoutOrder"] = 3,
				["Visible"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Visible"] = v_u_46,
				["Size"] = UDim2.new(0, v51, 1, 0)
			}
			local v78 = {}
			local v79
			if v44 then
				v79 = v_u_2.createElement(v_u_17, {
					["size"] = UDim2.new(0.5, 0, 1, 0),
					["position"] = UDim2.new(0.5, 0, 0, 0),
					["backgroundColor"] = p_u_33.props.onDecline and v_u_18.Green or v_u_18.White,
					["icon"] = v_u_12 and "icons/actions/accept" or v_u_20["icons/actions/accept"],
					["showBackground"] = p_u_33.props.animatingPercentage == nil,
					["onActivated"] = p_u_33.props.onActivated
				}) or nil
			else
				v79 = nil
			end
			v78.ConfirmButton = v79
			local v80
			if v45 then
				v80 = v_u_2.createElement(v_u_17, {
					["size"] = UDim2.new(0.5, 0, 1, 0),
					["position"] = UDim2.new(0, 0, 0, 0),
					["backgroundColor"] = v_u_18.Red,
					["icon"] = v_u_12 and "icons/actions/reject" or v_u_20["icons/actions/reject"],
					["showBackground"] = p_u_33.props.animatingPercentage == nil,
					["onActivated"] = p_u_33.props.onDecline
				}) or nil
			else
				v80 = nil
			end
			v78.DeclineButton = v80
			v69.ButtonContainer = v75(v76, v77, v78)
			v65.HoverBackground = v66(v67, v68, v69)
			v65.DismissInputHandler = v_u_2.createElement("ImageButton", {
				["Image"] = "",
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(0, p_u_33.props.screenSizeX, 0, p_u_33.props.screenSizeY),
				["Position"] = UDim2.new(0, -p_u_33.state.absolutePosX, 0, -p_u_33.state.absolutePosY),
				["Visible"] = p_u_33.props.onDismiss ~= nil,
				[v_u_2.Event.Activated] = p_u_33.props.onDismiss
			})
			local v81 = not p_u_33.props.lastButton
			if v81 then
				v81 = v_u_2.createElement("Frame", {
					["ZIndex"] = 3,
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["BorderSizePixel"] = 0,
					["Size"] = UDim2.new(1, 0, 0, 1),
					["Position"] = UDim2.new(0, 0, 1, 0),
					["AnchorPoint"] = Vector2.new(0, 1),
					["BackgroundTransparency"] = p39.Theme.Divider.Transparency,
					["BackgroundColor3"] = p39.Theme.Divider.Color
				})
			end
			v65.Divider = v81
			return v58(v59, v60, v65)
		end)
	end)
end
return v3.UNSTABLE_connect2(function(p82) -- name: mapStateToProps
	return {
		["screenSizeX"] = p82.screenSize.X,
		["screenSizeY"] = p82.screenSize.Y
	}
end, nil)(v24)