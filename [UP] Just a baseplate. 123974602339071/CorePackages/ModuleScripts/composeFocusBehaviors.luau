-- Path: CorePackages.Packages._Index.FocusBehaviors.FocusBehaviors.composeFocusBehaviors
local v1 = script.Parent.Parent
require(v1.FocusNavigation)
return function(...) -- name: composeFocusBehaviors
	local v_u_2 = { ... }
	return {
		["onDescendantFocusChanged"] = function(p3) -- name: onDescendantFocusChanged
			-- upvalues: (copy) v_u_2
			for _, v4 in v_u_2 do
				if not v4.onDescendantFocusChanged then
					continue
				end
				v4.onDescendantFocusChanged(p3)
			end
		end,
		["getTargets"] = function() -- name: getTargets
			-- upvalues: (copy) v_u_2
			local v5 = {}
			for _, v6 in v_u_2 do
				for _, v7 in v6.getTargets() do
					table.insert(v5, v7)
				end
			end
			return v5
		end
	}
end