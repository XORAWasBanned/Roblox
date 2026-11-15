-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OptionSelectorGroup.OptionSelectorGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.Orientation)
local v_u_5 = require(v1.Enums.OptionSelectorGroupSize)
require(v1.Enums.FillBehavior)
local v_u_6 = require(v1.Components.InputLabel)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.View)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Utility.withCommonProps)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = require(script.Parent.OptionSelectorGroupContext)
local v_u_12 = require(script.Parent.useOptionSelectorGroupVariants)
local v_u_13 = {
	["orientation"] = nil,
	["size"] = nil,
	["Selectable"] = true,
	["testId"] = "--foundation-option-selector-group",
	["orientation"] = v4.Vertical,
	["size"] = v_u_5.Medium
}
local function v_u_23(p_u_14) -- name: OptionSelectorGroupInner
	-- upvalues: (copy) v_u_8, (copy) v_u_12, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_9, (copy) v_u_6, (copy) v_u_11
	local v_u_15 = p_u_14.props
	local v16 = v_u_12(v_u_8(), v_u_15.size or v_u_5.Medium, v_u_15.orientation)
	local v17 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_14, (copy) v_u_15
		return {
			["value"] = p_u_14.value,
			["onValueChanged"] = p_u_14.onValueChanged,
			["orientation"] = v_u_15.orientation,
			["Selectable"] = v_u_15.Selectable,
			["testId"] = v_u_15.testId,
			["size"] = p_u_14.sizeOverride,
			["fillBehavior"] = p_u_14.fillBehaviorOverride
		}
	end, {
		p_u_14.value,
		p_u_14.onValueChanged,
		v_u_15.orientation,
		v_u_15.Selectable,
		v_u_15.testId,
		p_u_14.sizeOverride,
		p_u_14.fillBehaviorOverride
	})
	local v18 = v_u_3.createElement
	local v19 = v_u_7
	local v20 = v_u_9(v_u_15, {
		["tag"] = v16.container.tag,
		["ref"] = p_u_14.ref
	})
	local v21 = {}
	local v22
	if v_u_15.legend == nil then
		v22 = nil
	else
		v22 = v_u_3.createElement(v_u_6, {
			["Text"] = nil,
			["size"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = v_u_15.legend,
			["size"] = v16.legend.size,
			["testId"] = ("%*--legend"):format(v_u_15.testId)
		})
	end
	v21.Legend = v22
	v21.List = v_u_3.createElement(v_u_7, {
		["tag"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["tag"] = v16.list.tag,
		["testId"] = ("%*--list"):format(v_u_15.testId)
	}, {
		["OptionSelectorGroupContext"] = v_u_3.createElement(v_u_11.Provider, {
			["value"] = v17
		}, v_u_15.children)
	})
	return v18(v19, v20, v21)
end
return v_u_3.memo(v_u_3.forwardRef(function(p24, p25) -- name: OptionSelectorGroup
	-- upvalues: (copy) v_u_10, (copy) v_u_13, (copy) v_u_3, (copy) v_u_23
	local v_u_26 = v_u_10(p24, v_u_13)
	local v27, v_u_28 = v_u_3.useState(v_u_26.value)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_28
		if v_u_26.value ~= nil then
			v_u_28(v_u_26.value)
		end
	end, { v_u_26.value })
	local v30 = v_u_3.useCallback(function(p29)
		-- upvalues: (copy) v_u_28, (copy) v_u_26
		v_u_28(p29)
		v_u_26.onValueChanged(p29)
	end, { v_u_28, v_u_26.onValueChanged })
	return v_u_3.createElement(v_u_23, {
		["props"] = v_u_26,
		["sizeOverride"] = p24.size,
		["fillBehaviorOverride"] = p24.fillBehavior,
		["value"] = v27,
		["onValueChanged"] = v30,
		["ref"] = p25
	})
end))