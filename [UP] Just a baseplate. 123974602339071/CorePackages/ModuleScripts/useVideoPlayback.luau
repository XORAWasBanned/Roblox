-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useVideoPlayback
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.Cryo)
local v4 = require(v2.React)
local v_u_5 = v4.useCallback
local v_u_6 = v4.useEffect
local v_u_7 = v4.useRef
local v_u_8 = v4.useState
local v_u_9 = require(v1.Hooks.useToggleState)
local v_u_10 = require(v1.Utils.Signal)
require(v1.Types)
local v_u_11 = {
	["autoplay"] = false,
	["looping"] = false,
	["playbackRegion"] = nil,
	["playbackRegion"] = NumberRange.new(0, (1 / 0))
}
return function(p_u_12, p_u_13, p14) -- name: useVideoPlayback
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8, (copy) v_u_10, (copy) v_u_5, (copy) v_u_6
	local v_u_15 = v_u_3.Dictionary.union(v_u_11, p14 or {})
	local v_u_16 = v_u_7(nil)
	local v_u_17 = v_u_9(false)
	local v_u_18 = v_u_9(v_u_15.autoplay)
	local v_u_19 = v_u_9(false)
	local v_u_20, v_u_21 = v_u_8(0)
	local v_u_22, v_u_23 = v_u_8(0)
	local v24, v_u_25 = v_u_8(0)
	local v26, v_u_27 = v_u_8(0)
	local v_u_28 = v_u_7(v_u_10.new())
	local v_u_29 = v_u_7(v_u_10.new())
	local v34 = v_u_5(function(p30)
		-- upvalues: (copy) v_u_16, (copy) v_u_15, (copy) v_u_20
		local v31 = v_u_16.current
		if v31 then
			local v32 = p30 + v_u_15.playbackRegion.Min
			local v33 = v_u_20
			v31.TimePosition = math.clamp(v32, 0, v33)
		end
	end, { v_u_20, v_u_15.playbackRegion })
	local v_u_39 = v_u_5(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_29, (copy) v_u_15, (copy) v_u_19, (copy) v_u_25, (copy) v_u_21
		local v35 = v_u_16.current
		if v35 then
			v_u_29.current:fire()
			local v36 = v_u_15.playbackRegion.Max - v_u_15.playbackRegion.Min
			v35.Volume = v_u_19.enabled and 0 or 0.2
			local v37 = v_u_25
			local v38 = v35.TimeLength
			v37((math.min(v36, v38)))
			v_u_21(v35.TimeLength)
		end
	end, { v_u_15.playbackRegion, v_u_19.enabled })
	local v_u_41 = v_u_5(function()
		-- upvalues: (copy) p_u_12, (copy) v_u_16, (copy) v_u_27, (copy) v_u_15, (copy) v_u_23
		if p_u_12 then
			local v40 = v_u_16.current
			if v40 then
				v_u_27(v40.TimePosition - v_u_15.playbackRegion.Min)
				v_u_23(v40.TimePosition)
			end
		end
	end, { p_u_12, v_u_15.playbackRegion })
	local v_u_42 = v_u_5(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_15, (copy) v_u_28
		if v_u_16.current then
			v_u_16.current.TimePosition = v_u_15.playbackRegion.Min
			v_u_28.current:fire()
		end
	end, { v_u_15.playbackRegion })
	v_u_6(function()
		-- upvalues: (copy) v_u_16, (copy) p_u_13
		local v43 = v_u_16.current
		if v43 then
			if p_u_13 then
				v43.VideoContent = p_u_13
			end
		end
	end, { v_u_17.enabled, p_u_13 })
	v_u_6(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_39, (copy) v_u_41, (copy) v_u_42
		local v44 = v_u_16.current
		if v44 then
			local v_u_45 = v44.Loaded:Connect(v_u_39)
			local v_u_46 = game:GetService("RunService").RenderStepped:Connect(v_u_41)
			local v_u_47 = v44.DidLoop:Connect(v_u_42)
			return function()
				-- upvalues: (copy) v_u_45, (copy) v_u_46, (copy) v_u_47
				v_u_45:Disconnect()
				v_u_46:Disconnect()
				v_u_47:Disconnect()
			end
		end
	end, {
		v_u_17.enabled,
		v_u_41,
		v_u_39,
		v_u_42
	})
	v_u_6(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_15
		local v48 = v_u_16.current
		if v48 then
			v48.Looped = v_u_15.looping
		end
	end, { v_u_17.enabled, v_u_15.looping })
	v_u_6(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_18
		local v49 = v_u_16.current
		if v49 then
			v49.Playing = v_u_18.enabled
		end
	end, { v_u_17.enabled, v_u_18.enabled })
	v_u_6(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local v50 = v_u_16.current
		if v50 then
			v50.Volume = v_u_19.enabled and 0 or 0.2
		end
	end, { v_u_17.enabled, v_u_19.enabled })
	v_u_6(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_22, (copy) v_u_15, (copy) v_u_18, (copy) v_u_28
		local v51 = v_u_16.current
		if v51 then
			if v_u_22 >= v_u_15.playbackRegion.Max + 0.001 then
				if v_u_18.enabled then
					if v_u_15.looping then
						v51.TimePosition = v_u_15.playbackRegion.Min
						v_u_28.current:fire()
					else
						v_u_18.disable()
					end
				else
					v_u_22 = v_u_15.playbackRegion.Max
				end
			end
			if v_u_22 < v_u_15.playbackRegion.Min - 0.001 then
				v51.TimePosition = v_u_15.playbackRegion.Min
			end
		end
	end, {
		v_u_22,
		v_u_15.playbackRegion,
		v_u_15.looping,
		v_u_18.disable
	})
	v_u_6(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_15, (copy) v_u_25
		local v52 = v_u_16.current
		if v52 then
			local v53 = v_u_15.playbackRegion.Max - v_u_15.playbackRegion.Min
			local v54 = v_u_25
			local v55 = v52.TimeLength
			v54((math.min(v53, v55)))
		end
	end, { v_u_15.playbackRegion })
	local v57 = v_u_5(function(p56)
		-- upvalues: (copy) v_u_17, (copy) v_u_16
		v_u_17.toggle()
		v_u_16.current = p56
	end, { v_u_17.toggle })
	return {
		["timeline"] = {
			["duration"] = v24,
			["elapsed"] = v26,
			["seek"] = v34,
			["timeLength"] = v_u_20,
			["timePosition"] = v_u_22
		},
		["playback"] = {
			["isPlaying"] = v_u_18.enabled,
			["pause"] = v_u_18.disable,
			["play"] = v_u_18.enable,
			["toggle"] = v_u_18.toggle
		},
		["volume"] = {
			["isMuted"] = v_u_19.enabled,
			["mute"] = v_u_19.enable,
			["unmute"] = v_u_19.disable,
			["toggle"] = v_u_19.toggle
		},
		["onVideoDidLoopSignalRef"] = v_u_28,
		["onVideoLoadedSignalRef"] = v_u_29,
		["ref"] = v_u_16,
		["updateRef"] = v57
	}
end