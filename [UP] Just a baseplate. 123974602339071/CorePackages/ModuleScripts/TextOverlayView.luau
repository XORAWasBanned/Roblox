-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.TextOverlay.TextOverlayView
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v4 = require(v2.MomentsCommon)
local v_u_5 = require(v2.React)
local v_u_6 = v_u_3.Button
local v_u_7 = v_u_3.View
local v_u_8 = v_u_5.useCallback
local v_u_9 = v4.Hooks.useDeviceInsets
local v_u_10 = v_u_3.Hooks.useTokens
local v_u_11 = require(v1.Context.CreationFlowContext)
local v_u_12 = require(v1.Enums.CreationFlowLocalization)
return function(p_u_13)
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_5, (copy) v_u_11, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_3, (copy) v_u_12
	local v14 = v_u_9()
	local v15 = v_u_10()
	local v16 = v_u_5.useContext(v_u_11)
	local v17 = v_u_8(function()
		-- upvalues: (copy) p_u_13
		if p_u_13.onTextOverlayDiscard then
			p_u_13.onTextOverlayDiscard()
		end
	end, { p_u_13.onTextOverlayDiscard })
	local v18 = v_u_8(function()
		-- upvalues: (copy) p_u_13
		if p_u_13.onTextOverlaySave then
			p_u_13.onTextOverlaySave()
		end
	end, { p_u_13.onTextOverlaySave })
	local v19 = v_u_5.createElement
	local v20 = v_u_7
	local v21 = {
		["LayoutOrder"] = nil,
		["tag"] = "align-x-center auto-y align-y-bottom anchor-bottom-center col gap-large position-bottom-center size-full-0",
		["LayoutOrder"] = p_u_13.layoutOrder
	}
	local v22 = {}
	local v23 = v_u_5.createElement
	local v24 = {
		["PaddingTop"] = UDim.new(0, v15.Padding.Small)
	}
	local v25 = UDim.new
	local v26 = v14.bottom
	local v27 = v15.Padding.Small
	v24.PaddingBottom = v25(0, (math.max(v26, v27)))
	local v28 = UDim.new
	local v29 = v14.left
	local v30 = v15.Padding.XLarge
	v24.PaddingLeft = v28(0, (math.max(v29, v30)))
	local v31 = UDim.new
	local v32 = v14.right
	local v33 = v15.Padding.XLarge
	v24.PaddingRight = v31(0, (math.max(v32, v33)))
	v22.Padding = v23("UIPadding", v24)
	local v34 = v_u_5.createElement
	local v35 = v_u_7
	local v36 = {
		["BackButton"] = v_u_5.createElement(v_u_6, {
			["fillBehavior"] = nil,
			["LayoutOrder"] = 1,
			["text"] = nil,
			["variant"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["fillBehavior"] = v_u_3.Enums.FillBehavior.Fit,
			["text"] = v16.getLocalization(v_u_12.GeneralCtaBack),
			["variant"] = v_u_3.Enums.ButtonVariant.Text,
			["onActivated"] = v17,
			["size"] = v_u_3.Enums.InputSize.Medium
		}),
		["DoneButton"] = v_u_5.createElement(v_u_6, {
			["fillBehavior"] = nil,
			["LayoutOrder"] = 2,
			["text"] = nil,
			["variant"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["fillBehavior"] = v_u_3.Enums.FillBehavior.Fit,
			["text"] = v16.getLocalization(v_u_12.GeneralCtaDone),
			["variant"] = v_u_3.Enums.ButtonVariant.Text,
			["onActivated"] = v18,
			["size"] = v_u_3.Enums.InputSize.Medium
		})
	}
	v22.Nav = v34(v35, {
		["LayoutOrder"] = 1,
		["tag"] = "align-x-center align-y-center auto-y gap-small row size-full-0 flex-x-between"
	}, v36)
	return v19(v20, v21, v22)
end