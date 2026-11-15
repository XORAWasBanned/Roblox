-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.constants
local v1 = { Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter, Enum.KeyCode.ButtonA }
local v2 = {
	["enter"] = nil,
	["exit"] = nil,
	["stepIncrement"] = nil,
	["stepDecrement"] = nil,
	["thumbSwitch"] = nil,
	["coarseIncrement"] = nil,
	["coarseDecrement"] = nil,
	["analogStep"] = nil,
	["thumbstickDeadzone"] = 0.8,
	["enter"] = v1,
	["exit"] = { Enum.KeyCode.Backspace, Enum.KeyCode.ButtonB },
	["stepIncrement"] = {
		["horizontal"] = { Enum.KeyCode.Right, Enum.KeyCode.DPadRight },
		["vertical"] = { Enum.KeyCode.Up, Enum.KeyCode.DPadUp }
	},
	["stepDecrement"] = {
		["horizontal"] = { Enum.KeyCode.Left, Enum.KeyCode.DPadLeft },
		["vertical"] = { Enum.KeyCode.Down, Enum.KeyCode.DPadDown }
	},
	["thumbSwitch"] = v1,
	["coarseIncrement"] = { Enum.KeyCode.ButtonR1 },
	["coarseDecrement"] = { Enum.KeyCode.ButtonL1 },
	["analogStep"] = { Enum.KeyCode.Thumbstick1 }
}
return v2