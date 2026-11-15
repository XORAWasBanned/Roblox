-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.CaptureView
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v2 = require(v1.BuilderIcons)
local v_u_3 = require(v1.Dash)
local v4 = require(v1.Foundation)
local v5 = require(v1.MomentsCommon)
local v_u_6 = require(v1.React)
local v_u_7 = v2.Icon.Image
local v_u_8 = v4.Icon
local v_u_9 = v4.View
local v_u_10 = v5.LoadableVideo
local v_u_11 = v4.Hooks.useTokens
return function(p12)
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_10, (copy) v_u_3
	local v13 = v_u_11()
	if not p12.capture then
		return v_u_6.createElement(v_u_9, {
			["tag"] = "bg-shift-200 radius-large size-full"
		}, {
			["EmptyState"] = v_u_6.createElement(v_u_8, {
				["AnchorPoint"] = nil,
				["LayoutOrder"] = 2,
				["name"] = nil,
				["Position"] = nil,
				["size"] = nil,
				["style"] = nil,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["name"] = v_u_7,
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["size"] = v13.Size.Size_1200,
				["style"] = v13.Color.Shift.Shift_400
			})
		})
	end
	local v14 = v_u_6.createElement
	local v15 = v_u_9
	local v16 = {
		["tag"] = "size-full"
	}
	local v17 = {}
	local v18
	if p12.scaleType == Enum.ScaleType.Fit then
		v18 = v_u_6.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 0),
			["PaddingBottom"] = UDim.new(0, 0),
			["PaddingLeft"] = UDim.new(0, 0),
			["PaddingRight"] = UDim.new(0, 0)
		})
	else
		v18 = nil
	end
	v17.UIPadding = v18
	v17.Overlay = v_u_6.createElement(v_u_6.Fragment, {}, p12.children)
	local v19
	if p12.capture.CaptureType == Enum.CaptureType.Video then
		v19 = v_u_6.createElement(v_u_10, {
			["cornerRadius"] = nil,
			["Looped"] = false,
			["onLoaded"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["onResolutionChanged"] = nil,
			["Playing"] = true,
			["renderOnFailed"] = nil,
			["Size"] = nil,
			["scaleType"] = nil,
			["videoRef"] = nil,
			["cornerRadius"] = v13.Radius.Large,
			["onLoaded"] = v_u_3.noop,
			["onAbsoluteSizeChanged"] = p12.onAbsoluteSizeChanged,
			["onResolutionChanged"] = p12.onResolutionChanged,
			["renderOnFailed"] = p12.onRenderFailed,
			["Size"] = UDim2.fromScale(1, 1),
			["scaleType"] = p12.scaleType,
			["videoRef"] = p12.playbackController.videoRef
		})
	else
		v19 = nil
	end
	v17.VideoPreview = v19
	local v20
	if p12.capture.CaptureType == Enum.CaptureType.Screenshot then
		v20 = v_u_6.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["ref"] = p12.playbackController.imageRef,
			["ScaleType"] = p12.scaleType,
			["Size"] = UDim2.fromScale(1, 1),
			[v_u_6.Change.AbsoluteSize] = p12.onAbsoluteSizeChanged
		})
	else
		v20 = nil
	end
	v17.ImagePreview = v20
	return v14(v15, v16, v17)
end