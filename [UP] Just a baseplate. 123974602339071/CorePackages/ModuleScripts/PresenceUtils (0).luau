-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion.AnimatePresence.PresenceUtils
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.PresenceContext)
return {
	["useIsPresent"] = function() -- name: useIsPresent
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		local v4 = v_u_2.useContext(v_u_3)
		return v4 == nil and true or v4.isPresent
	end,
	["isPresent"] = function(p5) -- name: isPresent
		return p5 == nil and true or p5.isPresent
	end
}