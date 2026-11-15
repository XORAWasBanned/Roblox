-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.CaptureItem
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v4 = require(v2.MomentsCommon)
local v_u_5 = require(v2.React)
local v_u_6 = v_u_3.Checkbox
local v_u_7 = v_u_3.Text
local v_u_8 = v_u_3.View
local v_u_9 = v4.GradientBackdrop
local v_u_10 = require(v1.Utils.getContentFromCapture)
local v_u_11 = v4.Utils.getFormatTime
local v_u_12 = v_u_5.useCallback
local v_u_13 = v_u_3.Hooks.useTokens
return function(p_u_14)
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_5, (copy) v_u_8, (copy) v_u_3, (copy) v_u_9, (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_10
	local v15 = v_u_13()
	local v16 = v_u_12(function()
		-- upvalues: (copy) p_u_14
		p_u_14.onActivated(p_u_14.capture)
	end, { p_u_14.capture, p_u_14.onActivated })
	local v17 = v_u_5.createElement
	local v18 = v_u_8
	local v19 = {
		["onActivated"] = nil,
		["stateLayer"] = nil,
		["tag"] = "size-full",
		["ZIndex"] = nil,
		["onActivated"] = v16,
		["stateLayer"] = {
			["affordance"] = v_u_3.Enums.StateLayerAffordance.None
		},
		["ZIndex"] = p_u_14.zIndex
	}
	local v20 = {
		["GradientBackdrop"] = v_u_5.createElement(v_u_9, {
			["anchorPoint"] = nil,
			["color3"] = nil,
			["position"] = nil,
			["rotation"] = 270,
			["size"] = nil,
			["startingTransparency"] = 0.6,
			["zIndex"] = 2,
			["anchorPoint"] = Vector2.new(0, 1),
			["color3"] = v15.Color.Common.Scrim.Color3,
			["position"] = UDim2.fromScale(0, 1),
			["size"] = UDim2.fromScale(1, 1)
		})
	}
	local v21 = v_u_5.createElement
	local v22 = v_u_8
	local v23 = {
		["tag"] = "padding-medium size-full",
		["ZIndex"] = 3
	}
	local v24 = {}
	local v25
	if p_u_14.selected then
		v25 = v_u_5.createElement(v_u_6, {
			["AnchorPoint"] = nil,
			["isChecked"] = true,
			["onActivated"] = nil,
			["Position"] = nil,
			["size"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["onActivated"] = v16,
			["Position"] = UDim2.fromScale(1, 0),
			["size"] = v_u_3.Enums.InputSize.Small
		})
	else
		v25 = nil
	end
	v24.SelectedIndicator = v25
	local v26
	if p_u_14.capture.CaptureType == Enum.CaptureType.Video then
		v26 = v_u_5.createElement(v_u_7, {
			["tag"] = "anchor-bottom-right auto-xy content-emphasis position-bottom-right text-label-medium",
			["Text"] = nil,
			["Text"] = v_u_11(p_u_14.capture.TimeLength)
		})
	else
		v26 = nil
	end
	v24.TimeLength = v26
	v20.Overlay = v21(v22, v23, v24)
	v20.CaptureThumbnail = v_u_5.createElement("ImageLabel", {
		["BorderSizePixel"] = 0,
		["ImageContent"] = nil,
		["ScaleType"] = nil,
		["Size"] = nil,
		["ZIndex"] = 1,
		["ImageContent"] = v_u_10(p_u_14.capture),
		["ScaleType"] = Enum.ScaleType.Crop,
		["Size"] = UDim2.fromScale(1, 1)
	})
	return v17(v18, v19, v20)
end