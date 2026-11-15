-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Coachmark.Coachmark
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Constants)
local v_u_6 = require(v1.Components.Button)
local v_u_7 = require(v1.Components.ButtonGroup)
local v_u_8 = require(v1.Components.CloseAffordance)
local v_u_9 = require(v1.Enums.CloseAffordanceVariant)
local v10 = require(v1.Enums.ColorNamespace)
local v_u_11 = require(v1.Enums.FillBehavior)
local v_u_12 = require(v1.Utility.Flags)
local v_u_13 = require(v1.Enums.InputSize)
local v_u_14 = require(v1.Utility.Logger)
local v_u_15 = require(v1.Enums.Orientation)
local v_u_16 = require(v1.Components.Popover)
local v17 = require(v1.Enums.PopoverAlign)
local v18 = require(v1.Enums.PopoverSide)
local v_u_19 = require(v1.Providers.Style.PresentationContext)
local v_u_20 = require(v1.Enums.Radius)
local v_u_21 = require(v1.Components.Text)
local v_u_22 = require(v1.Utility.Localization.Translator)
require(v1.Components.Types)
local v_u_23 = require(v1.Components.View)
local v_u_24 = require(v1.Utility.useScaledValue)
local v_u_25 = require(v1.Providers.Style.useTokens)
local v_u_26 = require(v1.Utility.withCommonProps)
local v_u_27 = require(v1.Utility.withDefaults)
local v_u_28 = {
	["isOpen"] = false,
	["align"] = nil,
	["side"] = nil,
	["hasArrow"] = true,
	["actionsFillBehavior"] = nil,
	["testId"] = "--foundation-coachmark",
	["align"] = v17.Start,
	["side"] = v18.Right
}
local v29
if v_u_12.FoundationEducationalTooltipRefresh then
	v29 = v_u_11.Fill
else
	v29 = nil
end
v_u_28.actionsFillBehavior = v29
local v_u_30 = {
	["colorNamespace"] = v10.Inverse
}
return v_u_4.memo(v_u_4.forwardRef(function(p31, p32) -- name: Coachmark
	-- upvalues: (copy) v_u_27, (copy) v_u_28, (copy) v_u_25, (copy) v_u_24, (copy) v_u_12, (copy) v_u_5, (copy) v_u_4, (copy) v_u_14, (copy) v_u_13, (copy) v_u_11, (copy) v_u_3, (copy) v_u_6, (copy) v_u_16, (copy) v_u_26, (copy) v_u_20, (copy) v_u_19, (copy) v_u_30, (copy) v_u_23, (copy) v_u_8, (copy) v_u_9, (copy) v_u_21, (copy) v_u_22, (copy) v_u_7, (copy) v_u_15
	local v_u_33 = v_u_27(p31, v_u_28)
	local v34 = v_u_25()
	local v35 = v_u_24(not v_u_12.FoundationEducationalTooltipRefresh and 320 or v_u_5.TOOLTIP_MAX_WIDTH)
	local v36 = v_u_24(240)
	if v_u_12.FoundationEducationalTooltipMinMediaWidth and not v_u_33.media then
		v36 = v34.Size.Size_3000
	end
	local v37
	if v_u_12.FoundationEducationalTooltipMinMediaWidth then
		v37 = nil
	else
		v37 = v_u_33.onClose and {
			["MaxSize"] = Vector2.new(v35 - v34.Size.Size_1200, (1 / 0))
		} or nil
	end
	local v43 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_33, (ref) v_u_12, (ref) v_u_14, (ref) v_u_13, (ref) v_u_11, (ref) v_u_3, (ref) v_u_4, (ref) v_u_6
		local v38 = {}
		if not v_u_33.actions then
			return v38
		end
		for v39, v40 in v_u_33.actions do
			if not v_u_12.FoundationEducationalTooltipRefresh and v39 > 2 then
				v_u_14:warning((("Coachmark only supports up to %* actions"):format(2)))
				return v38
			end
			if v_u_12.FoundationEducationalTooltipRefresh then
				v38[v39] = v40
			else
				local v41 = {
					["LayoutOrder"] = v39,
					["size"] = v_u_13.Medium,
					["fillBehavior"] = v_u_11.Fill,
					["testId"] = ("%*--action-%*"):format(v_u_33.testId, v39)
				}
				local v42 = v_u_3.union(v40, v41)
				v38["CoachmarkButton" .. v39] = v_u_4.createElement(v_u_6, v42)
			end
		end
		return v38
	end, { v_u_33.actions, v_u_33.testId })
	local v44 = v_u_12.FoundationEducationalTooltipMinMediaWidth and v_u_33.onClose
	if v44 then
		v44 = not v_u_33.media
	end
	local v45
	if v_u_12.FoundationEducationalTooltipBodyOnlyContentLayout and (v_u_33.title == "" and (v_u_33.text ~= nil and (v_u_33.text ~= "" and (v_u_33.media == nil and v_u_33.steps == nil)))) then
		v45 = v_u_33.actions == nil and true or #v_u_33.actions == 0
	else
		v45 = false
	end
	local v46 = v_u_4.createElement
	local v47 = v_u_16.Root
	local v48 = {
		["isOpen"] = v_u_33.isOpen,
		["testId"] = v_u_33.testId
	}
	local v49 = {
		["Anchor"] = v_u_4.createElement(v_u_16.Anchor, v_u_26(v_u_33, {
			["anchorRef"] = v_u_33.anchorRef
		}), v_u_33.children)
	}
	local v50 = v_u_4.createElement
	local v51 = v_u_16.Content
	local v52 = {
		["hasArrow"] = nil,
		["align"] = nil,
		["DO_NOT_USE_hasContentInputSink"] = true,
		["onPressedOutside"] = nil,
		["side"] = nil,
		["radius"] = nil,
		["backgroundStyle"] = nil,
		["selection"] = nil,
		["selectionGroup"] = nil,
		["ref"] = nil,
		["hasArrow"] = v_u_33.hasArrow,
		["align"] = v_u_33.align,
		["onPressedOutside"] = v_u_33.onPressedOutside,
		["side"] = {
			["position"] = v_u_33.side,
			["offset"] = v34.Size.Size_200
		},
		["radius"] = v_u_20.Medium,
		["backgroundStyle"] = v34.Inverse.Surface.Surface_0,
		["selection"] = v_u_33.selection,
		["selectionGroup"] = v_u_33.selectionGroup,
		["ref"] = p32
	}
	local v53 = v_u_4.createElement
	local v54 = v_u_19.Provider
	local v55 = {
		["value"] = v_u_30
	}
	local v56 = v_u_4.createElement
	local v57 = v_u_23
	local v58 = {
		["testId"] = v_u_33.testId,
		["tag"] = v_u_12.FoundationEducationalTooltipRefresh and "col auto-xy" or "col gap-medium auto-xy padding-bottom-medium"
	}
	local v59 = {
		["MaxSize"] = Vector2.new(v35, (1 / 0))
	}
	local v60
	if v_u_12.FoundationEducationalTooltipRefresh then
		v60 = Vector2.new(v36, 0)
	else
		v60 = nil
	end
	v59.MinSize = v60
	v58.sizeConstraint = v59
	local v61 = {}
	local v62
	if v_u_33.onClose then
		v62 = v_u_4.createElement("Folder", {}, {
			["CloseAffordance"] = v_u_4.createElement(v_u_8, {
				["onActivated"] = nil,
				["size"] = nil,
				["variant"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["ZIndex"] = 2,
				["testId"] = nil,
				["onActivated"] = v_u_33.onClose,
				["size"] = v_u_13.Small,
				["variant"] = v_u_9.Utility,
				["Position"] = UDim2.new(1, -v34.Padding.Small, 0, v34.Padding.Small),
				["AnchorPoint"] = Vector2.new(1, 0),
				["testId"] = ("%*--close-affordance"):format(v_u_33.testId)
			})
		})
	else
		v62 = nil
	end
	v61.CloseAffordanceContainer = v62
	local v63
	if v_u_33.media then
		v63 = v_u_4.createElement(v_u_23, {
			["LayoutOrder"] = 1,
			["tag"] = "size-full-0 auto-y"
		}, v_u_33.media)
	else
		v63 = nil
	end
	v61.Media = v63
	local v64 = v_u_4.createElement
	local v65 = v_u_23
	local v66 = {
		["LayoutOrder"] = 2,
		["tag"] = nil,
		["padding"] = nil,
		["sizeConstraint"] = nil
	}
	local v67
	if v_u_12.FoundationEducationalTooltipMinMediaWidth then
		v67 = {
			[v_u_12.FoundationEducationalTooltipRefresh and "col auto-xy" or "col gap-xsmall auto-xy"] = not v_u_12.FoundationEducationalTooltipBodyOnlyContentLayout and true or not v45
		}
		local v68
		if v_u_12.FoundationEducationalTooltipBodyOnlyContentLayout then
			v68 = v45
		else
			v68 = false
		end
		v67["col align-y-center auto-xy"] = v68
		local v69 = v_u_12.FoundationEducationalTooltipRefresh and "padding-medium" or "padding-x-medium padding-bottom-xsmall padding-top-medium"
		local v70 = not v44
		if v70 then
			v70 = not v45
		end
		v67[v69] = v70
	else
		v67 = v_u_12.FoundationEducationalTooltipRefresh and "col auto-xy padding-medium" or "col gap-xsmall auto-xy padding-x-medium padding-bottom-xsmall padding-top-medium"
	end
	v66.tag = v67
	local v71
	if v45 then
		v71 = {
			["top"] = UDim.new(0, v34.Padding.Small),
			["bottom"] = UDim.new(0, v34.Padding.Small),
			["left"] = UDim.new(0, v34.Padding.Medium)
		}
		local v72 = UDim.new
		local v73 = 0
		local v74
		if v44 then
			v74 = v34.Size.Size_1200
		else
			v74 = v34.Padding.Medium
		end
		v71.right = v72(v73, v74)
	elseif v_u_12.FoundationEducationalTooltipMinMediaWidth and v44 then
		v71 = {
			["top"] = UDim.new(0, v34.Padding.Medium)
		}
		local v75 = UDim.new
		local v76 = 0
		local v77
		if v_u_12.FoundationEducationalTooltipRefresh then
			v77 = v34.Padding.Medium
		else
			v77 = v34.Padding.XSmall
		end
		v71.bottom = v75(v76, v77)
		v71.left = UDim.new(0, v34.Padding.Medium)
		v71.right = UDim.new(0, v34.Size.Size_1200)
	else
		v71 = nil
	end
	v66.padding = v71
	v66.sizeConstraint = v45 and {
		["MinSize"] = Vector2.new(0, v34.Size.Size_800)
	} or nil
	local v78 = {}
	local v79
	if v_u_33.steps then
		local v80 = v_u_4.createElement
		local v81 = v_u_21
		local v82 = {
			["LayoutOrder"] = 1,
			["Text"] = nil,
			["tag"] = nil,
			["sizeConstraint"] = nil,
			["testId"] = nil,
			["Text"] = v_u_22:FormatByKey("CommonUI.Controls.Label.PageCount", {
				["current"] = v_u_33.steps.current,
				["total"] = v_u_33.steps.total
			}),
			["tag"] = v_u_12.FoundationEducationalTooltipRefresh and "auto-xy text-caption-medium text-align-x-left text-truncate-end content-inverse-default" or "auto-xy text-label-small text-align-x-left text-truncate-end content-inverse-default"
		}
		local v83
		if v_u_12.FoundationEducationalTooltipMinMediaWidth then
			v83 = nil
		else
			v83 = v37
		end
		v82.sizeConstraint = v83
		v82.testId = ("%*--step-indicator"):format(v_u_33.testId)
		v79 = v80(v81, v82)
	else
		v79 = nil
	end
	v78.StepIndicator = v79
	local v84
	if v_u_33.title == "" then
		v84 = nil
	else
		local v85 = v_u_4.createElement
		local v86 = v_u_21
		local v87 = {
			["LayoutOrder"] = 2,
			["Text"] = nil,
			["tag"] = "auto-xy text-title-large text-align-x-left text-truncate-split content-inverse-emphasis",
			["sizeConstraint"] = nil,
			["testId"] = nil,
			["Text"] = v_u_33.title
		}
		if v_u_12.FoundationEducationalTooltipMinMediaWidth then
			v37 = nil
		end
		v87.sizeConstraint = v37
		v87.testId = ("%*--header"):format(v_u_33.testId)
		v84 = v85(v86, v87)
	end
	v78.Header = v84
	local v88
	if v_u_33.text and v_u_33.text ~= "" then
		local v89 = v_u_4.createElement
		local v90 = v_u_21
		local v91 = {
			["LayoutOrder"] = 3,
			["Text"] = nil,
			["tag"] = nil,
			["padding"] = nil,
			["testId"] = nil,
			["Text"] = v_u_33.text,
			["tag"] = v_u_12.FoundationEducationalTooltipMinMediaWidth and "auto-xy text-body-medium text-wrap text-align-x-left content-inverse-default" or "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-inverse-default"
		}
		local v92
		if v_u_12.FoundationEducationalTooltipRefresh then
			if v_u_12.FoundationEducationalTooltipMinMediaWidth then
				v92 = v_u_33.title ~= "" and {
					["top"] = UDim.new(0, v34.Size.Size_100)
				} or nil
			else
				v92 = {
					["top"] = UDim.new(0, v34.Size.Size_100)
				}
			end
		else
			v92 = nil
		end
		v91.padding = v92
		v91.testId = ("%*--text"):format(v_u_33.testId)
		v88 = v89(v90, v91)
	else
		v88 = nil
	end
	v78.Text = v88
	v61.ContentSection = v64(v65, v66, v78)
	local v93
	if v_u_33.actions and #v_u_33.actions > 0 then
		v93 = v_u_4.createElement(v_u_23, {
			["LayoutOrder"] = 3,
			["tag"] = nil,
			["tag"] = v_u_12.FoundationEducationalTooltipRefresh and "row align-x-right size-full-0 auto-y padding-x-medium padding-bottom-medium" or "row gap-small size-full-0 auto-y padding-x-medium"
		}, v_u_12.FoundationEducationalTooltipRefresh and {
			["ButtonGroup"] = v_u_4.createElement(v_u_7, {
				["buttons"] = nil,
				["fillBehavior"] = nil,
				["maxButtonCount"] = 2,
				["orientation"] = nil,
				["size"] = nil,
				["testId"] = nil,
				["buttons"] = v43,
				["fillBehavior"] = v_u_33.actionsFillBehavior,
				["orientation"] = v_u_15.Horizontal,
				["size"] = v_u_13.Small,
				["testId"] = ("%*--actions"):format(v_u_33.testId)
			})
		} or v43)
	else
		v93 = nil
	end
	v61.Actions = v93
	v49.Content = v50(v51, v52, v53(v54, v55, v56(v57, v58, v61)))
	return v46(v47, v48, v49)
end))