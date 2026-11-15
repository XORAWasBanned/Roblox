-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.0.7.Motion.AnimatePresence.usePresence
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.PresenceContext)
local v_u_4 = require(script.Parent.PresenceUtils).isPresent
return function() -- name: usePresence
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v5 = v_u_2.useContext(v_u_3)
	local v_u_6 = v5.id
	local _ = v5.isPresent
	local v_u_7 = v5.onExitComplete
	local v8 = v5.passThroughData
	local v9 = v_u_2.useCallback(function()
		-- upvalues: (copy) v_u_7, (copy) v_u_6
		if v_u_7 then
			v_u_7(v_u_6)
		end
	end, { v_u_7, v_u_6 })
	return {
		["isPresent"] = v_u_4(v5),
		["id"] = v_u_6,
		["onExitComplete"] = v9,
		["passThroughData"] = v8
	}
end