-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.MusicEditor
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v4 = require(v2.MomentsCommon)
local v_u_5 = require(v2.React)
local v_u_6 = v_u_3.Button
local v_u_7 = v_u_3.Loading
local v_u_8 = v_u_3.View
local v_u_9 = v4.GradientBackdrop
local v_u_10 = require(v1.Components.MusicPreviewItem)
local v_u_11 = require(v1.Components.Waveform)
local v_u_12 = v_u_5.useCallback
local v_u_13 = v4.Hooks.useDeviceInsets
local v_u_14 = require(v1.Hooks.useMusicEditorController)
local v_u_15 = v4.Hooks.useToggleState
local v_u_16 = v_u_3.Hooks.useTokens
local v_u_17 = require(v1.Context.CreationFlowContext)
local v18 = require(v1.Constants)
local v_u_19 = require(v1.Enums.CreationFlowLocalization)
local v_u_20 = v18.AudioWaveform.SegmentSelectorWidth
local v_u_21 = UDim2.new(0, 48, 1, 0)
return function(p_u_22) -- name: MusicEditor
	-- upvalues: (copy) v_u_16, (copy) v_u_13, (copy) v_u_5, (copy) v_u_17, (copy) v_u_15, (copy) v_u_12, (copy) v_u_14, (copy) v_u_8, (copy) v_u_6, (copy) v_u_3, (copy) v_u_19, (copy) v_u_9, (copy) v_u_21, (copy) v_u_20, (copy) v_u_11, (copy) v_u_7, (copy) v_u_10
	local v23 = v_u_16()
	local v24 = v_u_13()
	local v25 = v_u_5.useContext(v_u_17)
	local v_u_26 = v_u_15(false)
	local v_u_27 = v_u_15(false)
	local v28 = v_u_12(function()
		-- upvalues: (copy) p_u_22, (copy) v_u_27
		p_u_22.playbackController.volume.mute()
		p_u_22.playbackController.timeline.seek(0)
		p_u_22.playbackController.playback.pause()
		v_u_27.enable()
	end, { p_u_22.playbackController.timeline.seek })
	local v29 = v_u_12(function()
		-- upvalues: (copy) p_u_22, (copy) v_u_27
		p_u_22.playbackController.volume.unmute()
		p_u_22.playbackController.playback.play()
		v_u_27.disable()
	end, {})
	local v30 = v_u_12(function()
		-- upvalues: (copy) p_u_22, (copy) v_u_26
		p_u_22.playbackController.volume.unmute()
		p_u_22.playbackController.playback.play()
		v_u_26.enable()
	end, {})
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_26
		v_u_26.disable()
	end, { p_u_22.musicEdit.assetId })
	local v31 = v_u_14(v_u_26.enabled, v29, v28, p_u_22.onStartTimeChanged, p_u_22.musicEdit, p_u_22.playbackController.audio.timeLength)
	local v32 = v31.waveformRef
	local v33 = v31.waveformPosition
	local v34 = v31.waveformDisplayRef
	local v35 = v_u_5.createElement
	local v36 = v_u_8
	local v37 = {
		["tag"] = "auto-y align-x-center align-y-top anchor-bottom-center bg-surface-100 col gap-large position-bottom-center radius-medium size-full-0",
		["ZIndex"] = 5
	}
	local v38 = {}
	local v39 = v_u_5.createElement
	local v40 = {
		["PaddingTop"] = UDim.new(0, v23.Padding.Small)
	}
	local v41 = UDim.new
	local v42 = v24.bottom
	local v43 = v23.Padding.Small
	v40.PaddingBottom = v41(0, (math.max(v42, v43)))
	local v44 = UDim.new
	local v45 = v24.left
	local v46 = v23.Padding.Large
	v40.PaddingLeft = v44(0, (math.max(v45, v46)))
	local v47 = UDim.new
	local v48 = v24.right
	local v49 = v23.Padding.Large
	v40.PaddingRight = v47(0, (math.max(v48, v49)))
	v38.Padding = v39("UIPadding", v40)
	v38.Nav = v_u_5.createElement(v_u_8, {
		["LayoutOrder"] = 1,
		["tag"] = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
	}, {
		["BackButton"] = v_u_5.createElement(v_u_6, {
			["ZIndex"] = 6,
			["fillBehavior"] = nil,
			["LayoutOrder"] = 1,
			["text"] = nil,
			["variant"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["fillBehavior"] = v_u_3.Enums.FillBehavior.Fit,
			["text"] = v25.getLocalization(v_u_19.GeneralCtaBack),
			["variant"] = v_u_3.Enums.ButtonVariant.Text,
			["onActivated"] = p_u_22.onBack,
			["size"] = v_u_3.Enums.InputSize.Medium
		}),
		["DoneButton"] = v_u_5.createElement(v_u_6, {
			["ZIndex"] = 6,
			["fillBehavior"] = nil,
			["LayoutOrder"] = 2,
			["text"] = nil,
			["variant"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["fillBehavior"] = v_u_3.Enums.FillBehavior.Fit,
			["text"] = v25.getLocalization(v_u_19.GeneralCtaDone),
			["variant"] = v_u_3.Enums.ButtonVariant.Text,
			["onActivated"] = p_u_22.onDone,
			["size"] = v_u_3.Enums.InputSize.Medium
		})
	})
	local v50 = v_u_5.createElement
	local v51 = v_u_8
	local v52 = {
		["LayoutOrder"] = 2,
		["tag"] = "size-full-1600"
	}
	local v53 = {}
	local v54 = v_u_5.createElement
	local v55 = v_u_8
	local v57 = {
		["DragDetector"] = v_u_5.createElement("UIDragDetector", {
			["DragStyle"] = Enum.UIDragDetectorDragStyle.TranslateLine,
			["ref"] = v32,
			["ResponseStyle"] = Enum.UIDragDetectorResponseStyle.CustomOffset
		}),
		["LeftGradientBackdrop"] = v_u_5.createElement(v_u_9, {
			["color3"] = nil,
			["rotation"] = 0,
			["size"] = nil,
			["startingTransparency"] = 0,
			["zIndex"] = 2,
			["color3"] = v23.Color.Surface.Surface_100.Color3,
			["size"] = v_u_21
		}),
		["RightGradientBackdrop"] = v_u_5.createElement(v_u_9, {
			["anchorPoint"] = nil,
			["color3"] = nil,
			["position"] = nil,
			["rotation"] = 180,
			["size"] = nil,
			["startingTransparency"] = 0,
			["zIndex"] = 2,
			["anchorPoint"] = Vector2.new(1, 0),
			["color3"] = v23.Color.Surface.Surface_100.Color3,
			["position"] = UDim2.fromScale(1, 0),
			["size"] = v_u_21
		}),
		["WaveformContainer"] = v_u_5.createElement(v_u_8, {
			["tag"] = "anchor-center-center position-center-center radius-medium",
			["Size"] = nil,
			["Size"] = UDim2.new(0, v_u_20, 1, 0)
		}, {
			["WaveformDisplay"] = v_u_5.createElement(v_u_11, {
				["audioAssetId"] = nil,
				["position"] = nil,
				["onWaveformReady"] = nil,
				["ref"] = nil,
				["videoDuration"] = nil,
				["zIndex"] = 1,
				["audioAssetId"] = p_u_22.musicEdit.assetId,
				["position"] = v33:map(function(p56)
					return UDim2.fromScale(p56, 0.5)
				end),
				["onWaveformReady"] = v30,
				["ref"] = v34,
				["videoDuration"] = p_u_22.playbackController.timeline.duration
			})
		})
	}
	v53.Timeline = v54(v55, {
		["tag"] = "clip size-full-full",
		["ZIndex"] = 1
	}, v57)
	local v58 = v_u_5.createElement
	local v59 = v_u_8
	local v60 = {
		["tag"] = "anchor-center-center position-center-center radius-medium",
		["Size"] = nil,
		["ZIndex"] = 2,
		["Size"] = UDim2.new(0, v_u_20, 1, -v23.Size.Size_100)
	}
	local v61 = {}
	local v62
	if v_u_26.enabled and not v_u_27.enabled then
		v62 = v_u_5.createElement(v_u_8, {
			["tag"] = "anchor-center-center bg-system-contrast size-100-1900 radius-circle",
			["Position"] = nil,
			["Position"] = UDim2.fromScale(p_u_22.playbackController.timeline.elapsed / p_u_22.playbackController.timeline.duration, 0.5)
		})
	else
		v62 = nil
	end
	v61.Scrubber = v62
	local v63
	if v_u_26.enabled then
		v63 = nil
	else
		v63 = v_u_5.createElement(v_u_7, {
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["size"] = v_u_3.Enums.IconSize.Medium
		})
	end
	v61.LoadingIndicator = v63
	v61.OutlineStroke = v_u_5.createElement("UIStroke", {
		["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border,
		["Color"] = v23.Color.System.Contrast.Color3,
		["Transparency"] = v23.Color.System.Contrast.Transparency,
		["Thickness"] = v23.Stroke.Thick
	})
	v53.SegmentOutline = v58(v59, v60, v61)
	v38.SegmentSelector = v50(v51, v52, v53)
	v38.MusicPreviewItemWrapper = v_u_5.createElement(v_u_8, {
		["tag"] = "auto-y size-full-0",
		["LayoutOrder"] = 3
	}, {
		["MusicPreviewItem"] = v_u_5.createElement(v_u_10, {
			["musicAssetId"] = p_u_22.musicEdit.assetId
		})
	})
	return v35(v36, v37, v38)
end