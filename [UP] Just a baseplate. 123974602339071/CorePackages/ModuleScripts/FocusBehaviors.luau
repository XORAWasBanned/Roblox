-- Path: CorePackages.Packages._Index.FocusBehaviors.FocusBehaviors
local v1 = script.Parent
require(v1.FocusNavigation)
local v_u_2 = require(script.composeFocusBehaviors)
local function v_u_5() -- name: mostRecentDescendantBehavior
	local v_u_3 = nil
	return {
		["onDescendantFocusChanged"] = function(p4) -- name: onDescendantFocusChanged
			-- upvalues: (ref) v_u_3
			v_u_3 = p4 or v_u_3
		end,
		["getTargets"] = function() -- name: getTargets
			-- upvalues: (ref) v_u_3
			return v_u_3 and { v_u_3 } or {}
		end
	}
end
return {
	["default"] = function(p_u_6) -- name: defaultDescendantBehavior
		return {
			["getTargets"] = function() -- name: getTargets
				-- upvalues: (copy) p_u_6
				return p_u_6 and { p_u_6 } or {}
			end
		}
	end,
	["mostRecent"] = v_u_5,
	["mostRecentOrDefault"] = function(p_u_7) -- name: mostRecentDescendantOrDefaultBehavior
		-- upvalues: (copy) v_u_2, (copy) v_u_5
		return v_u_2(v_u_5(), {
			["getTargets"] = function() -- name: getTargets
				-- upvalues: (copy) p_u_7
				return p_u_7 and { p_u_7 } or {}
			end
		})
	end,
	["composeFocusBehaviors"] = v_u_2
}