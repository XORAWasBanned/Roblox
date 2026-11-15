-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.WindowManager
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Service)
local v_u_5 = require(v1.Hooks.useChromeWindowItems)
local v_u_6 = require(v1.Unibar.ComponentHosts.WindowHost)
return function(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4
	local v7 = {}
	for _, v8 in v_u_5() do
		v7["window_" .. v8.integration.id] = v_u_3.createElement(v_u_6, {
			["position"] = v_u_4:windowPosition(v8.integration.id),
			["integration"] = v8
		})
	end
	return v7
end