-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders._Utils.createPlayhead
local v_u_1 = game:GetService("RunService")
require(script.Parent.Parent.Parent.Types)
return function(p2) -- name: createPlayhead
	-- upvalues: (copy) v_u_1
	local v_u_3 = p2.root
	local v_u_4 = p2.tracks or {}
	local v_u_7 = p2.getClipLength or function()
		-- upvalues: (copy) v_u_4
		local v5 = 0
		for _, v6 in v_u_4 do
			if v5 >= v6.Length then
				continue
			end
			v5 = v6.Length
		end
		return v5
	end
	local v_u_8 = p2.getDuration or v_u_7
	local v_u_9 = p2.syncVisuals
	local v_u_10 = p2.animator
	local v_u_11 = p2.canPlay or function()
		-- upvalues: (copy) v_u_8
		return v_u_8() > 0
	end
	local v_u_12 = 0
	local v_u_13 = false
	local v_u_14 = false
	local v_u_15 = nil
	local function v_u_20(p16) -- name: applyPlayhead
		-- upvalues: (copy) v_u_8, (copy) v_u_7, (ref) v_u_12, (copy) v_u_10, (ref) v_u_1, (copy) v_u_9, (copy) v_u_4
		local v17 = v_u_8()
		local v18 = v_u_7()
		if v17 <= 0 then
			v_u_12 = 0
			if v_u_10 ~= nil and not v_u_1:IsRunning() then
				v_u_10:StepAnimations(0)
			end
			if v_u_9 ~= nil then
				v_u_9(v_u_12)
			end
		else
			v_u_12 = math.clamp(p16, 0, v17)
			if v18 > 0 then
				for _, v19 in v_u_4 do
					v19.TimePosition = v_u_12 % v18
				end
			end
			if v_u_10 ~= nil and not v_u_1:IsRunning() then
				v_u_10:StepAnimations(0)
			end
			if v_u_9 ~= nil then
				v_u_9(v_u_12)
			end
		end
	end
	local function v_u_24()
		-- upvalues: (ref) v_u_14, (copy) v_u_11, (ref) v_u_13, (copy) v_u_9, (ref) v_u_12, (copy) v_u_4, (copy) v_u_20, (ref) v_u_15, (ref) v_u_1, (copy) v_u_8
		if v_u_14 then
			return
		elseif v_u_11() then
			if v_u_9 ~= nil then
				v_u_9(v_u_12)
			end
			for _, v21 in v_u_4 do
				v21:AdjustSpeed(1)
				if v21.IsPlaying then
					continue
				end
				v21:Play(0)
			end
			v_u_20(v_u_12)
			v_u_13 = true
			if v_u_15 == nil then
				if v_u_14 then
					return
				end
				v_u_15 = v_u_1.Heartbeat:Connect(function(p22)
					-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_8, (ref) v_u_20, (ref) v_u_12
					if v_u_14 or not v_u_13 then
						return
					else
						local v23 = v_u_8()
						if v23 > 0 then
							v_u_20((v_u_12 + p22) % v23)
						end
					end
				end)
			end
		else
			v_u_13 = false
		end
	end
	local function v_u_26()
		-- upvalues: (ref) v_u_14, (ref) v_u_15, (copy) v_u_4, (ref) v_u_13
		if not v_u_14 then
			if v_u_15 ~= nil then
				v_u_15:Disconnect()
				v_u_15 = nil
			end
			for _, v25 in v_u_4 do
				v25:AdjustSpeed(0)
			end
			v_u_13 = false
		end
	end
	local function v_u_28(p27)
		-- upvalues: (ref) v_u_14, (copy) v_u_20
		if not v_u_14 then
			v_u_20(p27)
		end
	end
	local function v_u_30()
		-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_15, (copy) v_u_4, (copy) v_u_3
		if not v_u_14 then
			v_u_14 = true
			v_u_13 = false
			if v_u_15 ~= nil then
				v_u_15:Disconnect()
				v_u_15 = nil
			end
			for _, v29 in v_u_4 do
				v29:AdjustSpeed(0)
				v29:Stop(0)
			end
			table.clear(v_u_4)
			v_u_3:Destroy()
		end
	end
	v_u_20(0)
	local v31 = {}
	local v_u_32 = p2.play
	v31.play = v_u_32 ~= nil and function()
		-- upvalues: (copy) v_u_32, (copy) v_u_24
		v_u_32(v_u_24)
	end or v_u_24
	local v_u_33 = p2.pause
	v31.pause = v_u_33 ~= nil and function()
		-- upvalues: (copy) v_u_33, (copy) v_u_26
		v_u_33(v_u_26)
	end or v_u_26
	local v_u_34 = p2.seek
	v31.seek = v_u_34 ~= nil and function(p35)
		-- upvalues: (copy) v_u_34, (copy) v_u_28
		v_u_34(v_u_28, p35)
	end or v_u_28
	local v_u_36 = p2.dispose
	v31.dispose = v_u_36 ~= nil and function()
		-- upvalues: (copy) v_u_36, (copy) v_u_30
		v_u_36(v_u_30)
	end or v_u_30
	local function v_u_37()
		-- upvalues: (ref) v_u_13
		return v_u_13
	end
	local v_u_38 = p2.getIsPlaying
	v31.getIsPlaying = v_u_38 ~= nil and function()
		-- upvalues: (copy) v_u_38, (copy) v_u_37
		return v_u_38(v_u_37)
	end or v_u_37
	local function v_u_39()
		-- upvalues: (ref) v_u_12
		return v_u_12
	end
	local v_u_40 = p2.getPosition
	v31.getPosition = v_u_40 ~= nil and function()
		-- upvalues: (copy) v_u_40, (copy) v_u_39
		return v_u_40(v_u_39)
	end or v_u_39
	v31.getDuration = v_u_8
	return v31
end