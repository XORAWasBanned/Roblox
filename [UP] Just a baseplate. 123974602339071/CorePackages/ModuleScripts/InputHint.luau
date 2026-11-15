-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInput.InputHint
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_5 = require(v1.Enums.InputLabelSize)
local v_u_6 = v_u_5.Medium
return v_u_3.memo(function(p_u_7) -- name: InputHint
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v_u_8 = p_u_7.size or v_u_6
	local v9 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_7, (copy) v_u_8, (ref) v_u_5
		return {
			["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
			["content-muted"] = p_u_7.isDisabled,
			["content-default"] = not p_u_7.isDisabled,
			["text-caption-small"] = v_u_8 == v_u_5.Small and true or v_u_8 == v_u_5.XSmall,
			["text-caption-medium"] = v_u_8 == v_u_5.Medium and true or v_u_8 == v_u_5.Large
		}
	end, { p_u_7.isDisabled, v_u_8 })
	return v_u_3.createElement(v_u_4, {
		["Text"] = p_u_7.text,
		["tag"] = v9,
		["testId"] = p_u_7.testId,
		["LayoutOrder"] = p_u_7.LayoutOrder,
		["padding"] = p_u_7.padding
	})
end)