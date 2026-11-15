-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.PlaybackControls
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v2 = require(v1.BuilderIcons)
local v_u_3 = require(v1.Foundation)
local v4 = require(v1.MomentsCommon)
local v_u_5 = require(v1.React)
local v_u_6 = v_u_3.IconButton
local v_u_7 = v_u_3.Slider
local v_u_8 = v_u_3.Text
local v_u_9 = v_u_3.View
local v_u_10 = v2.Icon.PlayLarge
local v_u_11 = v2.Icon.PauseLarge
local v_u_12 = v2.Icon.Speaker
local v_u_13 = v2.Icon.SpeakerSlash
local v_u_14 = v2.Icon.TwoArrowsFromCenter
local v_u_15 = v2.Icon.TwoArrowsToCenter
local v_u_16 = v4.GradientBackdrop
local v_u_17 = v_u_5.useCallback
local v_u_18 = v4.Hooks.useDeviceInsets
local v_u_19 = v_u_3.Hooks.useTokens
local v_u_20 = v4.Utils.getFormatTime
return function(p_u_21) -- name: PlaybackControls
	-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_5, (copy) v_u_17, (copy) v_u_9, (copy) v_u_16, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_11, (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_8, (copy) v_u_20, (copy) v_u_14, (copy) v_u_15
	local v22 = v_u_18()
	local v23 = v_u_19()
	local v24, v_u_25 = v_u_5.useBinding(UDim2.fromScale(1, 0))
	local v_u_26 = v_u_5.useRef(false)
	local v27 = v_u_5.useCallback(function()
		-- upvalues: (copy) p_u_21, (copy) v_u_26
		if p_u_21.playbackController.playback.isPlaying then
			v_u_26.current = true
		end
		p_u_21.playbackController.playback.pause()
	end, { p_u_21.playbackController.playback.isPlaying })
	local v28 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_26, (copy) p_u_21
		if v_u_26.current then
			p_u_21.playbackController.playback.play()
		end
		v_u_26.current = false
	end, {})
	local v30 = v_u_5.useCallback(function(p29)
		-- upvalues: (copy) p_u_21
		p_u_21.playbackController.timeline.seek(p29 * p_u_21.playbackController.timeline.duration)
	end, { p_u_21.playbackController.timeline.duration, p_u_21.playbackController.timeline.seek })
	local v32 = v_u_5.useCallback(function(p31)
		-- upvalues: (copy) v_u_25
		v_u_25(UDim2.new(0, p31.AbsoluteSize.X, 1, 0))
	end, {})
	local v33 = v_u_17(function()
		-- upvalues: (copy) p_u_21
		p_u_21.playbackController.playback.toggle()
	end, { p_u_21.playbackController })
	local v34 = v_u_17(function()
		-- upvalues: (copy) p_u_21
		p_u_21.playbackController.volume.toggle()
	end, { p_u_21.playbackController })
	local v35 = v_u_5.createElement
	local v36 = v_u_9
	local v37 = {
		["LayoutOrder"] = nil,
		["tag"] = "auto-y size-full-0",
		["LayoutOrder"] = p_u_21.layoutOrder
	}
	local v38 = {
		["GradientBackdrop"] = v_u_5.createElement(v_u_16, {
			["color3"] = nil,
			["rotation"] = 270,
			["size"] = nil,
			["color3"] = v23.Color.Common.Scrim.Color3,
			["size"] = v24
		})
	}
	local v39 = v_u_5.createElement
	local v40 = v_u_9
	local v41 = {
		["LayoutOrder"] = 1,
		["onAbsoluteSizeChanged"] = nil,
		["tag"] = "auto-y col gap-xxsmall size-full-0",
		["onAbsoluteSizeChanged"] = v32
	}
	local v42 = {}
	local v43 = v_u_5.createElement
	local v44 = {
		["PaddingBottom"] = UDim.new(0, v23.Padding.Medium)
	}
	local v45 = UDim.new
	local v46 = v22.left
	local v47 = v23.Padding.Large
	v44.PaddingLeft = v45(0, (math.max(v46, v47)))
	local v48 = UDim.new
	local v49 = v22.right
	local v50 = v23.Padding.Large
	v44.PaddingRight = v48(0, (math.max(v49, v50)))
	v42.Padding = v43("UIPadding", v44)
	v42.Slider = v_u_5.createElement(v_u_7, {
		["value"] = nil,
		["size"] = nil,
		["knobVisibility"] = nil,
		["variant"] = nil,
		["onValueChanged"] = nil,
		["onDragStarted"] = nil,
		["onDragEnded"] = nil,
		["LayoutOrder"] = 1,
		["value"] = p_u_21.playbackController.timeline.elapsed / p_u_21.playbackController.timeline.duration,
		["size"] = v_u_3.Enums.InputSize.XSmall,
		["knobVisibility"] = v_u_3.Enums.Visibility.None,
		["variant"] = v_u_3.Enums.SliderVariant.Standard,
		["onValueChanged"] = v30,
		["onDragStarted"] = v27,
		["onDragEnded"] = v28
	})
	local v51 = v_u_5.createElement
	local v52 = v_u_9
	local v53 = {
		["tag"] = "auto-y size-full-0",
		["LayoutOrder"] = 2
	}
	local v54 = {}
	local v55 = v_u_5.createElement
	local v56 = v_u_9
	local v57 = {
		["PlaybackToggle"] = v_u_5.createElement(v_u_6, {
			["icon"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["LayoutOrder"] = 1,
			["icon"] = p_u_21.playbackController.playback.isPlaying and v_u_11 or v_u_10,
			["onActivated"] = v33,
			["size"] = v_u_3.Enums.InputSize.Small
		}),
		["MuteToggle"] = v_u_5.createElement(v_u_6, {
			["icon"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["LayoutOrder"] = 2,
			["icon"] = p_u_21.playbackController.volume.isMuted and v_u_13 or v_u_12,
			["onActivated"] = v34,
			["size"] = v_u_3.Enums.InputSize.Small
		})
	}
	v54.LeftControlButtons = v55(v56, {
		["tag"] = "auto-xy row gap-xsmall anchor-top-left position-top-left",
		["LayoutOrder"] = 1
	}, v57)
	v54.DurationDisplay = v_u_5.createElement(v_u_8, {
		["LayoutOrder"] = 2,
		["tag"] = "auto-xy anchor-center-center position-center-center text-body-medium content-emphasis",
		["Text"] = nil,
		["Text"] = ("%* / %*"):format(v_u_20(p_u_21.playbackController.timeline.elapsed), (v_u_20(p_u_21.playbackController.timeline.duration)))
	})
	local v58 = v_u_5.createElement
	local v59 = v_u_9
	local v60 = {
		["tag"] = "auto-xy row gap-xsmall anchor-top-right position-top-right",
		["LayoutOrder"] = 3
	}
	local v61 = {}
	local v62 = v_u_5.createElement
	local v63 = v_u_6
	local v64 = {
		["icon"] = nil,
		["onActivated"] = nil,
		["size"] = nil,
		["LayoutOrder"] = 1
	}
	local v65
	if p_u_21.isFitMode then
		v65 = v_u_14
	else
		v65 = v_u_15
	end
	v64.icon = v65
	v64.onActivated = p_u_21.toggleFitMode
	v64.size = v_u_3.Enums.InputSize.Small
	v61.FitModeToggle = v62(v63, v64)
	v54.RightControlButtons = v58(v59, v60, v61)
	v42.ControlBar = v51(v52, v53, v54)
	v38.Controls = v39(v40, v41, v42)
	return v35(v36, v37, v38)
end