-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.SwitchServer
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = require(v1.Service)
local v_u_4 = require(v1.Integrations.CommonIcon)
local v5 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v6 = require(v1.ChromeShared.Unibar.Constants)
local v7 = require(v1.ChromeShared.Service.ChromeUtils).MappedSignal
local v8 = require(v2.Workspace.Packages.SwitchServer)
local v9 = v8.GetSwitchServerStore
local v10 = v8.Constants
local v_u_11 = v9(false)
local v_u_12 = require(v2.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v13 = require(v2.Workspace.Packages.AppCommonLib).Signal
local v14 = require(v2.Workspace.Packages.SignalsUtils)
local v_u_15 = false
local v_u_16 = v13.new()
local v_u_17 = v7.new(v_u_16, function()
	-- upvalues: (ref) v_u_15
	return v_u_15
end)
v14.createDetachedEffect(function(p18)
	-- upvalues: (copy) v_u_11, (ref) v_u_15, (copy) v_u_16
	local v19 = v_u_11.isConfirmationOpen(p18)
	if v_u_15 ~= v19 then
		v_u_15 = v19
		v_u_16:fire()
	end
end)
local v20 = {
	["initialAvailability"] = v3.AvailabilitySignal.Unavailable,
	["id"] = v6.SWITCH_SERVER_ID,
	["label"] = v10.BUTTON.LABEL
}
local v21
if v_u_12() then
	v21 = v5.SessionAction
else
	v21 = v5.BelowFold
end
v20.sideSheetPlacement = v21
function v20.activated() -- name: activated
	-- upvalues: (copy) v_u_11
	v_u_11.setConfirmationOpen(true)
end
v20.isActivated = v_u_17
v20.components = {
	["Icon"] = function(_) -- name: Icon
		-- upvalues: (copy) v_u_4, (copy) v_u_17
		return v_u_4("TwoLocationPinsConnectingArrow", nil, v_u_17)
	end
}
local v_u_22 = v3:register(v20)
v14.createDetachedEffect(function(p23)
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_22
	if v_u_11.shouldEnableSwitchServer(p23) or v_u_12() then
		v_u_22.availability:available()
	else
		v_u_22.availability:unavailable()
	end
end)
return v_u_22