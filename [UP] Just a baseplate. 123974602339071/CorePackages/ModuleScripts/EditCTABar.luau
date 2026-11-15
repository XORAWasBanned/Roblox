-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.EditCTABar
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.Foundation)
local v5 = require(v2.MomentsCommon)
local v_u_6 = require(v2.React)
local v_u_7 = v_u_4.Icon
local v_u_8 = v_u_4.Text
local v_u_9 = v_u_4.View
local v_u_10 = v3.Icon.TextUppercaseALowercaseA
local v_u_11 = v3.Icon.ThreeBarsVerticalTrianglesHorizontal
local v_u_12 = v3.Icon.MusicNote
local v_u_13 = v5.GradientBackdrop
local v_u_14 = require(v1.Actions.CreationFlowStateUpdated)
local v_u_15 = v5.Hooks.useDeviceInsets
local v_u_16 = v5.Hooks.useDispatch
local v_u_17 = v_u_4.Hooks.useTokens
local v_u_18 = require(v1.Context.CreationFlowContext)
local v_u_19 = require(v1.Enums.CreationFlowState)
local v_u_20 = require(v1.Enums.CreationFlowLocalization)
local v_u_21 = require(v1.Analytics.EventNames)
return function(p22)
	-- upvalues: (copy) v_u_15, (copy) v_u_17, (copy) v_u_6, (copy) v_u_18, (copy) v_u_16, (copy) v_u_14, (copy) v_u_19, (copy) v_u_21, (copy) v_u_9, (copy) v_u_13, (copy) v_u_7, (copy) v_u_11, (copy) v_u_4, (copy) v_u_8, (copy) v_u_20, (copy) v_u_12, (copy) v_u_10
	local v23 = v_u_15()
	local v24 = v_u_17()
	local v_u_25 = v_u_6.useContext(v_u_18)
	local v_u_26 = v_u_16()
	local v27, v_u_28 = v_u_6.useBinding(UDim2.fromScale(1, 0))
	local v30 = v_u_6.useCallback(function(p29)
		-- upvalues: (copy) v_u_28
		v_u_28(UDim2.new(0, 1.5 * p29.AbsoluteSize.X, 1, 0))
	end, {})
	local v31 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_26, (ref) v_u_14, (ref) v_u_19, (copy) v_u_25, (ref) v_u_21
		v_u_26(v_u_14(v_u_19.Trimming))
		v_u_25.fireEvent(v_u_21.EditingFlowTrimButtonPressed)
	end)
	local v32 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_26, (ref) v_u_14, (ref) v_u_19, (copy) v_u_25, (ref) v_u_21
		v_u_26(v_u_14(v_u_19.Music))
		v_u_25.fireEvent(v_u_21.EditingFlowMusicButtonPressed)
	end)
	local v33 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_26, (ref) v_u_14, (ref) v_u_19, (copy) v_u_25, (ref) v_u_21
		v_u_26(v_u_14(v_u_19.TextOverlay))
		v_u_25.fireEvent(v_u_21.EditingFlowTextOverlayButtonPressed)
	end)
	local v34 = v_u_6.createElement
	local v35 = v_u_9
	local v36 = {
		["tag"] = "auto-x anchor-center-right position-center-right size-0-full",
		["ZIndex"] = nil,
		["ZIndex"] = p22.zIndex
	}
	local v37 = {
		["GradientBackdrop"] = v_u_6.createElement(v_u_13, {
			["color3"] = nil,
			["rotation"] = 180,
			["size"] = nil,
			["color3"] = v24.Color.Common.Scrim.Color3,
			["size"] = v27
		})
	}
	local v38 = v_u_6.createElement
	local v39 = v_u_9
	local v40 = {
		["tag"] = "align-x-right align-y-center anchor-center-right auto-x col gap-small position-center-right size-0-full",
		["onAbsoluteSizeChanged"] = nil,
		["onAbsoluteSizeChanged"] = v30
	}
	local v41 = {
		["Padding"] = v_u_6.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, v24.Padding.Large),
			["PaddingRight"] = UDim.new(0, v23.right + v24.Padding.Large)
		})
	}
	local v42
	if p22.captureType == Enum.CaptureType.Video then
		local v43 = v_u_6.createElement
		local v44 = v_u_9
		local v45 = {
			["LayoutOrder"] = 1,
			["onActivated"] = nil,
			["tag"] = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
			["onActivated"] = v31
		}
		local v46 = {
			["Icon"] = v_u_6.createElement(v_u_7, {
				["name"] = nil,
				["LayoutOrder"] = 2,
				["size"] = nil,
				["name"] = v_u_11,
				["size"] = v_u_4.Enums.IconSize.Large
			})
		}
		local v47
		if p22.showText then
			v47 = v_u_6.createElement(v_u_8, {
				["LayoutOrder"] = 1,
				["tag"] = "auto-xy text-label-medium content-emphasis",
				["Text"] = nil,
				["Text"] = v_u_25.getLocalization(v_u_20.EditingCtaTrimming)
			})
		else
			v47 = nil
		end
		v46.Text = v47
		v42 = v43(v44, v45, v46)
	else
		v42 = nil
	end
	v41.TrimCTAButton = v42
	local v48
	if p22.captureType == Enum.CaptureType.Video or p22.captureType == Enum.CaptureType.Screenshot then
		local v49 = v_u_6.createElement
		local v50 = v_u_9
		local v51 = {
			["LayoutOrder"] = 2,
			["onActivated"] = nil,
			["tag"] = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
			["onActivated"] = v32
		}
		local v52 = {
			["Icon"] = v_u_6.createElement(v_u_7, {
				["name"] = nil,
				["LayoutOrder"] = 2,
				["size"] = nil,
				["name"] = v_u_12,
				["size"] = v_u_4.Enums.IconSize.Large
			})
		}
		local v53
		if p22.showText then
			v53 = v_u_6.createElement(v_u_8, {
				["LayoutOrder"] = 1,
				["tag"] = "auto-xy text-label-medium content-emphasis",
				["Text"] = nil,
				["Text"] = v_u_25.getLocalization(v_u_20.EditingCtaMusic)
			})
		else
			v53 = nil
		end
		v52.Text = v53
		v48 = v49(v50, v51, v52)
	else
		v48 = nil
	end
	v41.MusicCTAButton = v48
	local v54
	if p22.captureType == Enum.CaptureType.Video then
		local v55 = v_u_6.createElement
		local v56 = v_u_9
		local v57 = {
			["LayoutOrder"] = 3,
			["onActivated"] = nil,
			["tag"] = "align-x-right align-y-center auto-xy row gap-medium padding-xsmall radius-medium",
			["onActivated"] = v33
		}
		local v58 = {
			["Icon"] = v_u_6.createElement(v_u_7, {
				["name"] = nil,
				["LayoutOrder"] = 2,
				["size"] = nil,
				["name"] = v_u_10,
				["size"] = v_u_4.Enums.IconSize.Large
			})
		}
		local v59
		if p22.showText then
			v59 = v_u_6.createElement(v_u_8, {
				["LayoutOrder"] = 1,
				["tag"] = "auto-xy text-label-medium content-emphasis",
				["Text"] = nil,
				["Text"] = v_u_25.getLocalization(v_u_20.EditingCtaTextOverlay)
			})
		else
			v59 = nil
		end
		v58.Text = v59
		v54 = v55(v56, v57, v58)
	else
		v54 = nil
	end
	v41.TextOverlayCTAButton = v54
	v37.EditCTABar = v38(v39, v40, v41)
	return v34(v35, v36, v37)
end