-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Hooks.useAudioWaveform
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = game:GetService("Players")
local v_u_4 = require(v2.React)
local v_u_5 = v_u_4.useEffect
local v6 = require(v1.Constants)
local v_u_7 = v3.LocalPlayer
local v_u_8 = v6.AudioWaveform.SegmentSelectorWidth
local v_u_9 = v6.AudioWaveform.WaveformWidth
local v_u_10 = v6.AudioWaveform.WaveformPadding
local function v_u_19(p11) -- name: normalizeWaveform
	local v12 = {}
	local v13 = 0
	for _, v14 in p11 do
		local v15 = math.max(0, v14)
		table.insert(v12, v15)
		v13 = math.max(v13, v15)
	end
	if v13 == 0 then
		return v12
	end
	local v16 = {}
	for _, v17 in v12 do
		local v18 = v17 / v13
		table.insert(v16, v18)
	end
	return v16
end
return function(p_u_20, p_u_21) -- name: useAudioWaveform
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_5, (copy) v_u_7, (copy) v_u_19
	local v22, v_u_23 = v_u_4.useState({})
	local v_u_24 = v_u_4.useRef(nil)
	local v_u_25 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (copy) p_u_21
		return v_u_8 / (v_u_9 + v_u_10) / p_u_21
	end, { p_u_21 })
	local v_u_26 = v_u_4.useMemo(function()
		-- upvalues: (copy) p_u_20
		return ("rbxassetid://%*"):format(p_u_20)
	end, { p_u_20 })
	v_u_5(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_24, (ref) v_u_7
		local v_u_27 = Instance.new("Folder")
		v_u_27.Name = "AudioWaveform"
		local v28 = Instance.new("AudioPlayer")
		v28.Asset = v_u_26
		v28.Parent = v_u_27
		v_u_24.current = v28
		v_u_27.Parent = v_u_7:WaitForChild("PlayerGui")
		return function()
			-- upvalues: (copy) v_u_27
			v_u_27:Destroy()
		end
	end, { p_u_20, p_u_21 })
	local v_u_30 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) v_u_23, (ref) v_u_19
		local v_u_29 = v_u_24.current
		if v_u_29 and v_u_29.IsReady then
			task.spawn(function()
				-- upvalues: (copy) v_u_29, (ref) v_u_25, (ref) v_u_23, (ref) v_u_19
				v_u_23((v_u_19((v_u_29:GetWaveformAsync(NumberRange.new(0, v_u_29.TimeLength), v_u_25 * v_u_29.TimeLength)))))
			end)
		end
	end, {})
	v_u_5(function()
		-- upvalues: (copy) v_u_24, (copy) v_u_30
		local v31 = v_u_24.current
		local v_u_32 = {}
		if v31 then
			local v33 = v31:GetPropertyChangedSignal("IsReady")
			local v34 = v_u_30
			table.insert(v_u_32, v33:Connect(v34))
		end
		return function()
			-- upvalues: (copy) v_u_32
			for _, v35 in v_u_32 do
				v35:Disconnect()
			end
		end
	end, {})
	return v22
end