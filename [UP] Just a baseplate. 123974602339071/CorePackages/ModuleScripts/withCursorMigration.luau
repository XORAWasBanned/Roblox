-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Cursor.withCursorMigration
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.CursorContext)
return function(p_u_4) -- name: withCursorMigration
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return v_u_2.createElement(v_u_3.Consumer, {
		["render"] = function(p5) -- name: render
			-- upvalues: (copy) p_u_4
			return p_u_4(p5.getCursor)
		end
	})
end