-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.mapBindable
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.React)
local v_u_3 = require(v2.ReactIs)
require(v1.Components.Types)
return function(p4, p5) -- name: mapBindable
	-- upvalues: (copy) v_u_3
	if v_u_3.isBinding(p4) then
		return p4:map(p5)
	else
		return p5(p4)
	end
end