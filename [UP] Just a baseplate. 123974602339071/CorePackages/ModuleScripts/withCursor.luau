-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Cursor.withCursor
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.CursorContext)
return function(p4) -- name: withCursor
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return v_u_2.createElement(v_u_3.Consumer, {
		["render"] = p4
	})
end