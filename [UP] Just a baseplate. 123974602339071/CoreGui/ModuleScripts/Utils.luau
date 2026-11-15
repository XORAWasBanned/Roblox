-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.Utils
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.RobloxAppEnums)
local v_u_3 = require(v1.Workspace.Packages.AppCommonLib)
local v_u_4 = v2.DeviceOrientationMode
return {
	["getDeviceType"] = function() -- name: getDeviceType
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		local v5 = v_u_3.getDeviceType
		local v6 = workspace.CurrentCamera.ViewportSize
		local v7
		if v6.X > v6.Y then
			v7 = v_u_4.Landscape
		else
			v7 = v_u_4.Portrait
		end
		return v5(v7)
	end,
	["DeviceTypes"] = v2.DeviceType,
	["getDeviceOrientation"] = function() -- name: getDeviceOrientation
		-- upvalues: (copy) v_u_4
		local v8 = workspace.CurrentCamera.ViewportSize
		if v8.X > v8.Y then
			return v_u_4.Landscape
		else
			return v_u_4.Portrait
		end
	end,
	["getViewportSize"] = function() -- name: getViewportSize
		return workspace.CurrentCamera.ViewportSize
	end
}