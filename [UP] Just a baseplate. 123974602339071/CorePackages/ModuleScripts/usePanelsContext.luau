-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioPanels.usePanelsContext
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.PanelsContext)
require(script.Parent.Types)
return function() -- name: usePanelsContext
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v4 = v_u_2.useContext(v_u_3)
	if v4 == nil then
		error("usePanelsContext must be used within a PanelsContext")
	end
	return v4
end