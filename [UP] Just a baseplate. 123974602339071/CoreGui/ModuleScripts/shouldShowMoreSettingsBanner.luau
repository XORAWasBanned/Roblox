-- Path: CoreGui.RobloxGui.Modules.Settings.shouldShowMoreSettingsBanner
local v_u_1 = game:GetService("CorePackages")
local v_u_2 = require(v_u_1.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_3 = nil
local function v_u_6() -- name: defaultGetAvailability
	-- upvalues: (copy) v_u_1
	local v4 = require(v_u_1.Workspace.Packages.AccountUpgrade.Eligibility)
	local v5 = require(v_u_1.Workspace.Packages.AccountUpgrade.AccountUpgradeFlow)
	return v4.getAvailability(v5.Pioneer)
end
local v_u_7 = setmetatable({}, {
	["__mode"] = "k"
})
return function(p8, p9) -- name: shouldShowMoreSettingsBanner
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_7, (ref) v_u_3, (copy) v_u_1
	if not (p8 or v_u_2)() then
		return false
	end
	local v10 = p9 or v_u_6
	local v11 = v_u_7[v10]
	if not v11 then
		v11 = v10()
		local v12 = v11.access
		local v13 = v_u_3
		if not v13 then
			v13 = require(v_u_1.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
			v_u_3 = v13
		end
		if v12 == v13.Denied then
			v_u_7[v10] = v11
		end
	end
	local v14 = v11.access
	local v15 = v_u_3
	if not v15 then
		v15 = require(v_u_1.Workspace.Packages.AccountUpgrade.Eligibility).AccessResponseEnum
		v_u_3 = v15
	end
	return v14 == v15.Denied
end