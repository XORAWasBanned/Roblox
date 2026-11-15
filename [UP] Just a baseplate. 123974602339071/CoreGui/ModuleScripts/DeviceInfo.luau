-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Reducers.DeviceInfo
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local v_u_3 = require(v1.Workspace.Packages.AppCommonLib).Immutable
local v_u_4 = require(v2.Constants)
local v_u_5 = require(v2.Actions.SetDeviceLayout)
local v_u_6 = require(v1.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation
local v_u_7 = require(v2.Actions.SetIsSmallTouchScreen)
return function(p8, p9)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7
	local v10 = p8 or {
		["DeviceLayout"] = nil,
		["DeviceOrientation"] = nil,
		["IsSmallTouchScreen"] = false,
		["DeviceLayout"] = v_u_4.DeviceLayout.DESKTOP,
		["DeviceOrientation"] = v_u_4.DeviceOrientation.INVALID
	}
	if p9.type == v_u_6.name then
		return v_u_3.Set(v10, "DeviceOrientation", p9.deviceOrientation)
	end
	if p9.type == v_u_5.name then
		return v_u_3.Set(v10, "DeviceLayout", p9.deviceLayout)
	end
	if p9.type == v_u_7.name then
		v10 = v_u_3.Set(v10, "IsSmallTouchScreen", p9.isSmallTouchScreen)
	end
	return v10
end