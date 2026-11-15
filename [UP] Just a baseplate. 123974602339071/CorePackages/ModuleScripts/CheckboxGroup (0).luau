-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.CheckboxGroup.CheckboxGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.InternalInputGroup)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.withCommonProps)
local v_u_6 = require(v1.Utility.withDefaults)
local v_u_7 = {
	["testId"] = "--foundation-checkbox-group"
}
return v_u_3.memo(v_u_3.forwardRef(function(p8, p9) -- name: CheckboxGroup
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v10 = v_u_6(p8, v_u_7)
	return v_u_3.createElement(v_u_4, v_u_5(v10, {
		["legend"] = v10.legend,
		["size"] = v10.size,
		["placement"] = v10.placement,
		["ref"] = p9
	}), v10.children)
end))