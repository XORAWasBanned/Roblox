-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.MovementModeEntry
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("Players")
local v_u_3 = UserSettings():GetService("UserGameSettings")
local v_u_4 = v_u_3:GetPropertyChangedSignal("ComputerMovementMode")
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
	[Enum.ComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse",
	[Enum.ComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove",
	[Enum.ComputerMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default"
}
local v_u_22 = {
	[Enum.DevComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse",
	[Enum.DevComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove"
}
local v23 = v_u_11.PureComponent:extend("MovementModeEntry")
v23.validateProps = v12.strictInterface({
	["LayoutOrder"] = v12.integer,
	["canOpen"] = v12.optional(v12.boolean),
	["canCaptureFocus"] = v12.optional(v12.boolean)
})
v23.defaultProps = {
	["canOpen"] = true
}
function v23.init(p24) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_7
	p24:setState({
		["selectedComputerMode"] = v_u_3.ComputerMovementMode,
		["computerOptions"] = v_u_8 and v_u_8:GetRegisteredComputerMovementModes() or {},
		["developerComputerMode"] = v_u_7.DevComputerMovementMode
	})
end
function v23.render(p_u_25) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_4, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_21, (copy) v_u_16, (copy) v_u_18, (copy) v_u_22, (copy) v_u_14, (copy) v_u_19, (copy) v_u_20, (copy) v_u_17
	local v26 = {}
	local v27 = {
		["event"] = v_u_4,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_25, (ref) v_u_3
			p_u_25:setState({
				["selectedComputerMode"] = v_u_3.ComputerMovementMode
			})
		end
	}
	v26.ComputerMovementModeListener = v_u_11.createElement(v_u_15, v27)
	local v28 = v_u_8
	if v28 then
		v28 = v_u_11.createElement(v_u_15, {
			["event"] = v_u_8.ComputerMovementModeRegistered,
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_25, (ref) v_u_8
				p_u_25:setState({
					["computerOptions"] = v_u_8:GetRegisteredComputerMovementModes()
				})
			end
		})
	end
	v26.ComputerMovementModeRegisteredListener = v28
	local v29 = {
		["event"] = v_u_9,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_25, (ref) v_u_7
			p_u_25:setState({
				["developerComputerMode"] = v_u_7.DevComputerMovementMode
			})
		end
	}
	v26.DevComputerMovementMode = v_u_11.createElement(v_u_15, v29)
	if #p_u_25.state.computerOptions == 0 then
		return v_u_11.createFragment(v26)
	end
	local v_u_30 = p_u_25.state.developerComputerMode ~= Enum.DevComputerMovementMode.UserChoice
	local v_u_31 = {}
	local v_u_32 = 0
	if not v_u_30 then
		for v33, v34 in ipairs(p_u_25.state.computerOptions) do
			v_u_31[v33] = v_u_21[v34]
			local v35 = v_u_31[v33] ~= nil
			local v36 = "Movement mode " .. v34.Name .. " has no localization key"
			assert(v35, v36)
			if p_u_25.state.selectedComputerMode.Value ~= v34.Value then
				continue
			end
			v_u_32 = v33
		end
	end
	local v37 = v_u_11.createElement
	local v38 = "Frame"
	local v39 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["ZIndex"] = 2,
		["Size"] = UDim2.new(1, 0, 0, 120),
		["LayoutOrder"] = p_u_25.props.LayoutOrder
	}
	local v40 = {
		["Padding"] = v_u_11.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 24),
			["PaddingRight"] = UDim.new(0, 24)
		}),
		["InputLabel"] = v_u_11.createElement(v_u_16, {
			["localizationKey"] = "CoreScripts.InGameMenu.GameSettings.MovementMode",
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 56),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0, 0)
		})
	}
	local v41 = v_u_18
	local v42 = {}
	local v43
	if v_u_30 then
		v43 = v_u_22[p_u_25.state.developerComputerMode] or nil
	else
		v43 = nil
	end
	v42.placeholder = v43
	v40.Dropdown = v41(v42)(function(p44)
		-- upvalues: (ref) v_u_11, (ref) v_u_14, (copy) v_u_31, (ref) v_u_32, (copy) v_u_30, (copy) p_u_25, (ref) v_u_3, (ref) v_u_19, (ref) v_u_20
		return v_u_11.createElement(v_u_14, {
			["Size"] = nil,
			["Position"] = nil,
			["selections"] = nil,
			["selectedIndex"] = nil,
			["placeHolderText"] = nil,
			["enabled"] = nil,
			["localize"] = true,
			["selectionParentName"] = "MovementModeEntryDropdown",
			["canOpen"] = nil,
			["canCaptureFocus"] = nil,
			["selectionChanged"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 44),
			["Position"] = UDim2.new(0, 0, 0, 56),
			["selections"] = v_u_31,
			["selectedIndex"] = v_u_32,
			["placeHolderText"] = p44.placeholder,
			["enabled"] = not v_u_30,
			["canOpen"] = p_u_25.props.canOpen,
			["canCaptureFocus"] = p_u_25.props.canCaptureFocus,
			["selectionChanged"] = function(p45) -- name: selectionChanged
				-- upvalues: (ref) v_u_3, (ref) p_u_25, (ref) v_u_19, (ref) v_u_20
				v_u_3.ComputerMovementMode = p_u_25.state.computerOptions[p45]
				v_u_19(v_u_20.AnalyticsSettingsChangeName, nil, {}, true)
			end
		})
	end)
	if v_u_30 then
		v_u_30 = v_u_11.createElement(v_u_17, {
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["Size"] = UDim2.new(1, -72, 0.25, 0)
		})
	end
	v40.LockedLabel = v_u_30
	v26.MovementModeEntrySelector = v37(v38, v39, v40)
	return v_u_11.createFragment(v26)
end
return v23