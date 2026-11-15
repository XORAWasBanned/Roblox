-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.MusicOverlay
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.Dash)
local v_u_5 = require(v2.Foundation)
local v6 = require(v2.MomentsCommon)
local v_u_7 = require(v2.React)
local v_u_8 = v_u_5.Icon
local v_u_9 = v_u_5.Enums.ScrollBarVisibility
local v_u_10 = v_u_5.ScrollView
local v_u_11 = v_u_5.Text
local v_u_12 = v_u_5.TextInput
local v_u_13 = v_u_5.View
local v_u_14 = v3.Icon.MagnifyingGlass
local v_u_15 = require(v1.Components.MusicEditor)
local v_u_16 = require(v1.Components.MusicPreviewItem)
local v_u_17 = require(v1.Thunks.SearchMusic)
local v_u_18 = v6.Hooks.useAudioPlayback
local v_u_19 = v_u_7.useCallback
local v_u_20 = v6.Hooks.useDeviceInsets
local v_u_21 = v6.Hooks.useDispatch
local v_u_22 = v_u_7.useEffect
local v_u_23 = v_u_7.useMemo
local v_u_24 = v6.Hooks.useSelector
local v_u_25 = v_u_5.Hooks.useTokens
local v_u_26 = require(v1.Context.CreationFlowContext)
local v_u_27 = require(v1.Constants)
local v_u_28 = require(v1.Enums.CreationFlowLocalization)
local v_u_29 = require(v1.Analytics.EventNames)
return function(p_u_30)
	-- upvalues: (copy) v_u_20, (copy) v_u_21, (copy) v_u_25, (copy) v_u_7, (copy) v_u_26, (copy) v_u_24, (copy) v_u_27, (copy) v_u_23, (copy) v_u_18, (copy) v_u_22, (copy) v_u_17, (copy) v_u_19, (copy) v_u_29, (copy) v_u_15, (copy) v_u_13, (copy) v_u_5, (copy) v_u_11, (copy) v_u_28, (copy) v_u_8, (copy) v_u_12, (copy) v_u_14, (copy) v_u_10, (copy) v_u_9, (copy) v_u_4, (copy) v_u_16
	local v31 = v_u_20()
	local v_u_32 = v_u_21()
	local v33 = v_u_25()
	local v_u_34, v35 = v_u_7.useState("")
	local v36, v_u_37 = v_u_7.useState(false)
	local v_u_38, v_u_39 = v_u_7.useState(nil)
	local v_u_40 = v_u_7.useContext(v_u_26)
	local v42 = v_u_24(function(p41)
		-- upvalues: (ref) v_u_27
		return p41[v_u_27.RoduxKey].CreationFlow.musicList
	end)
	local v44 = v_u_23(function()
		-- upvalues: (copy) v_u_38
		if not v_u_38 then
			return nil
		end
		local v43 = v_u_38
		return tostring(v43)
	end, { v_u_38 })
	local v_u_45 = v_u_18(v_u_38 ~= nil, v44, {
		["autoplay"] = true,
		["looping"] = false
	})
	v_u_22(function()
		-- upvalues: (copy) p_u_30, (copy) v_u_32, (ref) v_u_17
		p_u_30.playbackController.playback.pause()
		v_u_32(v_u_17("", p_u_30.playbackController.timeline.timeLength))
	end, { p_u_30.playbackController.timeline.timeLength })
	v_u_22(function()
		-- upvalues: (copy) v_u_45, (copy) v_u_39
		if not v_u_45.playback.isPlaying then
			v_u_39(nil)
		end
	end, { v_u_45.playback.isPlaying })
	local v_u_47 = v_u_19(function(p46)
		-- upvalues: (copy) p_u_30, (copy) v_u_39, (copy) v_u_37, (copy) v_u_40, (ref) v_u_29
		p_u_30.onMusicUpdate({
			["assetId"] = nil,
			["startTime"] = 0,
			["assetId"] = p46
		})
		p_u_30.playbackController.timeline.seek(0)
		v_u_39(nil)
		v_u_37(true)
		v_u_40.fireEvent(v_u_29.EditingFlowMusicSelected, {
			["musicAssetId"] = tostring(p46)
		})
	end, { p_u_30.onMusicUpdate })
	local v48 = v_u_19(function()
		-- upvalues: (copy) p_u_30
		p_u_30.onMusicDiscard()
		p_u_30.playbackController.playback.play()
		p_u_30.playbackController.volume.unmute()
	end, { p_u_30.onMusicDiscard })
	local v49 = v_u_19(function()
		-- upvalues: (copy) p_u_30, (copy) v_u_37
		p_u_30.onMusicUpdate(nil)
		v_u_37(false)
		p_u_30.playbackController.playback.pause()
	end, { p_u_30.onMusicUpdate })
	local v50 = v_u_19(function()
		-- upvalues: (copy) p_u_30, (copy) v_u_37
		p_u_30.onMusicSave()
		v_u_37(false)
		p_u_30.playbackController.playback.play()
		p_u_30.playbackController.volume.unmute()
	end, { p_u_30.onMusicSave })
	local v_u_52 = v_u_19(function(p51)
		-- upvalues: (copy) v_u_38, (copy) v_u_39, (copy) v_u_45
		if v_u_38 and v_u_38 == p51 then
			v_u_39(nil)
		else
			v_u_39(p51)
			v_u_45.playback.play()
		end
	end, { v_u_38 })
	local v53 = v_u_19(function()
		-- upvalues: (copy) v_u_38, (copy) v_u_39, (copy) v_u_32, (ref) v_u_17, (copy) v_u_34, (copy) p_u_30
		if v_u_38 then
			v_u_39(nil)
		end
		v_u_32(v_u_17(v_u_34, p_u_30.playbackController.timeline.timeLength))
	end, { v_u_38, v_u_34, p_u_30.playbackController.timeline.timeLength })
	local v55 = v_u_19(function(p54)
		-- upvalues: (copy) p_u_30
		if p_u_30.musicEdit then
			p_u_30.onMusicUpdate({
				["assetId"] = p_u_30.musicEdit.assetId,
				["startTime"] = p54
			})
		end
	end, { p_u_30.musicEdit, p_u_30.onMusicUpdate })
	if v36 then
		return v_u_7.createElement(v_u_15, {
			["playbackController"] = p_u_30.playbackController,
			["musicEdit"] = p_u_30.musicEdit,
			["onBack"] = v49,
			["onStartTimeChanged"] = v55,
			["onDone"] = v50
		})
	end
	local v56 = v_u_7.createElement
	local v57 = v_u_13
	local v58 = {
		["onActivated"] = nil,
		["Size"] = nil,
		["stateLayer"] = nil,
		["tag"] = "align-x-center align-y-top anchor-bottom-center bg-surface-100 col gap-small position-bottom-center radius-medium size-full-0",
		["ZIndex"] = 5,
		["onActivated"] = function() -- name: onActivated end,
		["Size"] = UDim2.fromScale(1, 0.6666666666666666),
		["stateLayer"] = {
			["affordance"] = v_u_5.Enums.StateLayerAffordance.None
		}
	}
	local v59 = {}
	local v60 = v_u_7.createElement
	local v61 = {
		["PaddingTop"] = UDim.new(0, v33.Padding.Medium)
	}
	local v62 = UDim.new
	local v63 = v31.left
	local v64 = v33.Padding.XLarge
	v61.PaddingLeft = v62(0, (math.max(v63, v64)))
	local v65 = UDim.new
	local v66 = v31.right
	local v67 = v33.Padding.XLarge
	v61.PaddingRight = v65(0, (math.max(v66, v67)))
	v59.Padding = v60("UIPadding", v61)
	v59.ModalHeaderBar = v_u_7.createElement(v_u_13, {
		["LayoutOrder"] = 1,
		["tag"] = "align-x-center align-y-center auto-y flex-between row size-full-0"
	}, {
		["InspectTitle"] = v_u_7.createElement(v_u_11, {
			["LayoutOrder"] = 1,
			["tag"] = "text-heading-small content-action-emphasis text-truncate-end text-align-x-left text-align-y-top auto-xy",
			["Text"] = nil,
			["Text"] = v_u_40.getLocalization(v_u_28.EditingCtaMusic)
		}),
		["CloseButton"] = v_u_7.createElement(v_u_13, {
			["AnchorPoint"] = nil,
			["onActivated"] = nil,
			["Position"] = nil,
			["tag"] = "auto-xy padding-medium radius-medium",
			["LayoutOrder"] = 2,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["onActivated"] = v48,
			["Position"] = UDim2.fromScale(0.5, 0.5)
		}, {
			["CloseIcon"] = v_u_7.createElement(v_u_8, {
				["AnchorPoint"] = nil,
				["name"] = "icons/navigation/close",
				["Position"] = nil,
				["style"] = nil,
				["ZIndex"] = 2,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["style"] = v33.Color.ActionEmphasis.Foreground
			})
		})
	})
	v59.SearchBar = v_u_7.createElement(v_u_13, {
		["LayoutOrder"] = 2,
		["tag"] = "align-x-center align-y-center col gap-small size-full-0 auto-y"
	}, {
		["Input"] = v_u_7.createElement(v_u_12, {
			["iconLeading"] = nil,
			["text"] = nil,
			["placeholder"] = nil,
			["label"] = "",
			["onChanged"] = nil,
			["onReturnPressed"] = nil,
			["onFocusLost"] = nil,
			["LayoutOrder"] = 1,
			["width"] = nil,
			["iconLeading"] = v_u_14,
			["text"] = v_u_34,
			["placeholder"] = v_u_40.getLocalization(v_u_28.GeneralSearchPlaceholder),
			["onChanged"] = v35,
			["onReturnPressed"] = v53,
			["onFocusLost"] = v53,
			["width"] = UDim.new(1, 0)
		})
	})
	local v68 = v_u_7.createElement
	local v69 = v_u_10
	local v70 = {
		["flexItem"] = nil,
		["layout"] = nil,
		["LayoutOrder"] = 3,
		["scroll"] = nil,
		["tag"] = "align-x-left align-y-top col size-full",
		["flexItem"] = {
			["FlexMode"] = Enum.UIFlexMode.Shrink
		},
		["layout"] = {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["Padding"] = UDim.new(0, v33.Gap.Small)
		},
		["scroll"] = {
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
			["scrollBarVisibility"] = v_u_9.None,
			["ScrollingDirection"] = Enum.ScrollingDirection.Y
		}
	}
	local v71
	if v42 and #v42 > 0 then
		v71 = v_u_4.map(v42, function(p72, p73)
			-- upvalues: (ref) v_u_7, (ref) v_u_16, (copy) v_u_47, (copy) v_u_52, (copy) v_u_38, (copy) v_u_45
			local v74 = v_u_7.createElement
			local v75 = v_u_16
			local v76 = {
				["key"] = p72,
				["layoutOrder"] = p73,
				["musicAssetId"] = p72,
				["onMusicSelected"] = v_u_47,
				["togglePreviewMusic"] = v_u_52
			}
			local v77
			if v_u_38 == p72 then
				v77 = v_u_45.timeline.elapsed / v_u_45.timeline.duration
			else
				v77 = nil
			end
			v76.progress = v77
			v76.isPreviewing = v_u_38 == p72
			return v74(v75, v76)
		end)
	else
		v71 = {
			["NoResults"] = v_u_7.createElement(v_u_11, {
				["Text"] = nil,
				["tag"] = "text-body-medium content-action-emphasis text-align-x-center",
				["Text"] = v_u_40.getLocalization(v_u_28.MusicNoResults)
			})
		}
	end
	v59.ScrollView = v68(v69, v70, v71)
	return v56(v57, v58, v59)
end