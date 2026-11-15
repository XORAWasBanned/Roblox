-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Resources.Controls
local v1 = game:GetService("UserInputService")
local v2 = Enum.KeyCode
local v3 = Enum.UserInputType
local v4 = {
	["KEYBOARD"] = "Keyboard",
	["GAMEPAD"] = "Gamepad"
}
local v5 = {
	[Enum.UserInputType.MouseButton2] = v4.KEYBOARD,
	[Enum.UserInputType.MouseButton3] = v4.KEYBOARD,
	[Enum.UserInputType.MouseWheel] = v4.KEYBOARD,
	[Enum.UserInputType.MouseMovement] = v4.KEYBOARD,
	[Enum.UserInputType.Keyboard] = v4.KEYBOARD,
	[Enum.UserInputType.Gamepad1] = v4.GAMEPAD,
	[Enum.UserInputType.Gamepad2] = v4.GAMEPAD,
	[Enum.UserInputType.Gamepad3] = v4.GAMEPAD,
	[Enum.UserInputType.Gamepad4] = v4.GAMEPAD,
	[Enum.UserInputType.Gamepad5] = v4.GAMEPAD,
	[Enum.UserInputType.Gamepad6] = v4.GAMEPAD,
	[Enum.UserInputType.Gamepad7] = v4.GAMEPAD,
	[Enum.UserInputType.Gamepad8] = v4.GAMEPAD
}
local v6 = {}
local v7 = {
	["title"] = "CoreScripts.InGameMenu.Controls.CharacterMovementTitle",
	["controls"] = nil,
	["controls"] = {
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.MoveForward",
			["inputs"] = nil,
			["inputs"] = { v2.Up, v2.W }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.MoveBackward",
			["inputs"] = nil,
			["inputs"] = { v2.Down, v2.S }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.MoveLeft",
			["inputs"] = nil,
			["inputs"] = { v2.A }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.MoveRight",
			["inputs"] = nil,
			["inputs"] = { v2.D }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.Jump",
			["inputs"] = nil,
			["inputs"] = { v2.Space }
		}
	}
}
local v8 = {
	["title"] = "CoreScripts.InGameMenu.Controls.CameraMovementTitle",
	["controls"] = nil,
	["controls"] = {
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.RotateCamera",
			["inputs"] = nil,
			["inputs"] = { v2.Left, v2.Right, v3.MouseButton2 }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.ZoomInOutCamera",
			["inputs"] = nil,
			["inputs"] = { v3.MouseWheel }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.ZoomInCamera",
			["inputs"] = nil,
			["inputs"] = { v2.I }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.ZoomOutCamera",
			["inputs"] = nil,
			["inputs"] = { v2.O }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.MouseLock",
			["inputs"] = nil,
			["inputs"] = { v2.LeftShift }
		}
	}
}
local v9 = {
	["title"] = "CoreScripts.InGameMenu.Controls.AccessoriesTitle",
	["controls"] = nil,
	["controls"] = {
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.EquipUnequipTools",
			["inputs"] = nil,
			["list"] = true,
			["inputs"] = { v2.One, v2.Two, v2.Three }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.DropTool",
			["inputs"] = nil,
			["inputs"] = { v2.Backspace }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.UseTool",
			["inputs"] = nil,
			["inputs"] = { v3.MouseButton1 }
		}
	}
}
local v10 = {
	["title"] = "CoreScripts.InGameMenu.Controls.MenuItemsTitle",
	["controls"] = nil,
	["controls"] = {
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.RobloxMenu",
			["inputs"] = nil,
			["inputs"] = { v2.Escape }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.Backpack",
			["inputs"] = nil,
			["inputs"] = { v2.Tilde }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.Playerlist",
			["inputs"] = nil,
			["inputs"] = { v2.Tab }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.Chat",
			["inputs"] = nil,
			["inputs"] = { v2.Slash }
		}
	}
}
__set_list(v6, 1, {v7, v8, v9, v10})
local v11 = {
	["title"] = "CoreScripts.InGameMenu.Controls.MiscellaneousTitle",
	["controls"] = nil,
	["controls"] = {
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad",
			["inputs"] = nil,
			["inputs"] = { v2.BackSlash }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.Screenshot",
			["inputs"] = nil,
			["inputs"] = {
				{ v2.LeftSuper, v2.LeftShift, v2.Three }
			}
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.DevConsole",
			["inputs"] = nil,
			["inputs"] = {
				{ v2.LeftMeta, v2.F9 },
				v2.F9
			}
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.GraphicsLevelUp",
			["inputs"] = nil,
			["inputs"] = {
				{ v2.LeftMeta, v2.F10 },
				v2.F10
			}
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.GraphicsLevelDown",
			["inputs"] = nil,
			["inputs"] = {
				{ v2.LeftMeta, v2.LeftShift, v2.F10 },
				{ v2.LeftShift, v2.F10 }
			}
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.ToggleFullscreen",
			["inputs"] = nil,
			["inputs"] = {
				{ v2.LeftControl, v2.LeftSuper, v2.F }
			}
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.PerformanceStats",
			["inputs"] = nil,
			["inputs"] = {
				{
					v2.LeftMeta,
					v2.LeftAlt,
					v2.LeftSuper,
					v2.F7
				}
			}
		}
	}
}
local v12 = {
	["title"] = "CoreScripts.InGameMenu.Controls.MiscellaneousTitle",
	["controls"] = nil,
	["controls"] = {
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad",
			["inputs"] = nil,
			["inputs"] = { v2.BackSlash }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.Screenshot",
			["inputs"] = nil,
			["inputs"] = { v2.Print }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.RecordVideo",
			["inputs"] = nil,
			["inputs"] = { v2.F12 }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.DevConsole",
			["inputs"] = nil,
			["inputs"] = { v2.F9 }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.GraphicsLevelUp",
			["inputs"] = nil,
			["inputs"] = { v2.F10 }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.GraphicsLevelDown",
			["inputs"] = nil,
			["inputs"] = {
				{ v2.LeftShift, v2.F10 }
			}
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.ToggleFullscreen",
			["inputs"] = nil,
			["inputs"] = { v2.F11 }
		},
		{
			["desc"] = "CoreScripts.InGameMenu.Controls.PerformanceStats",
			["inputs"] = nil,
			["inputs"] = {
				{ v2.LeftControl, v2.LeftShift, v2.F7 }
			}
		}
	}
}
if v1:GetPlatform() == Enum.Platform.OSX then
	table.insert(v6, v11)
else
	table.insert(v6, v12)
end
return {
	["ControlLayouts"] = v4,
	["keybinds"] = v6,
	["inputToControlTypeMap"] = v5,
	["gamepadLabels"] = {
		["left"] = {
			"CoreScripts.InGameMenu.Controls.SwitchToolGamepad",
			"CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad",
			"CoreScripts.InGameMenu.Controls.MoveGamepad",
			"CoreScripts.InGameMenu.Controls.MenuNavigationGamepad"
		},
		["right"] = {
			"CoreScripts.InGameMenu.Controls.UseTool",
			"CoreScripts.InGameMenu.Controls.RobloxMenu",
			"CoreScripts.InGameMenu.Controls.BackGamepad",
			"CoreScripts.InGameMenu.Controls.Jump"
		},
		["camera"] = { "CoreScripts.InGameMenu.Controls.RotateCameraGamepad", "CoreScripts.InGameMenu.Controls.CameraZoomGamepad" }
	},
	["questGamepadLabels"] = {
		{
			["labelKey"] = "ResetCameraLabel",
			["xPosition"] = -0.015,
			["yPosition"] = 0.335,
			["xAlignment"] = nil,
			["width"] = 0.17,
			["xAlignment"] = Enum.TextXAlignment.Right
		},
		{
			["labelKey"] = "MenuLabel",
			["xPosition"] = -0.015,
			["yPosition"] = 0.397,
			["xAlignment"] = nil,
			["width"] = 0.17,
			["xAlignment"] = Enum.TextXAlignment.Right
		},
		{
			["labelKey"] = "SelectItemLabel",
			["xPosition"] = 0.442,
			["yPosition"] = 0.621,
			["xAlignment"] = nil,
			["width"] = 0.09,
			["xAlignment"] = Enum.TextXAlignment.Center
		},
		{
			["labelKey"] = "BackExitLabel",
			["xPosition"] = 0.818,
			["yPosition"] = 0.287,
			["xAlignment"] = nil,
			["width"] = 0.17,
			["xAlignment"] = Enum.TextXAlignment.Left
		},
		{
			["labelKey"] = "FirstPersonCameraLabel",
			["xPosition"] = 0.818,
			["yPosition"] = 0.342,
			["xAlignment"] = nil,
			["width"] = 0.17,
			["xAlignment"] = Enum.TextXAlignment.Left
		},
		{
			["labelKey"] = "JumpSelectLabel",
			["xPosition"] = 0.818,
			["yPosition"] = 0.413,
			["xAlignment"] = nil,
			["width"] = 0.17,
			["xAlignment"] = Enum.TextXAlignment.Left
		}
	}
}