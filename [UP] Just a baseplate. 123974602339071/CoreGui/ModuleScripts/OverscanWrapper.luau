-- Path: CoreGui.RobloxGui.Modules.Settings.Components.OverscanWrapper
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v_u_3 = require(v1.Workspace.Packages.FocusNavigationUtils).FocusRoot
local v_u_4 = require(v1.Packages.React)
local v5 = require(v1.Workspace.Packages.RobloxAppEnums)
local v_u_6 = require(v1.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local v_u_7 = v5.DeviceType
function OverscanWrapper(p_u_8) -- name: OverscanWrapper
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_2, (copy) v_u_3, (copy) v_u_6
	return function(p9)
		-- upvalues: (ref) v_u_7, (ref) v_u_4, (ref) v_u_2, (ref) v_u_3, (ref) v_u_6, (copy) p_u_8
		local v10 = {
			["deviceType"] = v_u_7.Console
		}
		local v11 = v_u_4.createElement
		local v12 = v_u_2
		local v13 = {
			["FocusNavigationCoreScriptsWrapper"] = v_u_4.createElement(v_u_3, {
				["surfaceIdentifier"] = nil,
				["isIsolated"] = true,
				["isAutoFocusRoot"] = true,
				["surfaceIdentifier"] = v_u_6.CentralOverlay
			}, {
				["Overscan"] = v_u_4.createElement(p_u_8, p9)
			})
		}
		return v11(v12, {
			["styleOverride"] = v10
		}, v13)
	end
end
return OverscanWrapper