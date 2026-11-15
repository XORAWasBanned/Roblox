-- Path: CoreGui.RobloxGui.Modules.Settings.Components.TabHeader.SwitchTabHint
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.ReactUtils)
local v5 = require(v1.Packages.Foundation)
local v6 = require(v1.Workspace.Packages.HelpPage)
local v_u_7 = v4.useEventConnection
local v_u_8 = v5.Icon
local v_u_9 = v5.Hooks.useTokens
local v_u_10 = v6.Constants.HELP_PAGE
local v11 = require(v1.Workspace.Packages.SharedFlags)
local v_u_12 = v11.FFlagGamepadIconSupportCheck
local v_u_13 = v11.FFlagLuaSupportMicroGamepadPreferredInput
local function v_u_15(p14) -- name: getSupportsButton
	-- upvalues: (copy) v_u_12, (copy) v_u_2
	return not v_u_12 and true or v_u_2:GamepadSupports(v_u_2:GetLastInputType(), p14)
end
return v_u_3.memo(v_u_3.forwardRef(function(p_u_16, p17) -- name: SwitchTabHint
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_15, (copy) v_u_2, (copy) v_u_13, (copy) v_u_7, (copy) v_u_12, (copy) v_u_10, (copy) v_u_8
	local v18 = v_u_9()
	local v19, v_u_20 = v_u_3.useState(v_u_15(p_u_16.keycode))
	local v_u_21, v_u_22 = v_u_3.useState(v_u_2:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross")
	local v23 = v_u_3.useBinding
	local v24 = v_u_2.PreferredInput ~= Enum.PreferredInput.Gamepad and v_u_13
	if v24 then
		v24 = v_u_2.PreferredInput == Enum.PreferredInput.MicroGamepad
	end
	local v25, v_u_26 = v23(v24)
	v_u_7(v_u_2:GetPropertyChangedSignal("PreferredInput"), function()
		-- upvalues: (copy) v_u_26, (ref) v_u_2, (ref) v_u_13, (copy) v_u_22
		local v27 = v_u_26
		local v28 = v_u_2.PreferredInput ~= Enum.PreferredInput.Gamepad and v_u_13
		if v28 then
			v28 = v_u_2.PreferredInput == Enum.PreferredInput.MicroGamepad
		end
		v27(v28)
		v_u_22(v_u_2:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross")
	end, {})
	if v_u_12 then
		v_u_7(v_u_2.LastInputTypeChanged, function()
			-- upvalues: (copy) v_u_20, (ref) v_u_15, (copy) p_u_16
			v_u_20(v_u_15(p_u_16.keycode))
		end, {})
	end
	local v29 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_21, (ref) v_u_10, (copy) p_u_16
		if v_u_21 then
			return v_u_10.GAMEPAD_ICON_MAP_PLAYSTATION[p_u_16.keycode]
		else
			return v_u_10.GAMEPAD_ICON_MAP_XBOX[p_u_16.keycode]
		end
	end, { p_u_16.keycode, v_u_21 })
	if v19 then
		return v_u_3.createElement(v_u_8, {
			["name"] = v29,
			["size"] = v18.Size.Size_800,
			["Visible"] = v25,
			["ref"] = p17
		})
	else
		return nil
	end
end))