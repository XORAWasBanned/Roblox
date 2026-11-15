-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.ScreenshotFlowStepHandlerContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(script.Parent.ScreenshotFlowStepHandler)
local v4 = v_u_2.PureComponent:extend("ScreenshotFlowStepHandlerContainer")
local v_u_5 = require(v1.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v6 = require(v1.Workspace.Packages.FocusNavigationUtils)
local v_u_7 = v6.FocusRoot
local v_u_8 = v6.FocusNavigableSurfaceIdentifierEnum
function v4.render(p9) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3
	local v10 = v_u_2.createElement
	local v11 = v_u_5
	local v12 = {
		["FocusNavigationCoreScriptsWrapper"] = v_u_2.createElement(v_u_7, {
			["surfaceIdentifier"] = nil,
			["isIsolated"] = true,
			["isAutoFocusRoot"] = true,
			["surfaceIdentifier"] = v_u_8.CentralOverlay
		}, {
			["ScreenshotFlowStepHandlerContainer"] = v_u_2.createElement(v_u_3, p9.props)
		})
	}
	return v10(v11, {}, v12)
end
return v4