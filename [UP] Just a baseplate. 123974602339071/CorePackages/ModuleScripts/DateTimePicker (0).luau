-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.DateTimePicker
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.DateTimePickerBeta)
require(script.Parent.DateTimePickerProps)
local v5 = require(v1.Enums.DateTimePickerVariant)
local v_u_6 = require(v1.Utility.withDefaults)
local v_u_7 = {
	["variant"] = nil,
	["testId"] = "--foundation-date-time-picker",
	["variant"] = v5.Single
}
return v_u_3.memo(function(p8) -- name: DateTimePicker
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	return v_u_3.createElement(v_u_4, v_u_6(p8, v_u_7))
end)