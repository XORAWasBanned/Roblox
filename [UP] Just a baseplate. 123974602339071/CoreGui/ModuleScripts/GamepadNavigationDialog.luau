-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadNavigationDialog
local v1 = game:GetService("CorePackages")
game:GetService("AppStorageService")
game:GetService("HttpService")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v1.Packages.React)
require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v7 = require(v1.Packages.RoactAppExperiment)
local _ = v6.Core.Style.withStyle
local v_u_8 = require(script.GamepadNavigationDialogShowCounter)
local v9 = script.Parent.Parent
local v10 = script.Parent.Parent.Parent
local v11 = v9.Parent.Actions
local v_u_12 = require(v11.SetGamepadNavigationDialogOpen)
local v13 = require(v10.Flags.GetFStringGamepadNavigationDialogABTestLayerName)
local v_u_14 = require(v10.Flags.FFlagAlwaysShowGamepadNavigationDialog)
local v15 = require(v10.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux)
local function v21(_) -- name: GamepadNavigationDialogContainer
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_8, (copy) v_u_14
	local v16, v_u_17 = v_u_4.useState(false)
	v_u_4.useEffect(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_17, (ref) v_u_2
		local v_u_18 = nil
		local function v19() -- name: disconnectGamepadConnected
			-- upvalues: (ref) v_u_18
			if v_u_18 then
				v_u_18:Disconnect()
				v_u_18 = nil
			end
		end
		if v_u_3:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			v_u_17(true)
		else
			v_u_18 = v_u_3.GamepadConnected:Connect(function()
				-- upvalues: (ref) v_u_17, (ref) v_u_18
				v_u_17(true)
				if v_u_18 then
					v_u_18:Disconnect()
					v_u_18 = nil
				end
			end)
		end
		v_u_2:GetPropertyChangedSignal("MenuIsOpen"):Connect(v19)
		return v19
	end, {})
	if not v16 then
		return nil
	end
	local v20 = {
		["isGamepadNavigationDialogEnabled"] = nil,
		["selectButtonDismissesGamepadNavigationDialog"] = false,
		["appStorageKey"] = "GamepadMenuVirtualCursorPromptShown",
		["maxShownCount"] = 1,
		["isGamepadNavigationDialogOpen"] = nil,
		["SetGamepadNavigationDialogOpen"] = nil,
		["isGamepadNavigationDialogEnabled"] = v_u_14,
		["isGamepadNavigationDialogOpen"] = v16,
		["SetGamepadNavigationDialogOpen"] = v_u_17
	}
	return v_u_4.createElement(v_u_8, v20)
end
local v_u_22 = v13()
local v25 = v7.connectUserLayer({ v_u_22 }, function(p23, _)
	-- upvalues: (copy) v_u_22, (copy) v_u_14
	local v24 = p23[v_u_22] or {}
	return {
		["isGamepadNavigationDialogEnabled"] = nil,
		["selectButtonDismissesGamepadNavigationDialog"] = nil,
		["appStorageKey"] = "GamepadMenuVirtualCursorPromptShown",
		["maxShownCount"] = 1,
		["isGamepadNavigationDialogEnabled"] = v_u_14 or v24.isGamepadNavigationDialogEnabled,
		["selectButtonDismissesGamepadNavigationDialog"] = v24.selectButtonDismissesGamepadNavigationDialog
	}
end)(v_u_8)
if v15 then
	return v21
else
	return v5.connect(function(p26)
		return {
			["isGamepadNavigationDialogOpen"] = p26.displayOptions.isGamepadNavigationDialogOpen
		}
	end, function(p_u_27)
		-- upvalues: (copy) v_u_12
		return {
			["SetGamepadNavigationDialogOpen"] = function(p28) -- name: SetGamepadNavigationDialogOpen
				-- upvalues: (copy) p_u_27, (ref) v_u_12
				return p_u_27(v_u_12(p28))
			end
		}
	end)(v25)
end