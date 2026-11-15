-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.AlertActions.AlertActions
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Components.Button)
local v_u_6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Utility.Logger)
require(v1.Components.Types)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Utility.withCommonProps)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = require(script.Parent.AlertConstants).MAX_ACTION_COUNT
local v_u_12 = {
	["testId"] = "--foundation-alert-actions"
}
return v_u_4.memo(function(p13) -- name: AlertActions
	-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_4, (copy) v_u_11, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_8, (copy) v_u_9
	local v_u_14 = v_u_10(p13, v_u_12)
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_14, (ref) v_u_11, (ref) v_u_7
		if v_u_14.actions and v_u_11 < #v_u_14.actions then
			v_u_7:warning((("Alert components only support up to %* actions"):format(v_u_11)))
		end
	end, { v_u_14.actions })
	local v19 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_14, (ref) v_u_11, (ref) v_u_3, (ref) v_u_6, (ref) v_u_4, (ref) v_u_5
		if not v_u_14.actions or #v_u_14.actions <= 0 then
			return nil
		end
		local v15 = {}
		for v16, v17 in v_u_14.actions do
			if v_u_11 < v16 then
				break
			end
			local v18 = v_u_3.join(v17, {
				["LayoutOrder"] = v16,
				["size"] = v_u_6.Small,
				["testId"] = ("%*--action-%*"):format(v_u_14.testId, v16)
			})
			v15["ActionButton" .. v16] = v_u_4.createElement(v_u_5, v18)
		end
		return v15
	end, { v_u_14.actions, v_u_14.testId })
	if v19 then
		return v_u_4.createElement(v_u_8, v_u_9(v_u_14, {
			["tag"] = v_u_14.tag or "auto-xy row gap-small",
			["padding"] = v_u_14.padding
		}), v19)
	else
		return nil
	end
end)