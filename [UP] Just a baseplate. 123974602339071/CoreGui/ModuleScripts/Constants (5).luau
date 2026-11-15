-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Constants
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.enumerate)
local v3 = script.Parent.Layouts
local v4 = require(v3.Small)
local v5 = require(v3.Large)
local v6 = require(v3.TenFoot)
local v7 = {
	["EmotesPerPage"] = 8,
	["ErrorDisplayTimeSeconds"] = 5,
	["FallbackLocale"] = "en-us",
	["LocalizationKeys"] = {
		["SelectAnEmote"] = "InGame.EmotesMenu.SelectAnEmote",
		["NoEmotesEquipped"] = "InGame.EmotesMenu.NoEmotesEquipped",
		["EmotesDisabled"] = "InGame.EmotesMenu.EmotesDisabled",
		["VisitShopToGetEmotes"] = "InGame.EmotesMenu.VisitShopToGetEmotes",
		["ErrorMessages"] = nil,
		["ErrorMessages"] = {
			["NotSupported"] = "InGame.EmotesMenu.ErrorMessageNotSupported",
			["R15Only"] = "InGame.EmotesMenu.ErrorMessageR15Only",
			["SwitchToR15"] = "InGame.EmotesMenu.ErrorMessageSwitchToR15",
			["NoMatchingEmote"] = "InGame.EmotesMenu.ErrorMessageNoMatchingEmote",
			["TemporarilyUnavailable"] = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable",
			["AnimationPlaying"] = "InGame.EmotesMenu.ErrorMessageAnimationPlaying"
		}
	},
	["ErrorTypes"] = {
		["NotSupported"] = "NotSupported",
		["R15Only"] = "R15Only",
		["SwitchToR15"] = "SwitchToR15",
		["NoMatchingEmote"] = "NoMatchingEmote",
		["TemporarilyUnavailable"] = "TemporarilyUnavailable",
		["AnimationPlaying"] = "AnimationPlaying"
	},
	["EmotesImage"] = "rbxthumb://type=Asset&id=%d&w=420&h=420",
	["EmotesMenuZIndex"] = 50,
	["ErrorFrameBorderSize"] = 0,
	["ErrorFrameBackgroundTransparency"] = 0.3,
	["WheelBackgroundTransparency"] = 0.4,
	["TextPadding"] = 10,
	["SegmentsStartRotation"] = -90,
	["InnerCircleSizeRatio"] = 0.45,
	["SlotNumberSize"] = 0.1,
	["ImageOutsidePadding"] = 0.025,
	["GradientTransparency"] = 0.5,
	["CursorOverrideName"] = "EmotesMenuCursorOverride",
	["GamepadInputTypes"] = {
		[Enum.UserInputType.Gamepad1] = true,
		[Enum.UserInputType.Gamepad2] = true,
		[Enum.UserInputType.Gamepad3] = true,
		[Enum.UserInputType.Gamepad4] = true,
		[Enum.UserInputType.Gamepad5] = true,
		[Enum.UserInputType.Gamepad6] = true,
		[Enum.UserInputType.Gamepad7] = true,
		[Enum.UserInputType.Gamepad8] = true
	},
	["LeaveMenuNoSinkInputs"] = {
		Enum.KeyCode.W,
		Enum.KeyCode.A,
		Enum.KeyCode.S,
		Enum.KeyCode.D,
		Enum.KeyCode.Up,
		Enum.KeyCode.Left,
		Enum.KeyCode.Down,
		Enum.KeyCode.Right,
		Enum.KeyCode.Space,
		Enum.KeyCode.Tab,
		Enum.KeyCode.Slash,
		Enum.KeyCode.Backquote
	},
	["EmoteSlotKeys"] = {
		Enum.KeyCode.One,
		Enum.KeyCode.Two,
		Enum.KeyCode.Three,
		Enum.KeyCode.Four,
		Enum.KeyCode.Five,
		Enum.KeyCode.Six,
		Enum.KeyCode.Seven,
		Enum.KeyCode.Eight
	},
	["EmoteMenuOpenKey"] = Enum.KeyCode.Period,
	["EmoteMenuOpenButton"] = Enum.KeyCode.DPadDown,
	["EmoteMenuCloseKey"] = Enum.KeyCode.Escape,
	["EmoteMenuCloseButton"] = Enum.KeyCode.ButtonB,
	["EmoteMenuCloseButtonSecondary"] = Enum.KeyCode.ButtonStart,
	["EmoteMenuNavUpButton"] = Enum.KeyCode.DPadUp,
	["EmoteMenuNavDownButton"] = Enum.KeyCode.DPadDown,
	["EmoteMenuPlayEmoteButton"] = Enum.KeyCode.DPadRight,
	["SelectionThumbstick"] = Enum.KeyCode.Thumbstick1,
	["ThumbstickThreshold"] = 0.8,
	["PlayEmoteButton"] = Enum.KeyCode.ButtonA,
	["ToggleMenuAction"] = "EmotesMenuToggleAction",
	["CloseMenuAction"] = "EmotesMenuCloseAction",
	["OpenMenuAction"] = "EmotesMenuOpenAction",
	["EmoteSelectionAction"] = "EmotesMenuSelectionAction",
	["ActivateEmoteSlotAction"] = "EmotesMenuActivateEmoteSlotAction",
	["PlaySelectedAction"] = "EmotesMenuPlaySelectedAction",
	["LeaveMenuDontSinkInputAction"] = "EmotesMenuLeaveMenuDontSinkInputAction",
	["ShiftFocusUpAction"] = "EmotesMenuShiftFocusUpAction",
	["ShiftFocusDownAction"] = "EmotesMenuShiftFocusDownAction",
	["VirtualCursorSinkAction"] = "EmotesMenuVirtualCursorSinkAction",
	["ScreenAvailable"] = UDim2.new(0.9, 0, 0.75, 0),
	["SmallScreenMaxSize"] = Vector2.new(700, 500),
	["Layout"] = {
		["Small"] = 0,
		["Large"] = 1,
		["TenFoot"] = 2
	},
	["Colors"] = {
		["White"] = Color3.new(1, 1, 1),
		["Black"] = Color3.new(0, 0, 0)
	},
	["OffScreen"] = v2("OffScreen", { "Top", "Bottom" })
}
v7.Layouts = {
	[v7.Layout.Small] = v4,
	[v7.Layout.Large] = v5,
	[v7.Layout.TenFoot] = v6
}
local v8 = {
	["Constants"] = v7,
	["Constants.Colors"] = v7.Colors,
	["Constants.Layout"] = v7.Layout,
	["Constants.LeaveMenuNoSinkInputs"] = v7.LeaveMenuNoSinkInputs,
	["Constants.LocalizationKeys"] = v7.LocalizationKeys,
	["Constants.LocalizationKeys.ErrorMessages"] = v7.LocalizationKeys.ErrorMessages,
	["Constants.Layouts"] = v7.Layouts,
	["Constants.Layouts.Small"] = v7.Layouts[v7.Layout.Small],
	["Constants.Layouts.Large"] = v7.Layouts[v7.Layout.Large],
	["Constants.Layouts.TenFoot"] = v7.Layouts[v7.Layout.TenFoot]
}
local function v12(p_u_9, p10) -- name: makeTableConstant
	setmetatable(p10, {
		["__newindex"] = function() -- name: __newindex end,
		["__index"] = function(_, p11) -- name: __index
			-- upvalues: (copy) p_u_9
			error(p_u_9 .. " table has no index: " .. tostring(p11), 2)
		end
	})
end
for v13, v14 in pairs(v8) do
	v12(v13, v14)
end
return v7