-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.Popover
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.withDefaults)
local v_u_5 = require(script.Parent.PopoverContext)
require(v1.Utility.Plugin.StudioUri)
require(v1.Components.Types)
local v_u_6 = {
	["testId"] = "--foundation-popover"
}
return function(p7) -- name: Popover
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v_u_8 = v_u_4(p7, v_u_6)
	local v_u_9, v_u_10 = v_u_3.useState(nil)
	local v_u_11, v_u_12 = v_u_3.useState(nil)
	local v13 = {
		["value"] = v_u_3.useMemo(function()
			-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_8
			return {
				["anchor"] = v_u_9,
				["setAnchor"] = v_u_10,
				["anchorUri"] = v_u_11,
				["setAnchorUri"] = v_u_12,
				["isOpen"] = v_u_8.isOpen,
				["testId"] = v_u_8.testId
			}
		end, {
			v_u_9,
			v_u_11,
			v_u_8.isOpen,
			v_u_8.testId
		})
	}
	return v_u_3.createElement(v_u_5.Provider, v13, v_u_8.children)
end