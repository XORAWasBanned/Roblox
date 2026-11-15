-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Icon.migrateIconName
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.BuilderIcons).Migration
return function(p3) -- name: migrateIconName
	-- upvalues: (copy) v_u_2
	return v_u_2.uiblox[p3]
end