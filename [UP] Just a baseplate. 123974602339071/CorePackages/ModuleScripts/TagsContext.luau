-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.TagsContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Utility.Logger)
return require(v2.React).createContext(function()
	-- upvalues: (copy) v_u_3
	v_u_3:warning("No Style Provider found")
	return ""
end)