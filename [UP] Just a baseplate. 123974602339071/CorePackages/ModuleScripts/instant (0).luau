-- Path: CorePackages.Packages._Index.Otter-31ab8d40-1.3.7.Otter.instant
require(script.Parent.types)
return function(p_u_1) -- name: instant
	return {
		["step"] = function() -- name: step
			-- upvalues: (copy) p_u_1
			return {
				["value"] = nil,
				["complete"] = true,
				["value"] = p_u_1
			}
		end,
		["startingValue"] = p_u_1
	}
end