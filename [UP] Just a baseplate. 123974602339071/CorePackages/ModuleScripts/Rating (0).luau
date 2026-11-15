-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Rating.Rating
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v5 = require(v1.Enums.ChipSize)
local v_u_6 = require(v1.Components.Divider)
local v_u_7 = require(v1.Components.Icon)
local v_u_8 = require(v1.Enums.Orientation)
local v_u_9 = require(v1.Enums.RatingValue)
local v_u_10 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_11 = require(v1.Components.View)
local v_u_12 = require(script.Parent.useRatingVariants)
local v_u_13 = require(v1.Providers.Style.useTokens)
local v_u_14 = require(v1.Utility.withCommonProps)
local v_u_15 = require(v1.Utility.withDefaults)
local v_u_16 = v3.Icon
local v_u_17 = v3.IconVariant
local v_u_18 = {
	["size"] = nil,
	["value"] = nil,
	["Selectable"] = true,
	["testId"] = "--foundation-rating",
	["size"] = v5.Medium,
	["value"] = v_u_9.None
}
return v_u_4.memo(v_u_4.forwardRef(function(p19, p20) -- name: Rating
	-- upvalues: (copy) v_u_15, (copy) v_u_18, (copy) v_u_13, (copy) v_u_12, (copy) v_u_4, (copy) v_u_9, (copy) v_u_11, (copy) v_u_14, (copy) v_u_7, (copy) v_u_16, (copy) v_u_17, (copy) v_u_10, (copy) v_u_6, (copy) v_u_8
	local v21 = v_u_15(p19, v_u_18)
	local v_u_22 = v_u_13()
	local v23 = v_u_12(v_u_22, v21.size)
	local v24 = v_u_4.useRef(nil)
	local v25 = v_u_4.useRef(nil)
	local v28 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_22
		local v26 = v_u_22.Stroke.Thicker
		local v27 = math.floor(v26)
		return {
			["radius"] = UDim.new(0, v_u_22.Radius.Circle),
			["offset"] = v27 * 2,
			["borderWidth"] = v27
		}
	end, { v_u_22 })
	local v29 = v21.value == v_u_9.ThumbUp
	local v30 = v21.value == v_u_9.ThumbDown
	local v31 = v_u_4.createElement
	local v32 = v_u_11
	local v33 = v_u_14(v21, {
		["tag"] = v23.container.tag,
		["backgroundStyle"] = v23.container.backgroundStyle,
		["ref"] = p20
	})
	local v34 = {}
	local v35 = v_u_4.createElement
	local v36 = v_u_11
	local v37 = {
		["tag"] = nil,
		["ref"] = nil,
		["LayoutOrder"] = 1,
		["onActivated"] = nil,
		["cursor"] = nil,
		["selection"] = nil,
		["testId"] = nil,
		["tag"] = v23.thumbUpSegment.tag,
		["ref"] = v24,
		["onActivated"] = v21.onThumbUp,
		["cursor"] = v28,
		["selection"] = {
			["Selectable"] = v21.Selectable,
			["NextSelectionUp"] = v21.NextSelectionUp,
			["NextSelectionDown"] = v21.NextSelectionDown,
			["NextSelectionLeft"] = v21.NextSelectionLeft,
			["NextSelectionRight"] = v25
		},
		["testId"] = ("%*--thumb-up"):format(v21.testId)
	}
	local v38 = {}
	local v39 = v_u_4.createElement
	local v40 = v_u_11
	local v41 = {
		["tag"] = nil,
		["LayoutOrder"] = 1,
		["tag"] = v23.thumbUpIcon.tag
	}
	local v42 = {}
	local v43 = v_u_4.createElement
	local v44 = v_u_7
	local v45 = {
		["name"] = v_u_16.ThumbUp
	}
	local v46
	if v29 then
		v46 = v_u_17.Filled
	else
		v46 = v_u_17.Regular
	end
	v45.variant = v46
	v45.size = v23.iconSize
	v45.style = v23.text.contentStyle
	v45.testId = ("%*--thumb-up-icon"):format(v21.testId)
	v42.Icon = v43(v44, v45)
	v38.Icon = v39(v40, v41, v42)
	v38.Text = v_u_4.createElement(v_u_10, {
		["Text"] = nil,
		["textStyle"] = nil,
		["tag"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["Text"] = v21.text,
		["textStyle"] = v23.text.contentStyle,
		["tag"] = v23.text.tag,
		["testId"] = ("%*--text"):format(v21.testId)
	})
	v34.ThumbUp = v35(v36, v37, v38)
	v34.Divider = v_u_4.createElement(v_u_11, {
		["tag"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["tag"] = v23.dividerContainer.tag,
		["testId"] = ("%*--divider"):format(v21.testId)
	}, {
		["Line"] = v_u_4.createElement(v_u_6, {
			["orientation"] = v_u_8.Vertical
		})
	})
	local v47 = v_u_4.createElement
	local v48 = v_u_11
	local v49 = {
		["tag"] = nil,
		["ref"] = nil,
		["LayoutOrder"] = 3,
		["onActivated"] = nil,
		["cursor"] = nil,
		["selection"] = nil,
		["testId"] = nil,
		["tag"] = v23.thumbDownSegment.tag,
		["ref"] = v25,
		["onActivated"] = v21.onThumbDown,
		["cursor"] = v28,
		["selection"] = {
			["Selectable"] = v21.Selectable,
			["NextSelectionUp"] = v21.NextSelectionUp,
			["NextSelectionDown"] = v21.NextSelectionDown,
			["NextSelectionLeft"] = v24,
			["NextSelectionRight"] = v21.NextSelectionRight
		},
		["testId"] = ("%*--thumb-down"):format(v21.testId)
	}
	local v50 = {}
	local v51 = v_u_4.createElement
	local v52 = v_u_11
	local v53 = {
		["tag"] = nil,
		["LayoutOrder"] = 1,
		["tag"] = v23.thumbDownIcon.tag
	}
	local v54 = {}
	local v55 = v_u_4.createElement
	local v56 = v_u_7
	local v57 = {
		["name"] = v_u_16.ThumbDown
	}
	local v58
	if v30 then
		v58 = v_u_17.Filled
	else
		v58 = v_u_17.Regular
	end
	v57.variant = v58
	v57.size = v23.iconSize
	v57.style = v23.text.contentStyle
	v57.testId = ("%*--thumb-down-icon"):format(v21.testId)
	v54.Icon = v55(v56, v57)
	v50.Icon = v51(v52, v53, v54)
	v34.ThumbDown = v47(v48, v49, v50)
	return v31(v32, v33, v34)
end))