-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useInputPlatform.detectInputPlatform
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers.Services).UserInputService
local v_u_3 = require(v1.Enums.InputPlatform)
local v_u_4 = {
	Enum.KeyCode.ButtonStart,
	Enum.KeyCode.ButtonSelect,
	Enum.KeyCode.ButtonA,
	Enum.KeyCode.ButtonL1,
	Enum.KeyCode.DPadUp
}
local function v_u_10(p_u_5) -- name: getPlatformFromImage
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local function v6()
		-- upvalues: (ref) v_u_2, (copy) p_u_5
		return v_u_2:GetImageForKeyCode(p_u_5)
	end
	local v7, v8 = pcall(v6)
	if v7 and (typeof(v8) == "string" and v8 ~= "") then
		local v9 = v8:lower()
		if v9:find("ps5") then
			return v_u_3.PS5
		elseif v9:find("ps4") then
			return v_u_3.PS4
		elseif v9:find("xbox") then
			return v_u_3.Xbox
		else
			return nil
		end
	else
		return nil
	end
end
return function() -- name: detectInputPlatform
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_10
	local function v11()
		-- upvalues: (ref) v_u_2
		return v_u_2:GetConnectedGamepads()
	end
	local v12, v13 = pcall(v11)
	if v12 then
		if typeof(v13) == "table" then
			v12 = #v13 > 0
		else
			v12 = false
		end
	end
	if v12 then
		for _, v14 in v_u_4 do
			v15 = v_u_10(v14)
			if v15 == nil then
				continue
			end
		end
		local v15 = nil
		if v15 == nil then
			local function v16()
				-- upvalues: (ref) v_u_2
				return v_u_2:GetStringForKeyCode(Enum.KeyCode.ButtonA)
			end
			local v17, v18 = pcall(v16)
			if v17 then
				v17 = v18 == "ButtonCross"
			end
			if v17 then
				return v_u_3.PS5
			else
				return v_u_3.Xbox
			end
		else
			return v15
		end
	else
		return v_u_3.Default
	end
end