-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ThemedButton
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.UIBlox
local v5 = v2.t
local v6 = script.Parent.Parent
local v7 = require(v6.Resources.Assets)
local v_u_8 = require(v6.Utility.divideTransparency)
local v_u_9 = v4.Core.ImageSet.ImageSetButton
local v_u_10 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v11 = require(v1.Packages.Foundation)
local v12 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_13
if v12 then
	v_u_13 = v11.UNSTABLE.withCursorMigration
else
	v_u_13 = v4.App.SelectionImage.withSelectionCursorProvider
end
local v_u_14
if v12 then
	v_u_14 = v11.Enums.CursorType
else
	v_u_14 = v4.App.SelectionImage.CursorKind
end
local v15 = v_u_3.PureComponent:extend("ThemedButton")
local v16 = v5.strictInterface
local v17 = {
	["normalThemeKey"] = v5.string,
	["hoverThemeKey"] = v5.string,
	["imageProps"] = v5.strictInterface({
		["Image"] = v5.union(v5.string, v5.table),
		["ScaleType"] = v5.enum(Enum.ScaleType),
		["SliceCenter"] = v5.Rect
	}),
	["enabled"] = v5.optional(v5.boolean),
	["renderChildren"] = v5.callback,
	["onActivated"] = v5.callback,
	["AnchorPoint"] = v5.optional(v5.Vector2),
	["LayoutOrder"] = v5.optional(v5.integer),
	["Position"] = v5.optional(v5.UDim2),
	["Size"] = v5.optional(v5.UDim2),
	["Visible"] = v5.optional(v5.boolean),
	["ButtonRef"] = v5.optional(v5.union(v5.callback, v5.table))
}
v15.validateProps = v16(v17)
v15.defaultProps = {
	["imageProps"] = nil,
	["enabled"] = true,
	["imageProps"] = v7.Images.RoundedRect
}
function v15.init(p18) -- name: init
	p18:setState({
		["hover"] = false,
		["press"] = false
	})
end
function v15.renderWithSelectionCursor(p_u_19, p_u_20) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_3, (copy) v_u_9, (copy) v_u_14
	local v_u_21 = p_u_19.props
	local v_u_22 = v_u_21.normalThemeKey
	if v_u_21.enabled and p_u_19.state.hover then
		v_u_22 = v_u_21.hoverThemeKey
	end
	return v_u_10(function(p23)
		local v24 = {}
		local v25 = {
			["BackgroundDefault"] = {
				["Color"] = p23.Color.Surface.Surface_0.Color3,
				["Transparency"] = p23.Color.Surface.Surface_0.Transparency
			},
			["BackgroundContrast"] = {
				["Color"] = p23.Color.Surface.Surface_100.Color3,
				["Transparency"] = p23.Color.Surface.Surface_100.Transparency
			},
			["BackgroundMuted"] = {
				["Color"] = p23.Color.Surface.Surface_200.Color3,
				["Transparency"] = p23.Color.Surface.Surface_200.Transparency
			},
			["BackgroundUIDefault"] = {
				["Color"] = p23.Color.Surface.Surface_300.Color3,
				["Transparency"] = p23.Color.Surface.Surface_300.Transparency
			},
			["BackgroundUIContrast"] = {
				["Color"] = p23.Color.OverMedia.OverMedia_0.Color3,
				["Transparency"] = p23.Color.OverMedia.OverMedia_0.Transparency
			},
			["BackgroundOnHover"] = {
				["Color"] = p23.Color.State.Hover.Color3,
				["Transparency"] = p23.Color.State.Hover.Transparency
			},
			["BackgroundOnPress"] = {
				["Color"] = p23.Color.State.Press.Color3,
				["Transparency"] = p23.Color.State.Press.Transparency
			},
			["UIDefault"] = {
				["Color"] = p23.Color.Shift.Shift_200.Color3,
				["Transparency"] = p23.Color.Shift.Shift_200.Transparency
			},
			["UIMuted"] = {
				["Color"] = p23.Color.Shift.Shift_100.Color3,
				["Transparency"] = p23.Color.Shift.Shift_100.Transparency
			},
			["UIEmphasis"] = {
				["Color"] = p23.Color.Shift.Shift_400.Color3,
				["Transparency"] = p23.Color.Shift.Shift_400.Transparency
			},
			["ContextualPrimaryDefault"] = {
				["Color"] = p23.Color.ActionEmphasis.Background.Color3,
				["Transparency"] = p23.Color.ActionEmphasis.Background.Transparency
			},
			["ContextualPrimaryContent"] = {
				["Color"] = p23.Color.ActionEmphasis.Foreground.Color3,
				["Transparency"] = p23.Color.ActionEmphasis.Foreground.Transparency
			},
			["SystemPrimaryDefault"] = {
				["Color"] = p23.Color.ActionSubEmphasis.Background.Color3,
				["Transparency"] = p23.Color.ActionSubEmphasis.Background.Transparency
			},
			["SystemPrimaryContent"] = {
				["Color"] = p23.Color.ActionSubEmphasis.Foreground.Color3,
				["Transparency"] = p23.Color.ActionSubEmphasis.Foreground.Transparency
			},
			["IconDefault"] = {
				["Color"] = p23.Color.Content.Default.Color3,
				["Transparency"] = p23.Color.Content.Default.Transparency
			},
			["IconEmphasis"] = {
				["Color"] = p23.Color.Content.Emphasis.Color3,
				["Transparency"] = p23.Color.Content.Emphasis.Transparency
			},
			["IconOnHover"] = {
				["Color"] = p23.Color.Content.Emphasis.Color3,
				["Transparency"] = p23.Color.Content.Emphasis.Transparency
			},
			["TextEmphasis"] = {
				["Color"] = p23.Color.Content.Emphasis.Color3,
				["Transparency"] = p23.Color.Content.Emphasis.Transparency
			},
			["TextDefault"] = {
				["Color"] = p23.Color.Content.Default.Color3,
				["Transparency"] = p23.Color.Content.Default.Transparency
			},
			["TextMuted"] = {
				["Color"] = p23.Color.Content.Muted.Color3,
				["Transparency"] = p23.Color.Content.Muted.Transparency
			},
			["TextLink"] = {
				["Color"] = p23.Color.Content.Link.Color3,
				["Transparency"] = p23.Color.Content.Link.Transparency
			},
			["Divider"] = {
				["Color"] = p23.Color.Stroke.Emphasis.Color3,
				["Transparency"] = p23.Color.Stroke.Emphasis.Transparency
			},
			["Overlay"] = {
				["Color"] = p23.Color.Common.Scrim.Color3,
				["Transparency"] = p23.Color.Common.Scrim.Transparency
			},
			["DropShadow"] = {
				["Color"] = p23.Color.Common.Shadow.Color3,
				["Transparency"] = p23.Color.Common.Shadow.Transparency
			},
			["NavigationBar"] = {
				["Color"] = p23.Color.Common.NavigationBar.Color3,
				["Transparency"] = p23.Color.Common.NavigationBar.Transparency
			},
			["PlaceHolder"] = {
				["Color"] = p23.Color.Common.Shimmer.Color3,
				["Transparency"] = p23.Color.Common.Shimmer.Transparency
			},
			["OnlineStatus"] = {
				["Color"] = p23.Color.System.Success.Color3,
				["Transparency"] = p23.Color.System.Success.Transparency
			},
			["OfflineStatus"] = {
				["Color"] = p23.Color.System.Neutral.Color3,
				["Transparency"] = p23.Color.System.Neutral.Transparency
			},
			["Success"] = {
				["Color"] = p23.Color.System.Success.Color3,
				["Transparency"] = p23.Color.System.Success.Transparency
			},
			["Alert"] = {
				["Color"] = p23.Color.System.Alert.Color3,
				["Transparency"] = p23.Color.System.Alert.Transparency
			},
			["Badge"] = {
				["Color"] = p23.Color.System.Contrast.Color3,
				["Transparency"] = p23.Color.System.Contrast.Transparency
			},
			["BadgeContent"] = {
				["Color"] = p23.Inverse.Content.Emphasis.Color3,
				["Transparency"] = p23.Inverse.Content.Emphasis.Transparency
			},
			["SecondaryDefault"] = {
				["Color"] = p23.Color.Extended.White.White_70.Color3,
				["Transparency"] = p23.Color.Extended.White.White_70.Transparency
			},
			["SecondaryOnHover"] = {
				["Color"] = p23.Color.Extended.White.White_100.Color3,
				["Transparency"] = p23.Color.Extended.White.White_100.Transparency
			}
		}
		v24.Theme = v25
		return v24
	end, function(p26)
		-- upvalues: (ref) v_u_22, (ref) v_u_8, (copy) p_u_19, (copy) v_u_21, (ref) v_u_3, (ref) v_u_9, (copy) p_u_20, (ref) v_u_14
		local v27 = p26.Theme[v_u_22]
		local v28 = v27 ~= nil
		local v29 = "theme key " .. v_u_22 .. " is nil"
		assert(v28, v29)
		local v30 = v_u_8(v27.Transparency, p_u_19.state.press and 2 or 1)
		local v31 = not v_u_21.enabled and 0.5 or v30
		local v32 = v_u_3.createElement
		local v33 = v_u_9
		local v36 = {
			["Visible"] = v_u_21.Visible,
			["BackgroundTransparency"] = 1,
			["ImageColor3"] = v27.Color,
			["Position"] = v_u_21.Position,
			["Size"] = v_u_21.Size,
			["AnchorPoint"] = v_u_21.AnchorPoint,
			["ImageTransparency"] = v31,
			["LayoutOrder"] = v_u_21.LayoutOrder,
			["ScaleType"] = v_u_21.imageProps.ScaleType,
			["SliceCenter"] = v_u_21.imageProps.SliceCenter,
			["Image"] = v_u_21.imageProps.Image,
			["SelectionImageObject"] = p_u_20(v_u_14.RoundedRectNoInset),
			[v_u_3.Event.Activated] = function()
				-- upvalues: (ref) v_u_21
				if v_u_21.enabled then
					v_u_21.onActivated()
				end
			end,
			[v_u_3.Event.MouseEnter] = function()
				-- upvalues: (ref) p_u_19
				p_u_19:setState({
					["hover"] = true
				})
			end,
			[v_u_3.Event.MouseLeave] = function()
				-- upvalues: (ref) p_u_19
				p_u_19:setState({
					["hover"] = false,
					["press"] = false
				})
			end,
			[v_u_3.Event.InputBegan] = function(_, p34)
				-- upvalues: (ref) p_u_19
				if p34.UserInputType == Enum.UserInputType.MouseButton1 or p34.UserInputType == Enum.UserInputType.Touch then
					p_u_19:setState({
						["press"] = true
					})
				end
			end,
			[v_u_3.Event.InputEnded] = function(_, p35)
				-- upvalues: (ref) p_u_19
				if p35.UserInputType == Enum.UserInputType.MouseButton1 or p35.UserInputType == Enum.UserInputType.Touch then
					p_u_19:setState({
						["press"] = false
					})
				end
			end,
			[v_u_3.Ref] = p_u_19.props.ButtonRef
		}
		local v37 = v_u_21.renderChildren
		local v38 = v_u_21.enabled
		if v38 then
			v38 = p_u_19.state.hover
		end
		local v39 = v_u_21.enabled
		if v39 then
			v39 = p_u_19.state.press
		end
		return v32(v33, v36, v37(v31, v38, v39))
	end)
end
function v15.render(p_u_40) -- name: render
	-- upvalues: (copy) v_u_13
	return v_u_13(function(p41)
		-- upvalues: (copy) p_u_40
		return p_u_40:renderWithSelectionCursor(p41)
	end)
end
return v15