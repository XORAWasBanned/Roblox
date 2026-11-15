-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.Overlay
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local v_u_4 = require(v1.Packages.UIBlox).Core.Style.useStyle
local v_u_5 = require(v1.Packages.ReactFocusNavigation)
local v_u_6 = v_u_5.FocusNavigationService.new(v_u_5.EngineInterface.CoreGui)
local v7 = require(v1.Workspace.Packages.FocusNavigationUtils)
local v_u_8 = v7.FocusNavigableSurfaceRegistry.Provider
local v_u_9 = v7.FocusRoot
local v_u_10 = v7.FocusNavigableSurfaceIdentifierEnum
local v11 = script.Parent.Parent
local v_u_12 = require(v11.Colors)
local v_u_13 = require(v11.Components.OverlayComponents)
local function v_u_15(p14) -- name: selectOverlayComponent
	-- upvalues: (copy) v_u_13
	return v_u_13[p14.overlay.overlay]
end
local function v_u_17(p16) -- name: selectOverlayProps
	return p16.overlay.overlayProps
end
return function(_) -- name: Overlay
	-- upvalues: (copy) v_u_3, (copy) v_u_15, (copy) v_u_17, (copy) v_u_4, (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12
	local v18 = v_u_3(v_u_15)
	local v19 = v_u_3(v_u_17)
	local v20 = v_u_4()
	local v21 = v_u_2.createElement
	local v22 = v_u_5.FocusNavigationContext.Provider
	local v23 = {
		["value"] = v_u_6
	}
	local v24 = {}
	local v25 = v_u_2.createElement
	local v26 = v_u_8
	local v27 = {}
	local v28 = v_u_2.createElement
	local v29 = v_u_9
	local v30 = {
		["surfaceIdentifier"] = nil,
		["isIsolated"] = true,
		["isAutoFocusRoot"] = true,
		["surfaceIdentifier"] = v_u_10.CentralOverlay
	}
	local v31 = {
		["OverlayContainer"] = v_u_2.createElement("Frame", {
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["Visible"] = nil,
			["BackgroundTransparency"] = v20.Tokens.Color.Common.Scrim.Transparency,
			["BackgroundColor3"] = v_u_12.Black,
			["Size"] = UDim2.fromScale(1, 1),
			["Visible"] = v18 ~= nil
		}, {
			["Overlay"] = v18 and v_u_2.createElement(v18, v19) or nil
		})
	}
	v27.FocusNavigationCoreScriptsWrapper = v28(v29, v30, v31)
	v24.FocusNavigationRegistryProvider = v25(v26, nil, v27)
	return v21(v22, v23, v24)
end