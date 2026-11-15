-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Snackbar.Snackbar
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.Dash)
local v_u_5 = require(v2.React)
local v_u_6 = v3.IconVariant
local v_u_7 = require(v1.Components.CloseAffordance)
local v_u_8 = require(v1.Enums.CloseAffordanceVariant)
local v9 = require(v1.Enums.ColorNamespace)
local v_u_10 = require(v1.Components.Icon)
local v_u_11 = require(v1.Enums.InputSize)
local v_u_12 = require(v1.Providers.Style.PresentationContext)
local v_u_13 = require(v1.Enums.StateLayerMode)
local v_u_14 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_15 = require(v1.Components.View)
local v_u_16 = require(v1.Utility.useScaledValue)
local v_u_17 = require(v1.Providers.Style.useTokens)
local v_u_18 = require(v1.Utility.withCommonProps)
local v_u_19 = require(v1.Utility.withDefaults)
local v_u_20 = {
	["testId"] = "--foundation-snackbar"
}
local v_u_21 = {
	["colorNamespace"] = v9.Inverse
}
return v_u_5.memo(v_u_5.forwardRef(function(p22, p23) -- name: Snackbar
	-- upvalues: (copy) v_u_19, (copy) v_u_20, (copy) v_u_17, (copy) v_u_16, (copy) v_u_6, (copy) v_u_5, (copy) v_u_15, (copy) v_u_18, (copy) v_u_12, (copy) v_u_21, (copy) v_u_10, (copy) v_u_4, (copy) v_u_14, (copy) v_u_13, (copy) v_u_7, (copy) v_u_11, (copy) v_u_8
	local v24 = v_u_19(p22, v_u_20)
	local v25 = v_u_17()
	local v26 = v24.icon
	if v26 then
		v26 = v24.icon ~= ""
	end
	local v27
	if v24.action == nil then
		v27 = false
	else
		v27 = v24.action.text ~= ""
	end
	local v28 = v27 or v24.onClose ~= nil
	local v29 = v26 or v28
	local v30 = v_u_16(371)
	local v31 = v_u_16(v26 and 304 or 272)
	local v32 = v24.icon
	local v33
	if typeof(v32) == "string" then
		v33 = {
			["name"] = v24.icon,
			["variant"] = v_u_6.Regular
		}
	else
		v33 = v24.icon
	end
	local v34 = v25.Typography.CaptionLarge.FontSize * v25.Typography.CaptionLarge.LineHeight * 2
	local v35 = v24.action
	local v36 = v_u_5.createElement
	local v37 = v_u_15
	local v38 = v_u_18
	local v39 = {}
	local v40
	if v28 then
		v40 = UDim2.fromOffset(v30, 0)
	else
		v40 = UDim2.fromOffset(0, 0)
	end
	v39.Size = v40
	v39.sizeConstraint = not v28 and {
		["MinSize"] = Vector2.new(0, 0),
		["MaxSize"] = Vector2.new(v31, (1 / 0))
	} or nil
	v39.tag = {
		["row align-y-center gap-large padding-y-xsmall radius-medium bg-system-contrast"] = true,
		["padding-left-large"] = not v29,
		["padding-left-medium"] = v29,
		["auto-xy padding-right-large"] = not v28,
		["auto-y padding-right-small"] = v28
	}
	v39.ref = p23
	local v41 = v38(v24, v39)
	local v42 = v_u_5.createElement
	local v43 = v_u_12.Provider
	local v44 = {
		["value"] = v_u_21
	}
	local v45 = {}
	local v46 = v_u_5.createElement
	local v47 = v_u_15
	local v48 = {
		["LayoutOrder"] = 1,
		["tag"] = "row align-y-center fill gap-small auto-xy padding-y-small",
		["testId"] = nil,
		["testId"] = ("%*--content"):format(v24.testId)
	}
	local v49 = {}
	local v50
	if v26 then
		v50 = v_u_5.createElement(v_u_10, v_u_4.join(v33, {
			["style"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["style"] = v25.Inverse.Content.Emphasis,
			["testId"] = ("%*--icon"):format(v24.testId)
		}))
	else
		v50 = nil
	end
	v49.Icon = v50
	v49.Title = v_u_5.createElement(v_u_14, {
		["LayoutOrder"] = 2,
		["Text"] = nil,
		["sizeConstraint"] = nil,
		["tag"] = "fill auto-xy text-caption-large text-wrap text-align-x-left text-truncate-split content-inverse-emphasis",
		["testId"] = nil,
		["Text"] = v24.title,
		["sizeConstraint"] = {
			["MinSize"] = Vector2.new(0, 0),
			["MaxSize"] = Vector2.new((1 / 0), v34)
		},
		["testId"] = ("%*--title"):format(v24.testId)
	})
	v45.Content = v46(v47, v48, v49)
	local v51
	if v28 then
		local v52 = v_u_5.createElement
		local v53 = v_u_15
		local v54 = {
			["LayoutOrder"] = 2,
			["tag"] = "row align-y-center gap-xsmall auto-xy",
			["testId"] = nil,
			["testId"] = ("%*--buttons"):format(v24.testId)
		}
		local v55 = {}
		local v56
		if v27 then
			v56 = v_u_5.createElement(v_u_14, {
				["LayoutOrder"] = 1,
				["onActivated"] = nil,
				["stateLayer"] = nil,
				["Text"] = nil,
				["tag"] = "auto-xy padding-small text-label-medium radius-medium content-inverse-link",
				["testId"] = nil,
				["onActivated"] = v35.onActivated,
				["stateLayer"] = {
					["mode"] = v_u_13.Inverse
				},
				["Text"] = v35.text,
				["testId"] = ("%*--action"):format(v24.testId)
			})
		else
			v56 = nil
		end
		v55.Action = v56
		local v57
		if v24.onClose == nil then
			v57 = nil
		else
			v57 = v_u_5.createElement(v_u_7, {
				["LayoutOrder"] = 2,
				["onActivated"] = nil,
				["size"] = nil,
				["variant"] = nil,
				["testId"] = nil,
				["onActivated"] = v24.onClose,
				["size"] = v_u_11.Small,
				["variant"] = v_u_8.Utility,
				["testId"] = ("%*--close-affordance"):format(v24.testId)
			})
		end
		v55.CloseAffordance = v57
		v51 = v52(v53, v54, v55)
	else
		v51 = nil
	end
	v45.Buttons = v51
	return v36(v37, v41, v42(v43, v44, v45))
end))