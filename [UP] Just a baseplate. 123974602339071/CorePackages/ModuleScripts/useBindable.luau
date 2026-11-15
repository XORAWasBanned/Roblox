-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useBindable
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
require(v1.Components.Types)
return function(p5) -- name: useBindable
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v6, v7 = v_u_3.useBinding(nil)
	if v_u_4.isBinding(p5) then
		return p5
	end
	v7(p5)
	return v6
end