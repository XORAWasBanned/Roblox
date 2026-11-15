-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.RadioGroup.RadioGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Utility.withCommonProps)
local v_u_5 = require(v1.Utility.withDefaults)
local v_u_6 = require(v1.Components.InternalInputGroup)
local v_u_7 = require(script.Parent.RadioGroupContext)
local v8 = require(v1.Enums.InputSize)
local v9 = require(v1.Enums.InputPlacement)
local v_u_10 = {
	["size"] = nil,
	["placement"] = nil,
	["Selectable"] = true,
	["testId"] = "--foundation-radio-group",
	["size"] = v8.Medium,
	["placement"] = v9.Start
}
return v_u_3.memo(v_u_3.forwardRef(function(p11, p12) -- name: RadioGroup
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7
	local v_u_13 = v_u_5(p11, v_u_10)
	local v_u_14, v_u_15 = v_u_3.useState(v_u_13.value)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_13, (copy) v_u_15
		if v_u_13.value ~= nil then
			v_u_15(v_u_13.value)
		end
	end, { v_u_13.value })
	local v_u_17 = v_u_3.useCallback(function(p16)
		-- upvalues: (copy) v_u_15, (copy) v_u_13
		v_u_15(p16)
		v_u_13.onValueChanged(p16)
	end, { v_u_15, v_u_13.onValueChanged })
	local v18 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_14, (copy) v_u_17, (copy) v_u_13
		return {
			["value"] = v_u_14,
			["onValueChanged"] = v_u_17,
			["Selectable"] = v_u_13.Selectable,
			["testId"] = v_u_13.testId
		}
	end, {
		v_u_14,
		v_u_17,
		v_u_13.Selectable,
		v_u_13.testId
	})
	local v19 = v_u_3.createElement
	local v20 = v_u_6
	local v21 = v_u_4(v_u_13, {
		["size"] = v_u_13.size,
		["placement"] = v_u_13.placement,
		["legend"] = v_u_13.legend,
		["ref"] = p12
	})
	local v22 = {
		["RadioGroupContext"] = v_u_3.createElement(v_u_7.Provider, {
			["value"] = v18
		}, v_u_13.children)
	}
	return v19(v20, v21, v22)
end))