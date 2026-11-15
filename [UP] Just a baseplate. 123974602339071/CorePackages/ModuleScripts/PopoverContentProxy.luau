-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.PopoverContentProxy
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.Content)
local v_u_5 = require(script.Parent.ContentPlugin)
local v_u_6 = require(v1.Utility.isPluginSecurity)
local v_u_7 = require(v1.Providers.Plugin.usePlugin)
return v_u_3.forwardRef(function(p8, p9) -- name: PopoverContentProxy
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local _, v10 = v_u_7()
	if p9 then
		p8 = table.clone(p8)
		p8.ref = p9
	end
	if v_u_6() and v10 then
		return v_u_3.createElement(v_u_5, p8)
	else
		return v_u_3.createElement(v_u_4, p8)
	end
end)