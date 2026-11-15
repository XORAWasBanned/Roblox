-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Accordion.Item.AccordionItem
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
require(v2.Otter)
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactOtter)
local v_u_6 = v3.Icon
local v_u_7 = require(v1.Components.Divider)
local v_u_8 = require(v1.Components.Icon)
local v_u_9 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Providers.Preferences.usePreferences)
local v_u_12 = require(v1.Utility.withCommonProps)
local v_u_13 = require(v1.Utility.withDefaults)
local v_u_14 = require(script.Parent.Parent.useAccordion)
local v_u_15 = require(v1.Providers.Style.useTokens)
local v_u_16 = require(v1.Enums.InputPlacement)
require(v1.Enums.InputSize)
require(v1.Providers.Style.Tokens)
local v_u_17 = require(script.Parent.Parent.useAccordionItemVariants)
local v_u_18 = {
	["hasDivider"] = true,
	["isExpanded"] = false
}
return v_u_4.memo(v_u_4.forwardRef(function(p19, p20) -- name: AccordionItem
	-- upvalues: (copy) v_u_13, (copy) v_u_18, (copy) v_u_15, (copy) v_u_11, (copy) v_u_4, (copy) v_u_5, (copy) v_u_14, (copy) v_u_17, (copy) v_u_16, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7
	local v_u_21 = v_u_13(p19, v_u_18)
	local v_u_22 = v_u_15()
	local v_u_23 = v_u_11().reducedMotion
	local v_u_25 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_22
		local v24 = v_u_22
		return {
			["easingStyle"] = v24.Ease.StandardOut,
			["duration"] = v24.Time.Time_300
		}
	end, { v_u_22 })
	local v_u_26, v_u_27 = v_u_4.useState(v_u_21.isExpanded)
	local v_u_28 = v_u_4.useRef(false)
	local v29, v_u_30 = v_u_5.useAnimatedBinding(0)
	local v31, v_u_32 = v_u_5.useAnimatedBinding(0, function()
		-- upvalues: (copy) v_u_28, (copy) v_u_27
		if v_u_28.current then
			v_u_27(false)
			v_u_28.current = false
		end
	end)
	local v_u_33 = v_u_4.useRef(nil)
	local v_u_34 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_23, (copy) v_u_32, (ref) v_u_5, (copy) v_u_30, (copy) v_u_27, (copy) v_u_28, (copy) v_u_25
		if v_u_23 then
			v_u_32((v_u_5.instant(0)))
			v_u_30((v_u_5.instant(0)))
			v_u_27(false)
			v_u_28.current = false
		else
			v_u_28.current = true
			v_u_32(v_u_5.ease(0, v_u_25))
			v_u_30(v_u_5.ease(0, v_u_25))
		end
	end, { v_u_23, v_u_25 })
	local v35 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_33, (copy) v_u_26, (copy) v_u_23, (copy) v_u_32, (ref) v_u_5, (copy) v_u_25
		if v_u_33 and (v_u_33.current and v_u_26) then
			if v_u_23 then
				v_u_32((v_u_5.instant(v_u_33.current.AbsoluteSize.Y)))
				return
			end
			v_u_32(v_u_5.ease(v_u_33.current.AbsoluteSize.Y, v_u_25))
		end
	end, {
		v_u_33,
		v_u_26,
		v_u_23,
		v_u_25
	})
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_21, (copy) v_u_34, (copy) v_u_27
		if v_u_26 and not v_u_21.isExpanded then
			v_u_34()
		else
			v_u_27(v_u_21.isExpanded)
		end
	end, { v_u_21.isExpanded })
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_23, (copy) v_u_30, (ref) v_u_5, (copy) v_u_25
		if v_u_26 then
			if v_u_23 then
				v_u_30((v_u_5.instant(-180)))
				return
			end
			v_u_30(v_u_5.ease(-180, v_u_25))
		end
	end, { v_u_26, v_u_23, v_u_25 })
	local v36 = v_u_14()
	local v37 = v36.onAccordionItemActivated
	local v38 = v36.itemSize
	local v39 = v36.isContained
	local v40 = v36.chevronPosition
	local v41 = v_u_17(v_u_22, v38, v39)
	local v42 = v40 == v_u_16.Start
	local v43 = v42 and 3 or 1
	local v44 = v42 and 1 or 3
	local v45 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_34, (copy) v_u_27
		if v_u_26 then
			v_u_34()
		else
			v_u_27(true)
		end
	end, { v_u_26 })
	if v_u_21.onActivated then
		v45 = v_u_21.onActivated
	elseif v37 then
		v45 = v37(v_u_21.id, v_u_26)
	end
	v_u_21.testId = ("%*--item-%*"):format(v36.testId, v_u_21.id)
	local v46 = v_u_21.description ~= nil
	local v47 = v_u_4.createElement(v_u_9, {
		["LayoutOrder"] = 2,
		["Text"] = nil,
		["tag"] = nil,
		["testId"] = nil,
		["Text"] = v_u_21.text,
		["tag"] = {
			[v41.text.tag] = true,
			["grow"] = not v46,
			["size-full-0"] = v46
		},
		["testId"] = ("%*--title"):format(v_u_21.testId)
	})
	local v48
	if v_u_21.icon then
		v48 = v_u_21.icon
	else
		v48 = v_u_21.leadingIcon
	end
	local v49 = v_u_4.createElement
	local v50 = v_u_10
	local v51 = v_u_12(v_u_21, {
		["tag"] = v41.container.tag,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["stateLayer"] = v41.container.stateLayer,
		["ref"] = p20
	})
	local v52 = {}
	local v53 = v_u_4.createElement
	local v54 = v_u_10
	local v55 = {
		["LayoutOrder"] = 1,
		["tag"] = nil,
		["AutomaticSize"] = nil,
		["onActivated"] = nil,
		["testId"] = nil,
		["tag"] = v41.header.tag
	}
	local v56
	if v46 then
		v56 = Enum.AutomaticSize.Y
	else
		v56 = nil
	end
	v55.AutomaticSize = v56
	v55.onActivated = v45
	v55.testId = ("%*--header"):format(v_u_21.testId)
	local v57 = {}
	local v58
	if v48 then
		local v59 = v_u_4.createElement
		local v60 = v_u_8
		local v61 = {
			["LayoutOrder"] = v43
		}
		local v62
		if type(v48) == "table" then
			v62 = v48.name
		else
			v62 = v48
		end
		v61.name = v62
		local v63
		if type(v48) == "table" then
			v63 = v48.variant
		else
			v63 = nil
		end
		v61.variant = v63
		v61.style = v41.icon.style
		v61.size = v41.icon.size
		v61.testId = ("%*--leading-icon"):format(v_u_21.testId)
		v58 = v59(v60, v61)
	else
		v58 = nil
	end
	v57.Icon = v58
	local v64
	if v46 then
		v64 = nil
	else
		v64 = v47
	end
	v57.Title = v64
	local v65
	if v46 then
		v65 = v_u_4.createElement(v_u_10, {
			["LayoutOrder"] = 2,
			["tag"] = nil,
			["testId"] = nil,
			["tag"] = v41.textContainer.tag,
			["testId"] = ("%*--text-container"):format(v_u_21.testId)
		}, {
			["Title"] = v47,
			["Description"] = v_u_4.createElement(v_u_9, {
				["LayoutOrder"] = 3,
				["Text"] = nil,
				["TextWrapped"] = false,
				["TextTruncate"] = nil,
				["tag"] = nil,
				["testId"] = nil,
				["Text"] = v_u_21.description,
				["TextTruncate"] = Enum.TextTruncate.AtEnd,
				["tag"] = v41.description.tag,
				["testId"] = ("%*--description"):format(v_u_21.testId)
			})
		})
	else
		v65 = nil
	end
	v57.TextContainer = v65
	v57.CollapseIcon = v_u_4.createElement(v_u_10, {
		["tag"] = "auto-xy",
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["LayoutOrder"] = v44,
		["testId"] = ("%*--collapse-icon-container"):format(v_u_21.testId)
	}, {
		["Icon"] = v_u_4.createElement(v_u_8, {
			["name"] = v_u_6.ChevronLargeDown,
			["Rotation"] = v29,
			["style"] = v41.icon.style,
			["size"] = v41.icon.size,
			["testId"] = ("%*--collapse-icon"):format(v_u_21.testId)
		})
	})
	v52.Header = v53(v54, v55, v57)
	local v66
	if v_u_26 then
		local v67 = v_u_4.createElement
		local v68 = v_u_10
		local v69 = {
			["tag"] = "col",
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Size"] = nil,
			["ClipsDescendants"] = true,
			["testId"] = ("%*--content"):format(v_u_21.testId)
		}
		local v70
		if v31 then
			v70 = v31:map(function(p71)
				return UDim2.new(1, 0, 0, p71)
			end)
		else
			v70 = nil
		end
		v69.Size = v70
		v66 = v67(v68, v69, {
			["AnimatedContainer"] = v_u_4.createElement(v_u_10, {
				["tag"] = v41.content.tag,
				["ref"] = v_u_33,
				["onAbsoluteSizeChanged"] = v35,
				["flexItem"] = {
					["FlexMode"] = Enum.UIFlexMode.None
				},
				["testId"] = ("%*--animated-content"):format(v_u_21.testId)
			}, { v_u_21.children })
		})
	else
		v66 = nil
	end
	v52.Content = v66
	local v72
	if v_u_21.hasDivider then
		v72 = v_u_4.createElement(v_u_7, {
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["testId"] = ("%*--divider"):format(v_u_21.testId)
		})
	else
		v72 = nil
	end
	v52.Divider = v72
	return v49(v50, v51, v52)
end))