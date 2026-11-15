-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.FocusBehaviorHooks
local v1 = script.Parent.Parent
require(v1.FocusNavigation)
local v2 = require(v1.FocusBehaviors)
local v_u_3 = require(v1.React)
local v_u_4 = v2.default
local v_u_5 = v2.mostRecent
local v_u_6 = v2.mostRecentOrDefault
local v_u_7 = require(script.Parent.useContainerFocusBehavior)
return {
	["useDefaultFocusBehavior"] = function(p8) -- name: useDefaultFocusBehavior
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_7
		local v_u_9, v10 = v_u_3.useState(nil)
		return v10, v_u_7(v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_4, (copy) v_u_9
			return v_u_4(v_u_9)
		end, { v_u_9 }), p8)
	end,
	["useMostRecentFocusBehavior"] = function(p11) -- name: useMostRecentFocusBehavior
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_7
		return v_u_7(v_u_3.useMemo(v_u_5, {}), p11)
	end,
	["useMostRecentOrDefaultFocusBehavior"] = function(p12) -- name: useMostRecentOrDefaultFocusBehavior
		-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_7
		local v_u_13, v14 = v_u_3.useState(nil)
		return v14, v_u_7(v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_6, (copy) v_u_13
			return v_u_6(v_u_13)
		end, { v_u_13 }), p12)
	end
}