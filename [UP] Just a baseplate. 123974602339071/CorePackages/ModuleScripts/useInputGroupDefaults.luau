-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInputGroup.useInputGroupDefaults
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.withDefaults)
local v_u_3 = require(script.Parent.useInputGroup)
return function(p4, p5) -- name: useInputGroupDefaults
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_2(p4, v_u_2(v_u_3(), p5))
end