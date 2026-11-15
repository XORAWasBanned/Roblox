-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Button.Button
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.Motion)
local v_u_4 = v3.useMotion
local v_u_5 = v3.AnimatePresence
local v_u_6 = require(v2.React)
local v_u_7 = require(v2.ReactOtter)
local v8 = require(v1.Enums.InputSize)
local v_u_9 = require(script.Parent.Spinner)
local v_u_10 = require(script.Parent.endAlignedIcons)
local v11 = require(v1.Enums.ButtonVariant)
local v_u_12 = require(v1.Enums.FillBehavior)
local v_u_13 = require(v1.Enums.ControlState)
local v_u_14 = require(script.Parent.ButtonIcon)
local v_u_15 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_16 = require(v1.Components.View)
local v_u_17 = require(v1.Constants)
local v_u_18 = require(v1.Utility.Flags)
local v_u_19 = require(v1.Utility.withDefaults)
local v_u_20 = require(v1.Utility.withCommonProps)
local v_u_21 = require(script.Parent.useButtonMotionStates)
local v_u_22 = require(script.Parent.useButtonVariants)
local v_u_23 = require(v1.Providers.Style.useTokens)
local v_u_24 = require(v1.Providers.Style.PresentationContext).usePresentationContext
local v_u_25 = {
	[v11.Link] = {
		["format"] = "<u>%s</u>",
		["controlState"] = nil,
		["controlState"] = { v_u_13.Hover, v_u_13.Pressed }
	}
}
local function v_u_35(p26) -- name: onProgressChange
	-- upvalues: (copy) v_u_17
	local v27 = NumberSequence.new
	local v28 = {}
	local v29 = NumberSequenceKeypoint.new(0, 0)
	local v30 = NumberSequenceKeypoint.new
	local v31 = p26 - 0.0001
	local v32 = v30(math.max(0, v31), 0)
	local v33 = NumberSequenceKeypoint.new
	local v34 = p26 + 0.0001
	__set_list(v28, 1, {v29, v32, v33(math.min(1, v34), v_u_17.DISABLED_TRANSPARENCY), NumberSequenceKeypoint.new(1, v_u_17.DISABLED_TRANSPARENCY)})
	return v27(v28)
end
local v_u_36 = {
	["isDisabled"] = false,
	["isLoading"] = false,
	["variant"] = nil,
	["size"] = nil,
	["width"] = nil,
	["inputDelay"] = 0,
	["testId"] = "--foundation-button",
	["variant"] = v11.Standard,
	["size"] = v8.Medium,
	["width"] = UDim.new(0, 0)
}
return v_u_6.memo(v_u_6.forwardRef(function(p37, p38) -- name: Button
	-- upvalues: (copy) v_u_19, (copy) v_u_36, (copy) v_u_6, (copy) v_u_13, (copy) v_u_7, (copy) v_u_10, (copy) v_u_23, (copy) v_u_24, (copy) v_u_22, (copy) v_u_21, (copy) v_u_17, (copy) v_u_4, (copy) v_u_25, (copy) v_u_16, (copy) v_u_20, (copy) v_u_12, (copy) v_u_5, (copy) v_u_9, (copy) v_u_18, (copy) v_u_14, (copy) v_u_15, (copy) v_u_35
	local v_u_39 = v_u_19(p37, v_u_36)
	local v_u_40 = v_u_39.inputDelay
	local v41, v42 = v_u_6.useBinding(v_u_13.Initialize)
	local v_u_43, v_u_44 = v_u_6.useState(v_u_40 > 0)
	local v45, v_u_46 = v_u_7.useAnimatedBinding(0, function()
		-- upvalues: (copy) v_u_44
		v_u_44(false)
	end)
	local v47 = v_u_39.icon
	if v47 then
		v47 = v_u_10[v_u_39.icon]
	end
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_43, (copy) v_u_46, (ref) v_u_7
		if v_u_43 == false then
			v_u_46(v_u_7.instant(0))
		end
	end, { v_u_43 })
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_43, (copy) v_u_44, (copy) v_u_40, (copy) v_u_46, (ref) v_u_7
		if v_u_43 then
			v_u_44(false)
		end
		if v_u_40 > 0 then
			v_u_44(true)
			v_u_46((v_u_7.ease(1, {
				["duration"] = v_u_40,
				["easingStyle"] = Enum.EasingStyle.Quad
			})))
		end
	end, { v_u_40 })
	local v_u_48 = v_u_23()
	local v49 = v_u_24()
	local v50 = v_u_22
	local v51 = v_u_39.size
	local v52 = v_u_39.variant
	local v53
	if v49 then
		v53 = v49.colorNamespace
	else
		v53 = nil
	end
	local v_u_54 = v50(v_u_48, v51, v52, v53)
	local v_u_55 = v_u_21(v_u_54.content.style.Transparency, v_u_17.DISABLED_TRANSPARENCY)
	local v56, v_u_57 = v_u_4(v_u_55.Default)
	local v58, v_u_59 = v_u_4(v_u_55.Default)
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_39, (copy) v_u_59, (copy) v_u_55
		if v_u_39.isLoading then
			v_u_59(v_u_55.Loading)
		else
			v_u_59(v_u_55.Default)
		end
	end, { v_u_39.isLoading })
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_39, (copy) v_u_57, (copy) v_u_55
		if v_u_39.isDisabled then
			v_u_57(v_u_55.Disabled)
		else
			v_u_57(v_u_55.Default)
		end
	end, { v_u_39.isDisabled })
	local v60 = v_u_6.useMemo(function()
		-- upvalues: (copy) v_u_54, (copy) v_u_48
		return {
			["radius"] = UDim.new(0, v_u_54.container.radius),
			["offset"] = v_u_48.Size.Size_200,
			["borderWidth"] = v_u_48.Stroke.Thicker
		}
	end, { v_u_48, v_u_54.container.radius })
	local v_u_61 = v_u_39.text
	if v_u_61 then
		v_u_61 = v_u_39.text ~= ""
	end
	local v64 = v_u_6.useCallback(function(p62)
		-- upvalues: (ref) v_u_25, (copy) v_u_39, (copy) v_u_61
		local v63 = v_u_25[v_u_39.variant]
		if v_u_61 and (v63 and table.find(v63.controlState, p62)) then
			return v63.format:format(v_u_39.text)
		else
			return v_u_39.text
		end
	end, { v_u_39.text, v_u_39.variant, v_u_61 })
	local v65 = v_u_6.createElement
	local v66 = v_u_16
	local v67 = v_u_20
	local v68 = {}
	local v69
	if v_u_39.width.Scale == 0 and v_u_39.width.Offset == 0 then
		v69 = Enum.AutomaticSize.X
	else
		v69 = nil
	end
	v68.AutomaticSize = v69
	v68.cornerRadius = UDim.new(0, v_u_54.container.radius)
	local v70
	if v_u_54.container.style then
		local v_u_71 = v_u_54.container.style.Transparency
		v70 = v56.transparency:map(function(p72)
			-- upvalues: (copy) v_u_71
			if v_u_71 == nil then
				return p72
			else
				return v_u_71 + (1 - v_u_71) * p72
			end
		end):map(function(p73)
			-- upvalues: (copy) v_u_54
			return {
				["Color3"] = v_u_54.container.style.Color3,
				["Transparency"] = p73
			}
		end)
	else
		v70 = nil
	end
	v68.backgroundStyle = v70
	local v74
	if v_u_39.fillBehavior then
		v74 = {}
		local v75
		if v_u_39.fillBehavior == v_u_12.Fill then
			v75 = Enum.UIFlexMode.Fill
		else
			v75 = Enum.UIFlexMode.Shrink
		end
		v74.FlexMode = v75
	else
		v74 = nil
	end
	v68.flexItem = v74
	local v76
	if v_u_54.container.stroke then
		v76 = {
			["Color"] = v_u_54.container.stroke.Color
		}
		local v_u_77 = v_u_54.container.stroke.Transparency
		v76.Transparency = v56.transparency:map(function(p78)
			-- upvalues: (copy) v_u_77
			if v_u_77 == nil then
				return p78
			else
				return v_u_77 + (1 - v_u_77) * p78
			end
		end)
	else
		v76 = nil
	end
	v68.stroke = v76
	v68.Size = UDim2.new(v_u_39.fillBehavior == v_u_12.Fill and 1 or v_u_39.width.Scale, v_u_39.fillBehavior == v_u_12.Fill and 0 or v_u_39.width.Offset, 0, v_u_54.container.height)
	local v79 = {}
	local v80
	if v_u_39.isDisabled then
		v80 = false
	else
		v80 = v_u_39.Selectable
	end
	v79.Selectable = v80
	v79.NextSelectionUp = v_u_39.NextSelectionUp
	v79.NextSelectionDown = v_u_39.NextSelectionDown
	v79.NextSelectionLeft = v_u_39.NextSelectionLeft
	v79.NextSelectionRight = v_u_39.NextSelectionRight
	v68.selection = v79
	v68.cursor = v60
	v68.onActivated = v_u_39.onActivated
	v68.onStateChanged = v42
	v68.isDisabled = v_u_39.isDisabled or (v_u_39.isLoading or v_u_43)
	v68.stateLayer = v_u_54.container.stateLayer
	v68.tag = v_u_54.container.tag
	v68.ref = p38
	local v81 = v67(v_u_39, v68)
	local v82 = {}
	local v83
	if v_u_39.isLoading then
		local v84 = v_u_6.createElement
		local v85 = "Folder"
		local v86 = {}
		local v87 = {}
		local v88 = v_u_6.createElement
		local v89 = v_u_5
		local v90 = {}
		local v91 = {}
		local v92 = v_u_6.createElement
		local v93 = v_u_9
		local v94 = {}
		local v95 = v_u_54.icon.size
		local v96
		if v_u_18.FoundationUsePath2DSpinner then
			v96 = UDim2.fromOffset(v_u_48.Padding.XSmall, v_u_48.Padding.XSmall)
		else
			v96 = UDim2.fromOffset(0, 0)
		end
		v94.Size = v95 - v96
		v94.style = v56.transparency:map(function(p97)
			-- upvalues: (copy) v_u_54
			return {
				["Color3"] = v_u_54.content.style.Color3,
				["Transparency"] = p97
			}
		end)
		v94.testId = ("%*--spinner"):format(v_u_39.testId)
		v91.Spinner = v92(v93, v94)
		v87.PresenceWrapper = v88(v89, v90, v91)
		v83 = v84(v85, v86, v87)
	else
		v83 = nil
	end
	v82.Loading = v83
	local v98
	if v_u_39.icon then
		local v99 = v_u_6.createElement
		local v100 = v_u_16
		local v101 = {}
		local v102
		if v_u_39.icon then
			v102 = v_u_54.icon.size
		else
			v102 = nil
		end
		v101.Size = v102
		v101.LayoutOrder = v_u_39.icon and (v47 and 3 or 1) or nil
		local v103
		if v_u_39.icon then
			v103 = ("%*--icon-wrapper"):format(v_u_39.testId)
		else
			v103 = nil
		end
		v101.testId = v103
		v98 = v99(v100, v101, {
			["Icon"] = v_u_6.createElement(v_u_14, {
				["icon"] = v_u_39.icon,
				["isLoading"] = v_u_39.isLoading,
				["variant"] = v_u_39.variant,
				["size"] = v_u_39.size,
				["disabledTransparencyBinding"] = v56.transparency,
				["textTransparencyBinding"] = v58.textTransparency,
				["testId"] = v_u_39.testId
			})
		})
	else
		v98 = nil
	end
	v82.IconWrapper = v98
	local v104
	if v_u_61 then
		v104 = v_u_6.createElement(v_u_15, {
			["Text"] = nil,
			["RichText"] = nil,
			["tag"] = nil,
			["textStyle"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Text"] = v41:map(v64),
			["RichText"] = v_u_25[v_u_39.variant] ~= nil,
			["tag"] = v_u_54.text.tag,
			["textStyle"] = v_u_6.joinBindings({ v56.transparency, v58.textTransparency }):map(function(p105)
				-- upvalues: (copy) v_u_54
				local v106 = p105[1]
				local v107 = p105[2]
				return {
					["Color3"] = v_u_54.content.style.Color3,
					["Transparency"] = v107 + v106
				}
			end),
			["testId"] = ("%*--text"):format(v_u_39.testId)
		})
	else
		v104 = nil
	end
	v82.Text = v104
	local v108
	if v_u_43 then
		v108 = v_u_6.createElement("UIGradient", {
			["Transparency"] = v45:map(v_u_35)
		})
	else
		v108 = nil
	end
	v82.Gradient = v108
	return v65(v66, v81, v82)
end))