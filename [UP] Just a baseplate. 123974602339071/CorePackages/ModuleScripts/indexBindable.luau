-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.indexBindable
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.React)
local v_u_3 = require(v2.ReactIs)
require(v1.Components.Types)
return function(p4, p_u_5) -- name: indexBindable
	-- upvalues: (copy) v_u_3
	if v_u_3.isBinding(p4) then
		return p4:map(function(p6)
			-- upvalues: (copy) p_u_5
			return p6[p_u_5]
		end)
	else
		return p4[p_u_5]
	end
end