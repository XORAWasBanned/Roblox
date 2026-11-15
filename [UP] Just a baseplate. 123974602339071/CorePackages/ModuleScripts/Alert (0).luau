-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Alert.Alert
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Components.AlertActions.AlertConstants)
local v_u_6 = require(v1.Enums.AlertSeverity)
local v_u_7 = require(v1.Enums.AlertVariant)
local v8 = require(v1.Enums.Breakpoint)
local v9 = require(v1.Utility.Responsive.BreakpointConfig)
local v_u_10 = require(v1.Components.ButtonGroup)
local v_u_11 = require(v1.Enums.ButtonVariant)
local v_u_12 = require(v1.Components.CloseAffordance)
local v_u_13 = require(v1.Enums.CloseAffordanceVariant)
local v_u_14 = require(v1.Utility.Flags)
local v_u_15 = require(v1.Components.Icon)
local v_u_16 = require(v1.Enums.IconSize)
local v_u_17 = require(v1.Enums.InputSize)
local v_u_18 = require(v1.Components.Link)
local v_u_19 = require(v1.Enums.StateLayerAffordance)
local v_u_20 = require(v1.Components.Text)
local v_u_21 = require(v1.Enums.TextOverflow)
require(v1.Components.Types)
local v_u_22 = require(v1.Components.View)
local v_u_23 = require(v1.Utility.escapeRichText)
local v_u_24 = require(v1.Utility.isBuilderIcon)
local v_u_25 = require(v1.Providers.Style.useTokens)
local v_u_26 = require(v1.Utility.withCommonProps)
local v_u_27 = require(v1.Utility.withDefaults)
local v_u_28 = require(script.Parent.useAlertVariants)
local v_u_29 = v3.IconVariant
local v_u_30 = {
	["variant"] = nil,
	["severity"] = nil,
	["testId"] = "--foundation-alert",
	["variant"] = v_u_7.Feedback,
	["severity"] = v_u_6.Info
}
local v_u_31 = {
	[v_u_7.Standard] = v_u_7.Feedback,
	[v_u_7.Emphasis] = v_u_7.Feedback
}
local v_u_32 = v9.widths[v8.XSmall]
local function v_u_41(p33) -- name: WrappingRichText
	-- upvalues: (copy) v_u_4, (copy) v_u_20, (copy) v_u_22
	local v34, v_u_35 = v_u_4.useState(0)
	local v_u_36 = p33.alertWidth
	local v39 = v_u_4.useCallback(function(p37)
		-- upvalues: (copy) v_u_36, (copy) v_u_35
		local v38 = p37.AbsoluteSize.X
		if v_u_36 <= 0 or v38 <= v_u_36 then
			v_u_35(v38)
		end
	end, { v_u_36 })
	local v40 = {
		[("Label-%*"):format((math.floor(v34)))] = v_u_4.createElement(v_u_20, {
			["Text"] = nil,
			["RichText"] = true,
			["tag"] = nil,
			["padding"] = nil,
			["sizeConstraint"] = nil,
			["stateLayer"] = nil,
			["onActivated"] = nil,
			["testId"] = nil,
			["Text"] = p33.text,
			["tag"] = {
				["size-full-0"] = true,
				[p33.slot.tag] = true
			},
			["padding"] = p33.slot.padding,
			["sizeConstraint"] = v34 > 0 and {
				["MaxSize"] = Vector2.new(v34, (1 / 0))
			} or nil,
			["stateLayer"] = p33.stateLayer,
			["onActivated"] = p33.onActivated,
			["testId"] = p33.testId
		})
	}
	return v_u_4.createElement(v_u_22, {
		["tag"] = p33.slot.tag,
		["LayoutOrder"] = p33.LayoutOrder,
		["onAbsoluteSizeChanged"] = v39
	}, v40)
end
return v_u_4.memo(v_u_4.forwardRef(function(p42, p43) -- name: Alert
	-- upvalues: (copy) v_u_27, (copy) v_u_30, (copy) v_u_25, (copy) v_u_31, (copy) v_u_4, (copy) v_u_32, (copy) v_u_14, (copy) v_u_28, (copy) v_u_11, (copy) v_u_5, (copy) v_u_29, (copy) v_u_6, (copy) v_u_24, (copy) v_u_15, (copy) v_u_16, (copy) v_u_22, (copy) v_u_41, (copy) v_u_20, (copy) v_u_18, (copy) v_u_21, (copy) v_u_23, (copy) v_u_19, (copy) v_u_10, (copy) v_u_17, (copy) v_u_12, (copy) v_u_13, (copy) v_u_26, (copy) v_u_7
	local v_u_44 = v_u_27(p42, v_u_30)
	local v45 = v_u_25()
	local v46 = v_u_31[v_u_44.variant] or v_u_44.variant
	local v47, v_u_48 = v_u_4.useState(Vector2.zero)
	local v50 = v_u_4.useCallback(function(p49)
		-- upvalues: (copy) v_u_48, (copy) v_u_44
		v_u_48(p49.AbsoluteSize)
		if v_u_44.onAbsoluteSizeChanged then
			v_u_44.onAbsoluteSizeChanged(p49)
		end
	end, { v_u_44.onAbsoluteSizeChanged })
	local v51, v_u_52 = v_u_4.useState(0)
	local v54 = v_u_4.useCallback(function(p53)
		-- upvalues: (copy) v_u_52
		v_u_52(p53.AbsoluteSize.X)
	end, {})
	local v55 = v_u_44.link
	local v56 = v_u_44.actions
	local v57
	if v55 then
		v57 = v55.text
	else
		v57 = not v56 and "" or ("%*|%*"):format(v56.primary.text, not v56.secondary and "" or v56.secondary.text)
	end
	local v_u_58 = v_u_4.useRef(false)
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_58, (copy) v_u_52
		if v_u_58.current then
			v_u_52(0)
		end
		v_u_58.current = true
	end, { v57 })
	local v59
	if v47.X > 0 then
		v59 = v47.X <= v_u_32
	else
		v59 = false
	end
	local v60 = v47.X * (v_u_14.FoundationAlertStackTrailingOnOverflow and 0.3 or 0.4)
	if v_u_14.FoundationAlertStackTrailingOnOverflow then
		if not v59 then
			if v60 > 0 then
				v59 = v60 < v51
			else
				v59 = false
			end
		end
	elseif not v59 then
		if v_u_44.actions == nil or v60 <= 0 then
			v59 = false
		else
			v59 = v60 < v51
		end
	end
	local v61 = v_u_28(v45, v_u_44.severity, v46, v59)
	local v64 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_44, (ref) v_u_11
		if not v_u_44.actions then
			return nil
		end
		local v62 = {
			{
				["text"] = v_u_44.actions.primary.text,
				["onActivated"] = v_u_44.actions.primary.onActivated,
				["variant"] = v_u_11.Standard
			}
		}
		if v_u_44.actions.secondary then
			local v63 = {
				["text"] = v_u_44.actions.secondary.text,
				["onActivated"] = v_u_44.actions.secondary.onActivated,
				["variant"] = v_u_11.Utility
			}
			table.insert(v62, v63)
		end
		return v62
	end, { v_u_44.actions })
	local v65 = v_u_5.SEVERITY_TO_ICON[v_u_44.severity]
	local v66 = v_u_29.Filled
	local v67 = v61.iconBackplate
	local v68 = v_u_44.icon
	local v69
	if v68 == nil or v_u_44.severity ~= v_u_6.Info then
		v69 = v65
	else
		if typeof(v68) == "string" then
			v69 = v68
		else
			v69 = v68.name
		end
		if v_u_24(v69) then
			if typeof(v68) == "table" and v68.variant then
				v66 = v68.variant
			else
				v66 = v_u_29.Filled
			end
			v67 = nil
		else
			v69 = v65
		end
	end
	local v70 = v_u_4.createElement(v_u_15, {
		["name"] = nil,
		["size"] = nil,
		["variant"] = nil,
		["style"] = nil,
		["LayoutOrder"] = 2,
		["ZIndex"] = 2,
		["testId"] = nil,
		["name"] = v69,
		["size"] = v_u_16.Medium,
		["variant"] = v66,
		["style"] = v61.icon.style,
		["testId"] = ("%*--icon"):format(v_u_44.testId)
	})
	local v71 = v_u_4.createElement
	local v72 = v_u_22
	local v73 = {
		["tag"] = "align-y-center size-0-800 auto-x",
		["LayoutOrder"] = 1
	}
	local v74 = {}
	if v67 then
		v70 = v_u_4.createElement(v_u_22, {
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["Size"] = v61.iconFrame.Size
		}, {
			["Backplate"] = v_u_4.createElement(v_u_22, {
				["Size"] = nil,
				["Position"] = nil,
				["tag"] = nil,
				["backgroundStyle"] = nil,
				["LayoutOrder"] = 1,
				["ZIndex"] = 1,
				["testId"] = nil,
				["Size"] = v67.Size,
				["Position"] = v67.Position,
				["tag"] = v67.tag,
				["backgroundStyle"] = v67.backgroundStyle,
				["testId"] = ("%*--icon-backplate"):format(v_u_44.testId)
			}),
			["Icon"] = v70
		})
	end
	v74.Content = v70
	local v75 = v71(v72, v73, v74)
	local v76
	if v_u_44.richText then
		v76 = v_u_4.createElement(v_u_41, {
			["slot"] = nil,
			["text"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["alertWidth"] = nil,
			["slot"] = v61.message,
			["text"] = v_u_44.text,
			["testId"] = ("%*--message"):format(v_u_44.testId),
			["alertWidth"] = v47.X
		})
	else
		v76 = v_u_4.createElement(v_u_20, {
			["Text"] = nil,
			["tag"] = nil,
			["padding"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Text"] = v_u_44.text,
			["tag"] = v61.message.tag,
			["padding"] = v61.message.padding,
			["testId"] = ("%*--message"):format(v_u_44.testId)
		})
	end
	if v59 then
		v54 = nil
	end
	local v77
	if v_u_44.link and v_u_14.FoundationAlertUseLink then
		local v78 = v_u_4.createElement
		local v79 = v_u_22
		local v80 = {
			["tag"] = nil,
			["padding"] = nil,
			["LayoutOrder"] = 3,
			["onAbsoluteSizeChanged"] = nil,
			["tag"] = v61.linkContainer.tag,
			["padding"] = v61.link.padding,
			["onAbsoluteSizeChanged"] = v54
		}
		local v81 = {}
		local v82 = v_u_4.createElement
		local v83 = v_u_18
		local v84 = {
			["text"] = nil,
			["onActivated"] = nil,
			["hasUnderline"] = true,
			["textOverflow"] = nil,
			["testId"] = nil,
			["text"] = v_u_44.link.text,
			["onActivated"] = v_u_44.link.onActivated
		}
		local v85
		if v59 then
			v85 = v_u_21.Wrap
		else
			v85 = v_u_21.None
		end
		v84.textOverflow = v85
		v84.testId = ("%*--link"):format(v_u_44.testId)
		v81.Link = v82(v83, v84)
		v77 = v78(v79, v80, v81)
	elseif v_u_44.link then
		if v59 and v_u_14.FoundationAlertLinkWrap then
			v77 = v_u_4.createElement(v_u_41, {
				["slot"] = nil,
				["text"] = nil,
				["LayoutOrder"] = 3,
				["testId"] = nil,
				["alertWidth"] = nil,
				["onActivated"] = nil,
				["stateLayer"] = nil,
				["slot"] = v61.link,
				["text"] = ("<u>%*</u>"):format((v_u_23(v_u_44.link.text))),
				["testId"] = ("%*--link"):format(v_u_44.testId),
				["alertWidth"] = v47.X,
				["onActivated"] = v_u_44.link.onActivated,
				["stateLayer"] = {
					["affordance"] = v_u_19.None
				}
			})
		else
			local v86 = v_u_4.createElement
			local v87 = v_u_20
			local v88 = {
				["Text"] = nil,
				["RichText"] = true,
				["tag"] = nil,
				["padding"] = nil,
				["sizeConstraint"] = nil,
				["stateLayer"] = nil,
				["onActivated"] = nil,
				["LayoutOrder"] = 3,
				["testId"] = nil,
				["onAbsoluteSizeChanged"] = nil,
				["Text"] = ("<u>%*</u>"):format((v_u_23(v_u_44.link.text))),
				["tag"] = v61.link.tag,
				["padding"] = v61.link.padding
			}
			local v89
			if v_u_14.FoundationAlertStackTrailingOnOverflow then
				v89 = nil
			else
				v89 = not v59 and v60 > 0 and {
					["MaxSize"] = Vector2.new(v60, (1 / 0))
				} or nil
			end
			v88.sizeConstraint = v89
			v88.stateLayer = {
				["affordance"] = v_u_19.None
			}
			v88.onActivated = v_u_44.link.onActivated
			v88.testId = ("%*--link"):format(v_u_44.testId)
			v88.onAbsoluteSizeChanged = v54
			v77 = v86(v87, v88)
		end
	elseif v64 then
		v77 = v_u_4.createElement(v_u_10, {
			["buttons"] = nil,
			["size"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["buttons"] = v64,
			["size"] = v_u_17.Small,
			["testId"] = ("%*--actions"):format(v_u_44.testId),
			["onAbsoluteSizeChanged"] = v54
		})
	else
		v77 = nil
	end
	local v90
	if v_u_44.onClose then
		v90 = v_u_4.createElement(v_u_12, {
			["onActivated"] = nil,
			["size"] = nil,
			["variant"] = nil,
			["LayoutOrder"] = 4,
			["testId"] = nil,
			["onActivated"] = v_u_44.onClose,
			["size"] = v_u_17.Small,
			["variant"] = v_u_13.Utility,
			["testId"] = ("%*--close"):format(v_u_44.testId)
		})
	else
		v90 = nil
	end
	local v91 = v59 and {
		["Icon"] = v75,
		["Stack"] = v_u_4.createElement(v_u_22, {
			["LayoutOrder"] = 2,
			["tag"] = nil,
			["testId"] = nil,
			["tag"] = v61.stack.tag,
			["testId"] = ("%*--stack"):format(v_u_44.testId)
		}, {
			["Message"] = v76,
			["Trailing"] = v77
		}),
		["Close"] = v90
	} or {
		["Icon"] = v75,
		["Message"] = v76,
		["Trailing"] = v77,
		["Close"] = v90
	}
	local v92 = v_u_26(v_u_44, {
		["tag"] = v61.container.tag,
		["backgroundStyle"] = v61.container.backgroundStyle,
		["ref"] = p43
	})
	v92.onAbsoluteSizeChanged = v50
	local v93 = v46 == v_u_7.System and {
		["TopBorder"] = v_u_4.createElement(v_u_22, {
			["Size"] = nil,
			["backgroundStyle"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Size"] = v61.border.Size,
			["backgroundStyle"] = v61.border.backgroundStyle,
			["testId"] = ("%*--top-border"):format(v_u_44.testId)
		}),
		["Main"] = v_u_4.createElement(v_u_22, {
			["tag"] = nil,
			["LayoutOrder"] = 2,
			["tag"] = v61.main.tag
		}, v91),
		["BottomBorder"] = v_u_4.createElement(v_u_22, {
			["Size"] = nil,
			["backgroundStyle"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["Size"] = v61.border.Size,
			["backgroundStyle"] = v61.border.backgroundStyle,
			["testId"] = ("%*--bottom-border"):format(v_u_44.testId)
		})
	} or v91
	return v_u_4.createElement(v_u_22, v92, v93)
end))