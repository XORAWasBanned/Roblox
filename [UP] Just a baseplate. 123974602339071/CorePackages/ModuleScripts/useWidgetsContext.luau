-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioWidgets.useWidgetsContext
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
require(script.Parent.Types)
local v_u_3 = require(script.Parent.WidgetsContext)
return function() -- name: useWidgetsContext
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v4 = v_u_2.useContext(v_u_3)
	if v4 == nil then
		error("useWidgetsContext must be used within a WidgetsProvider")
	end
	return v4
end