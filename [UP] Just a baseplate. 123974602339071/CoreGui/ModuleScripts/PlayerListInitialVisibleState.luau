-- Path: CoreGui.RobloxGui.Modules.PlayerList.PlayerListInitialVisibleState
local v_u_1 = game:GetService("VRService")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("UserInputService")
local v6 = v2:WaitForChild("RobloxGui")
local v_u_7 = require(v6.Modules.TenFootInterface)
local v_u_8 = require(v6.Modules.Settings.Utility)
local v9 = require(v3.Workspace.Packages.PlayerList)
local v10 = script.Parent
local v_u_11 = require(v10.Flags.FFlagPlayerListPersistVisibility)
local v_u_12 = require(v10.Flags.FStringPlayerListOverrideType)
local v_u_13 = v9.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_14 = v9.Common.isReskinConsoleMobileRoute
local v_u_15 = v9.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local v_u_16 = require(v3.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local function v_u_22(p17) -- name: isSmallTouchScreen
	-- upvalues: (copy) v_u_14, (copy) v_u_4, (copy) v_u_15, (copy) v_u_13, (copy) v_u_16, (copy) v_u_8, (copy) v_u_12
	if v_u_14({
		["displaySize"] = v_u_4.ViewportDisplaySize,
		["preferredInput"] = p17
	}) then
		return true
	end
	local v18
	if v_u_15 then
		v18 = v_u_4.ViewportDisplaySize == Enum.DisplaySize.Small
	else
		v18 = false
	end
	local v19
	if v_u_13 then
		v19 = v_u_4.ViewportDisplaySize == Enum.DisplaySize.Large
	else
		v19 = false
	end
	local v20 = (v_u_13 or v_u_15) and (p17 ~= Enum.PreferredInput.Touch and p17 ~= Enum.PreferredInput.Gamepad and v_u_16)
	if v20 then
		v20 = p17 == Enum.PreferredInput.MicroGamepad
	end
	local v21 = v_u_8:IsSmallTouchScreen()
	if v21 then
		v20 = v21
	elseif not (v_u_13 and (v19 and v20) or v_u_15 and (v18 and v20)) then
		v20 = v_u_12 == "mobile"
	end
	return v20
end
return function(p23)
	-- upvalues: (copy) v_u_5, (copy) v_u_22, (copy) v_u_1, (copy) v_u_14, (copy) v_u_4, (copy) v_u_13, (copy) v_u_7, (copy) v_u_11
	if p23 == nil then
		p23 = v_u_5.PreferredInput
	end
	local v24 = not (v_u_22(p23) or v_u_1.VREnabled) and (v_u_14({
		["displaySize"] = v_u_4.ViewportDisplaySize,
		["preferredInput"] = p23
	}) or (v_u_13 or not v_u_7:IsEnabled()))
	if v24 then
		if v_u_11 then
			return UserSettings().GameSettings.PlayerListVisible
		end
		v24 = true
	end
	return v24
end