-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getIconForKeyCode.getIconForKeyCode
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.InputPlatform)
local v_u_2 = require(script.Parent.KeyCodeIconMappings)
return function(p3, p4) -- name: getIconForKeyCode
	-- upvalues: (copy) v_u_2
	return v_u_2.getIconForKeyName(p3.Name, p4)
end