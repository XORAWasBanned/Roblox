-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getBindableValue
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.React)
local v_u_3 = require(v2.ReactIs)
require(v1.Components.Types)
return function(p4) -- name: getBindableValue
	-- upvalues: (copy) v_u_3
	if v_u_3.isBinding(p4) then
		return p4:getValue()
	else
		return p4
	end
end