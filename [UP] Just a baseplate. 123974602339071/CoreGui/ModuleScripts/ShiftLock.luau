-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.SettingFields.ShiftLock
local v1 = script:FindFirstAncestor("Settings")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = UserSettings().GameSettings
local v5 = game:GetService("Players")
local v6 = require(v2.Workspace.Packages.SettingsService)
local v7 = v6.ValueChangedSignal
local v_u_8 = v6.AvailabilitySignal
local v9 = v6.VisibilitySignal
local v10 = v6.SettingEnum
local v11 = require(v1.Integrations.Constants)
local v_u_12 = v5.LocalPlayer
local v13 = v11.GAMESETTINGS.LAYOUT_ORDER
local v_u_14 = {
	[Enum.ControlMode.MouseLockSwitch] = true,
	[Enum.ControlMode.Classic] = false
}
local v15 = v_u_14[v_u_4.ControlMode]
local v16 = v7.new(v15)
v16:connect(function(p17)
	-- upvalues: (copy) v_u_14, (copy) v_u_4
	if v_u_14[v_u_4.ControlMode] ~= p17 then
		local v18 = v_u_4
		local v19
		if p17 then
			v19 = Enum.ControlMode.MouseLockSwitch
		else
			v19 = Enum.ControlMode.Classic
		end
		v18.ControlMode = v19
	end
end)
local v20 = v9.new(true)
local v38 = (function(_, p_u_21) -- name: ShiftLockAvailability
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_8
	local v22 = v_u_8.new
	local v23 = not v_u_12 and true or v_u_12.DevEnableMouseLock
	local v24 = v_u_3.MouseEnabled
	if v24 then
		local v25 = v_u_3.KeyboardEnabled
		if not v25 then
			v23 = v25
		end
	else
		v23 = v24
	end
	local v_u_26 = v22(v23)
	v_u_26:connect(function(p27)
		-- upvalues: (copy) p_u_21
		if p27 then
			p_u_21:set(p27)
		end
	end, true)
	if v_u_12 then
		v_u_12.Changed:Connect(function(p28)
			-- upvalues: (copy) v_u_26, (ref) v_u_12, (ref) v_u_3
			if p28 == "DevEnableMouseLock" then
				local v29 = v_u_26
				local v30 = not v_u_12 and true or v_u_12.DevEnableMouseLock
				local v31 = v_u_3.MouseEnabled
				if v31 then
					local v32 = v_u_3.KeyboardEnabled
					if not v32 then
						v30 = v32
					end
				else
					v30 = v31
				end
				v29:set(v30)
			end
		end)
	end
	v_u_3.Changed:Connect(function(p33)
		-- upvalues: (copy) v_u_26, (ref) v_u_12, (ref) v_u_3
		if p33 == "MouseEnabled" or p33 == "KeyboardEnabled" then
			local v34 = v_u_26
			local v35 = not v_u_12 and true or v_u_12.DevEnableMouseLock
			local v36 = v_u_3.MouseEnabled
			if v36 then
				local v37 = v_u_3.KeyboardEnabled
				if not v37 then
					v35 = v37
				end
			else
				v35 = v36
			end
			v34:set(v35)
		end
	end)
	return v_u_26
end)(v16, v20)
return {
	["id"] = "shift-lock",
	["field_type"] = nil,
	["label"] = "CoreScripts.InGameMenu.GameSettings.ShiftLock",
	["alreadyLocalized"] = false,
	["onChanged"] = nil,
	["availability"] = nil,
	["visibility"] = nil,
	["layoutOrder"] = nil,
	["field_type"] = v10.Toggle,
	["onChanged"] = v16,
	["availability"] = v38,
	["visibility"] = v20,
	["layoutOrder"] = v13.ShiftLockFrame
}