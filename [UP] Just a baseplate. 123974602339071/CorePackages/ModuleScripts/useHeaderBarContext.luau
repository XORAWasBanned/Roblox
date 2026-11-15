-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.HeaderBar.useHeaderBarContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.HeaderBar.HeaderBarContext)
return function() -- name: useHeaderBarContext
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.useContext(v_u_4.Context)
end