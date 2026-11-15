-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.TrimmingView
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = game:GetService("VideoService")
local v4 = require(v2.BuilderIcons)
local v_u_5 = require(v2.Foundation)
local v6 = require(v2.MomentsCommon)
local v_u_7 = require(v2.React)
local v_u_8 = v_u_5.Button
local v_u_9 = v_u_5.IconButton
local v_u_10 = v_u_5.Text
local v_u_11 = v_u_5.View
local v_u_12 = v4.Icon.PlayLarge
local v_u_13 = v4.Icon.PauseLarge
local v_u_14 = v4.Icon.Speaker
local v_u_15 = v4.Icon.SpeakerSlash
local v_u_16 = require(v1.Components.DragHandle)
local v_u_17 = require(v1.Components.TrimTooltip)
local v_u_18 = v_u_7.useCallback
local v_u_19 = v6.Hooks.useDeviceInsets
local v_u_20 = v_u_5.Hooks.useTokens
local v_u_21 = require(v1.Hooks.useTrimDragController)
local v_u_22 = require(v1.Context.CreationFlowContext)
local v_u_23 = require(v1.Utils.getContentFromCapture)
local v_u_24 = require(v1.Enums.DragHandle)
local v_u_25 = require(v1.Enums.CreationFlowLocalization)
return function(p_u_26)
	-- upvalues: (copy) v_u_19, (copy) v_u_20, (copy) v_u_7, (copy) v_u_22, (copy) v_u_23, (copy) v_u_3, (copy) v_u_18, (copy) v_u_21, (copy) v_u_11, (copy) v_u_8, (copy) v_u_5, (copy) v_u_25, (copy) v_u_17, (copy) v_u_16, (copy) v_u_24, (copy) v_u_9, (copy) v_u_13, (copy) v_u_12, (copy) v_u_10, (copy) v_u_15, (copy) v_u_14
	local v27 = v_u_19()
	local v28 = v_u_20()
	local v29 = v_u_7.useContext(v_u_22)
	local v_u_30 = v_u_7.useRef(false)
	local v_u_31 = v_u_7.useRef(false)
	local v32, v_u_33 = v_u_7.useState(nil)
	local v_u_34 = v_u_7.useRef(nil)
	local v_u_35 = v_u_23(p_u_26.selectedCapture)
	local v_u_36, v_u_37 = v_u_7.useState({})
	v_u_7.useEffect(function()
		-- upvalues: (copy) v_u_34, (ref) v_u_3, (copy) v_u_35, (copy) p_u_26, (copy) v_u_37
		task.spawn(function()
			-- upvalues: (ref) v_u_34, (ref) v_u_3, (ref) v_u_35, (ref) p_u_26, (ref) v_u_37
			local function v38()
				-- upvalues: (ref) v_u_34, (ref) v_u_3, (ref) v_u_35
				v_u_34.current = v_u_3:CreateVideoSamplerAsync(v_u_35)
			end
			local v39, v40 = pcall(v38)
			if v39 then
				local v41 = p_u_26.playbackController.timeline.timeLength
				local v42 = {}
				for v43 = 0, math.floor(v41) - 1 do
					table.insert(v42, v43)
				end
				v_u_37(v_u_34.current:GetSamplesAtTimesAsync(v42))
			else
				warn("Failed to create VideoSampler:", v40)
			end
		end)
	end, { p_u_26.selectedCapture })
	local v45 = v_u_18(function(p44)
		-- upvalues: (copy) v_u_30, (copy) p_u_26, (copy) v_u_31, (copy) v_u_33
		v_u_30.current = p_u_26.playbackController.playback.isPlaying
		v_u_31.current = p_u_26.playbackController.volume.isMuted
		p_u_26.playbackController.volume.mute()
		p_u_26.playbackController.playback.pause()
		v_u_33(p44)
	end, { p_u_26.playbackController.playback.isPlaying, p_u_26.playbackController.volume.isMuted })
	local v55 = v_u_21(true, v_u_18(function()
		-- upvalues: (copy) v_u_30, (copy) p_u_26, (copy) v_u_31, (copy) v_u_33
		if v_u_30.current then
			p_u_26.playbackController.playback.play()
		end
		if not v_u_31.current then
			p_u_26.playbackController.volume.unmute()
		end
		v_u_30.current = false
		v_u_31.current = false
		v_u_33(nil)
	end, {}), v45, v_u_18(function(p46, p47)
		-- upvalues: (copy) p_u_26
		local v48 = p46 or (p_u_26.trimEdit and p_u_26.trimEdit.startTime or 0)
		local v49 = p47 or (p_u_26.trimEdit and p_u_26.trimEdit.endTime or p_u_26.playbackController.timeline.timeLength)
		local v50 = p_u_26.playbackController.timeline.timeLength
		local v51 = math.clamp(v48, 0, v50)
		local v52 = p_u_26.playbackController.timeline.timeLength
		local v53 = {
			["startTime"] = v51,
			["endTime"] = math.clamp(v49, 0, v52)
		}
		p_u_26.onTrimUpdate(v53)
		p_u_26.playbackController.timeline.seek(0)
	end, { p_u_26.onTrimUpdate, p_u_26.trimEdit, p_u_26.playbackController.timeline.timeLength }), v_u_18(function(p54)
		-- upvalues: (copy) p_u_26
		p_u_26.playbackController.timeline.seek(p54 * p_u_26.playbackController.timeline.duration)
	end, { p_u_26.playbackController.timeline.seek, p_u_26.playbackController.timeline.duration }), p_u_26.trimEdit, p_u_26.playbackController.timeline.timeLength)
	local v56 = v55.dragContainerRef
	local v57 = v55.leftHandleRef
	local v58 = v55.rightHandleRef
	local v59 = v55.scrubberDisplayRef
	local v60 = v55.scrubberRef
	local v61 = v55.segmentRef
	local v62 = v55.leftHandlePosition
	local v63 = v55.rightHandlePosition
	local v64 = v_u_18(function()
		-- upvalues: (copy) p_u_26
		if p_u_26.onTrimDiscard then
			p_u_26.onTrimDiscard()
		end
	end, { p_u_26.onTrimDiscard })
	local v65 = v_u_18(function()
		-- upvalues: (copy) p_u_26
		if p_u_26.onTrimSave then
			p_u_26.onTrimSave()
		end
	end, { p_u_26.onTrimSave })
	local v66 = v_u_18(function()
		-- upvalues: (copy) p_u_26
		p_u_26.playbackController.playback.toggle()
	end, { p_u_26.playbackController })
	local v67 = v_u_18(function()
		-- upvalues: (copy) p_u_26
		p_u_26.playbackController.volume.toggle()
	end, { p_u_26.playbackController })
	local v79 = v_u_7.useMemo(function()
		-- upvalues: (copy) p_u_26, (ref) v_u_7, (ref) v_u_11, (copy) v_u_36
		local v68 = p_u_26.playbackController.timeline.timeLength
		local v69 = {}
		for v70 = 1, math.floor(v68) do
			local v71 = v_u_7.createElement
			local v72 = v_u_11
			local v73 = {
				["tag"] = "size-full-full bg-system-neutral shrink"
			}
			local v74 = {}
			local v75 = v_u_7.createElement
			local v76 = "ImageLabel"
			local v77 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["ImageContent"] = nil,
				["ScaleType"] = nil,
				["Size"] = UDim2.fromScale(1, 1)
			}
			local v78 = v_u_36[v70]
			if v78 then
				v78 = v_u_36[v70].Image
			end
			v77.ImageContent = v78
			v77.ScaleType = Enum.ScaleType.Crop
			v74.content = v75(v76, v77)
			v69[v70] = v71(v72, v73, v74)
		end
		return v69
	end, { p_u_26.playbackController.timeline.timeLength, v_u_36 })
	local v80 = v_u_7.createElement
	local v81 = v_u_11
	local v82 = {
		["LayoutOrder"] = nil,
		["tag"] = "align-x-center auto-y align-y-bottom anchor-bottom-center col gap-large position-bottom-center size-full-0",
		["LayoutOrder"] = p_u_26.layoutOrder
	}
	local v83 = {}
	local v84 = v_u_7.createElement
	local v85 = {
		["PaddingTop"] = UDim.new(0, v28.Padding.Small)
	}
	local v86 = UDim.new
	local v87 = v27.bottom
	local v88 = v28.Padding.Small
	v85.PaddingBottom = v86(0, (math.max(v87, v88)))
	local v89 = UDim.new
	local v90 = v27.left
	local v91 = v28.Padding.XLarge
	v85.PaddingLeft = v89(0, (math.max(v90, v91)))
	local v92 = UDim.new
	local v93 = v27.right
	local v94 = v28.Padding.XLarge
	v85.PaddingRight = v92(0, (math.max(v93, v94)))
	v83.Padding = v84("UIPadding", v85)
	v83.Nav = v_u_7.createElement(v_u_11, {
		["LayoutOrder"] = 1,
		["tag"] = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
	}, {
		["BackButton"] = v_u_7.createElement(v_u_8, {
			["fillBehavior"] = nil,
			["LayoutOrder"] = 1,
			["text"] = nil,
			["variant"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["fillBehavior"] = v_u_5.Enums.FillBehavior.Fit,
			["text"] = v29.getLocalization(v_u_25.GeneralCtaBack),
			["variant"] = v_u_5.Enums.ButtonVariant.Text,
			["onActivated"] = v64,
			["size"] = v_u_5.Enums.InputSize.Medium
		}),
		["DoneButton"] = v_u_7.createElement(v_u_8, {
			["fillBehavior"] = nil,
			["LayoutOrder"] = 2,
			["text"] = nil,
			["variant"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["fillBehavior"] = v_u_5.Enums.FillBehavior.Fit,
			["text"] = v29.getLocalization(v_u_25.GeneralCtaDone),
			["variant"] = v_u_5.Enums.ButtonVariant.Text,
			["onActivated"] = v65,
			["size"] = v_u_5.Enums.InputSize.Medium
		})
	})
	local v95 = v_u_7.createElement
	local v96 = v_u_11
	local v97 = {
		["LayoutOrder"] = 2,
		["tag"] = "padding-x-small size-full-1000",
		["ZIndex"] = 2
	}
	local v98 = {}
	local v99 = v_u_7.createElement
	local v100 = v_u_11
	local v101 = {
		["ref"] = nil,
		["tag"] = "padding-x-medium size-full-full",
		["ZIndex"] = 2,
		["ref"] = v56
	}
	local v102 = {}
	local v103 = v_u_7.createElement
	local v104 = v_u_11
	local v105 = {
		["tag"] = "size-full"
	}
	local v108 = {
		["TrimTooltip"] = v_u_7.createElement(v_u_17, {
			["activeHandle"] = v32,
			["leftHandlePosition"] = v62,
			["rightHandlePosition"] = v63,
			["timeLength"] = p_u_26.playbackController.timeline.timeLength
		}),
		["LeftHandle"] = v_u_7.createElement(v_u_16, {
			["anchorPoint"] = Vector2.new(1, 0.5),
			["position"] = v62:map(function(p106)
				return UDim2.fromScale(p106, 0.5)
			end),
			["dragDetectorRef"] = v57
		}),
		["RightHandle"] = v_u_7.createElement(v_u_16, {
			["anchorPoint"] = nil,
			["isFlipped"] = true,
			["position"] = nil,
			["dragDetectorRef"] = nil,
			["anchorPoint"] = Vector2.new(0, 0.5),
			["position"] = v63:map(function(p107)
				return UDim2.fromScale(p107, 0.5)
			end),
			["dragDetectorRef"] = v58
		})
	}
	local v109 = v_u_7.createElement
	local v110 = v_u_11
	local v115 = {
		["Position"] = nil,
		["Size"] = nil,
		["tag"] = "anchor-center-left",
		["ZIndex"] = 2,
		["Position"] = v62:map(function(p111)
			return UDim2.fromScale(p111, 0.5)
		end),
		["Size"] = v_u_7.joinBindings({
			["leftHandlePosition"] = v62,
			["rightHandlePosition"] = v63
		}):map(function(p112)
			local v113 = p112.leftHandlePosition
			local v114 = p112.rightHandlePosition
			return UDim2.fromScale(v114 - v113, 1)
		end)
	}
	local v116 = {
		["OutlineStroke"] = v_u_7.createElement("UIStroke", {
			["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border,
			["Color"] = v28.Color.System.Contrast.Color3,
			["Transparency"] = v28.Color.System.Contrast.Transparency,
			["Thickness"] = v28.Stroke.Thicker
		})
	}
	local v117
	if v32 and v32 ~= v_u_24.Scrubber then
		v117 = nil
	else
		v117 = v_u_7.createElement(v_u_11, {
			["ref"] = nil,
			["tag"] = "anchor-center-center bg-system-contrast size-100-1400 radius-circle",
			["Position"] = nil,
			["ref"] = v59,
			["Position"] = UDim2.fromScale(p_u_26.playbackController.timeline.elapsed / p_u_26.playbackController.timeline.duration, 0.5)
		}, {
			["DragDetector"] = v_u_7.createElement("UIDragDetector", {
				["DragStyle"] = Enum.UIDragDetectorDragStyle.TranslateLine,
				["ref"] = v60,
				["ResponseStyle"] = Enum.UIDragDetectorResponseStyle.CustomScale
			})
		})
	end
	v116.Scrubber = v117
	v116.DragDetector = v_u_7.createElement("UIDragDetector", {
		["DragStyle"] = Enum.UIDragDetectorDragStyle.TranslateLine,
		["ref"] = v61,
		["ResponseStyle"] = Enum.UIDragDetectorResponseStyle.CustomScale
	})
	v108.Outline = v109(v110, v115, v116)
	v108.ShadowBlockLeft = v_u_7.createElement(v_u_11, {
		["backgroundStyle"] = nil,
		["Size"] = nil,
		["tag"] = "anchor-center-left position-center-left",
		["ZIndex"] = 0,
		["backgroundStyle"] = v28.Color.Extended.Black.Black_50,
		["Size"] = v62:map(function(p118)
			return UDim2.fromScale(p118, 1)
		end)
	})
	v108.ShadowBlockRight = v_u_7.createElement(v_u_11, {
		["backgroundStyle"] = nil,
		["Size"] = nil,
		["tag"] = "anchor-center-right position-center-right",
		["ZIndex"] = 0,
		["backgroundStyle"] = v28.Color.Extended.Black.Black_50,
		["Size"] = v63:map(function(p119)
			return UDim2.fromScale(1 - p119, 1)
		end)
	})
	v102.TrimmerBar = v103(v104, v105, v108)
	v98.PaddedContainer = v99(v100, v101, v102)
	v98.Timeline = v_u_7.createElement(v_u_11, {
		["tag"] = "bg-surface-100 radius-medium size-full-full",
		["ZIndex"] = 1
	}, {
		["OutlineStroke"] = v_u_7.createElement("UIStroke", {
			["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border,
			["Color"] = v28.Color.Surface.Surface_100.Color3,
			["Transparency"] = v28.Color.Surface.Surface_100.Transparency,
			["Thickness"] = v28.Stroke.Thicker
		}),
		["TimelineBar"] = v_u_7.createElement(v_u_11, {
			["layout"] = nil,
			["tag"] = "padding-x-medium size-full-full row",
			["layout"] = {
				["Padding"] = UDim.new(0, v28.Size.Size_50)
			}
		}, v79)
	})
	v83.Trimmer = v95(v96, v97, v98)
	local v120 = v_u_7.createElement
	local v121 = v_u_11
	local v122 = {
		["PlaybackToggle"] = v_u_7.createElement(v_u_9, {
			["LayoutOrder"] = 1,
			["icon"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["icon"] = p_u_26.playbackController.playback.isPlaying and v_u_13 or v_u_12,
			["onActivated"] = v66,
			["size"] = v_u_5.Enums.InputSize.Medium
		})
	}
	local v123 = v_u_7.createElement
	local v124 = v_u_10
	local v125 = {
		["LayoutOrder"] = 2,
		["tag"] = "auto-xy text-label-medium content-default",
		["Text"] = nil
	}
	local v126 = string.format
	local v127 = p_u_26.playbackController.timeline.elapsed
	v125.Text = ("%* / %*"):format(v126("%.1f", (math.max(0, v127))), (string.format("%.1f", p_u_26.playbackController.timeline.duration)))
	v122.DurationDisplay = v123(v124, v125)
	v122.MuteToggle = v_u_7.createElement(v_u_9, {
		["LayoutOrder"] = 3,
		["icon"] = nil,
		["onActivated"] = nil,
		["size"] = nil,
		["icon"] = p_u_26.playbackController.volume.isMuted and v_u_15 or v_u_14,
		["onActivated"] = v67,
		["size"] = v_u_5.Enums.InputSize.Medium
	})
	v83.VideoControls = v120(v121, {
		["LayoutOrder"] = 3,
		["tag"] = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
	}, v122)
	return v80(v81, v82, v83)
end