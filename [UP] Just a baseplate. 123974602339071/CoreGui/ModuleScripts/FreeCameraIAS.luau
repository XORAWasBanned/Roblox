-- Path: CoreGui.RobloxGui.Modules.Server.FreeCamera.FreeCameraIAS
local v_u_1 = math.clamp
local v_u_2 = math.exp
local v_u_3 = math.rad
local v_u_4 = math.sqrt
local v_u_5 = math.tan
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("RunService")
local v_u_8 = game:GetService("StarterGui")
local v_u_9 = game:GetService("StarterPlayer")
local v_u_10 = game:GetService("UserInputService")
local v_u_11 = game:GetService("Workspace")
local v_u_12 = game:GetService("Lighting")
local v13, v14 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor1")
end)
local v15 = v13 and v14
local v_u_16 = {
	["AttributeName"] = "FreecamEnabled",
	["Thumbstick"] = nil,
	["DoubleTap"] = nil,
	["PlayerLock"] = nil,
	["Movement"] = nil,
	["Pan"] = nil,
	["Fov"] = nil,
	["Roll"] = nil,
	["DoF"] = nil,
	["Bloom"] = nil,
	["Blur"] = nil,
	["ColorCorrection"] = nil,
	["SunRays"] = nil,
	["Keys"] = nil,
	["Thumbstick"] = {
		["Curvature"] = 2
	},
	["DoubleTap"] = {
		["Threshold"] = 0.25,
		["Debounce"] = 0.1
	},
	["PlayerLock"] = {
		["DefaultZoom"] = 20,
		["MinZoom"] = 5,
		["MaxZoom"] = 50,
		["DefaultHeight"] = 0,
		["HeightRange"] = 10
	},
	["Movement"] = {
		["Gain"] = Vector3.new(64, 64, 64),
		["AdjSpeed"] = 0.75,
		["MinSpeed"] = 0.01,
		["MaxSpeed"] = 4,
		["ShiftMul"] = 0.25,
		["Stiffness"] = 1.5,
		["AdjStiffness"] = 0.75,
		["MinStiffness"] = 0.01,
		["MaxStiffness"] = 10
	},
	["Pan"] = {
		["Gain"] = nil,
		["MouseScale"] = nil,
		["TrackpadScale"] = nil,
		["GamepadScale"] = nil,
		["AdjSpeed"] = 0.75,
		["MinSpeed"] = 0.01,
		["MaxSpeed"] = 4,
		["Stiffness"] = 1,
		["AdjStiffness"] = 0.75,
		["MinStiffness"] = 0.01,
		["MaxStiffness"] = 10,
		["Gain"] = Vector2.new(0.75, 1) * 8,
		["MouseScale"] = Vector2.new(0.0008181230868723419, -0.0008181230868723419),
		["TrackpadScale"] = Vector2.new(0.011453723216212788, -0.011453723216212788),
		["GamepadScale"] = Vector2.new(0.39269908169872414, 0.39269908169872414)
	},
	["Fov"] = {
		["Gain"] = 300,
		["WheelScale"] = -0.01667,
		["PinchScale"] = -0.008,
		["GamepadScale"] = 0.25,
		["AdjSpeed"] = 0.75,
		["MinSpeed"] = 0.01,
		["MaxSpeed"] = 4,
		["Stiffness"] = 4,
		["AdjStiffness"] = 0.75,
		["MinStiffness"] = 0.01,
		["MaxStiffness"] = 10
	},
	["Roll"] = {
		["Gain"] = -1.5707963267948966,
		["AdjSpeed"] = 0.75,
		["MinSpeed"] = 0.01,
		["MaxSpeed"] = 4,
		["Stiffness"] = 1,
		["AdjStiffness"] = 0.75,
		["MinStiffness"] = 0.01,
		["MaxStiffness"] = 10
	},
	["DoF"] = {
		["FarIntensity"] = {
			["Adj"] = 0.1,
			["Min"] = 0,
			["Max"] = 1
		},
		["NearIntensity"] = {
			["Adj"] = 0.1,
			["Min"] = 0,
			["Max"] = 1
		},
		["FocusDistance"] = {
			["Adj"] = 20,
			["Min"] = 0,
			["Max"] = 200
		},
		["FocusRadius"] = {
			["Adj"] = 5,
			["Min"] = 0,
			["Max"] = 50
		}
	},
	["Bloom"] = {
		["Intensity"] = {
			["Adj"] = 0.05,
			["Min"] = 0,
			["Max"] = 1
		},
		["Size"] = {
			["Adj"] = 2,
			["Min"] = 0,
			["Max"] = 56
		},
		["Threshold"] = {
			["Adj"] = 0.05,
			["Min"] = nil,
			["Max"] = nil,
			["Min"] = v15 and 0.8 or 0,
			["Max"] = v15 and 4 or 1
		}
	},
	["Blur"] = {
		["Size"] = {
			["Adj"] = 2,
			["Min"] = 0,
			["Max"] = 56
		}
	},
	["ColorCorrection"] = {
		["Brightness"] = {
			["Adj"] = 0.05,
			["Min"] = -1,
			["Max"] = 1
		},
		["Contrast"] = {
			["Adj"] = 0.05,
			["Min"] = -1,
			["Max"] = 1
		},
		["Saturation"] = {
			["Adj"] = 0.05,
			["Min"] = -1,
			["Max"] = 1
		}
	},
	["SunRays"] = {
		["Intensity"] = {
			["Adj"] = 0.05,
			["Min"] = 0,
			["Max"] = 1
		},
		["Spread"] = {
			["Adj"] = 0.05,
			["Min"] = 0,
			["Max"] = 1
		}
	},
	["Keys"] = {
		["Toggle"] = {
			["Keyboard"] = Enum.KeyCode.P,
			["Modifier"] = Enum.KeyCode.LeftShift
		},
		["Pan"] = {
			["Mouse"] = Enum.KeyCode.MouseDelta,
			["Trackpad"] = Enum.KeyCode.TrackpadPan,
			["Gamepad"] = Enum.KeyCode.Thumbstick2
		},
		["MovementMove"] = {
			["Keyboard"] = {
				["Up"] = Enum.KeyCode.W,
				["Down"] = Enum.KeyCode.S,
				["Left"] = Enum.KeyCode.A,
				["Right"] = Enum.KeyCode.D
			},
			["Gamepad"] = Enum.KeyCode.Thumbstick1
		},
		["MovementElevate"] = {
			["Keyboard"] = {
				["Up"] = Enum.KeyCode.E,
				["Down"] = Enum.KeyCode.Q
			},
			["Gamepad"] = {
				["Up"] = Enum.KeyCode.ButtonR2,
				["Down"] = Enum.KeyCode.ButtonL2
			}
		},
		["ModeSelect"] = {
			["Toggle"] = {
				["Keyboard"] = Enum.KeyCode.Up,
				["Gamepad"] = Enum.KeyCode.DPadUp
			},
			["Next"] = {
				["Keyboard"] = Enum.KeyCode.Down,
				["Gamepad"] = Enum.KeyCode.DPadDown
			},
			["Axis"] = {
				["Up"] = {
					["Keyboard"] = Enum.KeyCode.Right,
					["Gamepad"] = Enum.KeyCode.DPadRight
				},
				["Down"] = {
					["Keyboard"] = Enum.KeyCode.Left,
					["Gamepad"] = Enum.KeyCode.DPadLeft
				}
			}
		},
		["Fov"] = {
			["Mouse"] = Enum.KeyCode.MouseWheel,
			["TrackpadPinch"] = Enum.KeyCode.TrackpadPinch,
			["Gamepad"] = {
				["Up"] = Enum.KeyCode.ButtonX,
				["Down"] = Enum.KeyCode.ButtonY
			}
		},
		["Tilt"] = {
			["Keyboard"] = {
				["Up"] = Enum.KeyCode.C,
				["Down"] = Enum.KeyCode.Z
			},
			["Gamepad"] = {
				["Up"] = Enum.KeyCode.ButtonR1,
				["Down"] = Enum.KeyCode.ButtonL1
			}
		},
		["Shift"] = {
			["KeyboardPrimary"] = Enum.KeyCode.LeftShift,
			["KeyboardSecondary"] = Enum.KeyCode.RightShift
		}
	}
}
v_u_16.Actions = {
	["Toggle"] = {
		["name"] = "FreecamToggleAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Bool,
		["bindings"] = {
			{
				["keyCode"] = v_u_16.Keys.Toggle.Keyboard,
				["primaryModifier"] = v_u_16.Keys.Toggle.Modifier
			}
		}
	},
	["Pan"] = {
		["name"] = "PanAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Direction2D,
		["bindings"] = {
			{
				["keyCode"] = v_u_16.Keys.Pan.Mouse,
				["vector2Scale"] = v_u_16.Pan.MouseScale
			},
			{
				["keyCode"] = v_u_16.Keys.Pan.Trackpad,
				["vector2Scale"] = v_u_16.Pan.TrackpadScale
			},
			{
				["keyCode"] = v_u_16.Keys.Pan.Gamepad,
				["responseCurve"] = v_u_16.Thumbstick.Curvature,
				["vector2Scale"] = v_u_16.Pan.GamepadScale
			}
		}
	},
	["MovementMove"] = {
		["name"] = "MovementMoveAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Direction2D,
		["bindings"] = {
			{
				["up"] = v_u_16.Keys.MovementMove.Keyboard.Up,
				["down"] = v_u_16.Keys.MovementMove.Keyboard.Down,
				["left"] = v_u_16.Keys.MovementMove.Keyboard.Left,
				["right"] = v_u_16.Keys.MovementMove.Keyboard.Right
			},
			{
				["keyCode"] = v_u_16.Keys.MovementMove.Gamepad,
				["responseCurve"] = v_u_16.Thumbstick.Curvature
			}
		}
	},
	["MovementElevate"] = {
		["name"] = "MovementElevateAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Direction1D,
		["bindings"] = {
			{
				["up"] = v_u_16.Keys.MovementElevate.Keyboard.Up,
				["down"] = v_u_16.Keys.MovementElevate.Keyboard.Down
			},
			{
				["up"] = v_u_16.Keys.MovementElevate.Gamepad.Up,
				["down"] = v_u_16.Keys.MovementElevate.Gamepad.Down
			}
		}
	},
	["Fov"] = {
		["name"] = "FovAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Direction1D,
		["bindings"] = {
			{
				["keyCode"] = v_u_16.Keys.Fov.Mouse,
				["scale"] = v_u_16.Fov.WheelScale
			},
			{
				["keyCode"] = v_u_16.Keys.Fov.TrackpadPinch,
				["scale"] = v_u_16.Fov.PinchScale
			},
			{
				["up"] = v_u_16.Keys.Fov.Gamepad.Up,
				["down"] = v_u_16.Keys.Fov.Gamepad.Down,
				["scale"] = v_u_16.Fov.GamepadScale
			}
		}
	},
	["Tilt"] = {
		["name"] = "TiltAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Direction1D,
		["bindings"] = {
			{
				["up"] = v_u_16.Keys.Tilt.Keyboard.Up,
				["down"] = v_u_16.Keys.Tilt.Keyboard.Down
			},
			{
				["up"] = v_u_16.Keys.Tilt.Gamepad.Up,
				["down"] = v_u_16.Keys.Tilt.Gamepad.Down
			}
		}
	},
	["Shift"] = {
		["name"] = "ShiftAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Bool,
		["bindings"] = {
			{
				["keyCode"] = v_u_16.Keys.Shift.KeyboardPrimary
			},
			{
				["keyCode"] = v_u_16.Keys.Shift.KeyboardSecondary
			}
		}
	},
	["ModeToggle"] = {
		["name"] = "ModeToggleAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Bool,
		["bindings"] = {
			{
				["keyCode"] = v_u_16.Keys.ModeSelect.Toggle.Keyboard
			},
			{
				["keyCode"] = v_u_16.Keys.ModeSelect.Toggle.Gamepad
			}
		}
	},
	["ModeNext"] = {
		["name"] = "ModeNextAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Bool,
		["bindings"] = {
			{
				["keyCode"] = v_u_16.Keys.ModeSelect.Next.Keyboard
			},
			{
				["keyCode"] = v_u_16.Keys.ModeSelect.Next.Gamepad
			}
		}
	},
	["ModeAxis"] = {
		["name"] = "ModeAxisAction",
		["type"] = nil,
		["bindings"] = nil,
		["type"] = Enum.InputActionType.Direction1D,
		["bindings"] = {
			{
				["up"] = v_u_16.Keys.ModeSelect.Axis.Up.Keyboard,
				["down"] = v_u_16.Keys.ModeSelect.Axis.Down.Keyboard
			},
			{
				["up"] = v_u_16.Keys.ModeSelect.Axis.Up.Gamepad,
				["down"] = v_u_16.Keys.ModeSelect.Axis.Down.Gamepad
			}
		}
	}
}
local v_u_17 = v_u_6.LocalPlayer
if not v_u_17 then
	v_u_6:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v_u_17 = v_u_6.LocalPlayer
end
local v_u_18 = nil
local v_u_19 = v_u_11.CurrentCamera
v_u_11:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (copy) v_u_11, (ref) v_u_19
	local v20 = v_u_11.CurrentCamera
	if v20 then
		v_u_19 = v20
	end
end)
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = {
	["DepthOfField"] = {
		["Enabled"] = false,
		["FarIntensity"] = 0.75,
		["NearIntensity"] = 0.75,
		["FocusDistance"] = 0.05,
		["InFocusRadius"] = 10
	},
	["Bloom"] = {
		["Enabled"] = false,
		["Intensity"] = 0.4,
		["Size"] = 24,
		["Threshold"] = 0.95
	},
	["Blur"] = {
		["Enabled"] = false,
		["Size"] = 24
	},
	["ColorCorrection"] = {
		["Enabled"] = false,
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = nil,
		["TintColor"] = Color3.new(1, 1, 1)
	},
	["SunRays"] = {
		["Enabled"] = false,
		["Intensity"] = 0.25,
		["Spread"] = 1
	},
	["ColorGrading"] = {
		["Enabled"] = false,
		["TonemapperPreset"] = nil,
		["TonemapperPreset"] = Enum.TonemapperPreset.Default
	}
}
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v31, v32 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
local v_u_33 = v31 and v32
local v34, v35 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsRefactor4")
end)
local v_u_36 = v34 and v35
local v37, v38 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPlayerScriptsRefactor5")
end)
local v_u_39 = v37 and v38
local v40, v41 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor2")
end)
local v_u_42 = v40 and v41
local v43, v44 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor3")
end)
local v_u_45 = v43 and v44
local v46, v47 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamIASRefactor4")
end)
local v_u_48 = v46 and v47
local function v59(p_u_49, p_u_50) -- name: makeEffectOverride
	-- upvalues: (ref) v_u_19, (copy) v_u_12
	local v_u_51 = {}
	local v_u_52 = nil
	local v_u_53 = nil
	return function() -- name: enable
		-- upvalues: (ref) v_u_51, (ref) v_u_19, (copy) p_u_49, (copy) p_u_50, (ref) v_u_12, (ref) v_u_52, (ref) v_u_53
		v_u_51 = {}
		for _, v54 in ipairs(v_u_19:GetChildren()) do
			if not v54:IsA(p_u_49) or (not v54.Enabled or p_u_50 and p_u_50(v54)) then
				continue
			end
			v_u_51[#v_u_51 + 1] = v54
			v54.Enabled = false
		end
		for _, v55 in ipairs(v_u_12:GetChildren()) do
			if not v55:IsA(p_u_49) or (not v55.Enabled or p_u_50 and p_u_50(v55)) then
				continue
			end
			v_u_51[#v_u_51 + 1] = v55
			v55.Enabled = false
		end
		v_u_52 = v_u_19.ChildAdded:Connect(function(p56)
			-- upvalues: (ref) p_u_49, (ref) p_u_50, (ref) v_u_51
			if p56:IsA(p_u_49) and (p56.Enabled and not (p_u_50 and p_u_50(p56))) then
				v_u_51[#v_u_51 + 1] = p56
				p56.Enabled = false
			end
		end)
		v_u_53 = v_u_12.ChildAdded:Connect(function(p57)
			-- upvalues: (ref) p_u_49, (ref) p_u_50, (ref) v_u_51
			if p57:IsA(p_u_49) and (p57.Enabled and not (p_u_50 and p_u_50(p57))) then
				v_u_51[#v_u_51 + 1] = p57
				p57.Enabled = false
			end
		end)
	end, function() -- name: disable
		-- upvalues: (ref) v_u_51, (ref) v_u_52, (ref) v_u_53
		for _, v58 in ipairs(v_u_51) do
			if not v58.Parent then
				continue
			end
			v58.Enabled = true
		end
		if v_u_52 then
			v_u_52:Disconnect()
			v_u_52 = nil
		end
		if v_u_53 then
			v_u_53:Disconnect()
			v_u_53 = nil
		end
		v_u_51 = {}
	end
end
local v_u_60 = false
local v_u_62, v_u_63 = v59("PostEffect", function(p61)
	return p61.Name:sub(1, 7) == "Freecam"
end)
local v_u_64 = nil
local function v_u_67() -- name: doToggleMasterEffects
	-- upvalues: (ref) v_u_60, (copy) v_u_62, (copy) v_u_63, (ref) v_u_64
	v_u_60 = not v_u_60
	if v_u_60 then
		v_u_62()
	else
		v_u_63()
		for _, v65 in ipairs(v_u_64) do
			local v66 = v65.get()
			if not v66 then
				continue
			end
			v66.Enabled = false
		end
	end
end
local function v_u_69() -- name: doToggleDoF
	-- upvalues: (ref) v_u_36, (ref) v_u_60, (ref) v_u_21
	if not v_u_36 or v_u_60 then
		local v68 = v_u_21
		if v68 then
			v68.Enabled = not v68.Enabled
		end
	end
end
local function v_u_71() -- name: doToggleBloom
	-- upvalues: (ref) v_u_36, (ref) v_u_60, (ref) v_u_22
	if not v_u_36 or v_u_60 then
		local v70 = v_u_22
		if v70 then
			v70.Enabled = not v70.Enabled
		end
	end
end
local function v_u_73() -- name: doToggleBlur
	-- upvalues: (ref) v_u_36, (ref) v_u_60, (ref) v_u_23
	if not v_u_36 or v_u_60 then
		local v72 = v_u_23
		if v72 then
			v72.Enabled = not v72.Enabled
		end
	end
end
local function v_u_75() -- name: doToggleColorCorrection
	-- upvalues: (ref) v_u_36, (ref) v_u_60, (ref) v_u_24
	if not v_u_36 or v_u_60 then
		local v74 = v_u_24
		if v74 then
			v74.Enabled = not v74.Enabled
		end
	end
end
local function v_u_77() -- name: doToggleSunRays
	-- upvalues: (ref) v_u_36, (ref) v_u_60, (ref) v_u_25
	if not v_u_36 or v_u_60 then
		local v76 = v_u_25
		if v76 then
			v76.Enabled = not v76.Enabled
		end
	end
end
local function v_u_79() -- name: doToggleColorGrading
	-- upvalues: (ref) v_u_36, (ref) v_u_60, (ref) v_u_26
	if not v_u_36 or v_u_60 then
		local v78 = v_u_26
		if v78 then
			v78.Enabled = not v78.Enabled
		end
	end
end
v_u_64 = {
	{
		["key"] = "DepthOfField",
		["class"] = "DepthOfFieldEffect",
		["get"] = nil,
		["set"] = nil,
		["props"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_21
			return v_u_21
		end,
		["set"] = function(p80) -- name: set
			-- upvalues: (ref) v_u_21
			v_u_21 = p80
		end,
		["props"] = {
			"FarIntensity",
			"NearIntensity",
			"FocusDistance",
			"InFocusRadius"
		}
	},
	{
		["key"] = "Bloom",
		["class"] = "BloomEffect",
		["get"] = nil,
		["set"] = nil,
		["props"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_22
			return v_u_22
		end,
		["set"] = function(p81) -- name: set
			-- upvalues: (ref) v_u_22
			v_u_22 = p81
		end,
		["props"] = { "Intensity", "Size", "Threshold" }
	},
	{
		["key"] = "Blur",
		["class"] = "BlurEffect",
		["get"] = nil,
		["set"] = nil,
		["props"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_23
			return v_u_23
		end,
		["set"] = function(p82) -- name: set
			-- upvalues: (ref) v_u_23
			v_u_23 = p82
		end,
		["props"] = { "Size" }
	},
	{
		["key"] = "ColorCorrection",
		["class"] = "ColorCorrectionEffect",
		["get"] = nil,
		["set"] = nil,
		["props"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_24
			return v_u_24
		end,
		["set"] = function(p83) -- name: set
			-- upvalues: (ref) v_u_24
			v_u_24 = p83
		end,
		["props"] = {
			"Brightness",
			"Contrast",
			"Saturation",
			"TintColor"
		}
	},
	{
		["key"] = "SunRays",
		["class"] = "SunRaysEffect",
		["get"] = nil,
		["set"] = nil,
		["props"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_25
			return v_u_25
		end,
		["set"] = function(p84) -- name: set
			-- upvalues: (ref) v_u_25
			v_u_25 = p84
		end,
		["props"] = { "Intensity", "Spread" }
	},
	{
		["key"] = "ColorGrading",
		["class"] = "ColorGradingEffect",
		["parent"] = nil,
		["get"] = nil,
		["set"] = nil,
		["props"] = nil,
		["parent"] = v_u_39 and v_u_12 or nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_26
			return v_u_26
		end,
		["set"] = function(p85) -- name: set
			-- upvalues: (ref) v_u_26
			v_u_26 = p85
		end,
		["props"] = { "TonemapperPreset" }
	}
}
local v_u_86 = nil
local v_u_87 = nil
local v_u_88 = nil
local v_u_89 = false
local v_u_90 = v_u_16.PlayerLock.DefaultZoom
local v_u_91 = v_u_16.PlayerLock.DefaultHeight
local v_u_92 = {}
local v_u_93 = 1
local v_u_94 = nil
local v_u_95 = false
local v_u_96 = false
local v_u_97 = (-1 / 0)
local v_u_98 = (-1 / 0)
local v_u_99 = {
	["movement"] = v_u_16.Movement.Stiffness,
	["pan"] = v_u_16.Pan.Stiffness,
	["fov"] = v_u_16.Fov.Stiffness,
	["roll"] = v_u_16.Roll.Stiffness
}
local v_u_100 = nil
local v_u_101 = {}
v_u_101.__index = v_u_101
function v_u_101.new(p102, p103) -- name: new
	-- upvalues: (copy) v_u_101
	local v104 = v_u_101
	local v105 = setmetatable({}, v104)
	v105.f = p102
	v105.p = p103
	v105.v = p103 * 0
	return v105
end
function v_u_101.Update(p106, p107, p108) -- name: Update
	-- upvalues: (copy) v_u_2
	local v109 = p106.f * 2 * 3.141592653589793
	local v110 = p106.p
	local v111 = p106.v
	local v112 = p108 - v110
	local v113 = v_u_2(-v109 * p107)
	local v114 = p108 + (v111 * p107 - v112 * (v109 * p107 + 1)) * v113
	local v115 = (v109 * p107 * (v112 * v109 - v111) + v111) * v113
	p106.p = v114
	p106.v = v115
	return v114
end
function v_u_101.SetFreq(p116, p117) -- name: SetFreq
	p116.f = p117
end
function v_u_101.Reset(p118, p119) -- name: Reset
	p118.p = p119
	p118.v = p119 * 0
end
local v_u_120 = Vector3.new()
local v_u_121 = Vector3.new()
local v_u_122 = 0
local v_u_123 = v_u_101.new(v_u_99.movement, (Vector3.new()))
local v_u_124 = v_u_101.new(v_u_99.pan, Vector2.new())
local v_u_125 = v_u_101.new(v_u_99.fov, 0)
local v_u_126 = v_u_101.new(v_u_99.roll, 0)
local v_u_127 = {}
local v_u_128 = {}
local v_u_129 = {
	["movement"] = 1,
	["pan"] = 1,
	["fov"] = 1,
	["roll"] = 1
}
local v_u_130 = false
local v_u_131 = nil
local v_u_132 = false
local v_u_133 = 1
local v_u_134 = {}
local v_u_135 = false
local v_u_136 = false
local function v_u_140(p137) -- name: findPlayerLockRootPart
	-- upvalues: (ref) v_u_92, (ref) v_u_93, (ref) v_u_89
	if not v_u_92 or #v_u_92 < 1 then
		return nil
	end
	for _ = 1, #v_u_92 do
		v_u_93 = (v_u_93 - 1 + p137) % #v_u_92 + 1
		local v138 = v_u_92[v_u_93]
		if v138 then
			v138 = v138.Character
		end
		if v138 then
			local v139 = v138:FindFirstChildOfClass("Humanoid")
			if v139 and v139.RootPart then
				return v139.RootPart
			end
		end
		if p137 ~= 0 then
			continue
		end
		p137 = 1
	end
	v_u_89 = false
	return nil
end
local v_u_141 = {
	{
		["name"] = "Custom",
		["color"] = nil
	},
	{
		["name"] = "White",
		["color"] = nil,
		["color"] = Color3.new(1, 1, 1)
	},
	{
		["name"] = "Warm",
		["color"] = nil,
		["color"] = Color3.fromRGB(255, 230, 200)
	},
	{
		["name"] = "Cool",
		["color"] = nil,
		["color"] = Color3.fromRGB(200, 220, 255)
	},
	{
		["name"] = "Red",
		["color"] = nil,
		["color"] = Color3.new(1, 0, 0)
	},
	{
		["name"] = "Green",
		["color"] = nil,
		["color"] = Color3.new(0, 1, 0)
	},
	{
		["name"] = "Blue",
		["color"] = nil,
		["color"] = Color3.new(0, 0, 1)
	},
	{
		["name"] = "Yellow",
		["color"] = nil,
		["color"] = Color3.new(1, 1, 0)
	},
	{
		["name"] = "Cyan",
		["color"] = nil,
		["color"] = Color3.new(0, 1, 1)
	},
	{
		["name"] = "Magenta",
		["color"] = nil,
		["color"] = Color3.new(1, 0, 1)
	},
	{
		["name"] = "Orange",
		["color"] = nil,
		["color"] = Color3.fromRGB(255, 140, 0)
	},
	{
		["name"] = "Purple",
		["color"] = nil,
		["color"] = Color3.fromRGB(128, 0, 255)
	}
}
local v_u_142 = 1
local v_u_143 = Color3.new(1, 1, 1)
local function v144() -- name: doTogglePlayerLock
	-- upvalues: (ref) v_u_89, (ref) v_u_90, (copy) v_u_16, (ref) v_u_91, (ref) v_u_94, (copy) v_u_140
	v_u_89 = not v_u_89
	if v_u_89 then
		v_u_90 = v_u_16.PlayerLock.DefaultZoom
		v_u_91 = v_u_16.PlayerLock.DefaultHeight
		v_u_94 = v_u_140(0)
	end
end
local function v146() -- name: doToggleScreenGuis
	-- upvalues: (ref) v_u_95, (ref) v_u_30, (ref) v_u_18
	v_u_95 = not v_u_95
	if v_u_30 then
		for _, v145 in pairs(v_u_30.getScreenGuis()) do
			if not v145.Parent or v145 == v_u_18 then
				continue
			end
			v145.Enabled = v_u_95
		end
	end
end
local function v147() -- name: doToggleLeaderboard
	-- upvalues: (ref) v_u_96, (copy) v_u_8
	v_u_96 = not v_u_96
	v_u_8:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, v_u_96)
end
local function v_u_160(p148, p149, p_u_150, p151, p152) -- name: makeEffectGroup
	local v154 = {
		{
			["type"] = "toggle",
			["name"] = "Enable",
			["toggle"] = nil,
			["isEnabled"] = nil,
			["toggle"] = p149,
			["isEnabled"] = function() -- name: isEnabled
				-- upvalues: (copy) p_u_150
				local v153 = p_u_150()
				if v153 then
					v153 = v153.Enabled
				end
				return v153
			end
		}
	}
	for _, v_u_155 in ipairs(p151 or {}) do
		v154[#v154 + 1] = {
			["type"] = "axis",
			["name"] = nil,
			["adj"] = nil,
			["min"] = nil,
			["max"] = nil,
			["get"] = nil,
			["set"] = nil,
			["name"] = v_u_155.name,
			["adj"] = v_u_155.adjCfg.Adj,
			["min"] = v_u_155.adjCfg.Min,
			["max"] = v_u_155.adjCfg.Max,
			["get"] = function() -- name: get
				-- upvalues: (copy) p_u_150, (copy) v_u_155
				local v156 = p_u_150()
				return v156 and v156[v_u_155.prop] or 0
			end,
			["set"] = function(p157) -- name: set
				-- upvalues: (copy) p_u_150, (copy) v_u_155
				local v158 = p_u_150()
				if v158 then
					v158[v_u_155.prop] = p157
				end
			end
		}
	end
	for _, v159 in ipairs(p152 or {}) do
		v154[#v154 + 1] = v159
	end
	return {
		["type"] = "group",
		["name"] = nil,
		["modes"] = nil,
		["name"] = p148,
		["modes"] = v154
	}
end
local function v_u_171(p_u_161) -- name: makeTintChannel
	-- upvalues: (ref) v_u_42, (ref) v_u_24, (ref) v_u_143, (ref) v_u_142
	return v_u_42 and {
		["type"] = "axis",
		["name"] = nil,
		["adj"] = 64,
		["min"] = 0,
		["max"] = 255,
		["format"] = "%.0f",
		["get"] = nil,
		["set"] = nil,
		["name"] = "Tint " .. p_u_161,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_24, (ref) v_u_143, (copy) p_u_161
			return (v_u_24 and v_u_24.TintColor or v_u_143)[p_u_161] * 255
		end,
		["set"] = function(p162) -- name: set
			-- upvalues: (ref) v_u_24, (ref) v_u_143, (copy) p_u_161, (ref) v_u_142
			local v163 = v_u_24 and v_u_24.TintColor or v_u_143
			local v164 = v163.R
			local v165 = v163.G
			local v166 = v163.B
			if p_u_161 == "R" then
				v164 = p162 / 255
			elseif p_u_161 == "G" then
				v165 = p162 / 255
			else
				v166 = p162 / 255
			end
			v_u_143 = Color3.new(v164, v165, v166)
			v_u_142 = 1
			if v_u_24 then
				v_u_24.TintColor = v_u_143
			end
		end
	} or {
		["type"] = "axis",
		["name"] = nil,
		["adj"] = 0.02,
		["min"] = 0,
		["max"] = 1,
		["get"] = nil,
		["set"] = nil,
		["name"] = "Tint " .. p_u_161,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_143, (copy) p_u_161
			return v_u_143[p_u_161]
		end,
		["set"] = function(p167) -- name: set
			-- upvalues: (ref) v_u_143, (copy) p_u_161, (ref) v_u_142, (ref) v_u_24
			local v168 = v_u_143.R
			local v169 = v_u_143.G
			local v170 = v_u_143.B
			if p_u_161 == "R" then
				v168 = p167
				p167 = v170
			elseif p_u_161 == "G" then
				v169 = p167
				p167 = v170
			end
			v_u_143 = Color3.new(v168, v169, p167)
			v_u_142 = 1
			if v_u_24 then
				v_u_24.TintColor = v_u_143
			end
		end
	}
end
local function v180(p172, p173, p_u_174, p_u_175, p_u_176) -- name: makeSpeedStiffnessGroup
	-- upvalues: (copy) v_u_129, (copy) v_u_99
	local v179 = {
		["type"] = "group",
		["name"] = nil,
		["modes"] = nil,
		["name"] = p172,
		["modes"] = {
			{
				["type"] = "axis",
				["name"] = "Speed",
				["adj"] = nil,
				["min"] = nil,
				["max"] = nil,
				["get"] = nil,
				["set"] = nil,
				["adj"] = p173.AdjSpeed,
				["min"] = p173.MinSpeed,
				["max"] = p173.MaxSpeed,
				["get"] = function() -- name: get
					-- upvalues: (ref) v_u_129, (copy) p_u_174
					return v_u_129[p_u_174]
				end,
				["set"] = function(p177) -- name: set
					-- upvalues: (ref) v_u_129, (copy) p_u_174
					v_u_129[p_u_174] = p177
				end
			},
			{
				["type"] = "axis",
				["name"] = "Stiffness",
				["adj"] = nil,
				["min"] = nil,
				["max"] = nil,
				["get"] = nil,
				["set"] = nil,
				["adj"] = p173.AdjStiffness,
				["min"] = p173.MinStiffness,
				["max"] = p173.MaxStiffness,
				["get"] = function() -- name: get
					-- upvalues: (ref) v_u_99, (copy) p_u_175
					return v_u_99[p_u_175]
				end,
				["set"] = function(p178) -- name: set
					-- upvalues: (ref) v_u_99, (copy) p_u_175, (copy) p_u_176
					v_u_99[p_u_175] = p178
					p_u_176:SetFreq(p178)
				end
			}
		}
	}
	return v179
end
local v194 = {
	(function() -- name: buildCustomEffectsGroup
		-- upvalues: (copy) v_u_67, (ref) v_u_60, (copy) v_u_160, (copy) v_u_69, (ref) v_u_21, (copy) v_u_16, (copy) v_u_71, (ref) v_u_22, (copy) v_u_73, (ref) v_u_23, (copy) v_u_75, (ref) v_u_24, (copy) v_u_141, (ref) v_u_142, (ref) v_u_143, (ref) v_u_42, (copy) v_u_171, (copy) v_u_77, (ref) v_u_25, (copy) v_u_79, (ref) v_u_26, (ref) v_u_36
		local v181 = {
			["type"] = "group",
			["name"] = "Custom Post Processing",
			["modes"] = nil
		}
		local v182 = {}
		local v185 = {
			{
				["type"] = "cycle",
				["name"] = "Tonemap",
				["items"] = nil,
				["getIndex"] = nil,
				["setIndex"] = nil,
				["displayItem"] = nil,
				["items"] = function() -- name: items
					return { Enum.TonemapperPreset.Default, Enum.TonemapperPreset.Retro }
				end,
				["getIndex"] = function() -- name: getIndex
					-- upvalues: (ref) v_u_26
					return v_u_26 and v_u_26.TonemapperPreset == Enum.TonemapperPreset.Retro and 2 or 1
				end,
				["setIndex"] = function(p183) -- name: setIndex
					-- upvalues: (ref) v_u_26
					if v_u_26 then
						v_u_26.TonemapperPreset = ({ Enum.TonemapperPreset.Default, Enum.TonemapperPreset.Retro })[p183]
					end
				end,
				["displayItem"] = function(p184) -- name: displayItem
					return p184.Name
				end
			}
		}
		__set_list(v182, 1, {{
	["type"] = "toggle",
	["name"] = "Enable",
	["toggle"] = nil,
	["isEnabled"] = nil,
	["toggle"] = v_u_67,
	["isEnabled"] = function() -- name: isEnabled
		-- upvalues: (ref) v_u_60
		return v_u_60
	end
}, v_u_160("Depth of Field", v_u_69, function()
	-- upvalues: (ref) v_u_21
	return v_u_21
end, {
	{
		["name"] = "Far",
		["adjCfg"] = nil,
		["prop"] = "FarIntensity",
		["adjCfg"] = v_u_16.DoF.FarIntensity
	},
	{
		["name"] = "Near",
		["adjCfg"] = nil,
		["prop"] = "NearIntensity",
		["adjCfg"] = v_u_16.DoF.NearIntensity
	},
	{
		["name"] = "Focus Distance",
		["adjCfg"] = nil,
		["prop"] = "FocusDistance",
		["adjCfg"] = v_u_16.DoF.FocusDistance
	},
	{
		["name"] = "Focus Radius",
		["adjCfg"] = nil,
		["prop"] = "InFocusRadius",
		["adjCfg"] = v_u_16.DoF.FocusRadius
	}
}), v_u_160("Bloom", v_u_71, function()
	-- upvalues: (ref) v_u_22
	return v_u_22
end, {
	{
		["name"] = "Intensity",
		["adjCfg"] = nil,
		["prop"] = "Intensity",
		["adjCfg"] = v_u_16.Bloom.Intensity
	},
	{
		["name"] = "Size",
		["adjCfg"] = nil,
		["prop"] = "Size",
		["adjCfg"] = v_u_16.Bloom.Size
	},
	{
		["name"] = "Threshold",
		["adjCfg"] = nil,
		["prop"] = "Threshold",
		["adjCfg"] = v_u_16.Bloom.Threshold
	}
}), v_u_160("Blur", v_u_73, function()
	-- upvalues: (ref) v_u_23
	return v_u_23
end, {
	{
		["name"] = "Size",
		["adjCfg"] = nil,
		["prop"] = "Size",
		["adjCfg"] = v_u_16.Blur.Size
	}
}), v_u_160("Color Correction", v_u_75, function()
	-- upvalues: (ref) v_u_24
	return v_u_24
end, {
	{
		["name"] = "Brightness",
		["adjCfg"] = nil,
		["prop"] = "Brightness",
		["adjCfg"] = v_u_16.ColorCorrection.Brightness
	},
	{
		["name"] = "Contrast",
		["adjCfg"] = nil,
		["prop"] = "Contrast",
		["adjCfg"] = v_u_16.ColorCorrection.Contrast
	},
	{
		["name"] = "Saturation",
		["adjCfg"] = nil,
		["prop"] = "Saturation",
		["adjCfg"] = v_u_16.ColorCorrection.Saturation
	}
}, {
	{
		["type"] = "cycle",
		["name"] = "Tint",
		["items"] = nil,
		["getIndex"] = nil,
		["setIndex"] = nil,
		["displayItem"] = nil,
		["items"] = function() -- name: items
			-- upvalues: (ref) v_u_141
			return v_u_141
		end,
		["getIndex"] = function() -- name: getIndex
			-- upvalues: (ref) v_u_142
			return v_u_142
		end,
		["setIndex"] = function(p186) -- name: setIndex
			-- upvalues: (ref) v_u_142, (ref) v_u_24, (ref) v_u_143, (ref) v_u_141, (ref) v_u_42
			v_u_142 = p186
			if v_u_24 then
				if p186 == 1 then
					v_u_24.TintColor = v_u_143
					return
				end
				local v187 = v_u_141[p186].color
				v_u_24.TintColor = v187
				if not v_u_42 then
					v_u_143 = v187
				end
			end
		end,
		["displayItem"] = function(p188) -- name: displayItem
			return p188.name
		end
	},
	v_u_171("R"),
	v_u_171("G"),
	(v_u_171("B"))
}), v_u_160("Sun Rays", v_u_77, function()
	-- upvalues: (ref) v_u_25
	return v_u_25
end, {
	{
		["name"] = "Intensity",
		["adjCfg"] = nil,
		["prop"] = "Intensity",
		["adjCfg"] = v_u_16.SunRays.Intensity
	},
	{
		["name"] = "Spread",
		["adjCfg"] = nil,
		["prop"] = "Spread",
		["adjCfg"] = v_u_16.SunRays.Spread
	}
}), (v_u_160("Color Grading", v_u_79, function()
	-- upvalues: (ref) v_u_26
	return v_u_26
end, nil, v185))})
		v181.modes = v182
		if v_u_36 then
			for v189 = 2, #v181.modes do
				v181.modes[v189].disabled = function()
					-- upvalues: (ref) v_u_60
					return not v_u_60
				end
			end
		end
		return v181
	end)(),
	{
		["type"] = "group",
		["name"] = "Player Lock",
		["modes"] = nil,
		["modes"] = {
			{
				["type"] = "toggle",
				["name"] = "Enable",
				["toggle"] = nil,
				["isEnabled"] = nil,
				["toggle"] = v144,
				["isEnabled"] = function() -- name: isEnabled
					-- upvalues: (ref) v_u_89
					return v_u_89
				end
			},
			{
				["type"] = "cycle",
				["name"] = "Target",
				["items"] = nil,
				["getIndex"] = nil,
				["setIndex"] = nil,
				["displayItem"] = nil,
				["items"] = function() -- name: items
					-- upvalues: (ref) v_u_92
					return v_u_92
				end,
				["getIndex"] = function() -- name: getIndex
					-- upvalues: (ref) v_u_93
					return v_u_93
				end,
				["setIndex"] = function(p190) -- name: setIndex
					-- upvalues: (ref) v_u_93, (ref) v_u_92, (ref) v_u_94
					v_u_93 = p190
					local v191 = v_u_92[p190]
					if v191 then
						v191 = v191.Character
					end
					if v191 then
						local v192 = v191:FindFirstChildOfClass("Humanoid")
						v_u_94 = v192 and v192.RootPart or nil
					else
						v_u_94 = nil
					end
				end,
				["displayItem"] = function(p193) -- name: displayItem
					return p193.Name
				end
			}
		}
	},
	{
		["type"] = "group",
		["name"] = nil,
		["modes"] = nil,
		["name"] = v_u_45 and "UI Visibility" or "UI",
		["modes"] = {
			{
				["type"] = "toggle",
				["name"] = "Screen GUIs",
				["toggle"] = nil,
				["isEnabled"] = nil,
				["toggle"] = v146,
				["isEnabled"] = function() -- name: isEnabled
					-- upvalues: (ref) v_u_95
					return v_u_95
				end
			},
			{
				["type"] = "toggle",
				["name"] = "Leaderboard",
				["toggle"] = nil,
				["isEnabled"] = nil,
				["toggle"] = v147,
				["isEnabled"] = function() -- name: isEnabled
					-- upvalues: (ref) v_u_96
					return v_u_96
				end
			}
		}
	},
	v180("Movement", v_u_16.Movement, "movement", "movement", v_u_123),
	v180("Field of View", v_u_16.Fov, "fov", "fov", v_u_125),
	v180(v_u_45 and "Roll" or "Tilt", v_u_16.Roll, "roll", "roll", v_u_126),
	(v180(v_u_45 and "Rotation" or "Pan", v_u_16.Pan, "pan", "pan", v_u_124))
}
local v_u_195 = v_u_45 and {
	v194[4],
	v194[7],
	v194[6],
	v194[5],
	v194[1],
	v194[2],
	v194[3]
} or v194
local v_u_196, v_u_197
if v_u_36 then
	v_u_196 = function(p198) -- name: isDisabled
		local v199 = p198.disabled
		if v199 then
			v199 = p198.disabled()
		end
		return v199
	end
	v_u_197 = function(p200, p201, p202) -- name: nextEnabledIndex
		-- upvalues: (ref) v_u_196
		local v203 = #p200
		for _ = 1, v203 do
			p201 = (p201 - 1 + p202) % v203 + 1
			if v_u_196(p200[p201]) then
				continue
			end
			return p201
		end
		return p201
	end
else
	v_u_196 = nil
	v_u_197 = nil
end
local function v_u_207(p204, p205) -- name: createBinding
	local v206 = Instance.new("InputBinding")
	if p205.keyCode then
		v206.KeyCode = p205.keyCode
	end
	if p205.up then
		v206.Up = p205.up
	end
	if p205.down then
		v206.Down = p205.down
	end
	if p205.left then
		v206.Left = p205.left
	end
	if p205.right then
		v206.Right = p205.right
	end
	if p205.scale then
		v206.Scale = p205.scale
	end
	if p205.vector2Scale then
		v206.Vector2Scale = p205.vector2Scale
	end
	if p205.responseCurve then
		v206.ResponseCurve = p205.responseCurve
	end
	if p205.primaryModifier then
		v206.PrimaryModifier = p205.primaryModifier
	end
	v206.Parent = p204
	return v206
end
local function v_u_212(p208, p209) -- name: createAction
	-- upvalues: (copy) v_u_207
	local v210 = Instance.new("InputAction")
	v210.Name = p209.name
	v210.Type = p209.type
	v210.Parent = p208
	for _, v211 in ipairs(p209.bindings) do
		v_u_207(v210, v211)
	end
	return v210
end
(function() -- name: createIASContexts
	-- upvalues: (copy) v_u_16, (ref) v_u_48, (copy) v_u_9, (ref) v_u_100, (copy) v_u_212, (copy) v_u_127, (copy) v_u_128, (ref) v_u_131, (ref) v_u_121, (copy) v_u_126, (ref) v_u_130, (ref) v_u_36, (ref) v_u_132, (ref) v_u_136, (ref) v_u_134, (ref) v_u_197, (ref) v_u_195, (ref) v_u_133, (ref) v_u_135, (ref) v_u_196
	local v213 = v_u_16.Actions
	local v_u_214
	if v_u_48 then
		v_u_214 = Instance.new("Folder")
		v_u_214.Name = "FreecamInput"
		v_u_214.Parent = v_u_9
		script.Destroying:Connect(function()
			-- upvalues: (copy) v_u_214
			v_u_214:Destroy()
		end)
	else
		v_u_214 = script
	end
	local v215 = Instance.new("InputContext")
	v215.Name = "FreecamToggleContext"
	v215.Priority = 3000
	v215.Sink = false
	v215.Enabled = true
	v215.Parent = v_u_214
	v_u_100 = v_u_212(v215, v213.Toggle)
	local v216 = Instance.new("InputContext")
	v216.Name = "FreecamInputContext"
	v216.Priority = 2000
	v216.Sink = true
	v216.Enabled = false
	v216.Parent = v_u_214
	v_u_127._sinkContext = v216
	v_u_128.Pan = v_u_212(v216, v213.Pan)
	v_u_128.MovementMove = v_u_212(v216, v213.MovementMove)
	v_u_128.MovementElevate = v_u_212(v216, v213.MovementElevate)
	v_u_128.Fov = v_u_212(v216, v213.Fov)
	v_u_128.Shift = v_u_212(v216, v213.Shift)
	local v217 = v_u_212(v216, v213.Tilt)
	v_u_128.Tilt = v217
	local v_u_218 = v_u_16.DoubleTap.Threshold
	local v_u_219 = v_u_16.DoubleTap.Debounce
	local function v_u_222()
		-- upvalues: (ref) v_u_121, (ref) v_u_126, (ref) v_u_130
		local v220 = v_u_121.x
		local v221 = v_u_121.y
		v_u_121 = Vector3.new(v220, v221, 0)
		v_u_126:Reset(0)
		v_u_130 = true
	end
	local v_u_223 = nil
	local v_u_224 = 0
	local function v227(p225) -- name: detect
		-- upvalues: (ref) v_u_223, (copy) v_u_218, (ref) v_u_224, (copy) v_u_219, (copy) v_u_222
		if math.abs(p225) > 0.01 then
			local v226 = os.clock()
			if v_u_223 ~= nil and v226 - v_u_223 <= v_u_218 then
				if v_u_219 <= v226 - v_u_224 then
					v_u_222()
					v_u_224 = v226
				end
				v_u_223 = nil
				return
			end
			v_u_223 = v226
		end
	end
	v_u_131 = function() -- name: reset
		-- upvalues: (ref) v_u_223
		v_u_223 = nil
	end
	local v_u_228 = v227
	v217.StateChanged:Connect(function(p229)
		-- upvalues: (ref) v_u_130, (ref) v_u_228
		if v_u_130 then
			if math.abs(p229) < 0.01 then
				v_u_130 = false
			end
		else
			v_u_228(p229)
		end
	end)
	v_u_212(v216, v213.ModeToggle).StateChanged:Connect(function(p230)
		-- upvalues: (ref) v_u_36, (ref) v_u_132, (ref) v_u_136, (ref) v_u_134, (ref) v_u_197, (ref) v_u_195, (ref) v_u_133, (ref) v_u_135
		if p230 then
			if v_u_36 then
				if v_u_132 then
					if v_u_136 then
						v_u_136 = false
						return
					elseif #v_u_134 > 0 then
						local v231 = v_u_134[#v_u_134]
						local v232 = v_u_197(v231.modes, v231.index, -1)
						if v232 < v231.index then
							v231.index = v232
						else
							v_u_134[#v_u_134] = nil
						end
					else
						local v233 = v_u_197(v_u_195, v_u_133, -1)
						if v233 < v_u_133 then
							v_u_133 = v233
						else
							v_u_132 = false
						end
					end
				else
					v_u_132 = true
					return
				end
			elseif v_u_132 then
				if v_u_135 then
					v_u_135 = false
					return
				elseif #v_u_134 > 0 then
					v_u_134[#v_u_134] = nil
				else
					v_u_132 = false
				end
			else
				v_u_132 = true
				return
			end
		else
			return
		end
	end)
	v_u_212(v216, v213.ModeNext).StateChanged:Connect(function(p234)
		-- upvalues: (ref) v_u_36, (ref) v_u_132, (ref) v_u_136, (ref) v_u_134, (ref) v_u_197, (ref) v_u_133, (ref) v_u_195, (ref) v_u_135
		if p234 then
			if v_u_36 then
				if v_u_132 then
					if v_u_136 then
						v_u_136 = false
						return
					elseif #v_u_134 > 0 then
						local v235 = v_u_134[#v_u_134]
						v235.index = v_u_197(v235.modes, v235.index, 1)
					else
						v_u_133 = v_u_197(v_u_195, v_u_133, 1)
					end
				else
					v_u_132 = true
					return
				end
			elseif v_u_132 then
				if v_u_135 then
					return
				elseif #v_u_134 > 0 then
					local v236 = v_u_134[#v_u_134]
					v236.index = v236.index % #v236.modes + 1
					return
				else
					local v237 = v_u_195[v_u_133]
					if v237.type == "group" then
						local v238 = v_u_134
						local v239 = {
							["modes"] = nil,
							["index"] = 1,
							["groupName"] = nil,
							["modes"] = v237.modes,
							["groupName"] = v237.name
						}
						table.insert(v238, v239)
						return
					elseif v237.type == "toggle" then
						v237.toggle()
					elseif v237.type == "cycle" then
						local v240 = v237.items()
						if #v240 > 0 then
							v237.setIndex(v237.getIndex() % #v240 + 1)
							return
						end
					else
						if v237.type == "action" then
							v237.action()
							return
						end
						if v237.type == "axis" then
							v_u_135 = true
						end
					end
				end
			else
				return
			end
		else
			return
		end
	end)
	local v241 = v_u_212(v216, v213.ModeAxis)
	v241.StateChanged:Connect(function(p242)
		-- upvalues: (ref) v_u_132, (ref) v_u_36, (ref) v_u_134, (ref) v_u_195, (ref) v_u_133, (ref) v_u_136, (ref) v_u_196, (ref) v_u_135
		if v_u_132 and p242 ~= 0 then
			if v_u_36 then
				local v243
				if #v_u_134 > 0 then
					local v244 = v_u_134[#v_u_134]
					v243 = v244.modes[v244.index]
				else
					v243 = v_u_195[v_u_133]
				end
				if v_u_136 then
					if v243.type == "toggle" then
						v243.toggle()
						return
					end
					if v243.type == "cycle" then
						local v245 = v243.items()
						if #v245 > 0 then
							if p242 > 0 then
								v243.setIndex(v243.getIndex() % #v245 + 1)
							else
								v243.setIndex((v243.getIndex() - 2) % #v245 + 1)
							end
						end
					else
						if v243.type == "action" then
							v243.action()
							return
						end
						if v243.type == "axis" then
							return
						end
					end
				else
					if p242 > 0 then
						if v_u_196(v243) then
							return
						elseif v243.type == "group" then
							local v246 = v_u_134
							local v247 = {
								["modes"] = nil,
								["index"] = 1,
								["groupName"] = nil,
								["modes"] = v243.modes,
								["groupName"] = v243.name
							}
							table.insert(v246, v247)
							return
						elseif v243.type == "action" then
							v243.action()
						else
							v_u_136 = true
						end
					end
					if p242 < 0 then
						v_u_136 = false
						if #v_u_134 > 0 then
							v_u_134[#v_u_134] = nil
						else
							v_u_132 = false
						end
					end
				end
			else
				if v_u_135 then
					return
				end
				if #v_u_134 > 0 then
					local v248
					if #v_u_134 > 0 then
						local v249 = v_u_134[#v_u_134]
						v248 = v249.modes[v249.index]
					else
						v248 = v_u_195[v_u_133]
					end
					if v248.type == "group" then
						local v250 = v_u_134
						local v251 = {
							["modes"] = nil,
							["index"] = 1,
							["groupName"] = nil,
							["modes"] = v248.modes,
							["groupName"] = v248.name
						}
						table.insert(v250, v251)
						return
					end
					if v248.type == "toggle" then
						v248.toggle()
						return
					end
					if v248.type == "cycle" then
						local v252 = v248.items()
						if #v252 == 0 then
							return
						end
						if p242 > 0 then
							v248.setIndex(v248.getIndex() % #v252 + 1)
							return
						end
						if p242 < 0 then
							v248.setIndex((v248.getIndex() - 2) % #v252 + 1)
							return
						end
					elseif v248.type == "action" then
						v248.action()
						return
					end
				else
					if p242 > 0 then
						v_u_133 = v_u_133 % #v_u_195 + 1
						return
					end
					if p242 < 0 then
						v_u_133 = (v_u_133 - 2) % #v_u_195 + 1
					end
				end
			end
		end
	end)
	v_u_128.ModeAxis = v241
end)()
function v_u_127.Movement() -- name: Movement
	-- upvalues: (copy) v_u_128, (copy) v_u_129, (copy) v_u_16
	local v253 = v_u_128.MovementMove:GetState()
	local v254 = v253.X
	local v255 = v_u_128.MovementElevate:GetState()
	local v256 = v253.Y
	return Vector3.new(v254, v255, v256) * (v_u_129.movement * (v_u_128.Shift:GetState() and v_u_16.Movement.ShiftMul or 1))
end
function v_u_127.Pan() -- name: Pan
	-- upvalues: (copy) v_u_128, (copy) v_u_129
	local v257 = v_u_128.Pan:GetState()
	return Vector2.new(v257.Y, -v257.X) * v_u_129.pan
end
function v_u_127.Fov() -- name: Fov
	-- upvalues: (copy) v_u_128, (copy) v_u_129
	return v_u_128.Fov:GetState() * v_u_129.fov
end
function v_u_127.Roll() -- name: Roll
	-- upvalues: (ref) v_u_130, (copy) v_u_128, (copy) v_u_129
	return (v_u_130 and 0 or v_u_128.Tilt:GetState()) * v_u_129.roll
end
function v_u_127.ModeControl(p258) -- name: ModeControl
	-- upvalues: (ref) v_u_132, (ref) v_u_36, (ref) v_u_136, (ref) v_u_134, (ref) v_u_135, (ref) v_u_195, (ref) v_u_133, (copy) v_u_128, (copy) v_u_1
	if v_u_132 then
		if v_u_36 then
			if not v_u_136 then
				return
			end
		elseif #v_u_134 == 0 and not v_u_135 then
			return
		end
		local v259
		if #v_u_134 > 0 then
			local v260 = v_u_134[#v_u_134]
			v259 = v260.modes[v260.index]
		else
			v259 = v_u_195[v_u_133]
		end
		if v259.type == "axis" then
			local v261 = v_u_128.ModeAxis:GetState() * v259.adj * p258
			if v261 ~= 0 then
				v259.set((v_u_1(v259.get() + v261, v259.min, v259.max)))
			end
		end
	else
		return
	end
end
function v_u_127.StartCapture() -- name: StartCapture
	-- upvalues: (copy) v_u_127
	v_u_127._sinkContext.Enabled = true
end
function v_u_127.StopCapture() -- name: StopCapture
	-- upvalues: (copy) v_u_127, (ref) v_u_130, (ref) v_u_131, (ref) v_u_132, (ref) v_u_36, (ref) v_u_134, (ref) v_u_136, (ref) v_u_135
	v_u_127._sinkContext.Enabled = false
	v_u_130 = false
	if v_u_131 then
		v_u_131()
	end
	v_u_132 = false
	if v_u_36 then
		table.clear(v_u_134)
		v_u_136 = false
	else
		v_u_134 = {}
	end
	v_u_135 = false
end
function v_u_127.getModeActive() -- name: getModeActive
	-- upvalues: (ref) v_u_132
	return v_u_132
end
function v_u_127.getModeName() -- name: getModeName
	-- upvalues: (ref) v_u_134, (ref) v_u_195, (ref) v_u_133
	local v262
	if #v_u_134 > 0 then
		local v263 = v_u_134[#v_u_134]
		v262 = v263.modes[v263.index]
	else
		v262 = v_u_195[v_u_133]
	end
	return v262.name
end
function v_u_127.getModeBreadcrumb() -- name: getModeBreadcrumb
	-- upvalues: (ref) v_u_134
	if #v_u_134 == 0 then
		return ""
	end
	local v264 = {}
	for _, v265 in ipairs(v_u_134) do
		local v266 = v265.groupName
		table.insert(v264, v266)
	end
	return table.concat(v264, " \226\128\186 ")
end
function v_u_127.getModeDisplay() -- name: getModeDisplay
	-- upvalues: (ref) v_u_134, (ref) v_u_195, (ref) v_u_133, (ref) v_u_42
	local v267
	if #v_u_134 > 0 then
		local v268 = v_u_134[#v_u_134]
		v267 = v268.modes[v268.index]
	else
		v267 = v_u_195[v_u_133]
	end
	if v267.type == "group" then
		return ""
	end
	if v267.type == "axis" then
		return string.format(v_u_42 and (v267.format or "%.2f") or "%.2f", v267.get())
	end
	if v267.type == "toggle" then
		return v267.isEnabled() and "ON" or "OFF"
	end
	if v267.type ~= "cycle" then
		return v267.type == "action" and "(fire)" or ""
	end
	local v269 = v267.items()
	if #v269 == 0 then
		return "None"
	end
	local v270 = v269[v267.getIndex()]
	return v270 and v267.displayItem(v270) or "None"
end
function v_u_127.getModeHint() -- name: getModeHint
	-- upvalues: (ref) v_u_195, (ref) v_u_133, (ref) v_u_134, (ref) v_u_135
	local v271 = v_u_195[v_u_133]
	if #v_u_134 <= 0 then
		if v_u_135 then
			local v272 = v271.type
			local v273 = v272 == "axis" and "Hold to adjust" or (v272 == "toggle" and "Tap to flip" or (v272 == "cycle" and "Tap to cycle" or (v272 == "action" and "Tap to fire" or (v272 == "group" and "Enter" or nil))))
			return {
				["nav"] = "[\226\134\145] Back",
				["action"] = nil,
				["action"] = v273 and "[\226\134\144][\226\134\146] " .. v273 or ""
			}
		end
		local v274 = v271.type
		local v275 = v274 == "group" and "Enter" or (v274 == "toggle" and "Flip" or (v274 == "cycle" and "Cycle" or (v274 == "action" and "Fire" or (v274 == "axis" and "Adjust" or "Select"))))
		local v276 = v_u_195[(v_u_133 - 2) % #v_u_195 + 1].name
		local v277 = v_u_195[v_u_133 % #v_u_195 + 1].name
		return {
			["nav"] = "[\226\134\145] Close  [\226\134\147] " .. v275,
			["action"] = "[\226\134\144] " .. v276 .. "  [\226\134\146] " .. v277
		}
	end
	local v278 = v_u_134[#v_u_134]
	local v279 = v278.index % #v278.modes + 1
	local v280 = "[\226\134\145] Back  [\226\134\147] " .. v278.modes[v279].name
	local v281
	if #v_u_134 > 0 then
		local v282 = v_u_134[#v_u_134]
		v281 = v282.modes[v282.index]
	else
		v281 = v_u_195[v_u_133]
	end
	local v283 = v281.type
	local v284 = v283 == "axis" and "Hold to adjust" or (v283 == "toggle" and "Tap to flip" or (v283 == "cycle" and "Tap to cycle" or (v283 == "action" and "Tap to fire" or (v283 == "group" and "Enter" or nil))))
	return {
		["nav"] = v280,
		["action"] = v284 and "[\226\134\144][\226\134\146] " .. v284 or ""
	}
end
function v_u_127.getTintColorName() -- name: getTintColorName
	-- upvalues: (ref) v_u_142, (copy) v_u_141
	return (v_u_142 < 1 or v_u_142 > #v_u_141) and "Custom" or v_u_141[v_u_142].name
end
function v_u_127.getActiveGroupName() -- name: getActiveGroupName
	-- upvalues: (ref) v_u_132, (ref) v_u_134
	if v_u_132 and #v_u_134 ~= 0 then
		return v_u_134[1].groupName
	else
		return nil
	end
end
if v_u_36 then
	v_u_127._navigationStack = v_u_134
	v_u_127._modes = v_u_195
	function v_u_127._getModeIndex() -- name: _getModeIndex
		-- upvalues: (ref) v_u_133
		return v_u_133
	end
	function v_u_127._isMonitorItemSelected() -- name: _isMonitorItemSelected
		-- upvalues: (ref) v_u_136
		return v_u_136
	end
end
local v_u_291 = {
	{
		["get"] = nil,
		["key"] = "bloom",
		["group"] = "Custom Post Processing",
		["fmt"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_22
			return v_u_22
		end,
		["fmt"] = function(p285) -- name: fmt
			return string.format("Intensity: %.2f  Size: %.1f\nThreshold: %.2f", p285.Intensity, p285.Size, p285.Threshold)
		end
	},
	{
		["get"] = nil,
		["key"] = "blur",
		["group"] = "Custom Post Processing",
		["fmt"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_23
			return v_u_23
		end,
		["fmt"] = function(p286) -- name: fmt
			return string.format("Size: %.1f", p286.Size)
		end
	},
	{
		["get"] = nil,
		["key"] = "cc",
		["group"] = "Custom Post Processing",
		["fmt"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_24
			return v_u_24
		end,
		["fmt"] = function(p287) -- name: fmt
			-- upvalues: (copy) v_u_127
			return string.format("Brightness: %.2f  Contrast: %.2f\nSaturation: %.2f  Tint: %s", p287.Brightness, p287.Contrast, p287.Saturation, v_u_127.getTintColorName())
		end
	},
	{
		["get"] = nil,
		["key"] = "sunrays",
		["group"] = "Custom Post Processing",
		["fmt"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_25
			return v_u_25
		end,
		["fmt"] = function(p288) -- name: fmt
			return string.format("Intensity: %.2f  Spread: %.2f", p288.Intensity, p288.Spread)
		end
	},
	{
		["get"] = nil,
		["key"] = "colorgrading",
		["group"] = "Custom Post Processing",
		["fmt"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_26
			return v_u_26
		end,
		["fmt"] = function(p289) -- name: fmt
			return string.format("Color Grading: %s", p289.TonemapperPreset.Name)
		end
	},
	{
		["get"] = nil,
		["key"] = "dof",
		["group"] = "Custom Post Processing",
		["fmt"] = nil,
		["get"] = function() -- name: get
			-- upvalues: (ref) v_u_21
			return v_u_21
		end,
		["fmt"] = function(p290) -- name: fmt
			return string.format("Far: %.2f  Near: %.2f\nDistance: %.1f  Radius: %.1f", p290.FarIntensity, p290.NearIntensity, p290.FocusDistance, p290.InFocusRadius)
		end
	}
}
local v_u_292 = nil
local v_u_293, v_u_294
if v_u_36 then
	local v_u_295 = {}
	local v_u_296 = 12
	v_u_293 = function(p297)
		-- upvalues: (ref) v_u_295, (ref) v_u_296, (ref) v_u_292
		local v298 = Instance.new("Frame")
		v298.Name = "FreecamMonitorPanel"
		v298.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		v298.BackgroundTransparency = 0.2
		v298.BorderSizePixel = 0
		v298.Size = UDim2.new(0, 240, 0, 0)
		v298.AutomaticSize = Enum.AutomaticSize.Y
		v298.AnchorPoint = Vector2.new(1, 1)
		v298.Position = UDim2.new(1, -16, 1, -16)
		v298.Visible = false
		local v299 = Instance.new("UICorner")
		v299.CornerRadius = UDim.new(0, 8)
		v299.Parent = v298
		local v300 = Instance.new("UIPadding")
		v300.PaddingTop = UDim.new(0, 8)
		v300.PaddingBottom = UDim.new(0, 8)
		v300.PaddingLeft = UDim.new(0, 12)
		v300.PaddingRight = UDim.new(0, 12)
		v300.Parent = v298
		local v301 = Instance.new("UIListLayout")
		v301.SortOrder = Enum.SortOrder.LayoutOrder
		v301.FillDirection = Enum.FillDirection.Vertical
		v301.Padding = UDim.new(0, 1)
		v301.Parent = v298
		local v302 = Instance.new("TextLabel")
		v302.Name = "Breadcrumb"
		v302.BackgroundTransparency = 1
		v302.TextColor3 = Color3.fromRGB(150, 150, 150)
		v302.Font = Enum.Font.GothamMedium
		v302.TextSize = 11
		v302.TextXAlignment = Enum.TextXAlignment.Left
		v302.Size = UDim2.new(1, 0, 0, 16)
		v302.LayoutOrder = 0
		v302.Visible = false
		v302.Parent = v298
		v_u_295 = {}
		for v303 = 1, v_u_296 do
			local v304 = Instance.new("Frame")
			v304.Name = "Row" .. v303
			v304.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			v304.BackgroundTransparency = 1
			v304.BorderSizePixel = 0
			v304.Size = UDim2.new(1, 0, 0, 22)
			v304.LayoutOrder = v303
			v304.Visible = false
			local v305 = Instance.new("UICorner")
			v305.CornerRadius = UDim.new(0, 4)
			v305.Parent = v304
			local v306 = Instance.new("UIPadding")
			v306.PaddingLeft = UDim.new(0, 6)
			v306.PaddingRight = UDim.new(0, 6)
			v306.Parent = v304
			local v307 = Instance.new("TextLabel")
			v307.Name = "Name"
			v307.BackgroundTransparency = 1
			v307.TextColor3 = Color3.new(1, 1, 1)
			v307.Font = Enum.Font.GothamMedium
			v307.TextSize = 14
			v307.TextXAlignment = Enum.TextXAlignment.Left
			v307.Size = UDim2.new(0.55, 0, 1, 0)
			v307.Position = UDim2.new(0, 0, 0, 0)
			v307.Parent = v304
			local v308 = Instance.new("TextLabel")
			v308.Name = "Value"
			v308.BackgroundTransparency = 1
			v308.TextColor3 = Color3.fromRGB(180, 180, 180)
			v308.Font = Enum.Font.GothamMedium
			v308.TextSize = 14
			v308.TextXAlignment = Enum.TextXAlignment.Right
			v308.Size = UDim2.new(0.45, 0, 1, 0)
			v308.Position = UDim2.new(0.55, 0, 0, 0)
			v308.Parent = v304
			v304.Parent = v298
			v_u_295[v303] = {
				["frame"] = v304,
				["nameLabel"] = v307,
				["valueLabel"] = v308
			}
		end
		local v309 = Instance.new("TextLabel")
		v309.Name = "Hint"
		v309.BackgroundTransparency = 1
		v309.TextColor3 = Color3.fromRGB(120, 120, 120)
		v309.Font = Enum.Font.Gotham
		v309.TextSize = 12
		v309.TextXAlignment = Enum.TextXAlignment.Left
		v309.Size = UDim2.new(1, 0, 0, 20)
		v309.LayoutOrder = v_u_296 + 1
		v309.Parent = v298
		v298.Parent = p297
		v_u_292 = {
			["panel"] = v298,
			["breadcrumb"] = v302,
			["hint"] = v309
		}
	end
	local function v_u_313(p310)
		-- upvalues: (ref) v_u_42
		if p310.type == "group" then
			return "\226\128\186"
		end
		if p310.type == "toggle" then
			return p310.isEnabled() and "On" or "Off"
		end
		if p310.type == "axis" then
			return string.format(v_u_42 and (p310.format or "%.2f") or "%.2f", p310.get())
		end
		if p310.type ~= "cycle" then
			return p310.type == "action" and "" or ""
		end
		local v311 = p310.items()
		if #v311 == 0 then
			return "--"
		end
		local v312 = v311[p310.getIndex()]
		return v312 and p310.displayItem(v312) or "--"
	end
	local function v_u_317(p314, p315, p316)
		if p314.type == "toggle" then
			if p314.isEnabled() then
				return Color3.fromRGB(0, 176, 111)
			else
				return Color3.fromRGB(150, 150, 150)
			end
		elseif p315 and p316 then
			return Color3.new(1, 1, 1)
		else
			return Color3.fromRGB(180, 180, 180)
		end
	end
	v_u_294 = function()
		-- upvalues: (ref) v_u_292, (copy) v_u_127, (ref) v_u_296, (ref) v_u_295, (ref) v_u_313, (ref) v_u_317, (ref) v_u_45
		if v_u_292 then
			local v318 = v_u_292.panel
			if v_u_127.getModeActive() then
				v318.Visible = true
				local v319, v320
				if #v_u_127._navigationStack > 0 then
					local v321 = v_u_127._navigationStack[#v_u_127._navigationStack]
					v319 = v321.modes
					v320 = v321.index
				else
					v319 = v_u_127._modes
					v320 = v_u_127._getModeIndex()
				end
				local v322 = v_u_127.getModeBreadcrumb()
				v_u_292.breadcrumb.Text = v322
				v_u_292.breadcrumb.Visible = v322 ~= ""
				local v323 = v_u_127._isMonitorItemSelected()
				local v324 = #v319
				local v325 = v_u_296
				local v326 = math.min(v324, v325)
				for v327 = 1, v_u_296 do
					local v328 = v_u_295[v327]
					if v327 <= v326 then
						local v329 = v319[v327]
						local v330 = v327 == v320
						local v331 = v329.disabled
						if v331 then
							v331 = v329.disabled()
						end
						v328.frame.Visible = true
						if v330 and not v331 then
							v328.nameLabel.Text = "> " .. v329.name
							v328.nameLabel.TextColor3 = Color3.new(1, 1, 1)
							v328.nameLabel.Font = Enum.Font.GothamMedium
							v328.frame.BackgroundTransparency = v323 and 0.88 or 1
						elseif v331 then
							v328.nameLabel.Text = "  " .. v329.name
							v328.nameLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
							v328.nameLabel.Font = Enum.Font.GothamMedium
							v328.frame.BackgroundTransparency = 1
						else
							v328.nameLabel.Text = "  " .. v329.name
							v328.nameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
							v328.nameLabel.Font = Enum.Font.GothamMedium
							v328.frame.BackgroundTransparency = 1
						end
						v328.valueLabel.Text = v_u_313(v329)
						v328.valueLabel.TextColor3 = v331 and Color3.fromRGB(60, 60, 60) or v_u_317(v329, v330, v323)
					else
						v328.frame.Visible = false
					end
				end
				if v323 then
					if v_u_45 then
						v_u_292.hint.Text = "\226\134\145\226\134\147 Exit selection   \226\134\144\226\134\146 Adjust"
					else
						v_u_292.hint.Text = "\226\134\144\226\134\146 Adjust   \226\134\145\226\134\147 Exit selection"
					end
				else
					v_u_292.hint.Text = "\226\134\145\226\134\147 Navigate   \226\134\146 Select   \226\134\144 Back"
					return
				end
			else
				v318.Visible = false
				return
			end
		else
			return
		end
	end
else
	v_u_293 = nil
	v_u_294 = nil
end
local function v_u_381(p332) -- name: StepFreecam
	-- upvalues: (copy) v_u_127, (copy) v_u_123, (copy) v_u_124, (copy) v_u_125, (copy) v_u_126, (ref) v_u_122, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_16, (copy) v_u_1, (ref) v_u_97, (ref) v_u_98, (ref) v_u_121, (ref) v_u_120, (ref) v_u_89, (ref) v_u_94, (ref) v_u_90, (ref) v_u_91, (ref) v_u_36, (ref) v_u_294, (ref) v_u_28, (ref) v_u_29, (ref) v_u_18, (ref) v_u_92, (ref) v_u_93, (copy) v_u_291, (ref) v_u_19
	v_u_127.ModeControl(p332)
	local v333 = v_u_123:Update(p332, v_u_127.Movement())
	local v334 = v_u_124:Update(p332, v_u_127.Pan())
	local v335 = v_u_125:Update(p332, v_u_127.Fov())
	local v336 = v_u_126:Update(p332, v_u_127.Roll())
	local v337 = v_u_4(0.7002075382097097 / v_u_5((v_u_3(v_u_122 / 2))))
	local v338 = v_u_122
	v_u_122 = v_u_1(v_u_122 + v335 * v_u_16.Fov.Gain * (p332 / v337), 1, 120)
	local v339 = v_u_122 - v338
	if math.abs(v339) > 0.01 then
		v_u_97 = os.clock()
	end
	if v333.Magnitude > 0.05 or (v334.Magnitude > 0.0005 or (math.abs(v336) > 0.0005 or math.abs(v335) > 0.0005)) then
		v_u_98 = os.clock()
	end
	local v340 = v334 * v_u_16.Pan.Gain * (p332 / v337)
	local v341 = v_u_121
	local v342 = v340.X
	local v343 = v340.Y
	local v344 = v336 * v_u_16.Roll.Gain * (p332 / v337)
	v_u_121 = v341 + Vector3.new(v342, v343, v344)
	local v345 = v_u_121.x % 6.283185307179586
	if v345 > 3.141592653589793 then
		v345 = v345 - 6.283185307179586 or v345
	end
	local v346 = v_u_121.y % 6.283185307179586
	if v346 > 3.141592653589793 then
		v346 = v346 - 6.283185307179586 or v346
	end
	local v347 = v_u_121.z % 6.283185307179586
	if v347 > 3.141592653589793 then
		v347 = v347 - 6.283185307179586 or v347
	end
	v_u_121 = Vector3.new(v345, v346, v347)
	local v348 = v333.X
	local v349 = v333.Y
	local v350 = -v333.Z
	local v351 = Vector3.new(v348, v349, v350)
	local v352 = CFrame.new(v_u_120) * CFrame.fromOrientation(v_u_121.x, v_u_121.y, v_u_121.z) * CFrame.new(v351 * v_u_16.Movement.Gain * p332)
	if v_u_89 and (v_u_94 and v_u_94.Parent) then
		local v353 = v_u_16.PlayerLock
		local v354 = -v333.Z * v_u_16.Movement.Gain.Z * p332
		local v355 = v333.Y * v_u_16.Movement.Gain.Y * p332
		v_u_90 = v_u_1(v_u_90 + v354, v353.MinZoom, v353.MaxZoom)
		v_u_91 = v_u_1(v_u_91 + v355, -v353.HeightRange, v353.HeightRange)
		local v356 = v_u_91
		v352 = CFrame.new(v_u_94.Position + Vector3.new(0, v356, 0)) * CFrame.fromOrientation(v_u_121.x, v_u_121.y, v_u_121.z) * CFrame.new(0, 0, v_u_90)
	end
	if v_u_36 then
		v_u_294()
	elseif v_u_28 and (v_u_28.Parent and (v_u_29 and (v_u_18 and v_u_18.Parent))) then
		local v357 = v_u_29.mode
		if v_u_127.getModeActive() then
			if os.clock() - v_u_98 < 2 then
				local v358 = {
					[#v358 + 1] = string.format("X: %.0f  Y: %.0f  Z: %.0f", v_u_120.X, v_u_120.Y, v_u_120.Z)
				}
				local v359 = #v358 + 1
				local v360 = string.format
				local v361 = v_u_121.X
				local v362 = math.deg(v361)
				local v363 = v_u_121.Y
				local v364 = math.deg(v363)
				local v365 = v_u_121.Z
				v358[v359] = v360("Pitch: %.1f\194\176  Yaw: %.1f\194\176  Roll: %.1f\194\176", v362, v364, (math.deg(v365)))
				if os.clock() - v_u_97 < 2 then
					v358[#v358 + 1] = string.format("Field of View: %.1f", v_u_122)
				end
				if p332 > 0 then
					local v366 = (v352.p - v_u_120).Magnitude / p332
					if v366 > 0.5 then
						v358[#v358 + 1] = string.format("Speed: %.1f", v366)
					end
				end
				local v367 = v_u_29.status
				local v368 = table.concat(v358, "\n")
				v367.bubble.Visible = v368 ~= ""
				if v368 ~= "" then
					v367.label.Text = v368
				end
			else
				v_u_29.status.bubble.Visible = false
			end
			if v_u_89 and (#v_u_92 > 0 and v_u_127.getActiveGroupName() ~= "Player Lock") then
				local v369 = v_u_29.lock
				local v370 = string.format("Lock: %s", v_u_92[v_u_93].Name)
				v369.bubble.Visible = v370 ~= ""
				if v370 ~= "" then
					v369.label.Text = v370
				end
			else
				v_u_29.lock.bubble.Visible = false
			end
			local v371 = v_u_127.getActiveGroupName()
			for _, v372 in ipairs(v_u_291) do
				local v373 = v372.get()
				if v373 and (v373.Enabled and v371 ~= v372.group) then
					local v374 = v_u_29[v372.key]
					local v375 = v372.fmt(v373)
					v374.bubble.Visible = v375 ~= ""
					if v375 == "" then
						continue
					end
					v374.label.Text = v375
				else
					v_u_29[v372.key].bubble.Visible = false
				end
			end
			v357.bubble.Visible = true
			local v376 = v_u_127.getModeBreadcrumb()
			v357.breadcrumb.Text = v376
			v357.breadcrumb.Visible = v376 ~= ""
			local v377 = v_u_127.getModeName()
			local v378 = v_u_127.getModeDisplay()
			local v379 = v357.title
			if v378 ~= "" then
				v377 = v377 .. ": " .. v378 or v377
			end
			v379.Text = v377
			local v380 = v_u_127.getModeHint()
			v357.nav.Text = v380.nav
			v357.nav.Visible = v380.nav ~= ""
			v357.action.Text = v380.action
			v357.action.Visible = v380.action ~= ""
			v_u_28.Visible = true
		else
			v_u_28.Visible = false
		end
	end
	v_u_120 = v352.p
	v_u_19.CFrame = v352
	v_u_19.Focus = v352
	v_u_19.FieldOfView = v_u_122
end
local v_u_382 = {}
local v_u_383 = nil
local v_u_384 = nil
local v_u_385 = nil
local v_u_386 = nil
local v_u_387 = nil
local v_u_388 = nil
local v_u_389 = {}
local v_u_390 = {
	["Backpack"] = true,
	["Chat"] = true,
	["Health"] = true,
	["PlayerList"] = true
}
local v_u_391 = {
	["BadgesNotificationsActive"] = true,
	["PointsNotificationsActive"] = true
}
function v_u_382.Push() -- name: Push
	-- upvalues: (copy) v_u_390, (copy) v_u_8, (copy) v_u_391, (ref) v_u_17, (ref) v_u_389, (ref) v_u_86, (ref) v_u_95, (ref) v_u_388, (ref) v_u_19, (ref) v_u_385, (ref) v_u_387, (ref) v_u_386, (ref) v_u_384, (copy) v_u_10, (ref) v_u_383
	for v392 in pairs(v_u_390) do
		v_u_390[v392] = v_u_8:GetCoreGuiEnabled(Enum.CoreGuiType[v392])
		v_u_8:SetCoreGuiEnabled(Enum.CoreGuiType[v392], false)
	end
	for v393 in pairs(v_u_391) do
		v_u_391[v393] = v_u_8:GetCore(v393)
		v_u_8:SetCore(v393, false)
	end
	local v394 = v_u_17:FindFirstChildOfClass("PlayerGui")
	if v394 then
		for _, v395 in pairs(v394:GetChildren()) do
			if not (v395:IsA("ScreenGui") and v395.Enabled) then
				continue
			end
			v_u_389[#v_u_389 + 1] = v395
			v395.Enabled = false
		end
		v_u_86 = v394.ChildAdded:Connect(function(p396)
			-- upvalues: (ref) v_u_389, (ref) v_u_95
			if p396:IsA("ScreenGui") and p396.Enabled then
				v_u_389[#v_u_389 + 1] = p396
				p396.Enabled = v_u_95
			end
		end)
	end
	v_u_388 = v_u_19.FieldOfView
	v_u_19.FieldOfView = 70
	v_u_385 = v_u_19.CameraType
	v_u_19.CameraType = Enum.CameraType.Custom
	v_u_387 = v_u_19.CFrame
	v_u_386 = v_u_19.Focus
	v_u_384 = v_u_10.MouseIconEnabled
	v_u_10.MouseIconEnabled = false
	v_u_383 = Enum.MouseBehavior.Default
	v_u_10.MouseBehavior = Enum.MouseBehavior.Default
end
function v_u_382.Pop() -- name: Pop
	-- upvalues: (copy) v_u_390, (copy) v_u_8, (copy) v_u_391, (ref) v_u_389, (ref) v_u_18, (ref) v_u_86, (ref) v_u_19, (ref) v_u_388, (ref) v_u_385, (ref) v_u_387, (ref) v_u_386, (copy) v_u_10, (ref) v_u_384, (ref) v_u_383
	for v397, v398 in pairs(v_u_390) do
		v_u_8:SetCoreGuiEnabled(Enum.CoreGuiType[v397], v398)
	end
	for v399, v400 in pairs(v_u_391) do
		v_u_8:SetCore(v399, v400)
	end
	for _, v401 in pairs(v_u_389) do
		if not v401.Parent or v401 == v_u_18 then
			continue
		end
		v401.Enabled = true
	end
	if v_u_86 then
		v_u_86:Disconnect()
		v_u_86 = nil
	end
	v_u_389 = {}
	v_u_19.FieldOfView = v_u_388
	v_u_388 = nil
	v_u_19.CameraType = v_u_385
	v_u_385 = nil
	v_u_19.CFrame = v_u_387
	v_u_387 = nil
	v_u_19.Focus = v_u_386
	v_u_386 = nil
	v_u_10.MouseIconEnabled = v_u_384
	v_u_384 = nil
	v_u_10.MouseBehavior = v_u_383
	v_u_383 = nil
end
function v_u_382.getScreenGuis() -- name: getScreenGuis
	-- upvalues: (ref) v_u_389
	return v_u_389
end
local function v_u_405(p402) -- name: removePlayerFromList
	-- upvalues: (ref) v_u_92, (ref) v_u_93, (ref) v_u_89
	for v403, v404 in ipairs(v_u_92) do
		if v404 ~= p402 then
			continue
		end
		table.remove(v_u_92, v403)
		if v_u_93 == v403 and v_u_89 then
			v_u_89 = false
			v_u_93 = 1
		end
		if v403 < v_u_93 then
			v_u_93 = v_u_93 - 1
		end
		if v_u_93 > #v_u_92 or v_u_93 < 1 then
			v_u_93 = 1
			return
		end
		return
	end
end
local function v_u_410() -- name: initializePlayerList
	-- upvalues: (ref) v_u_92, (copy) v_u_6, (ref) v_u_17, (ref) v_u_93, (ref) v_u_87, (ref) v_u_88, (copy) v_u_405
	v_u_92 = v_u_6:GetPlayers()
	for v406, v407 in ipairs(v_u_92) do
		if v407 ~= v_u_17 then
			continue
		end
		v_u_93 = v406
	end
	v_u_87 = v_u_6.PlayerAdded:Connect(function(p408)
		-- upvalues: (ref) v_u_92
		local v409 = v_u_92
		table.insert(v409, p408)
	end)
	v_u_88 = v_u_6.PlayerRemoving:Connect(v_u_405)
end
local function v_u_459() -- name: StartFreecam
	-- upvalues: (copy) v_u_410, (ref) v_u_19, (ref) v_u_121, (ref) v_u_120, (ref) v_u_122, (copy) v_u_123, (copy) v_u_124, (copy) v_u_125, (copy) v_u_126, (ref) v_u_18, (ref) v_u_17, (ref) v_u_36, (ref) v_u_292, (ref) v_u_293, (ref) v_u_28, (ref) v_u_29, (ref) v_u_382, (ref) v_u_64, (copy) v_u_27, (ref) v_u_39, (copy) v_u_7, (copy) v_u_381, (copy) v_u_127
	v_u_410()
	local v411 = v_u_19.CFrame
	v_u_121 = Vector3.new(v411:toEulerAnglesYXZ())
	v_u_120 = v411.p
	v_u_122 = v_u_19.FieldOfView
	v_u_123:Reset((Vector3.new()))
	v_u_124:Reset(Vector2.new())
	v_u_125:Reset(0)
	v_u_126:Reset(0)
	v_u_18 = v_u_17:WaitForChild("PlayerGui"):WaitForChild("Freecam")
	if v_u_36 then
		if not v_u_292 then
			v_u_293(v_u_18)
		end
	elseif not (v_u_28 and v_u_28.Parent) then
		local v_u_412 = Instance.new("Frame")
		v_u_412.Name = "FreecamCustomGui"
		v_u_412.BackgroundTransparency = 1
		v_u_412.AutomaticSize = Enum.AutomaticSize.XY
		v_u_412.AnchorPoint = Vector2.new(1, 1)
		v_u_412.Position = UDim2.new(1, -16, 1, -16)
		v_u_412.Size = UDim2.new(0, 0, 0, 0)
		v_u_412.Visible = false
		local v413 = Instance.new("UIListLayout")
		v413.SortOrder = Enum.SortOrder.LayoutOrder
		v413.FillDirection = Enum.FillDirection.Vertical
		v413.VerticalAlignment = Enum.VerticalAlignment.Bottom
		v413.HorizontalAlignment = Enum.HorizontalAlignment.Right
		v413.Padding = UDim.new(0, 6)
		v413.Parent = v_u_412
		local function v420(p414, p415) -- name: makeBubble
			-- upvalues: (copy) v_u_412
			local v416 = Instance.new("Frame")
			v416.Name = p414
			v416.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			v416.BackgroundTransparency = 0.4
			v416.BorderSizePixel = 0
			v416.AutomaticSize = Enum.AutomaticSize.XY
			v416.Size = UDim2.new(0, 0, 0, 0)
			v416.LayoutOrder = p415
			v416.Visible = false
			local v417 = Instance.new("UICorner")
			v417.CornerRadius = UDim.new(0, 8)
			v417.Parent = v416
			local v418 = Instance.new("UIPadding")
			v418.PaddingTop = UDim.new(0, 8)
			v418.PaddingBottom = UDim.new(0, 8)
			v418.PaddingLeft = UDim.new(0, 12)
			v418.PaddingRight = UDim.new(0, 12)
			v418.Parent = v416
			local v419 = Instance.new("TextLabel")
			v419.Name = "Label"
			v419.BackgroundTransparency = 1
			v419.TextColor3 = Color3.new(1, 1, 1)
			v419.Font = Enum.Font.GothamMedium
			v419.TextSize = 14
			v419.TextXAlignment = Enum.TextXAlignment.Left
			v419.AutomaticSize = Enum.AutomaticSize.XY
			v419.Size = UDim2.new(0, 0, 0, 0)
			v419.Parent = v416
			v416.Parent = v_u_412
			return v416, v419
		end
		local v421, v422 = v420("BloomBubble", 1)
		local v423, v424 = v420("BlurBubble", 2)
		local v425, v426 = v420("CCBubble", 3)
		local v427, v428 = v420("SunRaysBubble", 4)
		local v429, v430 = v420("ColorGradingBubble", 5)
		local v431, v432 = v420("DofBubble", 6)
		local v433, v434 = v420("LockBubble", 7)
		local v435, v436 = v420("StatusBubble", 8)
		local v_u_437 = Instance.new("Frame")
		v_u_437.Name = "ModeBubble"
		v_u_437.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		v_u_437.BackgroundTransparency = 0.4
		v_u_437.BorderSizePixel = 0
		v_u_437.AutomaticSize = Enum.AutomaticSize.XY
		v_u_437.Size = UDim2.new(0, 0, 0, 0)
		v_u_437.LayoutOrder = 9
		v_u_437.Visible = false
		local v438 = Instance.new("UICorner")
		v438.CornerRadius = UDim.new(0, 8)
		v438.Parent = v_u_437
		local v439 = Instance.new("UIPadding")
		v439.PaddingTop = UDim.new(0, 8)
		v439.PaddingBottom = UDim.new(0, 8)
		v439.PaddingLeft = UDim.new(0, 12)
		v439.PaddingRight = UDim.new(0, 12)
		v439.Parent = v_u_437
		local v440 = Instance.new("UIListLayout")
		v440.SortOrder = Enum.SortOrder.LayoutOrder
		v440.FillDirection = Enum.FillDirection.Vertical
		v440.Padding = UDim.new(0, 2)
		v440.Parent = v_u_437
		local function v447(p441, p442, p443, p444, p445) -- name: makeModeLabel
			-- upvalues: (copy) v_u_437
			local v446 = Instance.new("TextLabel")
			v446.Name = p441
			v446.BackgroundTransparency = 1
			v446.TextColor3 = p445
			v446.Font = p443
			v446.TextSize = p444
			v446.TextXAlignment = Enum.TextXAlignment.Left
			v446.AutomaticSize = Enum.AutomaticSize.XY
			v446.Size = UDim2.new(0, 0, 0, 0)
			v446.LayoutOrder = p442
			v446.Parent = v_u_437
			return v446
		end
		local v448 = v447("Breadcrumb", 1, Enum.Font.Gotham, 11, Color3.fromRGB(100, 100, 100))
		local v449 = v447("Title", 2, Enum.Font.GothamBold, 14, Color3.new(1, 1, 1))
		local v450 = v447("NavHint", 3, Enum.Font.Gotham, 12, Color3.fromRGB(120, 120, 120))
		local v451 = v447("ActionHint", 4, Enum.Font.GothamMedium, 12, Color3.fromRGB(200, 200, 200))
		v_u_437.Parent = v_u_412
		v_u_28 = v_u_412
		local v452 = {
			["bloom"] = {
				["bubble"] = v421,
				["label"] = v422
			},
			["blur"] = {
				["bubble"] = v423,
				["label"] = v424
			},
			["cc"] = {
				["bubble"] = v425,
				["label"] = v426
			},
			["sunrays"] = {
				["bubble"] = v427,
				["label"] = v428
			},
			["colorgrading"] = {
				["bubble"] = v429,
				["label"] = v430
			},
			["dof"] = {
				["bubble"] = v431,
				["label"] = v432
			},
			["lock"] = {
				["bubble"] = v433,
				["label"] = v434
			},
			["status"] = {
				["bubble"] = v435,
				["label"] = v436
			},
			["mode"] = {
				["bubble"] = v_u_437,
				["breadcrumb"] = v448,
				["title"] = v449,
				["nav"] = v450,
				["action"] = v451
			}
		}
		v_u_29 = v452
		v_u_412.Parent = v_u_18
	end
	v_u_382.Push()
	v_u_18.Enabled = true
	for _, v453 in ipairs(v_u_64) do
		local v454 = v_u_27[v453.key]
		local v455 = v453.class
		local v456 = "Freecam" .. v453.key
		local v457 = Instance.new(v455)
		v457.Name = v456
		v457.Parent = v_u_19
		if v_u_39 and v453.parent then
			v457.Parent = v453.parent
		end
		for _, v458 in ipairs(v453.props) do
			v457[v458] = v454[v458]
		end
		v457.Enabled = v454.Enabled
		v453.set(v457)
	end
	v_u_7:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, v_u_381)
	v_u_127.StartCapture()
end
local function v_u_464() -- name: StopFreecam
	-- upvalues: (ref) v_u_87, (ref) v_u_88, (ref) v_u_89, (ref) v_u_93, (ref) v_u_92, (copy) v_u_63, (ref) v_u_60, (ref) v_u_64, (copy) v_u_27, (ref) v_u_36, (ref) v_u_292, (ref) v_u_18, (ref) v_u_95, (ref) v_u_96, (copy) v_u_127, (copy) v_u_7, (ref) v_u_382
	if v_u_87 then
		v_u_87:Disconnect()
		v_u_87 = nil
	end
	if v_u_88 then
		v_u_88:Disconnect()
		v_u_88 = nil
	end
	v_u_89 = false
	v_u_93 = 1
	v_u_92 = {}
	v_u_63()
	v_u_60 = false
	for _, v460 in ipairs(v_u_64) do
		local v461 = v460.get()
		if not v461 then
			continue
		end
		local v462 = v_u_27[v460.key]
		v462.Enabled = v461.Enabled
		for _, v463 in ipairs(v460.props) do
			v462[v463] = v461[v463]
		end
		v461:Destroy()
		v460.set(nil)
	end
	if v_u_36 and v_u_292 then
		v_u_292.panel.Visible = false
	end
	if v_u_18 and v_u_18.Parent then
		v_u_18.Enabled = false
	end
	v_u_95 = false
	v_u_96 = false
	v_u_127.StopCapture()
	v_u_7:UnbindFromRenderStep("Freecam")
	v_u_382.Pop()
end
local v_u_465 = false
v_u_100.StateChanged:Connect(function(p466)
	-- upvalues: (ref) v_u_465, (copy) v_u_464, (copy) v_u_459, (ref) v_u_33, (copy) v_u_16
	if p466 then
		if v_u_465 then
			v_u_464()
		else
			v_u_459()
		end
		v_u_465 = not v_u_465
		if v_u_33 then
			script:SetAttribute(v_u_16.AttributeName, v_u_465)
		end
	end
end)
if v_u_33 then
	script:SetAttribute(v_u_16.AttributeName, v_u_465)
	script:GetAttributeChangedSignal(v_u_16.AttributeName):Connect(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_465, (copy) v_u_459, (copy) v_u_464
		local v467 = script:GetAttribute(v_u_16.AttributeName)
		if typeof(v467) == "boolean" then
			if v467 ~= v_u_465 then
				if v467 then
					v_u_459()
					v_u_465 = true
					return
				end
				v_u_464()
				v_u_465 = false
			end
		else
			script:SetAttribute(v_u_16.AttributeName, v_u_465)
		end
	end)
end
return {}