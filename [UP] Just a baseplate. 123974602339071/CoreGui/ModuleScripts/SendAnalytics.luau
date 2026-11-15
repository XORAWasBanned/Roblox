-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Utility.SendAnalytics
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("RbxAnalyticsService")
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Resources.Constants)
local v_u_5 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_6 = v_u_4.InputTypeMap
return function(p7, p8, p9, p10, p11)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	if p11 == nil then
		p11 = v_u_2
	end
	local function v26() -- name: reportSettingsForAnalytics
		-- upvalues: (ref) v_u_1
		local v12 = UserSettings().GameSettings
		local v13 = {}
		if v_u_1.TouchEnabled then
			local v14 = v12.TouchCameraMovementMode
			v13.camera_mode_touch = tostring(v14)
		else
			local v15 = v12.ComputerCameraMovementMode
			v13.camera_mode_desktop = tostring(v15)
		end
		if v_u_1.TouchEnabled then
			local v16 = v12.TouchMovementMode
			v13.movement_mode_touch = tostring(v16)
		else
			local v17 = v12.ComputerMovementMode
			v13.movement_mode_desktop = tostring(v17)
		end
		if v_u_1.MouseEnabled then
			local v18 = v12.ControlMode == Enum.ControlMode.MouseLockSwitch
			v13.shift_lock_enabled = tostring(v18)
		end
		if v_u_1.GamepadEnabled and v12.IsUsingGamepadCameraSensitivity then
			v13.camera_sensitivity_gamepad = string.format("%.2f", v12.GamepadCameraSensitivity)
		end
		if v_u_1.MouseEnabled then
			v13.camera_sensitivity_mouse = string.format("%.2f", v12.MouseSensitivityFirstPerson.X)
		end
		local v19 = v12.CameraYInverted
		v13.camera_y_inverted = tostring(v19)
		local v20 = v12.PerformanceStatsVisible
		v13.show_performance_stats = tostring(v20)
		local v21 = v12.MasterVolume * 10 + 0.5
		local v22 = math.floor(v21)
		v13.volume = tostring(v22)
		local v23 = settings().Rendering.QualityLevel
		v13.gfx_quality_level = tostring(v23)
		v13.fullscreen_enabled = tostring(v12:InFullScreen())
		local v24 = v12.OnScreenProfilerEnabled
		v13.microprofiler_enabled = tostring(v24)
		local v25 = v12.MicroProfilerWebServerEnabled
		v13.microprofiler_webserver_enabled = tostring(v25)
		return v13
	end
	if p10 == true then
		p9 = v26()
		p8 = v_u_4.AnalyticsSettingsChangeName
		p7 = v_u_4.AnalyticsInGameMenuName
	end
	local v27 = p9 or {}
	local v28 = game.GameId
	v27.universeid = tostring(v28)
	local v29 = v_u_6[v_u_1:GetLastInputType()] or v_u_1:GetLastInputType()
	v27.inputDevice = tostring(v29)
	if v27.playsessionid == nil and v_u_5 then
		v27.playsessionid = v_u_2:GetPlaySessionId()
	end
	p11:SetRBXEventStream(v_u_4.AnalyticsTargetName, p7, p8, v27)
end