-- Path: CoreGui.RobloxGui.Modules.Settings.Components.PortalWithFoundationStylelink
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Foundation)
local v_u_4 = require(v1.Packages.React)
local v_u_5 = require(v1.Packages.ReactRoblox)
local v_u_6 = v3.View
local v_u_7 = v3.Hooks.useStyleSheet
return function(p8) -- name: PortalWithFoundationStylelink
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v9 = v_u_7()
	local v10 = v_u_2.Dictionary.join
	local v11 = {
		["StyleLink"] = v_u_4.createElement("StyleLink", {
			["StyleSheet"] = v9
		})
	}
	local v12 = v10(v11, p8.children)
	return v_u_5.createPortal(v_u_4.createElement(v_u_6, {
		["tag"] = "auto-xy"
	}, v12), p8.parent)
end