-- Path: CoreGui.RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Workspace.Packages.Style).StyleProviderWithDefaultTheme
return function(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = v_u_2.createElement
	local v7 = v_u_3
	local v8 = {}
	local v9
	if p5 then
		v9 = p5.withUiModeSupport
	else
		v9 = false
	end
	v8.withUiModeSupport = v9
	v8.withDarkTheme = not p5 and true or p5.withDarkTheme
	return v6(v7, v8, p4)
end