-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Cursor.CursorContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Utility.Logger)
local v4 = require(v2.React)
require(v1.Enums.CursorType)
require(v1.Components.Types)
return v4.createContext({
	["refCache"] = {},
	["setMountedCursors"] = function(_) -- name: setMountedCursors
		-- upvalues: (copy) v_u_3
		v_u_3:warning("No Cursor Provider found")
	end,
	["getCursor"] = function(_) -- name: getCursor
		-- upvalues: (copy) v_u_3
		v_u_3:warning("No Cursor Provider found")
	end
})