-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.SystemBanner.SystemBanner
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils)
local v_u_5 = require(v1.Components.AlertActions)
local v6 = require(v1.Components.AlertActions.AlertConstants)
require(v1.Enums.AlertSeverity)
local v7 = require(v1.Enums.AlertVariant)
local v_u_8 = require(v1.Enums.Breakpoint)
local v9 = require(v2.BuilderIcons)
require(v1.Enums.ButtonVariant)
local v_u_10 = require(v1.Components.CloseAffordance)
local v_u_11 = require(v1.Enums.CloseAffordanceVariant)
local v_u_12 = require(v1.Components.Icon)
local v_u_13 = require(v1.Enums.IconSize)
local v_u_14 = v9.IconVariant
local v_u_15 = require(v1.Enums.InputSize)
local v_u_16 = require(v1.Providers.Style.PresentationContext)
local v_u_17 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_18 = require(v1.Components.View)
local v_u_19 = require(v1.Providers.Responsive.Hooks.useBreakpoint)
local v_u_20 = require(v1.Providers.Style.useTokens)
local v_u_21 = require(v1.Utility.withCommonProps)
local v_u_22 = require(v1.Utility.withDefaults)
local v_u_23 = require(script.Parent.useSystemBannerVariants)
local v_u_24 = v6.SEVERITY_TO_ICON
local v_u_25 = {
	["variant"] = nil,
	["testId"] = "--foundation-system-banner",
	["variant"] = v7.Standard
}
local v_u_26 = {
	[v7.System] = v7.Standard,
	[v7.Feedback] = v7.Standard
}
return v_u_3.memo(v_u_3.forwardRef(function(p27, p28) -- name: SystemBanner
	-- upvalues: (copy) v_u_22, (copy) v_u_25, (copy) v_u_20, (copy) v_u_26, (copy) v_u_23, (copy) v_u_3, (copy) v_u_4, (copy) v_u_19, (copy) v_u_8, (copy) v_u_5, (copy) v_u_18, (copy) v_u_21, (copy) v_u_16, (copy) v_u_12, (copy) v_u_24, (copy) v_u_13, (copy) v_u_14, (copy) v_u_17, (copy) v_u_10, (copy) v_u_15, (copy) v_u_11
	local v_u_29 = v_u_22(p27, v_u_25)
	local v_u_30 = v_u_20()
	local v_u_31 = v_u_23(v_u_30, v_u_26[v_u_29.variant] or v_u_29.variant, v_u_29.severity)
	local v32, v33 = v_u_3.useState(nil)
	local v34 = v_u_4.useComposedRef(p28, v33)
	local v_u_35 = v_u_19(v32) == v_u_8.XSmall
	local v36 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (copy) v_u_29, (copy) v_u_35, (copy) v_u_30
		return v_u_3.createElement(v_u_5, {
			["actions"] = nil,
			["testId"] = nil,
			["LayoutOrder"] = 3,
			["tag"] = nil,
			["padding"] = nil,
			["actions"] = v_u_29.actions,
			["testId"] = ("%*--actions"):format(v_u_29.testId),
			["tag"] = {
				["row gap-small auto-xy"] = true,
				["align-x-left"] = v_u_35,
				["align-x-right"] = not v_u_35
			},
			["padding"] = v_u_35 and {
				["top"] = UDim.new(0, v_u_30.Gap.Small)
			} or nil
		})
	end, {
		v_u_29.actions,
		v_u_29.testId,
		v_u_35,
		v_u_30.Gap.Small
	})
	local v37 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_31
		return {
			["colorNamespace"] = v_u_31.container.colorNamespace
		}
	end, { v_u_31.container.colorNamespace })
	local v38 = v_u_3.createElement
	local v39 = v_u_18
	local v40 = v_u_21
	local v41 = {}
	local v42 = {
		[v_u_31.container.tag] = true,
		["align-y-center"] = v_u_29.title == "" and true or v_u_29.description == nil
	}
	local v43
	if v_u_29.title == "" then
		v43 = false
	else
		v43 = v_u_29.description ~= nil
	end
	v42["align-y-top"] = v43
	v41.tag = v42
	v41.ref = v34
	local v44 = v40(v_u_29, v41)
	local v45 = v_u_3.createElement
	local v46 = v_u_16.Provider
	local v47 = {
		["value"] = v37
	}
	local v48 = {
		["Icon"] = v_u_3.createElement(v_u_12, {
			["LayoutOrder"] = 1,
			["name"] = nil,
			["size"] = nil,
			["variant"] = nil,
			["style"] = nil,
			["testId"] = nil,
			["name"] = v_u_24[v_u_29.severity],
			["size"] = v_u_13.Large,
			["variant"] = v_u_14.Filled,
			["style"] = v_u_31.icon.style,
			["testId"] = ("%*--icon"):format(v_u_29.testId)
		})
	}
	local v49 = v_u_3.createElement
	local v50 = v_u_18
	local v51 = {
		["LayoutOrder"] = 2,
		["tag"] = nil,
		["testId"] = nil,
		["tag"] = {
			["fill auto-xy"] = true,
			["col"] = v_u_35,
			["row"] = not v_u_35
		},
		["testId"] = ("%*--content"):format(v_u_29.testId)
	}
	local v52 = {}
	local v53 = v_u_3.createElement
	local v54 = v_u_18
	local v55 = {
		["LayoutOrder"] = 2,
		["tag"] = "col auto-xy"
	}
	local v56 = {}
	local v57
	if v_u_29.title == "" then
		v57 = nil
	else
		v57 = v_u_3.createElement(v_u_17, {
			["Text"] = nil,
			["textStyle"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = v_u_29.title,
			["textStyle"] = v_u_31.title.style,
			["tag"] = v_u_31.title.tag,
			["testId"] = ("%*--title"):format(v_u_29.testId)
		})
	end
	v56.Title = v57
	local v58
	if v_u_29.description then
		v58 = v_u_3.createElement(v_u_17, {
			["Text"] = nil,
			["textStyle"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Text"] = v_u_29.description,
			["textStyle"] = v_u_31.description.style,
			["tag"] = v_u_31.description.tag,
			["testId"] = ("%*--description"):format(v_u_29.testId)
		})
	else
		v58 = nil
	end
	v56.Description = v58
	local v59
	if v_u_35 then
		v59 = v36
	else
		v59 = nil
	end
	v56.Actions = v59
	v52.Text = v53(v54, v55, v56)
	v48.Content = v49(v50, v51, v52)
	if v_u_35 then
		v36 = nil
	end
	v48.Actions = v36
	local v60
	if v_u_29.onClose == nil then
		v60 = nil
	else
		v60 = v_u_3.createElement(v_u_10, {
			["onActivated"] = nil,
			["size"] = nil,
			["variant"] = nil,
			["LayoutOrder"] = 4,
			["testId"] = nil,
			["onActivated"] = v_u_29.onClose,
			["size"] = v_u_15.Small,
			["variant"] = v_u_11.Utility,
			["testId"] = ("%*--close"):format(v_u_29.testId)
		})
	end
	v48.Close = v60
	return v38(v39, v44, v45(v46, v47, v48))
end))