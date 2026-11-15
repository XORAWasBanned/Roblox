-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.IconButton
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
game:GetService("GuiService")
local v_u_3 = require(v1.Packages.Signals)
local v_u_4 = require(v1.Workspace.Packages.Display)
local v5 = require(v1.Workspace.Packages.SharedFlags)
local v_u_6 = v5.FFlagEnableConsoleExpControls
local v_u_7 = v5.FFlagAddUILessMode
local v_u_8 = v5.FIntAddUILessModeVariant
local v_u_9 = require(v1.Packages.Roact)
local v_u_10 = require(v1.Packages.React)
local v11 = require(v1.Packages.t)
local v12 = require(v1.Packages.UIBlox)
local v_u_13 = require(v1.Packages.Cryo)
local v_u_14 = v12.Core.ImageSet.ImageSetLabel
local v_u_15 = v12.Core.Style.withStyle
local v_u_16 = v12.Core.Control.Interactable
local v_u_17 = v12.Core.Control.Enum.ControlState
local v18 = v12.App.ImageSet.Images
local v_u_19 = v12.App.SelectionImage.withSelectionCursorProvider
local _ = v12.App.SelectionImage.CursorKind
local v_u_20 = require(v1.Packages.ReactOtter)
local v21 = require(v1.Packages.Foundation)
local v_u_22 = v21.Hooks.withCursor
local v_u_23 = v21.Enums.CursorType.SkinToneCircle
local _ = script.Parent.Parent.Parent
local v_u_24 = require(script.Parent.FlashingDot)
local v_u_25 = require(script.Parent.FlashingDotV2)
local v_u_26 = require(v2.RobloxGui.Modules.Flags.GetFFlagFlashingDotUseAsyncInit)
local v_u_27 = require(v1.Workspace.Packages.Chrome).Enabled()
local v_u_28 = require(v2.RobloxGui.Modules.isNewTiltIconEnabled)
local v_u_29 = require(script.Parent.Parent.Parent.Constants)
local v_u_30 = v_u_9.PureComponent:extend("IconButton")
local v_u_31 = v18["component_assets/circle_17"]
local v32 = v11.strictInterface
local v33 = {
	["icon"] = v11.union(v11.string, v11.table),
	["iconSize"] = v11.union(v11.number, v11.UDim2, v11.table),
	["enableFlashingDot"] = v11.optional(v11.boolean),
	["useIconScaleAnimation"] = v11.optional(v11.boolean),
	["onActivated"] = v11.callback,
	["onHover"] = v11.optional(v11.callback),
	["onHoverEnd"] = v11.optional(v11.callback),
	["backgroundTransparency"] = v11.optional(v11.number),
	["backgroundColor3"] = v11.optional(v11.Color3),
	["backgroundCornerRadius"] = v11.optional(v11.UDim),
	["forwardRef"] = v11.optional(v11.any)
}
local v34
if v_u_27 and v_u_6 then
	v34 = v11.optional(v11.callback)
else
	v34 = nil
end
v33.onSelectionChanged = v34
local v35
if v_u_27 and v_u_6 then
	v35 = v11.optional(v11.any)
else
	v35 = nil
end
v33.nextSelectionRightRef = v35
local v36
if v_u_7 and v_u_8 == 2 then
	v36 = v11.optional(v11.boolean)
else
	v36 = nil
end
v33.modal = v36
v33[v_u_9.Change.AbsoluteSize] = v11.optional(v11.callback)
v33[v_u_9.Change.AbsolutePosition] = v11.optional(v11.callback)
v_u_30.validateProps = v32(v33)
function AnimatedScaleIcon(p_u_37) -- name: AnimatedScaleIcon
	-- upvalues: (copy) v_u_20, (copy) v_u_10, (copy) v_u_9, (copy) v_u_14
	local v38, v_u_39 = v_u_20.useAnimatedBinding(p_u_37.iconSize)
	v_u_10.useEffect(function()
		-- upvalues: (copy) v_u_39, (ref) v_u_20, (copy) p_u_37
		v_u_39(v_u_20.spring(p_u_37.iconSize, {
			["dampingRatio"] = 1,
			["frequency"] = 2.857142857142857
		}))
		return function() end
	end, { p_u_37.iconSize })
	return v_u_9.createElement(v_u_14, {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageColor3"] = nil,
		["ImageTransparency"] = nil,
		["ZIndex"] = 1,
		["Size"] = v38:map(function(p40)
			return UDim2.fromOffset(p40, p40)
		end),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Image"] = p_u_37.icon,
		["ImageColor3"] = p_u_37.style.Theme.IconEmphasis.Color,
		["ImageTransparency"] = p_u_37.style.Theme.IconEmphasis.Transparency
	})
end
function v_u_30.init(p_u_41) -- name: init
	-- upvalues: (copy) v_u_17, (copy) v_u_3, (copy) v_u_4
	p_u_41:setState({
		["controlState"] = v_u_17.Default
	})
	function p_u_41.controlStateUpdated(p42, p43)
		-- upvalues: (copy) p_u_41, (ref) v_u_17
		if p_u_41.props.onHover and p43 == v_u_17.Hover then
			p_u_41.props.onHover()
		elseif p_u_41.props.onHoverEnd and (p42 == v_u_17.Hover and p43 ~= v_u_17.Hover) then
			p_u_41.props.onHoverEnd()
		end
		p_u_41:setState({
			["controlState"] = p43
		})
	end
	p_u_41.disposeUiScaleEffect = v_u_3.createEffect(function(p44)
		-- upvalues: (ref) v_u_4, (copy) p_u_41
		p_u_41:setState({
			["UiScale"] = v_u_4.GetDisplayStore(p44).getUIScale(p44)
		})
	end)
end
function v_u_30.render(p_u_45) -- name: render
	-- upvalues: (copy) v_u_27, (copy) v_u_22, (copy) v_u_19
	if v_u_27 then
		return v_u_22(function(p46)
			-- upvalues: (copy) p_u_45
			return p_u_45:renderWithCursor(p46)
		end)
	else
		return v_u_19(function(p47)
			-- upvalues: (copy) p_u_45
			return p_u_45:renderWithCursor(p47)
		end)
	end
end
function v_u_30.renderWithCursor(p_u_48, p_u_49) -- name: renderWithCursor
	-- upvalues: (copy) v_u_28, (copy) v_u_29, (copy) v_u_15, (copy) v_u_17, (copy) v_u_9, (copy) v_u_16, (copy) v_u_7, (copy) v_u_8, (copy) v_u_23, (copy) v_u_27, (copy) v_u_6, (copy) v_u_14, (copy) v_u_26, (copy) v_u_25, (copy) v_u_24, (copy) v_u_31
	local v_u_50 = not v_u_28()
	if v_u_50 then
		v_u_50 = p_u_48.props.backgroundColor3
	end
	local v_u_51 = v_u_29.TopBarButtonHeight * p_u_48.state.UiScale
	return v_u_15(function(p52)
		-- upvalues: (copy) p_u_48, (ref) v_u_17, (ref) v_u_9, (ref) v_u_16, (ref) v_u_7, (ref) v_u_8, (ref) v_u_28, (copy) v_u_51, (copy) p_u_49, (ref) v_u_23, (ref) v_u_27, (ref) v_u_6, (copy) v_u_50, (ref) v_u_14, (ref) v_u_26, (ref) v_u_25, (ref) v_u_24, (ref) v_u_31
		local v53 = {
			["Color"] = nil,
			["Transparency"] = 1,
			["Color"] = Color3.new(1, 1, 1)
		}
		if p_u_48.state.controlState == v_u_17.Pressed then
			v53 = p52.Theme.BackgroundOnPress
		elseif p_u_48.state.controlState == v_u_17.Hover then
			v53 = p52.Theme.BackgroundOnHover
		end
		local v54 = v_u_9.createElement
		local v55 = v_u_16
		local v56 = {
			["onStateChanged"] = p_u_48.controlStateUpdated,
			["ZIndex"] = 1
		}
		local v57
		if v_u_7 and v_u_8 == 2 then
			v57 = p_u_48.props.modal
		else
			v57 = nil
		end
		v56.Modal = v57
		v56.BackgroundTransparency = not v_u_28() and 1 or p52.Theme.BackgroundUIContrast.Transparency * p52.Settings.PreferredTransparency
		v56.Position = UDim2.fromScale(0, v_u_28() and 0.5 or 1)
		v56.AnchorPoint = Vector2.new(0, v_u_28() and 0.5 or 1)
		v56.Size = UDim2.fromOffset(v_u_51, v_u_51)
		v56.Image = not v_u_28() and "rbxasset://textures/ui/TopBar/iconBase.png" or nil
		v56.BackgroundColor3 = p52.Theme.BackgroundUIContrast.Color
		local v58
		if v_u_28() then
			v58 = p_u_49.getCursor(v_u_23)
		else
			v58 = nil
		end
		v56.SelectionImageObject = v58
		local v59
		if v_u_27 and v_u_6 then
			v59 = p_u_48.props.nextSelectionRightRef
		else
			v59 = nil
		end
		v56.NextSelectionRight = v59
		v56[v_u_9.Event.Activated] = p_u_48.props.onActivated
		local v60 = v_u_9.Event.SelectionChanged
		local v61
		if v_u_27 and v_u_6 then
			v61 = p_u_48.props.onSelectionChanged
		else
			v61 = nil
		end
		v56[v60] = v61
		v56[v_u_9.Ref] = p_u_48.props.forwardRef
		local v62 = {}
		local v63
		if v_u_28() then
			v63 = v_u_9.createElement("UICorner", {
				["CornerRadius"] = UDim.new(1, 0)
			}) or nil
		else
			v63 = nil
		end
		v62.UICorner = v63
		local v64
		if v_u_50 then
			local v65 = v_u_9.createElement
			local v66 = "Frame"
			local v67 = {
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["BorderSizePixel"] = 0,
				["BackgroundTransparency"] = nil,
				["BackgroundColor3"] = nil,
				["ZIndex"] = 0,
				["Size"] = p_u_48.props.iconSize,
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["BackgroundTransparency"] = p_u_48.props.backgroundTransparency,
				["BackgroundColor3"] = p_u_48.props.backgroundColor3
			}
			local v68 = {}
			local v69
			if p_u_48.props.backgroundCornerRadius then
				v69 = v_u_9.createElement("UICorner", {
					["CornerRadius"] = p_u_48.props.backgroundCornerRadius
				})
			else
				v69 = nil
			end
			v68.UICorner = v69
			v64 = v65(v66, v67, v68)
		else
			v64 = nil
		end
		v62.BackgroundFrame = v64
		local v70 = not p_u_48.props.useIconScaleAnimation
		if v70 then
			local v71 = v_u_9.createElement
			local v72 = v_u_14
			local v73 = {
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["ZIndex"] = 1
			}
			local v74 = p_u_48.props.iconSize
			local v75
			if typeof(v74) == "number" then
				v75 = UDim2.fromOffset(p_u_48.props.iconSize, p_u_48.props.iconSize)
			else
				v75 = p_u_48.props.iconSize
			end
			v73.Size = v75
			v73.Position = UDim2.fromScale(0.5, 0.5)
			v73.AnchorPoint = Vector2.new(0.5, 0.5)
			v73.Image = p_u_48.props.icon
			v73.ImageColor3 = p52.Theme.IconEmphasis.Color
			v73.ImageTransparency = p52.Theme.IconEmphasis.Transparency
			v70 = v71(v72, v73)
		end
		v62.Icon = v70
		local v76 = p_u_48.props.useIconScaleAnimation
		if v76 then
			v76 = v_u_9.createElement(AnimatedScaleIcon, {
				["icon"] = p_u_48.props.icon,
				["iconSize"] = p_u_48.props.iconSize,
				["style"] = p52
			})
		end
		v62.ScalingIcon = v76
		local v77
		if p_u_48.props.enableFlashingDot then
			local v78 = v_u_9.createElement
			local v79
			if v_u_26() then
				v79 = v_u_25
			else
				v79 = v_u_24
			end
			v77 = v78(v79)
		else
			v77 = nil
		end
		v62.FlashingDot = v77
		local v80
		if v_u_28() then
			local v81 = v_u_9.createElement
			local v82 = "Frame"
			local v83 = {
				["BackgroundTransparency"] = nil,
				["BackgroundColor3"] = nil,
				["Size"] = nil,
				["ZIndex"] = 2,
				["BackgroundTransparency"] = v53.Transparency,
				["BackgroundColor3"] = v53.Color,
				["Size"] = UDim2.fromScale(1, 1)
			}
			local v84 = {}
			local v85
			if v_u_28() then
				v85 = v_u_9.createElement("UICorner", {
					["CornerRadius"] = UDim.new(1, 0)
				}) or nil
			else
				v85 = nil
			end
			v84.UICorner = v85
			v80 = v81(v82, v83, v84) or nil
		else
			v80 = nil
		end
		v62.StateOverlayRound = v80
		local v86
		if v_u_28() then
			v86 = nil
		else
			v86 = v_u_9.createElement(v_u_14, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["Size"] = nil,
				["ZIndex"] = 2,
				["Image"] = v_u_31,
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = Rect.new(8, 8, 8, 8),
				["ImageColor3"] = v53.Color,
				["ImageTransparency"] = v53.Transparency,
				["Size"] = UDim2.fromScale(1, 1)
			}) or nil
		end
		v62.StateOverlay = v86
		return v54(v55, v56, v62)
	end)
end
function v_u_30.willUnmount(p87) -- name: willUnmount
	if p87.disposeUiScaleEffect then
		p87.disposeUiScaleEffect()
	end
end
return v_u_9.forwardRef(function(p88, p89)
	-- upvalues: (copy) v_u_9, (copy) v_u_30, (copy) v_u_13
	return v_u_9.createElement(v_u_30, v_u_13.Dictionary.join(p88, {
		["forwardRef"] = p89
	}))
end)