-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.FeedbackAlert.FeedbackAlert
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils)
local v_u_5 = require(v1.Components.AlertActions)
local v_u_6 = require(v1.Components.AlertActions.AlertConstants)
require(v1.Enums.AlertSeverity)
local v7 = require(v2.BuilderIcons)
local v_u_8 = require(v1.Components.CloseAffordance)
local v_u_9 = require(v1.Enums.CloseAffordanceVariant)
local v_u_10 = require(v1.Enums.ControlState)
local v_u_11 = require(v1.Components.Icon)
local v_u_12 = require(v1.Enums.IconSize)
local v_u_13 = require(v1.Enums.InputSize)
local v_u_14 = require(v1.Enums.StateLayerAffordance)
local v_u_15 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_16 = require(v1.Components.View)
local v_u_17 = require(v1.Utility.escapeRichText)
local v_u_18 = require(v1.Providers.Style.useTokens)
local v_u_19 = require(v1.Utility.withCommonProps)
local v_u_20 = require(v1.Utility.withDefaults)
local v_u_21 = v7.IconVariant
local v_u_22 = require(script.Parent.useFeedbackAlertVariants)
local v_u_23 = {
	["testId"] = "--foundation-feedback-alert"
}
return v_u_3.memo(v_u_3.forwardRef(function(p24, p25) -- name: FeedbackAlert
	-- upvalues: (copy) v_u_20, (copy) v_u_23, (copy) v_u_18, (copy) v_u_22, (copy) v_u_4, (copy) v_u_17, (copy) v_u_3, (copy) v_u_10, (copy) v_u_16, (copy) v_u_19, (copy) v_u_11, (copy) v_u_6, (copy) v_u_12, (copy) v_u_21, (copy) v_u_15, (copy) v_u_14, (copy) v_u_8, (copy) v_u_13, (copy) v_u_9, (copy) v_u_5
	local v26 = v_u_20(p24, v_u_23)
	local v27 = v_u_22(v_u_18(), v26.severity)
	local v28 = v_u_4.useComposedRef(p25)
	local v29
	if v26.link then
		v29 = v_u_17(v26.link.text)
	else
		v29 = nil
	end
	local v30, v_u_31 = v_u_3.useState(false)
	local v33 = v_u_3.useCallback(function(p32)
		-- upvalues: (copy) v_u_31, (ref) v_u_10
		v_u_31(p32 == v_u_10.Hover)
	end, {})
	local v34 = v_u_3.createElement
	local v35 = v_u_16
	local v36 = v_u_19(v26, {
		["tag"] = v27.container.tag,
		["stroke"] = v27.stroke,
		["backgroundStyle"] = v27.backgroundStyle,
		["ref"] = v28
	})
	local v37 = {}
	local v38 = v_u_3.createElement
	local v39 = v_u_16
	local v40 = {
		["LayoutOrder"] = 1,
		["tag"] = nil,
		["testId"] = nil,
		["tag"] = v27.headerRow.tag,
		["testId"] = ("%*--header"):format(v26.testId)
	}
	local v41 = {
		["Icon"] = v_u_3.createElement(v_u_11, {
			["LayoutOrder"] = 1,
			["name"] = nil,
			["size"] = nil,
			["variant"] = nil,
			["style"] = nil,
			["testId"] = nil,
			["name"] = v_u_6.SEVERITY_TO_ICON[v26.severity],
			["size"] = v_u_12.Large,
			["variant"] = v_u_21.Filled,
			["style"] = v27.icon.style,
			["testId"] = ("%*--icon"):format(v26.testId)
		})
	}
	local v42 = v_u_3.createElement
	local v43 = v_u_16
	local v44 = {
		["LayoutOrder"] = 2,
		["tag"] = "row align-y-center fill gap-xsmall auto-y",
		["testId"] = nil,
		["testId"] = ("%*--content"):format(v26.testId)
	}
	local v45 = {
		["Title"] = v_u_3.createElement(v_u_15, {
			["Text"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = v26.title,
			["tag"] = v27.title.tag,
			["testId"] = ("%*--title"):format(v26.testId)
		})
	}
	local v46
	if v26.subtitle then
		v46 = v_u_3.createElement(v_u_15, {
			["Text"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Text"] = v26.subtitle,
			["tag"] = v27.subtitle.tag,
			["testId"] = ("%*--subtitle"):format(v26.testId)
		})
	else
		v46 = nil
	end
	v45.Subtitle = v46
	local v47
	if v26.link then
		v47 = v_u_3.createElement(v_u_15, {
			["Text"] = "\194\183",
			["tag"] = "auto-xy text-body-medium content-default",
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["testId"] = ("%*--separator"):format(v26.testId)
		})
	else
		v47 = nil
	end
	v45.Separator = v47
	local v48
	if v26.link then
		local v49 = v_u_3.createElement
		local v50 = v_u_15
		local v51 = {
			["Text"] = nil,
			["RichText"] = true,
			["tag"] = nil,
			["LayoutOrder"] = 4,
			["stateLayer"] = nil,
			["onStateChanged"] = nil,
			["onActivated"] = nil,
			["testId"] = nil
		}
		if v30 then
			v29 = ("<u>%*</u>"):format(v29)
		end
		v51.Text = v29
		v51.tag = v27.link.tag
		v51.stateLayer = {
			["affordance"] = v_u_14.None
		}
		v51.onStateChanged = v33
		v51.onActivated = v26.link.onActivated
		v51.testId = ("%*--link"):format(v26.testId)
		v48 = v49(v50, v51)
	else
		v48 = nil
	end
	v45.Link = v48
	v41.Content = v42(v43, v44, v45)
	local v52
	if v26.onClose == nil then
		v52 = nil
	else
		v52 = v_u_3.createElement(v_u_8, {
			["onActivated"] = nil,
			["size"] = nil,
			["variant"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["onActivated"] = v26.onClose,
			["size"] = v_u_13.XSmall,
			["variant"] = v_u_9.Utility,
			["testId"] = ("%*--close"):format(v26.testId)
		})
	end
	v41.Close = v52
	v37.HeaderRow = v38(v39, v40, v41)
	local v53
	if v26.description then
		v53 = v_u_3.createElement(v_u_15, {
			["Text"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Text"] = v26.description,
			["tag"] = v27.description.tag,
			["testId"] = ("%*--description"):format(v26.testId)
		})
	else
		v53 = nil
	end
	v37.Description = v53
	v37.Actions = v_u_3.createElement(v_u_5, {
		["actions"] = nil,
		["testId"] = nil,
		["LayoutOrder"] = 3,
		["actions"] = v26.actions,
		["testId"] = ("%*--actions"):format(v26.testId)
	})
	return v34(v35, v36, v37)
end))