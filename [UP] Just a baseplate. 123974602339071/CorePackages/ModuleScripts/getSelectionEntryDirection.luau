-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.getSelectionEntryDirection
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers.Services).UserInputService
local v_u_3 = require(script.Parent.constants)
local function v_u_11(p4) -- name: getThumbstickDirection
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = v_u_2:GetLastInputType()
	if not v5.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v5) == nil then
		v5 = nil
	end
	if not v5 then
		return 0
	end
	for _, v6 in v_u_2:GetGamepadState(v5) do
		if v6.KeyCode ~= Enum.KeyCode.Thumbstick1 then
			continue
		end
		local v7 = v6.Position.X
		local v8 = v6.Position.Y
		local v9
		if p4 then
			v9 = v_u_3.thumbstickDeadzone <= v8 and true or v_u_3.thumbstickDeadzone <= v7
		else
			v9 = v_u_3.thumbstickDeadzone <= v7 and true or v8 <= -v_u_3.thumbstickDeadzone
		end
		local v10
		if p4 then
			v10 = v8 <= -v_u_3.thumbstickDeadzone and true or v7 <= -v_u_3.thumbstickDeadzone
		else
			v10 = v7 <= -v_u_3.thumbstickDeadzone and true or v_u_3.thumbstickDeadzone <= v8
		end
		return v9 and 1 or (v10 and -1 or 0)
	end
	return 0
end
return function(p12) -- name: getSelectionEntryDirection
	-- upvalues: (copy) v_u_2, (copy) v_u_11
	local v13
	if p12 then
		local v14 = Enum.KeyCode.Up
		local v15 = Enum.KeyCode.DPadUp
		if v_u_2:IsKeyDown(v14) then
			v13 = true
		else
			local v16 = v_u_2:GetLastInputType()
			if not v16.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v16) == nil then
				v16 = nil
			end
			if v16 == nil then
				v13 = false
			else
				v13 = v_u_2:IsGamepadButtonDown(v16, v15)
			end
		end
		if not v13 then
			local v17 = Enum.KeyCode.Right
			local v18 = Enum.KeyCode.DPadRight
			if v_u_2:IsKeyDown(v17) then
				v13 = true
			else
				local v19 = v_u_2:GetLastInputType()
				if not v19.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v19) == nil then
					v19 = nil
				end
				if v19 == nil then
					v13 = false
				else
					v13 = v_u_2:IsGamepadButtonDown(v19, v18)
				end
			end
		end
	else
		local v20 = Enum.KeyCode.Right
		local v21 = Enum.KeyCode.DPadRight
		if v_u_2:IsKeyDown(v20) then
			v13 = true
		else
			local v22 = v_u_2:GetLastInputType()
			if not v22.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v22) == nil then
				v22 = nil
			end
			if v22 == nil then
				v13 = false
			else
				v13 = v_u_2:IsGamepadButtonDown(v22, v21)
			end
		end
		if not v13 then
			local v23 = Enum.KeyCode.Down
			local v24 = Enum.KeyCode.DPadDown
			if v_u_2:IsKeyDown(v23) then
				v13 = true
			else
				local v25 = v_u_2:GetLastInputType()
				if not v25.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v25) == nil then
					v25 = nil
				end
				if v25 == nil then
					v13 = false
				else
					v13 = v_u_2:IsGamepadButtonDown(v25, v24)
				end
			end
		end
	end
	local v26
	if p12 then
		local v27 = Enum.KeyCode.Down
		local v28 = Enum.KeyCode.DPadDown
		if v_u_2:IsKeyDown(v27) then
			v26 = true
		else
			local v29 = v_u_2:GetLastInputType()
			if not v29.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v29) == nil then
				v29 = nil
			end
			if v29 == nil then
				v26 = false
			else
				v26 = v_u_2:IsGamepadButtonDown(v29, v28)
			end
		end
		if not v26 then
			local v30 = Enum.KeyCode.Left
			local v31 = Enum.KeyCode.DPadLeft
			if v_u_2:IsKeyDown(v30) then
				v26 = true
			else
				local v32 = v_u_2:GetLastInputType()
				if not v32.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v32) == nil then
					v32 = nil
				end
				if v32 == nil then
					v26 = false
				else
					v26 = v_u_2:IsGamepadButtonDown(v32, v31)
				end
			end
		end
	else
		local v33 = Enum.KeyCode.Left
		local v34 = Enum.KeyCode.DPadLeft
		if v_u_2:IsKeyDown(v33) then
			v26 = true
		else
			local v35 = v_u_2:GetLastInputType()
			if not v35.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v35) == nil then
				v35 = nil
			end
			if v35 == nil then
				v26 = false
			else
				v26 = v_u_2:IsGamepadButtonDown(v35, v34)
			end
		end
		if not v26 then
			local v36 = Enum.KeyCode.Up
			local v37 = Enum.KeyCode.DPadUp
			if v_u_2:IsKeyDown(v36) then
				v26 = true
			else
				local v38 = v_u_2:GetLastInputType()
				if not v38.Name:match("^Gamepad") or table.find(v_u_2:GetConnectedGamepads(), v38) == nil then
					v38 = nil
				end
				if v38 == nil then
					v26 = false
				else
					v26 = v_u_2:IsGamepadButtonDown(v38, v37)
				end
			end
		end
	end
	return v13 and 1 or (v26 and -1 or v_u_11(p12))
end