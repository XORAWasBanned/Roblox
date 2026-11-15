-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalNotice.InternalNotice
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.CloseAffordance)
local v_u_5 = require(v1.Enums.CloseAffordanceVariant)
local v_u_6 = require(v1.Components.Icon)
local v_u_7 = require(v1.Enums.InputSize)
local v_u_8 = require(v1.Enums.StateLayerAffordance)
local v_u_9 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Utility.escapeRichText)
local v_u_12 = require(script.Parent.useInternalNoticeLayout)
local v_u_13 = require(script.Parent.useInternalNoticeVariantsProps)
local v_u_14 = require(v1.Providers.Style.useTokens)
local v_u_15 = require(v1.Utility.withCommonProps)
return v_u_3.memo(v_u_3.forwardRef(function(p16, p17) -- name: InternalNotice
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_12, (copy) v_u_13, (copy) v_u_6, (copy) v_u_10, (copy) v_u_9, (copy) v_u_11, (copy) v_u_8, (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_15
	local v18 = p16.testId or "--foundation-internal-notice"
	local v_u_19 = v_u_14().Size.Size_600
	local v20 = UDim2.fromOffset(0, v_u_19)
	local v21 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_19
		return {
			["MinSize"] = Vector2.new(0, v_u_19)
		}
	end, { v_u_19 })
	local v22 = v_u_12(p16.onAbsoluteSizeChanged)
	local v23 = v22.isStacked
	local v24 = v_u_13(p16.variantProps, v23, p16.truncation == true)
	local v25 = p16.icon
	local v26
	if typeof(v25) == "string" then
		v26 = {
			["name"] = nil,
			["variant"] = nil,
			["name"] = p16.icon
		}
	else
		v26 = p16.icon
	end
	local v27
	if v26 then
		v27 = v_u_3.createElement(v_u_6, {
			["name"] = nil,
			["variant"] = nil,
			["size"] = nil,
			["style"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["name"] = v26.name,
			["variant"] = v26.variant,
			["size"] = v24.icon.size,
			["style"] = v24.icon.style,
			["testId"] = ("%*--icon"):format(v18)
		})
	else
		v27 = nil
	end
	local v28
	if v27 then
		v28 = v_u_3.createElement(v_u_10, {
			["tag"] = "col align-y-center auto-x",
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["Size"] = v20
		}, {
			["Icon"] = v27
		})
	else
		v28 = nil
	end
	local v29 = v_u_3.createElement(v_u_9, {
		["Text"] = nil,
		["tag"] = nil,
		["padding"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["Text"] = p16.text,
		["tag"] = v24.message.tag,
		["padding"] = v24.message.padding,
		["testId"] = ("%*--message"):format(v18)
	})
	local v30
	if p16.link then
		v30 = v_u_3.createElement(v_u_9, {
			["Text"] = nil,
			["RichText"] = true,
			["tag"] = nil,
			["padding"] = nil,
			["sizeConstraint"] = nil,
			["stateLayer"] = nil,
			["onActivated"] = nil,
			["LayoutOrder"] = nil,
			["testId"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["Text"] = ("<u>%*</u>"):format((v_u_11(p16.link.text))),
			["tag"] = v24.link.tag,
			["padding"] = v24.link.padding,
			["sizeConstraint"] = v22.stackedLinkConstraint,
			["stateLayer"] = {
				["affordance"] = v_u_8.None
			},
			["onActivated"] = p16.link.onActivated,
			["LayoutOrder"] = v23 and 3 or 2,
			["testId"] = ("%*--link"):format(v18),
			["onAbsoluteSizeChanged"] = v22.measureInlineLink
		})
	else
		v30 = nil
	end
	local v31
	if p16.onClose then
		v31 = v_u_3.createElement(v_u_10, {
			["tag"] = "col align-y-center auto-x",
			["Size"] = nil,
			["LayoutOrder"] = 3,
			["Size"] = v20
		}, {
			["Close"] = v_u_3.createElement(v_u_4, {
				["onActivated"] = nil,
				["size"] = nil,
				["variant"] = nil,
				["hasPadding"] = false,
				["LayoutOrder"] = 1,
				["testId"] = nil,
				["onActivated"] = p16.onClose,
				["size"] = v_u_7.Small,
				["variant"] = v_u_5.Utility,
				["testId"] = ("%*--close"):format(v18)
			})
		})
	else
		v31 = nil
	end
	local v32 = v24.container
	local v33 = v_u_15
	local v34 = {}
	local v35
	if v32 then
		v35 = v32.tag
	else
		v35 = nil
	end
	v34.tag = v35
	local v36
	if v32 then
		v36 = v32.backgroundStyle
	else
		v36 = nil
	end
	v34.backgroundStyle = v36
	v34.ref = p17
	local v37 = v33(p16, v34)
	v37.onAbsoluteSizeChanged = v22.onNoticeAbsoluteSizeChanged
	local v38 = v_u_3.createElement
	local v39 = v_u_10
	local v40 = {
		["tag"] = v24.content.tag,
		["padding"] = v24.content.padding,
		["LayoutOrder"] = v24.border and 2 or 1
	}
	local v41
	if v23 then
		v41 = {
			["Icon"] = v28,
			["Stack"] = v_u_3.createElement(v_u_10, {
				["LayoutOrder"] = 2,
				["tag"] = nil,
				["sizeConstraint"] = nil,
				["onAbsoluteSizeChanged"] = nil,
				["testId"] = nil,
				["tag"] = v24.stack.tag,
				["sizeConstraint"] = v21,
				["onAbsoluteSizeChanged"] = v22.onStackedColumnAbsoluteSizeChanged,
				["testId"] = ("%*--stack"):format(v18)
			}, {
				["Message"] = v29,
				["Link"] = v30
			}),
			["Close"] = v31
		}
	else
		v41 = {
			["Leading"] = v_u_3.createElement(v_u_10, {
				["tag"] = nil,
				["sizeConstraint"] = nil,
				["LayoutOrder"] = 1,
				["testId"] = nil,
				["tag"] = v24.leading.tag,
				["sizeConstraint"] = v21,
				["testId"] = ("%*--leading"):format(v18)
			}, {
				["Icon"] = v28,
				["Message"] = v29
			}),
			["Link"] = v30,
			["Close"] = v31
		}
	end
	local v42 = v38(v39, v40, v41)
	return v_u_3.createElement(v_u_10, v37, v24.border and {
		["TopBorder"] = v_u_3.createElement(v_u_10, {
			["Size"] = nil,
			["backgroundStyle"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Size"] = v24.border.Size,
			["backgroundStyle"] = v24.border.backgroundStyle,
			["testId"] = ("%*--top-border"):format(v18)
		}),
		["Main"] = v42,
		["BottomBorder"] = v_u_3.createElement(v_u_10, {
			["Size"] = nil,
			["backgroundStyle"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["Size"] = v24.border.Size,
			["backgroundStyle"] = v24.border.backgroundStyle,
			["testId"] = ("%*--bottom-border"):format(v18)
		})
	} or {
		["Main"] = v42
	})
end))