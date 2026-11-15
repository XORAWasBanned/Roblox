-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.CameraModeEntry
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("Players")
local v_u_3 = UserSettings():GetService("UserGameSettings")
local v_u_4 = v_u_3:GetPropertyChangedSignal("ComputerCameraMovementMode")
local v5 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v6 = require(v5.Modules.CoreUtility)
local v_u_7 = v2.LocalPlayer
local v_u_8 = v6.waitForChildOfClass(v_u_7, "PlayerScripts")
local v_u_9 = v_u_7:GetPropertyChangedSignal("DevComputerMovementMode")
local v10 = require(v1.Packages.InGameMenuDependencies)
local v_u_11 = v10.Roact
local v12 = v10.t
local v13 = script.Parent.Parent.Parent
local v_u_14 = require(v13.Components.DropDownSelection)
local v_u_15 = require(v13.Utility.ExternalEventConnection)
local v_u_16 = require(script.Parent.InputLabel)
local v_u_17 = require(script.Parent.DeveloperLockLabel)
local v_u_18 = require(v13.Localization.withLocalization)
local v_u_19 = require(v13.Utility.SendAnalytics)
local v_u_20 = require(v13.Resources.Constants)
local v_u_21 = {
	[Enum.ComputerCameraMovementMode.Classic] = "CoreScripts.InGameMenu.GameSettings.CameraModeClassic",
	[Enum.ComputerCameraMovementMode.Follow] = "CoreScripts.InGameMenu.GameSettings.CameraModeFollow",
	[Enum.ComputerCameraMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default",
	[Enum.ComputerCameraMovementMode.CameraToggle] = "CoreScripts.InGameMenu.GameSettings.CameraModeCameraToggle"
}
local v22 = v_u_11.PureComponent:extend("CameraModeEntry")
v22.validateProps = v12.strictInterface({
	["LayoutOrder"] = v12.integer,
	["canOpen"] = v12.optional(v12.boolean),
	["canCaptureFocus"] = v12.optional(v12.boolean),
	["ButtonRef"] = v12.optional(v12.union(v12.callback, v12.table))
})
v22.defaultProps = {
	["canOpen"] = true
}
function v22.init(p23) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_7
	p23:setState({
		["selectedComputerMode"] = v_u_3.ComputerCameraMovementMode,
		["computerOptions"] = v_u_8 and v_u_8:GetRegisteredComputerCameraMovementModes() or {},
		["developerComputerMode"] = v_u_7.DevComputerCameraMode
	})
end
function v22.render(p_u_24) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_4, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_21, (copy) v_u_16, (copy) v_u_18, (copy) v_u_14, (copy) v_u_19, (copy) v_u_20, (copy) v_u_17
	local v25 = {}
	local v26 = {
		["event"] = v_u_4,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_24, (ref) v_u_3
			p_u_24:setState({
				["selectedComputerMode"] = v_u_3.ComputerCameraMovementMode
			})
		end
	}
	v25.ComputerCameraMovementModeListener = v_u_11.createElement(v_u_15, v26)
	local v27 = v_u_8
	if v27 then
		v27 = v_u_11.createElement(v_u_15, {
			["event"] = v_u_8.ComputerCameraMovementModeRegistered,
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_24, (ref) v_u_8
				p_u_24:setState({
					["computerOptions"] = v_u_8:GetRegisteredComputerCameraMovementModes()
				})
			end
		})
	end
	v25.ComputerCameraMovementModeRegisteredListener = v27
	local v28 = {
		["event"] = v_u_9,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_24, (ref) v_u_7
			p_u_24:setState({
				["developerComputerMode"] = v_u_7.DevComputerCameraMode
			})
		end
	}
	v25.LocalPlayerComputerMovementMode = v_u_11.createElement(v_u_15, v28)
	if #p_u_24.state.computerOptions == 0 then
		return v_u_11.createFragment(v25)
	end
	local v_u_29 = p_u_24.state.developerComputerMode ~= Enum.DevComputerCameraMovementMode.UserChoice
	local v_u_30 = {}
	local v_u_31 = 0
	if not v_u_29 then
		for v32, v33 in ipairs(p_u_24.state.computerOptions) do
			v_u_30[v32] = v_u_21[v33]
			local v34 = v_u_30[v32] ~= nil
			local v35 = "Camera movement mode " .. v33.Name .. " has no localization key"
			assert(v34, v35)
			if p_u_24.state.selectedComputerMode.Value ~= v33.Value then
				continue
			end
			v_u_31 = v32
		end
	end
	local v36 = v_u_11.createElement
	local v37 = "Frame"
	local v38 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["ZIndex"] = 2,
		["Size"] = UDim2.new(1, 0, 0, 120),
		["LayoutOrder"] = p_u_24.props.LayoutOrder
	}
	local v39 = {
		["Padding"] = v_u_11.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 24),
			["PaddingRight"] = UDim.new(0, 24)
		}),
		["InputLabel"] = v_u_11.createElement(v_u_16, {
			["localizationKey"] = "CoreScripts.InGameMenu.GameSettings.CameraMode",
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 56),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0, 0)
		})
	}
	local v40 = v_u_18
	local v41 = {}
	local v42
	if v_u_29 then
		v42 = v_u_21[p_u_24.state.developerComputerMode] or nil
	else
		v42 = nil
	end
	v41.placeholder = v42
	v39.Dropdown = v40(v41)(function(_)
		-- upvalues: (ref) v_u_11, (ref) v_u_14, (copy) v_u_30, (ref) v_u_31, (copy) p_u_24, (copy) v_u_29, (ref) v_u_3, (ref) v_u_19, (ref) v_u_20
		return v_u_11.createElement(v_u_14, {
			["Size"] = nil,
			["Position"] = nil,
			["selections"] = nil,
			["selectedIndex"] = nil,
			["placeHolderText"] = nil,
			["enabled"] = nil,
			["localize"] = true,
			["selectionChanged"] = nil,
			["selectionParentName"] = "cameraModeDropdown",
			["canOpen"] = nil,
			["canCaptureFocus"] = nil,
			["ButtonRef"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 44),
			["Position"] = UDim2.new(0, 0, 0, 56),
			["selections"] = v_u_30,
			["selectedIndex"] = v_u_31,
			["placeHolderText"] = p_u_24.state.developerComputerMode.Name,
			["enabled"] = not v_u_29,
			["selectionChanged"] = function(p43) -- name: selectionChanged
				-- upvalues: (ref) v_u_3, (ref) p_u_24, (ref) v_u_19, (ref) v_u_20
				v_u_3.ComputerCameraMovementMode = p_u_24.state.computerOptions[p43]
				v_u_19(v_u_20.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			["canOpen"] = p_u_24.props.canOpen,
			["canCaptureFocus"] = p_u_24.props.canCaptureFocus,
			["ButtonRef"] = p_u_24.props.ButtonRef
		})
	end)
	if v_u_29 then
		v_u_29 = v_u_11.createElement(v_u_17, {
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["Size"] = UDim2.new(1, -72, 0.25, 0)
		})
	end
	v39.LockedLabel = v_u_29
	v25.CameraModeEntrySelector = v36(v37, v38, v39)
	return v_u_11.createFragment(v25)
end
return v22