-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Hooks.useMusicEditorController
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
require(v2.MomentsCommon)
local v3 = require(v2.React)
local v_u_4 = require(v2.ReactOtter)
local v_u_5 = v_u_4.useAnimatedBinding
local v_u_6 = v3.useCallback
local v_u_7 = v3.useEffect
local v_u_8 = v3.useRef
local v_u_9 = require(v1.Constants).AudioWaveform.SegmentSelectorWidth
return function(p_u_10, p_u_11, p_u_12, p_u_13, p_u_14, p_u_15) -- name: useMusicEditorController
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4, (copy) v_u_7
	local v_u_16 = v_u_8(nil)
	local v_u_17 = v_u_8(nil)
	local v_u_18, v_u_19 = v_u_5(0)
	local v_u_20 = v_u_8(nil)
	local v_u_21 = v_u_6(function()
		-- upvalues: (copy) v_u_20, (copy) v_u_18, (copy) p_u_12
		v_u_20.current = v_u_18:getValue()
		p_u_12()
	end, { p_u_12 })
	local v_u_30 = v_u_6(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_20, (ref) v_u_9, (copy) p_u_13, (copy) p_u_15, (copy) v_u_19, (ref) v_u_4
		local v22 = v_u_16.current
		local v23 = v_u_17.current
		if v22 and v23 then
			local v24 = v_u_20.current
			local v25 = v22.DragUDim2.X.Offset / v_u_9
			local v26 = v23.AbsoluteSize.X / v_u_9
			if 1 - v26 <= 0 then
				local v27 = v24 + v25
				local v28 = 1 - v26
				local v29 = math.clamp(v27, v28, 0)
				p_u_13(p_u_15 * (-v29 / v26))
				v_u_19(v_u_4.instant(v29))
			end
		else
			return
		end
	end, { p_u_15, p_u_13 })
	local v_u_31 = v_u_6(function()
		-- upvalues: (copy) v_u_20, (copy) p_u_11
		v_u_20.current = nil
		p_u_11()
	end, { p_u_11 })
	v_u_7(function()
		-- upvalues: (copy) p_u_10, (copy) v_u_16, (copy) v_u_21, (copy) v_u_30, (copy) v_u_31
		if p_u_10 then
			local v_u_32 = {}
			if v_u_16.current then
				local v33 = v_u_16.current.DragStart
				local v34 = v_u_21
				table.insert(v_u_32, v33:Connect(v34))
				local v35 = v_u_16.current.DragContinue
				local v36 = v_u_30
				table.insert(v_u_32, v35:Connect(v36))
				local v37 = v_u_16.current.DragEnd
				local v38 = v_u_31
				table.insert(v_u_32, v37:Connect(v38))
			end
			return function()
				-- upvalues: (copy) v_u_32
				for _, v39 in v_u_32 do
					v39:Disconnect()
				end
			end
		end
	end, {
		p_u_10,
		v_u_21,
		v_u_30,
		v_u_31
	})
	v_u_7(function()
		-- upvalues: (copy) v_u_17, (ref) v_u_9, (copy) v_u_19, (ref) v_u_4, (copy) p_u_14, (copy) p_u_15
		local v40 = v_u_17.current
		if v40 then
			local v41 = v40.AbsoluteSize.X / v_u_9
			v_u_19(v_u_4.instant(-p_u_14.startTime / p_u_15 * v41))
		end
	end, { p_u_14.startTime, p_u_15 })
	return {
		["waveformRef"] = v_u_16,
		["waveformPosition"] = v_u_18,
		["waveformDisplayRef"] = v_u_17
	}
end