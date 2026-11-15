-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.PreviewView
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v4 = require(v2.MomentsCommon)
local v_u_5 = require(v2.React)
local v_u_6 = v_u_3.Button
local v_u_7 = v_u_3.Enums.ButtonVariant
local v_u_8 = v_u_3.Enums.InputSize
local v_u_9 = v_u_3.View
local v_u_10 = v4.Hooks.useDeviceInsets
local v_u_11 = v_u_3.Hooks.useTokens
local v_u_12 = require(v1.Context.CreationFlowContext)
local v_u_13 = require(v1.Constants)
local v_u_14 = require(v1.Enums.CreationFlowLocalization)
return function(p15)
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_5, (copy) v_u_12, (copy) v_u_9, (copy) v_u_13, (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (copy) v_u_14, (copy) v_u_7
	local v16 = v_u_10()
	local v17 = v_u_11()
	local v18 = v_u_5.useContext(v_u_12)
	local v19 = v_u_5.createElement
	local v20 = v_u_9
	local v21 = {
		["LayoutOrder"] = nil,
		["tag"] = "align-x-center auto-y size-full-0",
		["LayoutOrder"] = p15.layoutOrder
	}
	local v22 = {}
	local v23 = v_u_5.createElement
	local v24 = {
		["PaddingTop"] = UDim.new(0, v17.Padding.Large)
	}
	local v25 = UDim.new
	local v26 = v16.bottom
	local v27 = v17.Padding.Large
	v24.PaddingBottom = v25(0, (math.max(v26, v27)))
	local v28 = UDim.new
	local v29 = v16.left
	local v30 = v17.Padding.XLarge
	v24.PaddingLeft = v28(0, (math.max(v29, v30)))
	local v31 = UDim.new
	local v32 = v16.right
	local v33 = v17.Padding.XLarge
	v24.PaddingRight = v31(0, (math.max(v32, v33)))
	v22.Padding = v23("UIPadding", v24)
	local v34 = v_u_5.createElement
	local v35 = v_u_9
	local v36 = {
		["sizeConstraint"] = nil,
		["tag"] = "align-x-center auto-y gap-small row size-full-0",
		["sizeConstraint"] = {
			["MaxSize"] = v_u_13.BottomBarSizeConstraint
		}
	}
	local v37 = {
		["ContinueButton"] = v_u_5.createElement(v_u_6, {
			["fillBehavior"] = nil,
			["LayoutOrder"] = 1,
			["onActivated"] = nil,
			["size"] = nil,
			["text"] = nil,
			["variant"] = nil,
			["width"] = nil,
			["fillBehavior"] = v_u_3.Enums.FillBehavior.Fill,
			["onActivated"] = p15.onContinueCallback,
			["size"] = v_u_8.Medium,
			["text"] = v18.getLocalization(v_u_14.PublishingCtaContinue),
			["variant"] = v_u_7.Emphasis,
			["width"] = UDim.new(0.5, 0)
		})
	}
	local v38
	if p15.onReturnToGalleryCallback then
		v38 = v_u_5.createElement(v_u_6, {
			["fillBehavior"] = nil,
			["LayoutOrder"] = 2,
			["text"] = nil,
			["variant"] = nil,
			["width"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["fillBehavior"] = v_u_3.Enums.FillBehavior.Fill,
			["text"] = v18.getLocalization(v_u_14.PublishingCtaReturn),
			["variant"] = v_u_7.Standard,
			["width"] = UDim.new(0.5, 0),
			["onActivated"] = p15.onReturnToGalleryCallback,
			["size"] = v_u_8.Medium
		})
	else
		v38 = nil
	end
	v37.ReturnToGalleryButton = v38
	v22.SizeConstraint = v34(v35, v36, v37)
	return v19(v20, v21, v22)
end