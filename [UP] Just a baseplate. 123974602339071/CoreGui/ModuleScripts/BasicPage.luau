-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.BasicPage
local v1 = game:GetService("Players")
local v_u_2 = UserSettings():GetService("UserGameSettings")
local v_u_3 = game:GetService("GuiService")
local v4 = game:GetService("CorePackages")
local v5 = game:GetService("VRService")
local v_u_6 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_7 = game:GetService("UserInputService"):GetPlatform()
local v8 = require(v4.Packages.InGameMenuDependencies)
local v_u_9 = v8.Roact
local v10 = v8.RoactRodux
local v11 = v8.t
local v12 = v8.UIBlox
local v_u_13 = v1.LocalPlayer
local v_u_14 = v_u_13:GetPropertyChangedSignal("DevEnableMouseLock")
local v_u_15 = v_u_2:GetPropertyChangedSignal("IsUsingCameraYInverted")
local v_u_16 = require(script.Parent.Parent.Connection.FocusHandler)
local v17 = script.Parent.Parent.Parent
local v_u_18 = require(v17.Components.Divider)
local v_u_19 = require(v17.Utility.ExternalEventConnection)
local v_u_20 = require(v17.Components.Page)
local v_u_21 = require(v17.Components.ThemedTextLabel)
local v_u_22 = require(v17.Localization.withLocalization)
local v_u_23 = require(v17.Resources.Assets)
local v_u_24 = require(v17.Actions.SetCurrentPage)
local v_u_25 = require(script.Parent.AutoPropertyToggleEntry)
local v_u_26 = require(script.Parent.SafetyBubbleModeEntry)
local v_u_27
if game:GetEngineFeature("VRMoreComfortSettings") then
	v_u_27 = require(script.Parent.ComfortSettingsEntry)
else
	v_u_27 = nil
end
local v_u_28 = require(script.Parent.CameraModeEntry)
local v_u_29 = require(script.Parent.CameraSensitivityEntry)
local v_u_30 = require(script.Parent.CategoryHeader)
local v_u_31 = require(script.Parent.DeviceSelectionEntry)
local v_u_32 = require(script.Parent.GraphicsQualityEntry)
local v_u_33 = require(script.Parent.MovementModeEntry)
local v_u_34 = require(script.Parent.ToggleEntry)
local v_u_35 = require(script.Parent.VolumeEntry)
local v_u_36 = require(v17.Utility.SendAnalytics)
local v_u_37 = require(v17.Resources.Constants)
local v38 = require(v4.Packages.Foundation)
local v39 = require(v4.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_40
if v39 then
	v_u_40 = v38.UNSTABLE.withCursorMigration
else
	v_u_40 = v12.App.SelectionImage.withSelectionCursorProvider
end
local v_u_41
if v39 then
	v_u_41 = v38.Enums.CursorType
else
	v_u_41 = v12.App.SelectionImage.CursorKind
end
local v_u_42 = v12.Core.ImageSet.ImageSetLabel
local v43 = v17.Flags
local v_u_44 = require(v43.GetFFlagIGMGamepadSelectionHistory)
local v_u_45 = require(v_u_6.Modules.Flags.GetFFlagAlwaysShowVRToggle)
local v_u_46 = game:GetEngineFeature("VRMoreComfortSettings")
local v_u_47 = v_u_2:GetPropertyChangedSignal("VREnabled")
local v48 = require(v4.Workspace.Packages.AppCommonLib).IsVRAppBuild
local v49 = v_u_9.PureComponent:extend("BasicPage")
v49.validateProps = v11.strictInterface({
	["switchToAdvancedPage"] = v11.callback,
	["switchToVRComfortSettingsPage"] = v11.callback,
	["pageTitle"] = v11.string,
	["isMenuOpen"] = v11.boolean,
	["currentPage"] = v11.optional(v11.string),
	["canCaptureFocus"] = v11.optional(v11.boolean),
	["canGamepadCaptureFocus"] = v11.optional(v11.boolean),
	["vrService"] = v11.optional(v11.union(v11.Instance, v11.table)),
	["isVRAppBuild"] = v11.optional(v11.callback),
	["currentZone"] = v_u_44() and v11.optional(v11.number) or nil
})
v49.defaultProps = {
	["vrService"] = v5,
	["isVRAppBuild"] = v48
}
local v_u_50 = v_u_2.VREnabled
function v49.init(p51) -- name: init
	-- upvalues: (copy) v_u_13, (copy) v_u_2, (copy) v_u_9
	p51:setState({
		["shiftLockEnabled"] = nil,
		["fullScreenEnabled"] = nil,
		["invertedCameraEnabled"] = nil,
		["vrActive"] = nil,
		["vrEnabled"] = nil,
		["voiceChatEnabled"] = false,
		["shiftLockEnabled"] = v_u_13.DevEnableMouseLock,
		["fullScreenEnabled"] = v_u_2:InFullScreen(),
		["invertedCameraEnabled"] = v_u_2.IsUsingCameraYInverted,
		["vrActive"] = p51.props.vrService.VREnabled,
		["vrEnabled"] = v_u_2.VREnabled
	})
	local v52, v53 = v_u_9.createBinding(UDim2.new(0, 0, 0, 0))
	p51.pageSize = v52
	p51.setPageSize = v53
	p51.cameraModeButton = v_u_9.createRef()
	p51.volumeButton = v_u_9.createRef()
end
function v49.didUpdate(p54, p55) -- name: didUpdate
	-- upvalues: (copy) v_u_44, (copy) v_u_3
	if not v_u_44() and (p54.props.canCaptureFocus and (p54.props.canGamepadCaptureFocus and not (p55.canCaptureFocus and p55.canGamepadCaptureFocus))) then
		if not p54.state.vrActive then
			v_u_3.SelectedCoreObject = p54.cameraModeButton:getValue()
			return
		end
		v_u_3.SelectedCoreObject = p54.volumeButton:getValue()
	end
end
function v49.renderWithSelectionCursor(p_u_56, p57) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_45, (copy) v_u_7, (copy) v_u_2, (copy) v_u_9, (copy) v_u_20, (copy) v_u_44, (copy) v_u_16, (copy) v_u_37, (copy) v_u_3, (copy) v_u_30, (copy) v_u_46, (copy) v_u_25, (ref) v_u_27, (copy) v_u_22, (copy) v_u_21, (copy) v_u_42, (copy) v_u_23, (copy) v_u_50, (copy) v_u_26, (copy) v_u_18, (copy) v_u_28, (copy) v_u_29, (copy) v_u_33, (copy) v_u_35, (copy) v_u_31, (copy) v_u_32, (copy) v_u_34, (copy) v_u_36, (copy) v_u_41, (copy) v_u_19, (copy) v_u_14, (copy) v_u_13, (copy) v_u_15, (copy) v_u_47
	local v_u_58 = 0
	local function v59()
		-- upvalues: (ref) v_u_58
		v_u_58 = v_u_58 + 1
		return v_u_58
	end
	local v60 = p_u_56.state.voiceChatEnabled
	if v60 then
		v60 = not p_u_56.props.isVRAppBuild()
	end
	local v61
	if v_u_45() then
		v61 = v_u_7 == Enum.Platform.Windows and true or v_u_7 == Enum.Platform.UWP
	else
		v61 = p_u_56.state.vrActive or v_u_2.HasEverUsedVR
		if v61 then
			v61 = not p_u_56.props.isVRAppBuild()
		end
	end
	local v62 = v_u_9.createElement
	local v63 = v_u_20
	local v64 = {
		["pageTitle"] = p_u_56.props.pageTitle,
		["position"] = p_u_56.props.position
	}
	local v65 = {}
	local v66
	if v_u_44() then
		local v67 = v_u_9.createElement
		local v68 = v_u_16
		local v69 = {}
		local v70 = p_u_56.props.canCaptureFocus
		if v70 then
			v70 = p_u_56.props.canGamepadCaptureFocus
		end
		v69.isFocused = v70
		v69.shouldForgetPreviousSelection = p_u_56.props.currentPage == v_u_37.MainPagePageKey and true or p_u_56.props.currentZone == 0
		function v69.didFocus(p71) -- name: didFocus
			-- upvalues: (ref) v_u_3, (copy) p_u_56
			if p71 then
				v_u_3.SelectedCoreObject = p71
				return
			elseif p_u_56.state.vrActive then
				v_u_3.SelectedCoreObject = p_u_56.volumeButton:getValue()
			else
				v_u_3.SelectedCoreObject = p_u_56.cameraModeButton:getValue()
			end
		end
		v66 = v67(v68, v69) or nil
	else
		v66 = nil
	end
	v65.FocusHandler = v66
	local v72 = v_u_9.createElement
	local v73 = "ScrollingFrame"
	local v74 = {
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["CanvasSize"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Selectable"] = false,
		["CanvasSize"] = p_u_56.pageSize,
		["Position"] = p_u_56.props.position,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v76 = {
		["Layout"] = v_u_9.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			[v_u_9.Change.AbsoluteContentSize] = function(p75)
				-- upvalues: (copy) p_u_56
				p_u_56.setPageSize(UDim2.new(0, 0, 0, p75.AbsoluteContentSize.Y))
			end
		})
	}
	local v77
	if p_u_56.state.vrActive then
		v77 = v_u_9.createElement(v_u_30, {
			["LayoutOrder"] = nil,
			["localizationKey"] = "CoreScripts.InGameMenu.GameSettings.VrControlsTitle",
			["LayoutOrder"] = v59()
		})
	else
		v77 = nil
	end
	v76.VRControlsHeader = v77
	local v78
	if v_u_46 or not p_u_56.state.vrActive then
		v78 = nil
	else
		v78 = v_u_9.createElement(v_u_25, {
			["LayoutOrder"] = nil,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
			["instance"] = nil,
			["valueKey"] = "VignetteEnabled",
			["LayoutOrder"] = v59(),
			["instance"] = v_u_2
		})
	end
	v76.VignetteEnabled = v78
	local v79
	if v_u_46 or not p_u_56.state.vrActive then
		v79 = nil
	else
		v79 = v_u_9.createElement(v_u_25, {
			["LayoutOrder"] = nil,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.VRSmoothRotationEnabled",
			["instance"] = nil,
			["valueKey"] = "VRSmoothRotationEnabled",
			["LayoutOrder"] = v59(),
			["instance"] = v_u_2
		})
	end
	v76.VRSmoothRotationEnabled = v79
	local v80
	if v_u_46 and p_u_56.state.vrActive then
		v80 = v_u_9.createElement(v_u_27, {
			["LayoutOrder"] = v59()
		})
	else
		v80 = nil
	end
	v76.VRComfortSettings = v80
	local v81
	if v_u_46 and p_u_56.state.vrActive then
		v81 = v_u_9.createElement("TextButton", {
			["LayoutOrder"] = v59(),
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 54),
			["Text"] = "",
			[v_u_9.Event.Activated] = p_u_56.props.switchToVRComfortSettingsPage
		}, {
			["Text"] = v_u_22({
				["text"] = "CoreScripts.InGameMenu.GameSettings.SwitchToVRComfortSettings"
			})(function(p82)
				-- upvalues: (ref) v_u_9, (ref) v_u_21
				return v_u_9.createElement(v_u_21, {
					["Text"] = nil,
					["TextXAlignment"] = nil,
					["fontKey"] = "Body",
					["themeKey"] = "TextDefault",
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["Text"] = p82.text,
					["TextXAlignment"] = Enum.TextXAlignment.Left,
					["Size"] = UDim2.new(1, -96, 1, 0),
					["Position"] = UDim2.new(0, 24, 0.5, 0),
					["AnchorPoint"] = Vector2.new(0, 0.5)
				})
			end),
			["Icon"] = v_u_9.createElement(v_u_42, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = v_u_23.Images.NavigateForward,
				["Size"] = UDim2.new(0, 36, 0, 36),
				["Position"] = UDim2.new(1, -36, 0.5, 0),
				["AnchorPoint"] = Vector2.new(1, 0.5)
			})
		})
	else
		v81 = nil
	end
	v76.VRComfortSettingsPageButton = v81
	local v83
	if v61 then
		v83 = v_u_9.createElement(v_u_25, {
			["LayoutOrder"] = nil,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.VREnabled",
			["instance"] = nil,
			["valueKey"] = "VREnabled",
			["subtextEnabled"] = nil,
			["subtextKey"] = "CoreScripts.InGameMenu.GameSettings.RestartPending",
			["LayoutOrder"] = v59(),
			["instance"] = v_u_2,
			["subtextEnabled"] = p_u_56.state.vrEnabled ~= v_u_50
		})
	else
		v83 = nil
	end
	v76.VRMode = v83
	local v84
	if p_u_56.state.vrActive then
		v84 = v_u_9.createElement(v_u_26, {
			["LayoutOrder"] = v59()
		})
	else
		v84 = nil
	end
	v76.VRSafetyBubbleMode = v84
	local v85
	if p_u_56.state.vrActive then
		v85 = v_u_9.createElement(v_u_18, {
			["LayoutOrder"] = v59(),
			["Size"] = UDim2.new(1, -24, 0, 1)
		})
	else
		v85 = nil
	end
	v76.VRControlsDivider = v85
	local v86
	if p_u_56.state.vrActive then
		v86 = nil
	else
		v86 = v_u_9.createElement(v_u_30, {
			["LayoutOrder"] = nil,
			["localizationKey"] = "CoreScripts.InGameMenu.GameSettings.CameraTitle",
			["LayoutOrder"] = v59()
		})
	end
	v76.CameraHeader = v86
	local v87 = not p_u_56.state.vrActive
	if v87 then
		v87 = v_u_9.createElement(v_u_28, {
			["LayoutOrder"] = v59(),
			["ButtonRef"] = p_u_56.cameraModeButton,
			["canOpen"] = p_u_56.props.canCaptureFocus,
			["canCaptureFocus"] = p_u_56.props.canGamepadCaptureFocus
		})
	end
	v76.CameraMode = v87
	local v88 = not p_u_56.state.vrActive and p_u_56.state.invertedCameraEnabled
	if v88 then
		v88 = v_u_9.createElement(v_u_25, {
			["LayoutOrder"] = nil,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.InvertedCamera",
			["instance"] = nil,
			["valueKey"] = "CameraYInverted",
			["LayoutOrder"] = v59(),
			["instance"] = v_u_2
		})
	end
	v76.InvertedCamera = v88
	local v89 = not p_u_56.state.vrActive
	if v89 then
		local v90 = v_u_9.createElement
		local v91 = v_u_29
		local v92 = {
			["LayoutOrder"] = v59()
		}
		local v93 = p_u_56.props.canCaptureFocus
		if v93 then
			v93 = p_u_56.props.canGamepadCaptureFocus
		end
		v92.canCaptureFocus = v93
		v92.isMenuOpen = p_u_56.props.isMenuOpen
		v89 = v90(v91, v92)
	end
	v76.CameraSensitivity = v89
	local v94
	if p_u_56.state.vrActive then
		v94 = nil
	else
		v94 = v_u_9.createElement(v_u_18, {
			["LayoutOrder"] = v59(),
			["Size"] = UDim2.new(1, -24, 0, 1)
		})
	end
	v76.CameraDivider = v94
	v76.ControlsHeader = v_u_9.createElement(v_u_30, {
		["LayoutOrder"] = nil,
		["localizationKey"] = "CoreScripts.InGameMenu.GameSettings.ControlsAudio",
		["LayoutOrder"] = v59()
	})
	local v95 = not p_u_56.state.vrActive
	if v95 then
		v95 = v_u_9.createElement(v_u_25, {
			["LayoutOrder"] = nil,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.ShiftLock",
			["instance"] = nil,
			["valueKey"] = "ControlMode",
			["onValue"] = nil,
			["offValue"] = nil,
			["lockedToOff"] = nil,
			["LayoutOrder"] = v59(),
			["instance"] = v_u_2,
			["onValue"] = Enum.ControlMode.MouseLockSwitch,
			["offValue"] = Enum.ControlMode.Classic,
			["lockedToOff"] = not p_u_56.state.shiftLockEnabled
		})
	end
	v76.ShiftLock = v95
	local v96 = not p_u_56.state.vrActive
	if v96 then
		v96 = v_u_9.createElement(v_u_33, {
			["LayoutOrder"] = v59(),
			["canOpen"] = p_u_56.props.canCaptureFocus,
			["canCaptureFocus"] = p_u_56.props.canGamepadCaptureFocus
		})
	end
	v76.MovementMode = v96
	local v97 = v_u_9.createElement
	local v98 = v_u_35
	local v99 = {
		["LayoutOrder"] = v59(),
		["buttonRef"] = p_u_56.volumeButton
	}
	local v100 = p_u_56.props.canCaptureFocus
	if v100 then
		v100 = p_u_56.props.canGamepadCaptureFocus
	end
	v99.canCaptureFocus = v100
	v99.isMenuOpen = p_u_56.props.isMenuOpen
	v76.VolumeEntry = v97(v98, v99)
	v76.HapticsToggle = v_u_9.createElement(v_u_25, {
		["LayoutOrder"] = nil,
		["labelKey"] = "Feature.Accessibility.Header.Haptics",
		["instance"] = nil,
		["valueKey"] = "HapticStrength",
		["onValue"] = 1,
		["offValue"] = 0,
		["LayoutOrder"] = v59(),
		["instance"] = v_u_2
	})
	if v60 then
		local v101 = v_u_9.createElement(v_u_31, {
			["LayoutOrder"] = v59(),
			["deviceType"] = v_u_31.DeviceType.Input,
			["isMenuOpen"] = p_u_56.props.isMenuOpen,
			["canOpen"] = p_u_56.props.canCaptureFocus,
			["canCaptureFocus"] = p_u_56.props.canGamepadCaptureFocus
		})
	end
	v76.InputDevice = v101
	if v60 then
		v60 = v_u_9.createElement(v_u_31, {
			["LayoutOrder"] = v59(),
			["deviceType"] = v_u_31.DeviceType.Output,
			["isMenuOpen"] = p_u_56.props.isMenuOpen,
			["canOpen"] = p_u_56.props.canCaptureFocus,
			["canCaptureFocus"] = p_u_56.props.canGamepadCaptureFocus
		})
	end
	v76.OutputDevice = v60
	v76.ControlsDivider = v_u_9.createElement(v_u_18, {
		["LayoutOrder"] = v59(),
		["Size"] = UDim2.new(1, -24, 0, 1)
	})
	v76.GraphicsHeader = v_u_9.createElement(v_u_30, {
		["LayoutOrder"] = nil,
		["localizationKey"] = "CoreScripts.InGameMenu.GameSettings.GraphicsTitle",
		["LayoutOrder"] = v59()
	})
	local v102 = v_u_9.createElement
	local v103 = v_u_32
	local v104 = {
		["LayoutOrder"] = v59()
	}
	local v105 = p_u_56.props.canCaptureFocus
	if v105 then
		v105 = p_u_56.props.canGamepadCaptureFocus
	end
	v104.canCaptureFocus = v105
	v104.isMenuOpen = p_u_56.props.isMenuOpen
	v76.GraphicsQualityEntry = v102(v103, v104)
	local v106 = not p_u_56.state.vrActive
	if v106 then
		v106 = v_u_9.createElement(v_u_34, {
			["LayoutOrder"] = nil,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.FullScreen",
			["checked"] = nil,
			["onToggled"] = nil,
			["LayoutOrder"] = v59(),
			["checked"] = p_u_56.state.fullScreenEnabled,
			["onToggled"] = function() -- name: onToggled
				-- upvalues: (ref) v_u_3, (ref) v_u_36, (ref) v_u_37
				v_u_3:ToggleFullscreen()
				v_u_36(v_u_37.AnalyticsSettingsChangeName, nil, {}, true)
			end
		})
	end
	v76.FullScreen = v106
	v76.GraphicsDivider = v_u_9.createElement(v_u_18, {
		["LayoutOrder"] = v59(),
		["Size"] = UDim2.new(1, -24, 0, 1)
	})
	v76.AdvancedSettings = v_u_9.createElement("TextButton", {
		["LayoutOrder"] = v59(),
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 54),
		["Text"] = "",
		["SelectionImageObject"] = p57(v_u_41.Square),
		[v_u_9.Event.Activated] = p_u_56.props.switchToAdvancedPage
	}, {
		["Text"] = v_u_22({
			["text"] = "CoreScripts.InGameMenu.GameSettings.SwitchToAdvancedSettings"
		})(function(p107)
			-- upvalues: (ref) v_u_9, (ref) v_u_21
			return v_u_9.createElement(v_u_21, {
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["fontKey"] = "Body",
				["themeKey"] = "TextDefault",
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Text"] = p107.text,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Size"] = UDim2.new(1, -96, 1, 0),
				["Position"] = UDim2.new(0, 24, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0, 0.5)
			})
		end),
		["Icon"] = v_u_9.createElement(v_u_42, {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Image"] = v_u_23.Images.NavigateForward,
			["Size"] = UDim2.new(0, 36, 0, 36),
			["Position"] = UDim2.new(1, -36, 0.5, 0),
			["AnchorPoint"] = Vector2.new(1, 0.5)
		})
	})
	v76.AdvancedDivider = v_u_9.createElement(v_u_18, {
		["LayoutOrder"] = v59(),
		["Size"] = UDim2.new(1, -24, 0, 1)
	})
	local v108 = {
		["event"] = v_u_14,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_56, (ref) v_u_13
			p_u_56:setState({
				["shiftLockEnabled"] = v_u_13.DevEnableMouseLock
			})
		end
	}
	v76.ShiftLockEnabledListener = v_u_9.createElement(v_u_19, v108)
	v76.FullScreenListener = v_u_9.createElement(v_u_19, {
		["event"] = v_u_2.FullscreenChanged,
		["callback"] = function(p109) -- name: callback
			-- upvalues: (copy) p_u_56, (ref) v_u_36, (ref) v_u_37
			p_u_56:setState({
				["fullScreenEnabled"] = p109
			})
			v_u_36(v_u_37.AnalyticsInGameMenuName, v_u_37.AnalyticsFullscreenModeName, {
				["enabled"] = p109
			})
		end
	})
	local v110 = {
		["event"] = v_u_15,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_56, (ref) v_u_2
			p_u_56:setState({
				["invertedCameraEnabled"] = v_u_2.IsUsingCameraYInverted
			})
		end
	}
	v76.CameraYInvertedListener = v_u_9.createElement(v_u_19, v110)
	v76.VRActiveListener = v_u_9.createElement(v_u_19, {
		["event"] = p_u_56.props.vrService:GetPropertyChangedSignal("VREnabled"),
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_56, (ref) v_u_2
			if p_u_56.props.vrService.VREnabled then
				v_u_2.HasEverUsedVR = true
			end
			p_u_56:setState({
				["vrActive"] = p_u_56.props.vrService.VREnabled
			})
		end
	})
	local v111 = {
		["event"] = v_u_47,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_56, (ref) v_u_2
			p_u_56:setState({
				["vrEnabled"] = v_u_2.VREnabled
			})
		end
	}
	v76.VREnabledListener = v_u_9.createElement(v_u_19, v111)
	v65.PageContents = v72(v73, v74, v76)
	return v62(v63, v64, v65)
end
function v49.render(p_u_112) -- name: render
	-- upvalues: (copy) v_u_40
	return v_u_40(function(p113)
		-- upvalues: (copy) p_u_112
		return p_u_112:renderWithSelectionCursor(p113)
	end)
end
function v49.didMount(p_u_114) -- name: didMount
	-- upvalues: (copy) v_u_6
	spawn(function()
		-- upvalues: (ref) v_u_6, (copy) p_u_114
		require(v_u_6.Modules.VoiceChat.VoiceChatServiceManager).default:asyncInit():andThen(function()
			-- upvalues: (ref) p_u_114
			p_u_114:setState({
				["voiceChatEnabled"] = true
			})
		end):catch(function() end)
	end)
end
return v10.UNSTABLE_connect2(function(p115)
	-- upvalues: (copy) v_u_37, (copy) v_u_44
	local v116 = p115.menuPage == "GameSettings" and p115.isMenuOpen
	if v116 then
		v116 = not p115.respawn.dialogOpen
	end
	local v117
	if p115.displayOptions.inputType == v_u_37.InputType.Gamepad then
		v117 = p115.currentZone == 1
	else
		v117 = false
	end
	local v118
	if v_u_44() then
		v118 = p115.currentZone
	else
		v118 = nil
	end
	return {
		["isMenuOpen"] = p115.isMenuOpen,
		["currentPage"] = p115.menuPage,
		["currentZone"] = v118,
		["canCaptureFocus"] = v116,
		["canGamepadCaptureFocus"] = v117
	}
end, function(p_u_119)
	-- upvalues: (copy) v_u_24, (copy) v_u_37
	return {
		["switchToAdvancedPage"] = function() -- name: switchToAdvancedPage
			-- upvalues: (copy) p_u_119, (ref) v_u_24, (ref) v_u_37
			p_u_119(v_u_24(v_u_37.advancedSettingsPageKey))
		end,
		["switchToVRComfortSettingsPage"] = function() -- name: switchToVRComfortSettingsPage
			-- upvalues: (copy) p_u_119, (ref) v_u_24, (ref) v_u_37
			p_u_119(v_u_24(v_u_37.vrComfortSettingsPageKey))
		end
	}
end)(v49)