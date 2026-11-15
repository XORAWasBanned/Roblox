-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.VRComfortSettingsPage
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = v2.t
local v_u_6 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(script.Parent.Parent.Page)
local v_u_9 = require(v7.Thunks.CloseMenu)
local v_u_10, v_u_11
if game:GetEngineFeature("VRMoreComfortSettings") then
	v_u_10 = require(script.Parent.VRComfortAutoToggleEntry)
	v_u_11 = require(script.Parent.ComfortSettingsEntry)
else
	v_u_11 = nil
	v_u_10 = nil
end
local v12 = v_u_3.PureComponent:extend("VRComfortSettingsPage")
v12.validateProps = v5.strictInterface({
	["closeMenu"] = v5.callback,
	["pageTitle"] = v5.string
})
function v12.render(p_u_13) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (ref) v_u_11, (ref) v_u_10
	return v_u_6(function(_)
		return {}
	end, function(_)
		-- upvalues: (ref) v_u_3, (ref) v_u_8, (copy) p_u_13, (ref) v_u_11, (ref) v_u_10
		local v_u_14 = 0
		local function v15()
			-- upvalues: (ref) v_u_14
			v_u_14 = v_u_14 + 1
			return v_u_14
		end
		local v16 = v_u_3.createElement
		local v17 = v_u_8
		local v18 = {
			["pageTitle"] = nil,
			["zIndex"] = 2,
			["position"] = nil,
			["pageTitle"] = p_u_13.props.pageTitle,
			["position"] = p_u_13.props.position
		}
		local v19 = {
			["Layout"] = v_u_3.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
				["VerticalAlignment"] = Enum.VerticalAlignment.Top
			})
		}
		local v20
		if game:GetEngineFeature("VRMoreComfortSettings") then
			v20 = v_u_3.createElement(v_u_11, {
				["LayoutOrder"] = v15()
			})
		else
			v20 = nil
		end
		v19.VRComfortSettings = v20
		local v21
		if game:GetEngineFeature("VRMoreComfortSettings") then
			v21 = v_u_3.createElement(v_u_10, {
				["LayoutOrder"] = nil,
				["labelKey"] = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
				["customValueKey"] = "VignetteEnabledCustomOption",
				["derivedValueKey"] = "VignetteEnabled",
				["LayoutOrder"] = v15()
			})
		else
			v21 = nil
		end
		v19.VignetteEnabled = v21
		local v22
		if game:GetEngineFeature("VRMoreComfortSettings") then
			v22 = v_u_3.createElement(v_u_10, {
				["LayoutOrder"] = nil,
				["labelKey"] = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled",
				["customValueKey"] = "VRSmoothRotationEnabledCustomOption",
				["derivedValueKey"] = "VRSmoothRotationEnabled",
				["checkedValue"] = false,
				["LayoutOrder"] = v15()
			})
		else
			v22 = nil
		end
		v19.VRSteppedRotationEnabled = v22
		local v23
		if game:GetEngineFeature("VRMoreComfortSettings") then
			v23 = v_u_3.createElement(v_u_10, {
				["LayoutOrder"] = nil,
				["labelKey"] = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled",
				["customValueKey"] = "VRThirdPersonFollowCamEnabledCustomOption",
				["derivedValueKey"] = "VRThirdPersonFollowCamEnabled",
				["checkedValue"] = false,
				["LayoutOrder"] = v15()
			})
		else
			v23 = nil
		end
		v19.VRThirdPersonFixedCamEnabled = v23
		return v16(v17, v18, v19)
	end)
end
return v4.UNSTABLE_connect2(nil, function(p_u_24)
	-- upvalues: (copy) v_u_9
	return {
		["closeMenu"] = function() -- name: closeMenu
			-- upvalues: (copy) p_u_24, (ref) v_u_9
			p_u_24(v_u_9)
		end
	}
end)(v12)