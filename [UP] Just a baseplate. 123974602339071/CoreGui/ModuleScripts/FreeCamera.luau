-- Path: CoreGui.RobloxGui.Modules.Server.FreeCamera.FreeCamera
local v_u_1 = math.abs
local v_u_2 = math.clamp
local v_u_3 = math.exp
local v_u_4 = math.rad
local v_u_5 = math.sign
local v_u_6 = math.sqrt
local v_u_7 = math.tan
local v_u_8 = game:GetService("ContextActionService")
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("RunService")
local v_u_11 = game:GetService("StarterGui")
local v_u_12 = game:GetService("UserInputService")
local v_u_13 = game:GetService("Workspace")
local v_u_14 = UserSettings().GameSettings
local v_u_15 = game:GetService("Lighting")
local v_u_16 = v_u_9.LocalPlayer
if not v_u_16 then
	v_u_9:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v_u_16 = v_u_9.LocalPlayer
end
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = v_u_13.CurrentCamera
v_u_13:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (copy) v_u_13, (ref) v_u_19
	local v20 = v_u_13.CurrentCamera
	if v20 then
		v_u_19 = v20
	end
end)
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = nil
local v24, v25 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock")
end)
local v_u_26 = v24 and v25
local v27, v28 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
local v_u_29 = v27 and v28
local v30, v31 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixFreecamDeltaTimeCalculation")
end)
local v_u_32 = v30 and v31
local v33, v34 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixFreecamGuiChangeVisibility2")
end)
local v_u_35 = v33 and v34
local v36, v37 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamControlSpeed")
end)
local v_u_38 = v36 and v37
local v39, v40 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamTiltControl")
end)
local v_u_41 = v39 and v40
local v42, v43 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamSmoothnessControl")
end)
local v_u_44 = v42 and v43
local v45, v46 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamGuiDestabilization")
end)
local v_u_47 = v45 and v46
local v48, v49 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamDepthOfFieldEffect3")
end)
local v_u_50 = v48 and v49
local v51, v52 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLock2")
end)
local v_u_53 = v51 and v52
local v54, v55 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLockResetHeight")
end)
local v_u_56 = v54 and v55
local v57, v58 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFreecamCustomGui")
end)
local v_u_59 = v57 and v58
local v60 = Enum.ContextActionPriority.Low.Value
local v_u_61 = Enum.ContextActionPriority.High.Value
local v_u_62 = { Enum.KeyCode.LeftShift, Enum.KeyCode.P }
local v_u_63 = {
	[Enum.KeyCode.Z] = true,
	[Enum.KeyCode.C] = true
}
local v_u_64 = {
	[Enum.KeyCode.ButtonL1] = true,
	[Enum.KeyCode.ButtonR1] = true
}
local v_u_65 = {
	[Enum.KeyCode.BackSlash] = true
}
local v_u_66 = {
	[Enum.KeyCode.Slash] = true
}
local v_u_67 = {
	[Enum.KeyCode.R] = true,
	[Enum.KeyCode.T] = true
}
local v_u_68 = {
	[Enum.KeyCode.G] = true
}
local v_u_69 = {
	[Enum.KeyCode.X] = true
}
local v_u_70 = {
	[Enum.KeyCode.L] = true
}
local v_u_71 = Vector2.new(0.75, 1) * 8
local v_u_72 = 1.5
local v_u_73 = 1
local v_u_74 = 4
local v_u_75 = 1
local v_u_76 = {}
local v_u_77 = 0
local v_u_78 = {}
local v_u_79 = nil
local v_u_80 = nil
local v_u_81 = nil
local v_u_82 = nil
local v_u_83 = nil
local v_u_84 = false
local v_u_85 = 20
local v_u_86 = 0
local v_u_87 = {}
local v_u_88 = 1
local v_u_89 = nil
local v_u_90 = false
local v_u_91 = false
local v_u_92 = {}
v_u_92.__index = v_u_92
function v_u_92.new(p93, p94) -- name: new
	-- upvalues: (copy) v_u_92
	local v95 = v_u_92
	local v96 = setmetatable({}, v95)
	v96.f = p93
	v96.p = p94
	v96.v = p94 * 0
	return v96
end
function v_u_92.Update(p97, p98, p99) -- name: Update
	-- upvalues: (copy) v_u_3
	local v100 = p97.f * 2 * 3.141592653589793
	local v101 = p97.p
	local v102 = p97.v
	local v103 = p99 - v101
	local v104 = v_u_3(-v100 * p98)
	local v105 = p99 + (v102 * p98 - v103 * (v100 * p98 + 1)) * v104
	local v106 = (v100 * p98 * (v103 * v100 - v102) + v102) * v104
	p97.p = v105
	p97.v = v106
	return v105
end
function v_u_92.SetFreq(p107, p108) -- name: SetFreq
	p107.f = p108
end
function v_u_92.Reset(p109, p110) -- name: Reset
	p109.p = p110
	p109.v = p110 * 0
end
local v_u_111 = Vector3.new()
local v_u_112
if v_u_41 then
	v_u_112 = Vector3.new()
else
	v_u_112 = Vector2.new()
end
local v_u_113 = 0
local v_u_114 = v_u_92.new(v_u_72, (Vector3.new()))
local v_u_115 = v_u_92.new(v_u_73, Vector2.new())
local v_u_116 = v_u_92.new(v_u_74, 0)
local v_u_117 = v_u_92.new(v_u_75, 0)
local v_u_118 = {}
local function v_u_120(p119) -- name: thumbstickCurve
	-- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	return v_u_5(p119) * v_u_2((v_u_3(2 * ((v_u_1(p119) - 0.15) / 0.85)) - 1) / 6.38905609893065, 0, 1)
end
local v_u_121 = {
	["ButtonX"] = 0,
	["ButtonY"] = 0,
	["DPadDown"] = 0,
	["DPadUp"] = 0,
	["DPadLeft"] = 0,
	["DPadRight"] = 0,
	["ButtonL2"] = 0,
	["ButtonR2"] = 0,
	["ButtonL1"] = 0,
	["ButtonR1"] = 0,
	["Thumbstick1"] = nil,
	["Thumbstick2"] = nil,
	["Thumbstick1"] = Vector2.new(),
	["Thumbstick2"] = Vector2.new()
}
local v_u_122 = {
	["W"] = 0,
	["A"] = 0,
	["S"] = 0,
	["D"] = 0,
	["E"] = 0,
	["Q"] = 0,
	["U"] = 0,
	["H"] = 0,
	["J"] = 0,
	["K"] = 0,
	["I"] = 0,
	["Y"] = 0,
	["Up"] = 0,
	["Down"] = 0,
	["Left"] = 0,
	["Right"] = 0,
	["LeftShift"] = 0,
	["RightShift"] = 0,
	["Z"] = 0,
	["C"] = 0,
	["Comma"] = 0,
	["Period"] = 0,
	["LeftBracket"] = 0,
	["RightBracket"] = 0,
	["Semicolon"] = 0,
	["Quote"] = 0,
	["V"] = 0,
	["B"] = 0,
	["N"] = 0,
	["M"] = 0,
	["BackSlash"] = 0,
	["Minus"] = 0,
	["Equals"] = 0,
	["Slash"] = 0,
	["R"] = 0,
	["T"] = 0,
	["G"] = 0,
	["X"] = 0,
	["L"] = 0
}
local v_u_123 = {
	["Delta"] = nil,
	["MouseWheel"] = 0,
	["Delta"] = Vector2.new()
}
local v_u_124 = Vector2.new(1, 1) * 0.04908738521234052
local v_u_125 = v_u_124 / 60
local v_u_126 = Vector2.new(1, 1) * 0.39269908169872414
local v_u_127 = {
	["FarIntensity"] = {
		["ADJ"] = 0.1,
		["MIN"] = 0,
		["MAX"] = 1
	},
	["NearIntensity"] = {
		["ADJ"] = 0.1,
		["MIN"] = 0,
		["MAX"] = 1
	},
	["FocusDistance"] = {
		["ADJ"] = 20,
		["MIN"] = 0,
		["MAX"] = 200
	},
	["FocusRadius"] = {
		["ADJ"] = 5,
		["MIN"] = 0,
		["MAX"] = 50
	}
}
local v_u_128 = 1
local v_u_129 = 1
local v_u_130 = 1
function v_u_118.Vel(p131) -- name: Vel
	-- upvalues: (ref) v_u_38, (ref) v_u_128, (copy) v_u_122, (copy) v_u_121, (copy) v_u_2, (ref) v_u_120, (copy) v_u_12
	if v_u_38 then
		v_u_128 = v_u_2(v_u_128 + p131 * (v_u_122.Up - v_u_122.Down + v_u_121.DPadUp - v_u_121.DPadDown) * 0.75, 0.01, 4)
	else
		v_u_128 = v_u_2(v_u_128 + p131 * (v_u_122.Up - v_u_122.Down) * 0.75, 0.01, 4)
	end
	local v132 = v_u_120(v_u_121.Thumbstick1.X)
	local v133 = v_u_120(v_u_121.ButtonR2) - v_u_120(v_u_121.ButtonL2)
	local v134 = v_u_120
	local v135 = -v_u_121.Thumbstick1.Y
	local v136 = Vector3.new(v132, v133, v134(v135)) * Vector3.new(1, 1, 1)
	local v137 = v_u_122.D - v_u_122.A + v_u_122.K - v_u_122.H
	local v138 = v_u_122.E - v_u_122.Q + v_u_122.I - v_u_122.Y
	local v139 = v_u_122.S - v_u_122.W + v_u_122.J - v_u_122.U
	local v140 = Vector3.new(v137, v138, v139) * Vector3.new(1, 1, 1)
	local v141 = v_u_12:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_12:IsKeyDown(Enum.KeyCode.RightShift)
	return (v136 + v140) * (v_u_128 * (v141 and 0.25 or 1))
end
function v_u_118.Pan(p142) -- name: Pan
	-- upvalues: (ref) v_u_120, (copy) v_u_121, (copy) v_u_126, (copy) v_u_123, (copy) v_u_124, (ref) v_u_32, (copy) v_u_125
	local v143 = Vector2.new(v_u_120(v_u_121.Thumbstick2.Y), v_u_120(-v_u_121.Thumbstick2.X)) * v_u_126
	local v144 = v_u_123.Delta * v_u_124
	if v_u_32 and p142 > 0 then
		v144 = v_u_123.Delta / p142 * v_u_125
	end
	v_u_123.Delta = Vector2.new()
	return v143 + v144
end
function v_u_118.Fov(p145) -- name: Fov
	-- upvalues: (ref) v_u_38, (ref) v_u_130, (copy) v_u_122, (copy) v_u_121, (copy) v_u_2, (copy) v_u_123, (ref) v_u_32
	if v_u_38 then
		v_u_130 = v_u_2(v_u_130 + p145 * (v_u_122.Right - v_u_122.Left + v_u_121.DPadRight - v_u_121.DPadLeft) * 0.75, 0.01, 4)
	end
	local v146 = (v_u_121.ButtonX - v_u_121.ButtonY) * 0.25
	local v147 = v_u_123.MouseWheel * 1
	if v_u_32 and p145 > 0 then
		v147 = v_u_123.MouseWheel / p145 * 0.016666666666666666
	end
	v_u_123.MouseWheel = 0
	if v_u_38 then
		return (v146 + v147) * v_u_130
	else
		return v146 + v147
	end
end
function v_u_118.Roll(p148) -- name: Roll
	-- upvalues: (ref) v_u_129, (copy) v_u_122, (copy) v_u_2, (copy) v_u_121
	v_u_129 = v_u_2(v_u_129 + p148 * (v_u_122.Period - v_u_122.Comma) * 0.75, 0.01, 4)
	return ((v_u_121.ButtonR1 - v_u_121.ButtonL1) * 1 + (v_u_122.C - v_u_122.Z) * 1) * v_u_129
end
function v_u_118.SpringControl(p149) -- name: SpringControl
	-- upvalues: (ref) v_u_50, (copy) v_u_12, (ref) v_u_72, (copy) v_u_122, (copy) v_u_2, (copy) v_u_114, (ref) v_u_73, (copy) v_u_115, (ref) v_u_74, (copy) v_u_116, (ref) v_u_75, (copy) v_u_117
	if not (v_u_50 and (v_u_12:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_12:IsKeyDown(Enum.KeyCode.RightShift) or (v_u_12:IsKeyDown(Enum.KeyCode.LeftControl) or v_u_12:IsKeyDown(Enum.KeyCode.RightControl)))) then
		v_u_72 = v_u_2(v_u_72 + p149 * (v_u_122.RightBracket - v_u_122.LeftBracket) * 0.75, 0.01, 10)
		v_u_114:SetFreq(v_u_72)
		v_u_73 = v_u_2(v_u_73 + p149 * (v_u_122.Quote - v_u_122.Semicolon) * 0.75, 0.01, 10)
		v_u_115:SetFreq(v_u_73)
		v_u_74 = v_u_2(v_u_74 + p149 * (v_u_122.B - v_u_122.V) * 0.75, 0.01, 10)
		v_u_116:SetFreq(v_u_74)
		v_u_75 = v_u_2(v_u_75 + p149 * (v_u_122.M - v_u_122.N) * 0.75, 0.01, 10)
		v_u_117:SetFreq(v_u_75)
	end
end
function v_u_118.DoF(p150) -- name: DoF
	-- upvalues: (copy) v_u_12, (ref) v_u_21, (copy) v_u_122, (copy) v_u_127, (copy) v_u_2
	local v151 = v_u_12:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_12:IsKeyDown(Enum.KeyCode.RightShift)
	local v152 = v_u_12:IsKeyDown(Enum.KeyCode.LeftControl) or v_u_12:IsKeyDown(Enum.KeyCode.RightControl)
	if v151 then
		v_u_21.FarIntensity = v_u_2(v_u_21.FarIntensity + p150 * (v_u_122.RightBracket - v_u_122.LeftBracket) * v_u_127.FarIntensity.ADJ, v_u_127.FarIntensity.MIN, v_u_127.FarIntensity.MAX)
		v_u_21.InFocusRadius = v_u_2(v_u_21.InFocusRadius + p150 * (v_u_122.Equals - v_u_122.Minus) * v_u_127.FocusRadius.ADJ, v_u_127.FocusRadius.MIN, v_u_127.FocusRadius.MAX)
		return
	elseif v152 then
		v_u_21.NearIntensity = v_u_2(v_u_21.NearIntensity + p150 * (v_u_122.RightBracket - v_u_122.LeftBracket) * v_u_127.NearIntensity.ADJ, v_u_127.NearIntensity.MIN, v_u_127.NearIntensity.MAX)
	else
		v_u_21.FocusDistance = v_u_2(v_u_21.FocusDistance + p150 * (v_u_122.Equals - v_u_122.Minus) * v_u_127.FocusDistance.ADJ, v_u_127.FocusDistance.MIN, v_u_127.FocusDistance.MAX)
	end
end
local function v_u_164(p153) -- name: handleDoubleTapReset
	-- upvalues: (copy) v_u_76, (ref) v_u_77, (ref) v_u_112, (copy) v_u_117, (ref) v_u_50, (copy) v_u_64, (copy) v_u_121, (copy) v_u_63, (copy) v_u_122
	local v154 = os.clock()
	local v155 = v_u_76[p153]
	if v155 and ((v155 and (v154 - v155 or -1) or -1) <= 0.25 and v154 - v_u_77 >= 0.1) then
		local v156 = v_u_112.x
		local v157 = v_u_112.y
		v_u_112 = Vector3.new(v156, v157, 0)
		v_u_117:Reset(0)
		if v_u_50 then
			local v158 = v_u_64
			local v159 = v_u_121
			for v160, _ in pairs(v158) do
				if not v159[v160.Name] then
					continue
				end
				v159[v160.Name] = 0
			end
			local v161 = v_u_63
			local v162 = v_u_122
			for v163, _ in pairs(v161) do
				if not v162[v163.Name] then
					continue
				end
				v162[v163.Name] = 0
			end
		else
			v_u_121.ButtonL1 = 0
			v_u_121.ButtonR1 = 0
			v_u_122.C = 0
			v_u_122.Z = 0
		end
		v_u_77 = v154
	end
	v_u_76[p153] = v154
end
local function v_u_168(p165) -- name: findPlayerLockRootPart
	-- upvalues: (ref) v_u_87, (ref) v_u_88, (ref) v_u_84
	if not v_u_87 or #v_u_87 < 1 then
		return nil
	end
	for _ = 1, #v_u_87 do
		v_u_88 = (v_u_88 - 1 + p165) % #v_u_87 + 1
		local v166 = v_u_87[v_u_88]
		if v166 then
			v166 = v166.Character
		end
		if v166 then
			local v167 = v166:FindFirstChildOfClass("Humanoid")
			if v167 and v167.RootPart then
				return v167.RootPart
			end
		end
		if p165 ~= 0 then
			continue
		end
		p165 = 1
	end
	v_u_84 = false
	return nil
end
local function v_u_196(_, p169, p170) -- name: Keypress
	-- upvalues: (copy) v_u_122, (ref) v_u_41, (copy) v_u_63, (copy) v_u_164, (ref) v_u_50, (copy) v_u_65, (ref) v_u_21, (ref) v_u_78, (ref) v_u_19, (copy) v_u_15, (ref) v_u_80, (ref) v_u_81, (ref) v_u_53, (copy) v_u_66, (ref) v_u_84, (ref) v_u_85, (ref) v_u_56, (ref) v_u_86, (ref) v_u_89, (copy) v_u_168, (copy) v_u_67, (ref) v_u_87, (ref) v_u_59, (copy) v_u_68, (ref) v_u_18, (copy) v_u_69, (ref) v_u_90, (ref) v_u_23, (copy) v_u_70, (ref) v_u_91, (copy) v_u_11
	v_u_122[p170.KeyCode.Name] = p169 == Enum.UserInputState.Begin and 1 or 0
	if v_u_41 and (v_u_63[p170.KeyCode] and p170.UserInputState == Enum.UserInputState.Begin) then
		v_u_164(p170.KeyCode)
	end
	if v_u_50 and (v_u_65[p170.KeyCode] and p170.UserInputState == Enum.UserInputState.Begin) then
		if v_u_21.Enabled then
			for _, v171 in ipairs(v_u_78) do
				if not v171.Parent then
					continue
				end
				v171.Enabled = true
			end
			if v_u_80 then
				v_u_80:Disconnect()
				v_u_80 = nil
			end
			if v_u_81 then
				v_u_81:Disconnect()
				v_u_81 = nil
			end
			v_u_78 = {}
		else
			v_u_78 = {}
			for _, v172 in ipairs(v_u_19:GetChildren()) do
				if not (v172:IsA("DepthOfFieldEffect") and v172.Enabled) then
					continue
				end
				v_u_78[#v_u_78 + 1] = v172
				v172.Enabled = false
			end
			for _, v173 in ipairs(v_u_15:GetChildren()) do
				if not (v173:IsA("DepthOfFieldEffect") and v173.Enabled) then
					continue
				end
				v_u_78[#v_u_78 + 1] = v173
				v173.Enabled = false
			end
			v_u_80 = v_u_19.ChildAdded:Connect(function(p174)
				-- upvalues: (ref) v_u_78
				if p174:IsA("DepthOfFieldEffect") and p174.Enabled then
					v_u_78[#v_u_78 + 1] = p174
					p174.Enabled = false
				end
			end)
			v_u_81 = v_u_15.ChildAdded:Connect(function(p175)
				-- upvalues: (ref) v_u_78
				if p175:IsA("DepthOfFieldEffect") and p175.Enabled then
					v_u_78[#v_u_78 + 1] = p175
					p175.Enabled = false
				end
			end)
		end
		v_u_21.Enabled = not v_u_21.Enabled
		local v176 = v_u_65
		local v177 = v_u_122
		for v178, _ in pairs(v176) do
			if not v177[v178.Name] then
				continue
			end
			v177[v178.Name] = 0
		end
	end
	if v_u_53 then
		if v_u_66[p170.KeyCode] and p170.UserInputState == Enum.UserInputState.Begin then
			v_u_84 = not v_u_84
			if v_u_84 then
				v_u_85 = 20
				if v_u_56 then
					v_u_86 = 0
				end
				v_u_89 = v_u_168(0)
			end
			local v179 = v_u_66
			local v180 = v_u_122
			for v181, _ in pairs(v179) do
				if not v180[v181.Name] then
					continue
				end
				v180[v181.Name] = 0
			end
		end
		if v_u_67[p170.KeyCode] and p170.UserInputState == Enum.UserInputState.Begin then
			if v_u_84 and #v_u_87 > 0 then
				v_u_89 = v_u_168(v_u_122.T - v_u_122.R)
			end
			local v182 = v_u_67
			local v183 = v_u_122
			for v184, _ in pairs(v182) do
				if not v183[v184.Name] then
					continue
				end
				v183[v184.Name] = 0
			end
		end
	end
	if v_u_59 then
		if v_u_68[p170.keyCode] and p170.UserInputState == Enum.UserInputState.Begin then
			if v_u_18 and v_u_18.Parent then
				v_u_18.Enabled = not v_u_18.Enabled
			end
			local v185 = v_u_68
			local v186 = v_u_122
			for v187, _ in pairs(v185) do
				if not v186[v187.Name] then
					continue
				end
				v186[v187.Name] = 0
			end
		end
		if v_u_69[p170.keyCode] and p170.UserInputState == Enum.UserInputState.Begin then
			v_u_90 = not v_u_90
			if v_u_23 then
				local v188 = v_u_23.getScreenGuis()
				for _, v189 in pairs(v188) do
					if not v189.Parent or v189 == v_u_18 then
						continue
					end
					v189.Enabled = v_u_90
				end
			end
			local v190 = v_u_69
			local v191 = v_u_122
			for v192, _ in pairs(v190) do
				if not v191[v192.Name] then
					continue
				end
				v191[v192.Name] = 0
			end
		end
		if v_u_70[p170.keyCode] and p170.UserInputState == Enum.UserInputState.Begin then
			v_u_91 = not v_u_91
			v_u_11:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, v_u_91)
			local v193 = v_u_70
			local v194 = v_u_122
			for v195, _ in pairs(v193) do
				if not v194[v195.Name] then
					continue
				end
				v194[v195.Name] = 0
			end
		end
	end
	return Enum.ContextActionResult.Sink
end
local function v_u_199(_, p197, p198) -- name: GpButton
	-- upvalues: (copy) v_u_121, (ref) v_u_41, (copy) v_u_64, (copy) v_u_164
	v_u_121[p198.KeyCode.Name] = p197 == Enum.UserInputState.Begin and 1 or 0
	if v_u_41 and (v_u_64[p198.KeyCode] and p198.UserInputState == Enum.UserInputState.Begin) then
		v_u_164(p198.KeyCode)
	end
	return Enum.ContextActionResult.Sink
end
local function v_u_202(_, _, p200) -- name: MousePan
	-- upvalues: (copy) v_u_123
	local v201 = p200.Delta
	v_u_123.Delta = Vector2.new(-v201.y, -v201.x)
	return Enum.ContextActionResult.Sink
end
local function v_u_204(_, _, p203) -- name: Thumb
	-- upvalues: (copy) v_u_121
	v_u_121[p203.KeyCode.Name] = p203.Position
	return Enum.ContextActionResult.Sink
end
local function v_u_206(_, _, p205) -- name: Trigger
	-- upvalues: (copy) v_u_121
	v_u_121[p205.KeyCode.Name] = p205.Position.z
	return Enum.ContextActionResult.Sink
end
local function v_u_208(_, _, p207) -- name: MouseWheel
	-- upvalues: (copy) v_u_123
	v_u_123[p207.UserInputType.Name] = -p207.Position.z
	return Enum.ContextActionResult.Sink
end
function v_u_118.StartCapture() -- name: StartCapture
	-- upvalues: (ref) v_u_38, (copy) v_u_8, (copy) v_u_196, (copy) v_u_61, (copy) v_u_199, (ref) v_u_41, (ref) v_u_44, (ref) v_u_50, (ref) v_u_53, (ref) v_u_59, (copy) v_u_202, (copy) v_u_208, (copy) v_u_206, (copy) v_u_204
	if v_u_38 then
		v_u_8:BindActionAtPriority("FreecamKeyboard", v_u_196, false, v_u_61, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y)
		v_u_8:BindActionAtPriority("FreecamKeyboardControlSpeed", v_u_196, false, v_u_61, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right)
		v_u_8:BindActionAtPriority("FreecamGamepadControlSpeed", v_u_199, false, v_u_61, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown, Enum.KeyCode.DPadLeft, Enum.KeyCode.DPadRight)
	else
		v_u_8:BindActionAtPriority("FreecamKeyboard", v_u_196, false, v_u_61, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down)
	end
	if v_u_41 then
		v_u_8:BindActionAtPriority("FreecamKeyboardTiltControl", v_u_196, false, v_u_61, Enum.KeyCode.Z, Enum.KeyCode.C)
		v_u_8:BindActionAtPriority("FreecamGamepadTiltControl", v_u_199, false, v_u_61, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		v_u_8:BindActionAtPriority("FreecamKeyboardTiltControlSpeed", v_u_196, false, v_u_61, Enum.KeyCode.Comma, Enum.KeyCode.Period)
		if v_u_44 then
			v_u_8:BindActionAtPriority("FreecamKeyboardSmoothnessControl", v_u_196, false, v_u_61, Enum.KeyCode.LeftBracket, Enum.KeyCode.RightBracket, Enum.KeyCode.Semicolon, Enum.KeyCode.Quote, Enum.KeyCode.V, Enum.KeyCode.B, Enum.KeyCode.N, Enum.KeyCode.M)
		end
	end
	if v_u_50 then
		v_u_8:BindActionAtPriority("FreecamKeyboardDoFToggle", v_u_196, false, v_u_61, Enum.KeyCode.BackSlash)
		v_u_8:BindActionAtPriority("FreecamKeyboardDoFControls", v_u_196, false, v_u_61, Enum.KeyCode.Minus, Enum.KeyCode.Equals)
	end
	if v_u_53 then
		v_u_8:BindActionAtPriority("FreecamKeyboardPlayerLockToggle", v_u_196, false, v_u_61, Enum.KeyCode.Slash)
		v_u_8:BindActionAtPriority("FreecamKeyboardPlayerLockSwitch", v_u_196, false, v_u_61, Enum.KeyCode.R, Enum.KeyCode.T)
	end
	if v_u_59 then
		v_u_8:BindActionAtPriority("FreecamKeyboardCustomGuiToggle", v_u_196, false, v_u_61, Enum.KeyCode.G)
		v_u_8:BindActionAtPriority("FreecamKeyboardPlayerGuiToggle", v_u_196, false, v_u_61, Enum.KeyCode.X)
		v_u_8:BindActionAtPriority("FreecamKeyboardLeaderboardToggle", v_u_196, false, v_u_61, Enum.KeyCode.L)
	end
	v_u_8:BindActionAtPriority("FreecamMousePan", v_u_202, false, v_u_61, Enum.UserInputType.MouseMovement)
	v_u_8:BindActionAtPriority("FreecamMouseWheel", v_u_208, false, v_u_61, Enum.UserInputType.MouseWheel)
	v_u_8:BindActionAtPriority("FreecamGamepadButton", v_u_199, false, v_u_61, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
	v_u_8:BindActionAtPriority("FreecamGamepadTrigger", v_u_206, false, v_u_61, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
	v_u_8:BindActionAtPriority("FreecamGamepadThumbstick", v_u_204, false, v_u_61, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
end
function v_u_118.StopCapture() -- name: StopCapture
	-- upvalues: (ref) v_u_59, (ref) v_u_128, (ref) v_u_38, (ref) v_u_130, (ref) v_u_41, (ref) v_u_129, (copy) v_u_121, (copy) v_u_122, (copy) v_u_123, (copy) v_u_8, (ref) v_u_44, (ref) v_u_50, (ref) v_u_53
	if not v_u_59 then
		v_u_128 = 1
		if v_u_38 then
			v_u_130 = 1
		end
		if v_u_41 then
			v_u_129 = 1
		end
	end
	local v209 = v_u_121
	for v210, v211 in pairs(v209) do
		v209[v210] = v211 * 0
	end
	local v212 = v_u_122
	for v213, v214 in pairs(v212) do
		v212[v213] = v214 * 0
	end
	local v215 = v_u_123
	for v216, v217 in pairs(v215) do
		v215[v216] = v217 * 0
	end
	v_u_8:UnbindAction("FreecamKeyboard")
	if v_u_38 then
		v_u_8:UnbindAction("FreecamKeyboardControlSpeed")
		v_u_8:UnbindAction("FreecamGamepadControlSpeed")
	end
	if v_u_41 then
		v_u_8:UnbindAction("FreecamKeyboardTiltControl")
		v_u_8:UnbindAction("FreecamGamepadTiltControl")
		v_u_8:UnbindAction("FreecamKeyboardTiltControlSpeed")
		if v_u_44 then
			v_u_8:UnbindAction("FreecamKeyboardSmoothnessControl")
		end
	end
	if v_u_50 then
		v_u_8:UnbindAction("FreecamKeyboardDoFToggle")
		v_u_8:UnbindAction("FreecamKeyboardDoFControls")
	end
	if v_u_53 then
		v_u_8:UnbindAction("FreecamKeyboardPlayerLockToggle")
		v_u_8:UnbindAction("FreecamKeyboardPlayerLockSwitch")
	end
	if v_u_59 then
		v_u_8:UnbindAction("FreecamKeyboardCustomGuiToggle")
		v_u_8:UnbindAction("FreecamKeyboardPlayerGuiToggle")
		v_u_8:UnbindAction("FreecamKeyboardLeaderboardToggle")
	end
	v_u_8:UnbindAction("FreecamMousePan")
	v_u_8:UnbindAction("FreecamMouseWheel")
	v_u_8:UnbindAction("FreecamGamepadButton")
	v_u_8:UnbindAction("FreecamGamepadTrigger")
	v_u_8:UnbindAction("FreecamGamepadThumbstick")
end
function v_u_118.getNavSpeed() -- name: getNavSpeed
	-- upvalues: (ref) v_u_128
	return v_u_128
end
function v_u_118.getFovSpeed() -- name: getFovSpeed
	-- upvalues: (ref) v_u_130
	return v_u_130
end
function v_u_118.getRollSpeed() -- name: getRollSpeed
	-- upvalues: (ref) v_u_129
	return v_u_129
end
local function v_u_246(p218) -- name: StepFreecam
	-- upvalues: (ref) v_u_44, (copy) v_u_118, (ref) v_u_50, (ref) v_u_21, (copy) v_u_114, (copy) v_u_115, (copy) v_u_116, (ref) v_u_41, (copy) v_u_117, (ref) v_u_113, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_2, (copy) v_u_71, (ref) v_u_112, (ref) v_u_111, (ref) v_u_53, (ref) v_u_84, (ref) v_u_89, (ref) v_u_85, (ref) v_u_86, (ref) v_u_59, (ref) v_u_22, (ref) v_u_18, (ref) v_u_72, (ref) v_u_73, (ref) v_u_74, (ref) v_u_75, (ref) v_u_38, (ref) v_u_87, (ref) v_u_88, (ref) v_u_19
	if v_u_44 then
		v_u_118.SpringControl(p218)
	end
	if v_u_50 and (v_u_21 and v_u_21.Parent) then
		v_u_118.DoF(p218)
	end
	local v219 = v_u_114:Update(p218, v_u_118.Vel(p218))
	local v220 = v_u_115:Update(p218, v_u_118.Pan(p218))
	local v221 = v_u_116:Update(p218, v_u_118.Fov(p218))
	local v222
	if v_u_41 then
		v222 = v_u_117:Update(p218, v_u_118.Roll(p218))
	else
		v222 = nil
	end
	local v223 = v_u_6(0.7002075382097097 / v_u_7((v_u_4(v_u_113 / 2))))
	v_u_113 = v_u_2(v_u_113 + v221 * 300 * (p218 / v223), 1, 120)
	local v224
	if v_u_41 then
		local v225 = v220 * v_u_71 * (p218 / v223)
		local v226 = v_u_112
		local v227 = v225.X
		local v228 = v225.Y
		local v229 = v222 * -1.5707963267948966 * (p218 / v223)
		v_u_112 = v226 + Vector3.new(v227, v228, v229)
		if v_u_44 then
			local v230 = v_u_112.x % 6.283185307179586
			local v231 = v_u_112.y % 6.283185307179586
			local v232 = v_u_112.z % 6.283185307179586
			v_u_112 = Vector3.new(v230, v231, v232)
		else
			local v233 = v_u_2(v_u_112.x, -1.5707963267948966, 1.5707963267948966)
			local v234 = v_u_112.y % 6.283185307179586
			local v235 = v_u_112.z
			v_u_112 = Vector3.new(v233, v234, v235)
		end
		v224 = CFrame.new(v_u_111) * CFrame.fromOrientation(v_u_112.x, v_u_112.y, v_u_112.z) * CFrame.new(v219 * Vector3.new(64, 64, 64) * p218)
	else
		v_u_112 = v_u_112 + v220 * v_u_71 * (p218 / v223)
		v_u_112 = Vector2.new(v_u_2(v_u_112.x, -1.5707963267948966, 1.5707963267948966), v_u_112.y % 6.283185307179586)
		v224 = CFrame.new(v_u_111) * CFrame.fromOrientation(v_u_112.x, v_u_112.y, 0) * CFrame.new(v219 * Vector3.new(64, 64, 64) * p218)
	end
	if v_u_53 and (v_u_84 and v_u_89) then
		local v236 = v219.Z * 64 * p218
		local v237 = v219.Y * 64 * p218
		v_u_85 = v_u_2(v_u_85 + v236, 5, 50)
		v_u_86 = v_u_2(v_u_86 + v237, -10, 10)
		local v238 = v_u_86
		local v239 = CFrame.new(v_u_89.Position + Vector3.new(0, v238, 0))
		local v240
		if v_u_41 then
			v240 = CFrame.fromOrientation(v_u_112.x, v_u_112.y, v_u_112.z)
		else
			v240 = CFrame.fromOrientation(v_u_112.x, v_u_112.y, 0)
		end
		v224 = v239 * v240 * CFrame.new(0, 0, v_u_85)
	end
	if v_u_59 and (v_u_22 and (v_u_22.Parent and (v_u_18 and (v_u_18.Parent and v_u_18.Enabled)))) then
		local v241 = ""
		if p218 > 0 then
			local v242 = (v224.p - v_u_111) / p218
			v241 = v241 .. string.format("Velocity: (%.1f, %.1f, %.1f)\n", v242.X, v242.Y, v242.Z)
		end
		local v243 = v241 .. string.format("FOV: %.1f\n", v_u_113)
		if v_u_41 then
			local v244 = string.format
			local v245 = v_u_112.z
			v243 = v243 .. v244("Tilt: %.1f\194\176\n", (math.deg(v245)))
		end
		if v_u_44 then
			v243 = (((v243 .. string.format("Stiffness (Vel): %.1f\n", v_u_72)) .. string.format("Stiffness (Pan): %.1f\n", v_u_73)) .. string.format("Stiffness (FOV): %.1f\n", v_u_74)) .. string.format("Stiffness (Roll): %.1f\n", v_u_75)
		end
		if v_u_38 then
			v243 = ((v243 .. string.format("Movement Speed: %.1f\n", v_u_118.getNavSpeed())) .. string.format("Zoom Speed: %.1f\n", v_u_118.getFovSpeed())) .. string.format("Tilt Speed: %.1f\n", v_u_118.getRollSpeed())
		end
		if v_u_50 then
			if v_u_21 and (v_u_21.Parent and v_u_21.Enabled) then
				v243 = ((((v243 .. string.format("Custom Depth Of Field: On\n")) .. string.format("Custom Depth Of Field Near Intensity: %.1f\n", v_u_21.NearIntensity)) .. string.format("Custom Depth Of Field Far Intensity: %.1f\n", v_u_21.FarIntensity)) .. string.format("Custom Depth Of Field Focus Distance: %.1f\n", v_u_21.FocusDistance)) .. string.format("Custom Depth Of Field Focus Radius: %.1f\n", v_u_21.InFocusRadius)
			else
				v243 = v243 .. string.format("Custom Depth Of Field: Off\n")
			end
		end
		if v_u_53 then
			if v_u_84 and #v_u_87 > 0 then
				v243 = v243 .. string.format("Player Lock: %s\n", v_u_87[v_u_88].Name)
			else
				v243 = v243 .. string.format("Player Lock: Off\n")
			end
		end
		v_u_22.Text = v243
	end
	v_u_111 = v224.p
	v_u_19.CFrame = v224
	v_u_19.Focus = v224
	v_u_19.FieldOfView = v_u_113
end
local v_u_247 = {}
local v_u_248 = nil
local v_u_249 = nil
local v_u_250 = nil
local v_u_251 = nil
local v_u_252 = nil
local v_u_253 = nil
local v_u_254 = {}
local v_u_255 = {
	["Backpack"] = true,
	["Chat"] = true,
	["Health"] = true,
	["PlayerList"] = true
}
local v_u_256 = {
	["BadgesNotificationsActive"] = true,
	["PointsNotificationsActive"] = true
}
function v_u_247.Push() -- name: Push
	-- upvalues: (copy) v_u_255, (copy) v_u_11, (copy) v_u_256, (ref) v_u_16, (ref) v_u_254, (ref) v_u_35, (ref) v_u_79, (ref) v_u_59, (ref) v_u_90, (ref) v_u_253, (ref) v_u_19, (ref) v_u_250, (ref) v_u_252, (ref) v_u_251, (ref) v_u_249, (copy) v_u_12, (ref) v_u_26, (copy) v_u_9, (copy) v_u_14, (ref) v_u_248
	for v257 in pairs(v_u_255) do
		v_u_255[v257] = v_u_11:GetCoreGuiEnabled(Enum.CoreGuiType[v257])
		v_u_11:SetCoreGuiEnabled(Enum.CoreGuiType[v257], false)
	end
	for v258 in pairs(v_u_256) do
		v_u_256[v258] = v_u_11:GetCore(v258)
		v_u_11:SetCore(v258, false)
	end
	local v259 = v_u_16:FindFirstChildOfClass("PlayerGui")
	if v259 then
		for _, v260 in pairs(v259:GetChildren()) do
			if not (v260:IsA("ScreenGui") and v260.Enabled) then
				continue
			end
			v_u_254[#v_u_254 + 1] = v260
			v260.Enabled = false
		end
		if v_u_35 then
			v_u_79 = v259.ChildAdded:Connect(function(p261)
				-- upvalues: (ref) v_u_254, (ref) v_u_59, (ref) v_u_90
				if p261:IsA("ScreenGui") and p261.Enabled then
					v_u_254[#v_u_254 + 1] = p261
					if v_u_59 then
						p261.Enabled = v_u_90
						return
					end
					p261.Enabled = false
				end
			end)
		end
	end
	v_u_253 = v_u_19.FieldOfView
	v_u_19.FieldOfView = 70
	v_u_250 = v_u_19.CameraType
	v_u_19.CameraType = Enum.CameraType.Custom
	v_u_252 = v_u_19.CFrame
	v_u_251 = v_u_19.Focus
	v_u_249 = v_u_12.MouseIconEnabled
	v_u_12.MouseIconEnabled = false
	if v_u_26 then
		local v262 = v_u_9.LocalPlayer.DevEnableMouseLock
		local v263 = v_u_9.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
		local v264 = v262 and (v_u_14.ControlMode == Enum.ControlMode.MouseLockSwitch and v_u_14.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove)
		if v264 then
			v264 = not v263
		end
		if v264 then
			v_u_248 = Enum.MouseBehavior.Default
			v_u_12.MouseBehavior = Enum.MouseBehavior.Default
		else
			v_u_248 = v_u_12.MouseBehavior
			v_u_12.MouseBehavior = Enum.MouseBehavior.Default
		end
	else
		v_u_248 = v_u_12.MouseBehavior
		v_u_12.MouseBehavior = Enum.MouseBehavior.Default
		return
	end
end
function v_u_247.Pop() -- name: Pop
	-- upvalues: (copy) v_u_255, (copy) v_u_11, (copy) v_u_256, (ref) v_u_254, (ref) v_u_59, (ref) v_u_18, (ref) v_u_35, (ref) v_u_79, (ref) v_u_19, (ref) v_u_253, (ref) v_u_250, (ref) v_u_252, (ref) v_u_251, (copy) v_u_12, (ref) v_u_249, (ref) v_u_248
	for v265, v266 in pairs(v_u_255) do
		v_u_11:SetCoreGuiEnabled(Enum.CoreGuiType[v265], v266)
	end
	for v267, v268 in pairs(v_u_256) do
		v_u_11:SetCore(v267, v268)
	end
	for _, v269 in pairs(v_u_254) do
		if v_u_59 then
			if not v269.Parent or v269 == v_u_18 then
				continue
			end
			v269.Enabled = true
		else
			if not v269.Parent then
				continue
			end
			v269.Enabled = true
		end
	end
	if v_u_35 then
		if v_u_79 then
			v_u_79:Disconnect()
			v_u_79 = nil
		end
		v_u_254 = {}
	end
	v_u_19.FieldOfView = v_u_253
	v_u_253 = nil
	v_u_19.CameraType = v_u_250
	v_u_250 = nil
	v_u_19.CFrame = v_u_252
	v_u_252 = nil
	v_u_19.Focus = v_u_251
	v_u_251 = nil
	v_u_12.MouseIconEnabled = v_u_249
	v_u_249 = nil
	v_u_12.MouseBehavior = v_u_248
	v_u_248 = nil
end
function v_u_247.getScreenGuis() -- name: getScreenGuis
	-- upvalues: (ref) v_u_254
	return v_u_254
end
local function v_u_273(p270) -- name: removePlayerFromList
	-- upvalues: (ref) v_u_87, (ref) v_u_88, (ref) v_u_84
	for v271, v272 in ipairs(v_u_87) do
		if v272 ~= p270 then
			continue
		end
		table.remove(v_u_87, v271)
		if v_u_88 == v271 and v_u_84 then
			v_u_84 = false
			v_u_88 = 1
		end
		if v271 < v_u_88 then
			v_u_88 = v_u_88 - 1
		end
		if v_u_88 > #v_u_87 or v_u_88 < 1 then
			v_u_88 = 1
			return
		end
		return
	end
end
local function v_u_278() -- name: initializePlayerList
	-- upvalues: (ref) v_u_87, (copy) v_u_9, (ref) v_u_16, (ref) v_u_88, (ref) v_u_82, (ref) v_u_83, (copy) v_u_273
	v_u_87 = v_u_9:GetPlayers()
	for v274, v275 in ipairs(v_u_87) do
		if v275 ~= v_u_16 then
			continue
		end
		v_u_88 = v274
	end
	v_u_82 = v_u_9.PlayerAdded:Connect(function(p276)
		-- upvalues: (ref) v_u_87
		local v277 = v_u_87
		table.insert(v277, p276)
	end)
	v_u_83 = v_u_9.PlayerRemoving:Connect(v_u_273)
end
local function v_u_280() -- name: StartFreecam
	-- upvalues: (ref) v_u_53, (copy) v_u_278, (ref) v_u_47, (ref) v_u_29, (ref) v_u_19, (ref) v_u_41, (ref) v_u_112, (ref) v_u_111, (ref) v_u_113, (copy) v_u_114, (copy) v_u_115, (copy) v_u_116, (copy) v_u_117, (ref) v_u_59, (ref) v_u_44, (ref) v_u_72, (ref) v_u_73, (ref) v_u_74, (ref) v_u_75, (ref) v_u_17, (ref) v_u_16, (ref) v_u_18, (ref) v_u_22, (ref) v_u_247, (ref) v_u_50, (ref) v_u_21, (copy) v_u_10, (copy) v_u_246, (copy) v_u_118
	if v_u_53 then
		v_u_278()
	end
	if not v_u_47 and v_u_29 then
		script:SetAttribute("FreecamEnabled", true)
	end
	local v279 = v_u_19.CFrame
	if v_u_41 then
		v_u_112 = Vector3.new(v279:toEulerAnglesYXZ())
	else
		v_u_112 = Vector2.new(v279:toEulerAnglesYXZ())
	end
	v_u_111 = v279.p
	v_u_113 = v_u_19.FieldOfView
	v_u_114:Reset((Vector3.new()))
	v_u_115:Reset(Vector2.new())
	v_u_116:Reset(0)
	if v_u_41 then
		v_u_117:Reset(0)
	end
	if not v_u_59 and v_u_44 then
		v_u_72 = 1.5
		v_u_73 = 1
		v_u_74 = 4
		v_u_75 = 1
	end
	if v_u_59 then
		v_u_17 = v_u_16:WaitForChild("PlayerGui")
		v_u_18 = v_u_17:WaitForChild("Freecam")
		if not (v_u_22 and v_u_22.Parent) then
			v_u_22 = Instance.new("TextLabel")
			v_u_22.Name = "FreecamCustomGui"
			v_u_22.TextColor3 = Color3.new(1, 1, 1)
			v_u_22.Font = Enum.Font.SourceSansBold
			v_u_22.TextSize = 20
			v_u_22.TextStrokeTransparency = 0
			v_u_22.BackgroundTransparency = 1
			v_u_22.TextWrapped = true
			v_u_22.TextXAlignment = Enum.TextXAlignment.Right
			v_u_22.AutomaticSize = Enum.AutomaticSize.Y
			v_u_22.AnchorPoint = Vector2.new(1, 1)
			v_u_22.Position = UDim2.new(1, -10, 1, -10)
			v_u_22.Size = UDim2.new(0, 400, 0, 0)
			v_u_22.Parent = v_u_18
		end
	end
	v_u_247.Push()
	if v_u_50 and not (v_u_21 and v_u_21.Parent) then
		v_u_21 = Instance.new("DepthOfFieldEffect")
		v_u_21.Enabled = false
		v_u_21.Name = "FreecamDepthOfField"
		v_u_21.Parent = v_u_19
	end
	v_u_10:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, v_u_246)
	v_u_118.StartCapture()
end
local function v_u_282() -- name: StopFreecam
	-- upvalues: (ref) v_u_47, (ref) v_u_29, (ref) v_u_53, (ref) v_u_82, (ref) v_u_83, (ref) v_u_84, (ref) v_u_88, (ref) v_u_87, (ref) v_u_50, (ref) v_u_21, (ref) v_u_78, (ref) v_u_80, (ref) v_u_81, (ref) v_u_59, (ref) v_u_18, (ref) v_u_90, (ref) v_u_91, (copy) v_u_118, (copy) v_u_10, (ref) v_u_247
	if not v_u_47 and v_u_29 then
		script:SetAttribute("FreecamEnabled", false)
	end
	if v_u_53 then
		if v_u_82 then
			v_u_82:Disconnect()
			v_u_82 = nil
		end
		if v_u_83 then
			v_u_83:Disconnect()
			v_u_83 = nil
		end
		v_u_84 = false
		v_u_88 = 1
		v_u_87 = {}
	end
	if v_u_50 and (v_u_21 and v_u_21.Parent) then
		if v_u_21.Enabled then
			for _, v281 in ipairs(v_u_78) do
				if not v281.Parent then
					continue
				end
				v281.Enabled = true
			end
			if v_u_80 then
				v_u_80:Disconnect()
				v_u_80 = nil
			end
			if v_u_81 then
				v_u_81:Disconnect()
				v_u_81 = nil
			end
			v_u_78 = {}
		end
		v_u_21.Enabled = false
	end
	if v_u_59 then
		if v_u_18 and v_u_18.Parent then
			v_u_18.Enabled = false
		end
		v_u_90 = false
		v_u_91 = false
	end
	v_u_118.StopCapture()
	v_u_10:UnbindFromRenderStep("Freecam")
	v_u_247.Pop()
end
local v_u_283 = false
local function v_u_286(p284) -- name: CheckMacro
	-- upvalues: (copy) v_u_12, (ref) v_u_283, (copy) v_u_282, (copy) v_u_280, (ref) v_u_47
	for v285 = 1, #p284 - 1 do
		if v_u_12:IsKeyDown(p284[v285]) then
			continue
		end
		return
	end
	if v_u_283 then
		v_u_282()
	else
		v_u_280()
	end
	v_u_283 = not v_u_283
	if v_u_47 then
		script:SetAttribute("FreecamEnabled", v_u_283)
	end
end
v_u_8:BindActionAtPriority("FreecamToggle", function(_, p287, p288) -- name: HandleActivationInput
	-- upvalues: (copy) v_u_62, (copy) v_u_286
	if p287 == Enum.UserInputState.Begin and p288.KeyCode == v_u_62[#v_u_62] then
		v_u_286(v_u_62)
	end
	return Enum.ContextActionResult.Pass
end, false, v60, v_u_62[#v_u_62])
if v_u_47 or v_u_29 then
	script:SetAttribute("FreecamEnabled", v_u_283)
	script:GetAttributeChangedSignal("FreecamEnabled"):Connect(function()
		-- upvalues: (ref) v_u_283, (copy) v_u_280, (copy) v_u_282
		local v289 = script:GetAttribute("FreecamEnabled")
		if typeof(v289) == "boolean" then
			if v289 ~= v_u_283 then
				if v289 then
					v_u_280()
					v_u_283 = true
					return
				end
				v_u_282()
				v_u_283 = false
			end
		else
			script:SetAttribute("FreecamEnabled", v_u_283)
		end
	end)
end
return {}