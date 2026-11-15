-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useUnifiedPlayback
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.Cryo)
local v4 = require(v2.React)
local v_u_5 = require(v1.Hooks.useAudioPlayback)
local v_u_6 = v4.useCallback
local v_u_7 = v4.useEffect
local v_u_8 = require(v1.Hooks.useImageDisplay)
local v_u_9 = v4.useMemo
local v_u_10 = v4.useRef
local v_u_11 = require(v1.Hooks.useToggleState)
local v_u_12 = require(v1.Hooks.useVideoPlayback)
local v_u_13 = require(v1.Utils.Signal)
local v_u_14 = require(v1.Constants)
require(v1.Types)
local v_u_15 = {
	["autoplay"] = false,
	["edits"] = nil,
	["looping"] = false,
	["content"] = nil,
	["captureType"] = nil,
	["edits"] = {
		["music"] = nil,
		["trim"] = nil
	}
}
return function(p_u_16, p17) -- name: useUnifiedPlayback
	-- upvalues: (copy) v_u_3, (copy) v_u_15, (copy) v_u_11, (copy) v_u_10, (copy) v_u_13, (copy) v_u_9, (copy) v_u_14, (copy) v_u_5, (copy) v_u_12, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7
	local v_u_18 = v_u_3.Dictionary.union(v_u_15, p17)
	local v_u_19 = v_u_11(false)
	local v_u_20 = v_u_11(false)
	local v_u_21 = v_u_10(v_u_13.new())
	local v_u_22 = v_u_9(function()
		-- upvalues: (copy) v_u_18
		if v_u_18.edits.music then
			return v_u_18.edits.music.assetId
		else
			return nil
		end
	end, { v_u_18.edits })
	local v_u_23 = v_u_9(function()
		-- upvalues: (copy) v_u_18, (ref) v_u_14
		if v_u_18.captureType == Enum.CaptureType.Screenshot then
			return NumberRange.new(0, v_u_14.ScreenshotMusicDuration)
		elseif v_u_18.edits.trim then
			return NumberRange.new(v_u_18.edits.trim.startTime, v_u_18.edits.trim.endTime)
		else
			return NumberRange.new(0, (1 / 0))
		end
	end, { v_u_18.edits, v_u_18.captureType })
	local v_u_24 = v_u_5(p_u_16, v_u_22, {
		["playbackRegion"] = v_u_9(function()
			-- upvalues: (copy) v_u_18, (copy) v_u_23
			if v_u_18.edits.music then
				return NumberRange.new(v_u_18.edits.music.startTime, v_u_18.edits.music.startTime + (v_u_23.Max - v_u_23.Min))
			else
				return NumberRange.new(0, (1 / 0))
			end
		end, { v_u_18.edits, v_u_23 }),
		["looping"] = p17.looping
	})
	local v25 = v_u_12
	local v26
	if v_u_18.captureType == Enum.CaptureType.Screenshot then
		v26 = nil
	else
		v26 = v_u_18.content
	end
	local v_u_27 = v25(p_u_16, v26, {
		["playbackRegion"] = v_u_23,
		["looping"] = p17.looping
	})
	local v28 = v_u_8
	local v29
	if v_u_18.captureType == Enum.CaptureType.Screenshot then
		v29 = v_u_18.content
	else
		v29 = nil
	end
	local v_u_30 = v28(p_u_16, v29)
	local v32 = v_u_6(function(p31)
		-- upvalues: (copy) v_u_27, (copy) v_u_24
		if v_u_27.ref.current and v_u_27.ref.current.IsLoaded then
			v_u_27.timeline.seek(p31)
			v_u_24.timeline.seek(p31)
		end
	end, { v_u_27.timeline.seek, v_u_24.timeline.seek })
	v_u_7(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_30, (copy) p_u_16, (copy) v_u_19
		if v_u_27.ref.current and v_u_27.ref.current.IsLoaded or v_u_30.ref.current and v_u_30.isLoadedRef.current then
			if p_u_16 then
				v_u_19.enable()
			else
				v_u_19.disable()
			end
		else
			return
		end
	end, { p_u_16 })
	v_u_7(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_30, (copy) v_u_19, (copy) v_u_24
		if v_u_27.ref.current and v_u_27.ref.current.IsLoaded or v_u_30.ref.current and v_u_30.isLoadedRef.current then
			if v_u_19.enabled then
				v_u_27.playback.play()
				v_u_24.playback.play()
			else
				v_u_27.playback.pause()
				v_u_24.playback.pause()
			end
		else
			return
		end
	end, { v_u_19.enabled })
	v_u_7(function()
		-- upvalues: (copy) v_u_20, (copy) v_u_24, (copy) v_u_22, (copy) v_u_27
		if v_u_20.enabled then
			v_u_24.volume.mute()
		else
			v_u_24.volume.unmute()
		end
		if v_u_22 or v_u_20.enabled then
			v_u_27.volume.mute()
		else
			v_u_27.volume.unmute()
		end
	end, { v_u_20.enabled, v_u_22 })
	local v_u_34 = v_u_6(function(p33)
		-- upvalues: (copy) p_u_16, (copy) v_u_18, (copy) v_u_19, (copy) v_u_21
		if p_u_16 and v_u_18.autoplay then
			v_u_19.enable()
		end
		v_u_21.current:fire(p33)
	end, { p_u_16, v_u_18.autoplay })
	local v_u_35 = v_u_6(function()
		-- upvalues: (copy) v_u_34
		v_u_34(Enum.AssetType.Image)
	end, { v_u_34 })
	local v_u_36 = v_u_6(function()
		-- upvalues: (copy) v_u_34
		v_u_34(Enum.AssetType.Video)
	end, { v_u_34 })
	local v_u_37 = v_u_6(function()
		-- upvalues: (copy) v_u_24
		v_u_24.timeline.seek(0)
	end, { v_u_24.timeline.seek })
	v_u_7(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_37, (copy) v_u_36, (copy) v_u_30, (copy) v_u_35
		local v_u_38 = {}
		if v_u_27.onVideoDidLoopSignalRef.current then
			local v39 = v_u_27.onVideoDidLoopSignalRef.current
			local v40 = v_u_37
			table.insert(v_u_38, v39:connect(v40))
		end
		if v_u_27.onVideoLoadedSignalRef.current then
			local v41 = v_u_27.onVideoLoadedSignalRef.current
			local v42 = v_u_36
			table.insert(v_u_38, v41:connect(v42))
		end
		if v_u_30.onImageLoadedSignalRef.current then
			local v43 = v_u_30.onImageLoadedSignalRef.current
			local v44 = v_u_35
			table.insert(v_u_38, v43:connect(v44))
		end
		return function()
			-- upvalues: (copy) v_u_38
			for _, v45 in v_u_38 do
				v45.disconnect()
			end
		end
	end, { v_u_36, v_u_37, v_u_35 })
	local v46 = {}
	local v47
	if v_u_18.captureType == Enum.CaptureType.Video then
		v47 = {
			["duration"] = v_u_27.timeline.duration,
			["elapsed"] = v_u_27.timeline.elapsed,
			["seek"] = v32,
			["timeLength"] = v_u_27.timeline.timeLength,
			["timePosition"] = v_u_27.timeline.timePosition
		}
	else
		v47 = {
			["duration"] = v_u_14.ScreenshotMusicDuration,
			["elapsed"] = v_u_24.timeline.elapsed,
			["seek"] = v32,
			["timeLength"] = v_u_14.ScreenshotMusicDuration,
			["timePosition"] = v_u_24.timeline.timePosition
		}
	end
	v46.timeline = v47
	v46.playback = {
		["isPlaying"] = v_u_19.enabled,
		["pause"] = v_u_19.disable,
		["play"] = v_u_19.enable,
		["toggle"] = v_u_19.toggle
	}
	v46.volume = {
		["isMuted"] = v_u_20.enabled,
		["mute"] = v_u_20.enable,
		["unmute"] = v_u_20.disable,
		["toggle"] = v_u_20.toggle
	}
	v46.audio = {
		["timeLength"] = v_u_24.timeline.timeLength,
		["timePosition"] = v_u_24.timeline.timePosition
	}
	v46.onContentLoadedSignalRef = v_u_21
	v46.imageRef = v_u_30.updateRef
	v46.videoRef = v_u_27.updateRef
	v46.audioRef = v_u_24.ref
	return v46
end