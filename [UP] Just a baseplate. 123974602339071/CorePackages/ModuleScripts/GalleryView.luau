-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.GalleryView
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.Cryo)
local v_u_5 = require(v2.Foundation)
local v6 = require(v2.MomentsCommon)
local v_u_7 = require(v2.React)
local v_u_8 = v_u_5.Button
local v_u_9 = v_u_5.Enums.ButtonVariant
local v_u_10 = v_u_5.Chip
local v_u_11 = v_u_5.Enums.InputSize
local v_u_12 = v_u_5.Text
local v_u_13 = v_u_5.View
local v_u_14 = v3.Icon.Image
local v_u_15 = v3.Icon.VideoCamera
local v_u_16 = require(v1.Components.CaptureItem)
local v_u_17 = v6.ScrollingGridView
local v_u_18 = v_u_7.useCallback
local v_u_19 = v_u_7.useContext
local v_u_20 = v6.Hooks.useDeviceInsets
local v_u_21 = v_u_5.Hooks.useTokens
local v_u_22 = require(v1.Context.CreationFlowContext)
local v_u_23 = require(v1.Constants)
local v_u_24 = require(v1.Enums.CreationFlowLocalization)
local v_u_25 = require(v1.Analytics.EventNames)
return function(p_u_26)
	-- upvalues: (copy) v_u_20, (copy) v_u_21, (copy) v_u_19, (copy) v_u_22, (copy) v_u_7, (copy) v_u_4, (copy) v_u_25, (copy) v_u_18, (copy) v_u_16, (copy) v_u_13, (copy) v_u_12, (copy) v_u_24, (copy) v_u_10, (copy) v_u_5, (copy) v_u_14, (copy) v_u_15, (copy) v_u_17, (copy) v_u_23, (copy) v_u_8, (copy) v_u_11, (copy) v_u_9
	local v27 = v_u_20()
	local v28 = v_u_21()
	local v_u_29 = v_u_19(v_u_22)
	local v_u_30, v_u_31 = v_u_7.useState(nil)
	local v_u_32 = v_u_7.useRef(false)
	local v34 = v_u_7.useMemo(function()
		-- upvalues: (copy) v_u_30, (copy) p_u_26, (ref) v_u_4
		if v_u_30 then
			return v_u_4.List.filter(p_u_26.captures, function(p33)
				-- upvalues: (ref) v_u_30
				return p33.CaptureType == v_u_30
			end)
		else
			return p_u_26.captures
		end
	end, { p_u_26.captures, v_u_30 })
	v_u_7.useEffect(function()
		-- upvalues: (copy) p_u_26, (copy) v_u_32, (copy) v_u_29, (ref) v_u_25
		if #p_u_26.captures == 0 and v_u_32.current == false then
			v_u_32.current = true
			v_u_29.fireEvent(v_u_25.EditingFlowGalleryNoCapturesAvailable)
		end
	end, { p_u_26.captures })
	local v36 = v_u_18(function(p35, _)
		-- upvalues: (ref) v_u_7, (ref) v_u_16, (copy) p_u_26
		return v_u_7.createElement(v_u_16, {
			["capture"] = nil,
			["onActivated"] = nil,
			["selected"] = nil,
			["zIndex"] = 1,
			["capture"] = p35,
			["onActivated"] = p_u_26.onCaptureSelected,
			["selected"] = p_u_26.selectedCapture == p35
		})
	end, { p_u_26.selectedCapture, p_u_26.onCaptureSelected })
	local v40 = v_u_18(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_13, (ref) v_u_12, (copy) v_u_29, (ref) v_u_24
		local v37 = v_u_7.createElement
		local v38 = v_u_13
		local v39 = {
			["EmptyState"] = v_u_7.createElement(v_u_12, {
				["tag"] = "anchor-top-center auto-xy content-action-emphasis padding-large position-top-center text-align-x-center text-align-y-center text-body-medium",
				["Text"] = nil,
				["Text"] = v_u_29.getLocalization(v_u_24.GeneralEmptyStateText)
			})
		}
		return v37(v38, {
			["tag"] = "shrink size-full-full"
		}, v39)
	end, { v_u_29 })
	local v41 = v_u_18(function()
		-- upvalues: (copy) v_u_31
		v_u_31(nil)
	end, {})
	local v42 = v_u_18(function()
		-- upvalues: (copy) v_u_31
		v_u_31(Enum.CaptureType.Screenshot)
	end, {})
	local v43 = v_u_18(function()
		-- upvalues: (copy) v_u_31
		v_u_31(Enum.CaptureType.Video)
	end, {})
	local v44 = v_u_18(function()
		-- upvalues: (copy) v_u_29
		v_u_29.fetchAdditionalCaptures()
	end, { v_u_29 })
	local v45 = v_u_7.createElement
	local v46 = v_u_13
	local v47 = {
		["LayoutOrder"] = nil,
		["tag"] = "align-x-center auto-y align-y-bottom anchor-bottom-center gap-large position-bottom-center col shrink size-full-0",
		["LayoutOrder"] = p_u_26.layoutOrder
	}
	local v48 = {}
	local v49 = v_u_7.createElement
	local v50 = {
		["PaddingTop"] = UDim.new(0, v28.Padding.Large)
	}
	local v51 = UDim.new
	local v52 = v27.bottom
	local v53 = v28.Padding.Large
	v50.PaddingBottom = v51(0, (math.max(v52, v53)))
	v48.Padding = v49("UIPadding", v50)
	local v54 = v_u_7.createElement
	local v55 = v_u_13
	local v56 = {}
	local v57 = v_u_7.createElement
	local v58 = {}
	local v59 = UDim.new
	local v60 = v27.left
	local v61 = v28.Padding.XLarge
	v58.PaddingLeft = v59(0, (math.max(v60, v61)))
	local v62 = UDim.new
	local v63 = v27.right
	local v64 = v28.Padding.XLarge
	v58.PaddingRight = v62(0, (math.max(v63, v64)))
	v56.Padding = v57("UIPadding", v58)
	v56.AllChip = v_u_7.createElement(v_u_10, {
		["isChecked"] = nil,
		["LayoutOrder"] = 1,
		["onActivated"] = nil,
		["size"] = nil,
		["text"] = nil,
		["isChecked"] = v_u_30 == nil,
		["onActivated"] = v41,
		["size"] = v_u_5.Enums.ChipSize.Small,
		["text"] = v_u_29.getLocalization(v_u_24.GeneralAllChipLabel)
	})
	v56.PhotosChip = v_u_7.createElement(v_u_10, {
		["isChecked"] = nil,
		["LayoutOrder"] = 2,
		["leading"] = nil,
		["onActivated"] = nil,
		["size"] = nil,
		["text"] = nil,
		["isChecked"] = v_u_30 == Enum.CaptureType.Screenshot,
		["leading"] = v_u_14,
		["onActivated"] = v42,
		["size"] = v_u_5.Enums.ChipSize.Small,
		["text"] = v_u_29.getLocalization(v_u_24.GeneralPhotosChipLabel)
	})
	v56.VideosChip = v_u_7.createElement(v_u_10, {
		["isChecked"] = nil,
		["LayoutOrder"] = 3,
		["leading"] = nil,
		["onActivated"] = nil,
		["size"] = nil,
		["text"] = nil,
		["isChecked"] = v_u_30 == Enum.CaptureType.Video,
		["leading"] = v_u_15,
		["onActivated"] = v43,
		["size"] = v_u_5.Enums.ChipSize.Small,
		["text"] = v_u_29.getLocalization(v_u_24.GeneralVideosChipLabel)
	})
	v48.FilterButtons = v54(v55, {
		["LayoutOrder"] = 1,
		["tag"] = "auto-y anchor-top-center gap-small position-top-center row size-full-0"
	}, v56)
	v48.CaptureGrid = v_u_7.createElement(v_u_13, {
		["LayoutOrder"] = 2,
		["tag"] = "anchor-top-center gap-small position-top-center row shrink size-full-full"
	}, {
		["Padding"] = v_u_7.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, v27.left),
			["PaddingRight"] = UDim.new(0, v27.right)
		}),
		["CaptureGrid"] = v_u_7.createElement(v_u_17, {
			["aspectRatio"] = 1,
			["itemConfig"] = nil,
			["items"] = nil,
			["layoutOrder"] = 1,
			["onShowMoreCallback"] = nil,
			["padding"] = nil,
			["renderEmptyState"] = nil,
			["renderItem"] = nil,
			["shouldShowShowMoreButton"] = nil,
			["showMoreButtonText"] = nil,
			["itemConfig"] = {
				["padding"] = 2,
				["maxItemsPerRow"] = 5,
				["minItemsPerPage"] = 6,
				["minItemWidth"] = 100
			},
			["items"] = v34,
			["onShowMoreCallback"] = v44,
			["padding"] = {
				["bottom"] = UDim.new(0, v28.Padding.Large)
			},
			["renderEmptyState"] = v40,
			["renderItem"] = v36,
			["shouldShowShowMoreButton"] = not v_u_29.capturesPagesIsFinished(),
			["showMoreButtonText"] = v_u_29.getLocalization(v_u_24.GeneralCtaShowMore)
		})
	})
	local v65 = v_u_7.createElement
	local v66 = v_u_13
	local v67 = {}
	local v68 = v_u_7.createElement
	local v69 = {}
	local v70 = UDim.new
	local v71 = v27.left
	local v72 = v28.Padding.XLarge
	v69.PaddingLeft = v70(0, (math.max(v71, v72)))
	local v73 = UDim.new
	local v74 = v27.right
	local v75 = v28.Padding.XLarge
	v69.PaddingRight = v73(0, (math.max(v74, v75)))
	v67.Padding = v68("UIPadding", v69)
	v67.ButtonConstraint = v_u_7.createElement(v_u_13, {
		["sizeConstraint"] = nil,
		["tag"] = "auto-y size-full-0",
		["sizeConstraint"] = {
			["MaxSize"] = v_u_23.BottomBarSizeConstraint
		}
	}, {
		["NextButton"] = v_u_7.createElement(v_u_8, {
			["fillBehavior"] = nil,
			["isDisabled"] = nil,
			["LayoutOrder"] = 1,
			["onActivated"] = nil,
			["size"] = nil,
			["text"] = nil,
			["variant"] = nil,
			["fillBehavior"] = v_u_5.Enums.FillBehavior.Fill,
			["isDisabled"] = not p_u_26.selectedCapture,
			["onActivated"] = p_u_26.onNextCallback,
			["size"] = v_u_11.Medium,
			["text"] = v_u_29.getLocalization(v_u_24.PublishingCtaContinue),
			["variant"] = v_u_9.Emphasis
		})
	})
	v48.ButtonContainer = v65(v66, {
		["LayoutOrder"] = 3,
		["tag"] = "align-x-center auto-y size-full-0"
	}, v67)
	return v45(v46, v47, v48)
end