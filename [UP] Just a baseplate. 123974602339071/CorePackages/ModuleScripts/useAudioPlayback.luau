-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useAudioPlayback
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v3 = game:GetService("Players")
local v_u_4 = require(v2.Cryo)
local v5 = require(v2.React)
local v_u_6 = v5.useCallback
local v_u_7 = v5.useEffect
local v_u_8 = v5.useMemo
local v_u_9 = v5.useRef
local v_u_10 = v5.useState
local v_u_11 = require(v1.Hooks.useToggleState)
require(v1.Types)
local v_u_12 = v3.LocalPlayer
local v_u_13 = {
	["autoplay"] = false,
	["looping"] = false,
	["playbackRegion"] = nil,
	["playbackRegion"] = NumberRange.new(0, (1 / 0))
}
return function(p_u_14, p_u_15, p16) -- name: useAudioPlayback
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_12
	local v_u_17 = v_u_4.Dictionary.union(v_u_13, p16 or {})
	local v_u_18 = v_u_9(nil)
	local v_u_19 = v_u_11(v_u_17.autoplay)
	local v_u_20 = v_u_11(false)
	local v_u_21, v_u_22 = v_u_10(0)
	local v23, v_u_24 = v_u_10(0)
	local v25, v_u_26 = v_u_10(0)
	local v27, v_u_28 = v_u_10(0)
	local v33 = v_u_6(function(p29)
		-- upvalues: (copy) v_u_18, (copy) v_u_17, (copy) v_u_21
		local v30 = v_u_18.current
		if v30 then
			local v31 = p29 + v_u_17.playbackRegion.Min
			local v32 = v_u_21
			v30.TimePosition = math.clamp(v31, 0, v32)
		end
	end, { v_u_21, v_u_17.playbackRegion })
	local v_u_35 = v_u_6(function()
		-- upvalues: (copy) p_u_14, (copy) v_u_18, (copy) v_u_28, (copy) v_u_17, (copy) v_u_24
		if p_u_14 then
			local v34 = v_u_18.current
			if v34 then
				v_u_28(v34.TimePosition - v_u_17.playbackRegion.Min)
				v_u_24(v34.TimePosition)
			end
		end
	end, { p_u_14, p_u_15, v_u_17.playbackRegion })
	local v_u_37 = v_u_8(function()
		-- upvalues: (ref) p_u_15
		local v36 = p_u_15
		if v36 then
			return ("rbxassetid://%*"):format(v36)
		else
			return nil
		end
	end, { p_u_15 })
	v_u_7(function()
		-- upvalues: (ref) v_u_37, (copy) v_u_17, (copy) v_u_22, (copy) v_u_18, (ref) v_u_12
		if v_u_37 then
			local v_u_38 = Instance.new("Folder")
			v_u_38.Name = ("AudioPlayback_%*"):format(v_u_37)
			local v_u_39 = Instance.new("AudioPlayer")
			v_u_39.Asset = v_u_37
			v_u_39.PlaybackRegion = v_u_17.playbackRegion
			v_u_39.Looping = v_u_17.looping or false
			v_u_39.Parent = v_u_38
			v_u_39.Volume = 0.2
			local function v40() -- name: updateTimeLength
				-- upvalues: (ref) v_u_22, (copy) v_u_39
				v_u_22(v_u_39.TimeLength)
			end
			v_u_39:GetPropertyChangedSignal("TimeLength"):Connect(v40)
			v_u_22(v_u_39.TimeLength)
			local v41 = Instance.new("AudioDeviceOutput")
			v41.Parent = v_u_38
			local v42 = Instance.new("Wire")
			v42.SourceInstance = v_u_39
			v42.TargetInstance = v41
			v42.Parent = v_u_38
			v_u_18.current = v_u_39
			task.spawn(function()
				-- upvalues: (copy) v_u_38, (ref) v_u_12
				v_u_38.Parent = v_u_12:WaitForChild("PlayerGui")
			end)
			return function()
				-- upvalues: (copy) v_u_38
				v_u_38:Destroy()
			end
		end
	end, { v_u_37 })
	v_u_7(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_17
		local v43 = v_u_18.current
		if v43 then
			v43.PlaybackRegion = v_u_17.playbackRegion
			v43.TimePosition = 0
		end
	end, { v_u_17.playbackRegion })
	v_u_7(function()
		-- upvalues: (copy) v_u_17, (copy) v_u_26, (copy) v_u_21
		local v44 = v_u_17.playbackRegion.Max - v_u_17.playbackRegion.Min
		local v45 = v_u_21
		v_u_26((math.min(v44, v45)))
	end, { v_u_21, v_u_17.playbackRegion })
	v_u_7(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_19
		local v46 = v_u_18.current
		if v46 then
			if v_u_19.enabled then
				v46.PlaybackSpeed = 1
				if not v46.IsPlaying then
					v46:Play()
					return
				end
			else
				v46.PlaybackSpeed = 0
				if v46.IsPlaying then
					v46:Stop()
				end
			end
		end
	end, { v_u_37, v_u_19.enabled })
	v_u_7(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_20, (copy) v_u_19
		local v47 = v_u_18.current
		if v47 then
			if v_u_20.enabled or not v_u_19.enabled then
				v47.Volume = 0
				return
			end
			v47.Volume = 0.2
		end
	end, { v_u_20.enabled, v_u_19.enabled })
	local v_u_48 = v_u_6(function()
		-- upvalues: (copy) v_u_19
		v_u_19.disable()
	end, {})
	v_u_7(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_35, (copy) v_u_48
		local v_u_49 = {}
		if v_u_18.current then
			local v50 = game:GetService("RunService").RenderStepped
			local v51 = v_u_35
			table.insert(v_u_49, v50:Connect(v51))
			local v52 = v_u_18.current.Ended
			local v53 = v_u_48
			table.insert(v_u_49, v52:Connect(v53))
		end
		return function()
			-- upvalues: (copy) v_u_49
			for _, v54 in v_u_49 do
				v54:Disconnect()
			end
		end
	end, { v_u_35, v_u_48 })
	return {
		["timeline"] = {
			["duration"] = v25,
			["elapsed"] = v27,
			["seek"] = v33,
			["timeLength"] = v_u_21,
			["timePosition"] = v23
		},
		["playback"] = {
			["isPlaying"] = v_u_19.enabled,
			["pause"] = v_u_19.disable,
			["play"] = v_u_19.enable,
			["toggle"] = v_u_19.toggle
		},
		["volume"] = {
			["isMuted"] = v_u_20.enabled,
			["mute"] = v_u_20.enable,
			["unmute"] = v_u_20.disable,
			["toggle"] = v_u_20.toggle
		},
		["ref"] = v_u_18
	}
end