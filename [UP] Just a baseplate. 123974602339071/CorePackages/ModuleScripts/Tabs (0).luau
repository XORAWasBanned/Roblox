-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Tabs.Tabs
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Enums.FillBehavior)
local v_u_6 = require(v1.Utility.Flags)
local v_u_7 = require(v1.Enums.InputSize)
local v_u_8 = require(v1.Components.OverflowScrollContainer)
local v_u_9 = require(script.Parent.TabItem)
require(v1.Components.Types)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Providers.Style.useTokens)
local v_u_12 = require(v1.Utility.withCommonProps)
local v_u_13 = require(v1.Utility.withDefaults)
local v_u_14 = require(v1.Utility.useAnimatedHighlight)
local v_u_15 = require(script.Parent.OverflowScrollContainer)
local v_u_16 = {
	["fillBehavior"] = nil,
	["size"] = nil,
	["testId"] = "--foundation-tabs",
	["ZIndex"] = 1,
	["fillBehavior"] = v_u_5.Fill,
	["size"] = v_u_7.Medium
}
return v_u_4.memo(v_u_4.forwardRef(function(p17, p18) -- name: Tabs
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_16, (copy) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_14, (copy) v_u_10, (copy) v_u_12, (copy) v_u_8, (copy) v_u_15, (copy) v_u_7, (copy) v_u_9
	local v_u_19 = v_u_11()
	local v_u_20 = v_u_13(p17, v_u_16)
	local v21, v_u_22 = v_u_4.useState(v_u_20.defaultActiveTabId or v_u_3.get(v_u_20, { 1, "id" }))
	local v_u_24 = v_u_4.useCallback(function(p23)
		-- upvalues: (copy) v_u_20, (copy) v_u_22
		if v_u_20.onActivated then
			v_u_20.onActivated(p23)
		end
		v_u_22(p23)
	end, v_u_6.FoundationTabsStableOnActivated and { v_u_20.onActivated } or nil)
	local v25 = v_u_20.fillBehavior == v_u_5.Fill
	local v_u_26 = v_u_20.activeTabId or v21
	local v28 = v_u_3.find(v_u_20.tabs, function(p27)
		-- upvalues: (copy) v_u_26
		return p27.id == v_u_26
	end)
	local v29 = v_u_4.useRef(nil)
	local v30, v31
	if v_u_6.FoundationUnifiedScrimScrolling then
		local v32, v33 = v_u_4.useBinding(0)
		v30 = v32
		local v_u_34 = v33
		v31 = v_u_4.useCallback(function(p35)
			-- upvalues: (ref) v_u_34
			v_u_34(p35.AbsoluteSize.X)
		end, {})
	else
		v30 = nil
		v31 = nil
	end
	local v_u_36 = v_u_4.useRef({})
	local v_u_39 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_36, (copy) v_u_20, (ref) v_u_4
		local v37 = v_u_36.current
		for _, v38 in v_u_20.tabs do
			if v38.ref then
				v37[v38.id] = v38.ref
			else
				if v37[v38.id] then
					continue
				end
				v37[v38.id] = v_u_4.createRef()
			end
		end
		return v37
	end, { v_u_20.tabs })
	local v40 = v_u_14(v_u_26, p18 or v29, v_u_39, v_u_20.size, v_u_20.fillBehavior)
	local v41 = v40.highlightPosition
	local v42 = v40.highlightWidth
	local v43 = v40.activeItemHeight
	local v44 = v_u_20.size
	local v45 = v_u_4.createElement
	local v46 = v_u_10
	local v48 = v_u_12(v_u_20, {
		["tag"] = v_u_6.FoundationUnifiedScrimScrolling and "auto-y no-clip" or "auto-y clip",
		["Size"] = UDim2.fromScale(1, 0),
		["sizeConstraint"] = v_u_6.FoundationUnifiedScrimScrolling and not v25 and {
			["MaxSize"] = v30:map(function(p47)
				return Vector2.new(p47, (1 / 0))
			end)
		} or nil
	})
	local v49 = {}
	local v50 = v_u_4.createElement
	local v51 = v_u_10
	local v52 = {
		["ref"] = nil,
		["tag"] = "col auto-y",
		["Size"] = nil,
		["ref"] = p18 or v29,
		["Size"] = UDim2.fromScale(1, 0)
	}
	local v53 = {}
	local v54 = v_u_4.createElement
	local v55 = v_u_10
	local v56 = {
		["LayoutOrder"] = 1,
		["tag"] = "auto-y",
		["Size"] = nil,
		["testId"] = nil,
		["Size"] = UDim2.fromScale(1, 0),
		["testId"] = ("%*--wrapper"):format(v_u_20.testId)
	}
	local v57 = {}
	local v58 = v_u_4.createElement
	local v59
	if v_u_6.FoundationUnifiedScrimScrolling then
		v59 = v_u_8
	else
		v59 = v_u_15
	end
	local v60
	if v_u_6.FoundationUnifiedScrimScrolling then
		v60 = {
			["LayoutOrder"] = 1,
			["size"] = nil,
			["scrimBottomInset"] = nil,
			["testId"] = nil,
			["size"] = v_u_20.size,
			["scrimBottomInset"] = v_u_19.Stroke.Thick,
			["testId"] = ("%*--scroll-container"):format(v_u_20.testId)
		}
	else
		v60 = {
			["LayoutOrder"] = 1,
			["size"] = nil,
			["testId"] = nil,
			["size"] = v_u_20.size,
			["testId"] = ("%*--scroll-container"):format(v_u_20.testId)
		}
	end
	local v61 = {}
	local v62 = v_u_4.createElement
	local v63 = v_u_10
	local v64 = {}
	if not v_u_6.FoundationUnifiedScrimScrolling then
		v31 = nil
	end
	v64.onAbsoluteSizeChanged = v31
	local v65
	if v_u_6.FoundationFixTabsFitGap then
		v65 = "row flex-y-fill auto-xy"
	else
		v65 = {
			["row flex-y-fill auto-xy"] = true
		}
		local v66 = not v25
		if v66 then
			v66 = v44 == v_u_7.Small and true or v44 == v_u_7.XSmall
		end
		v65["gap-large"] = v66
	end
	v64.tag = v65
	local v67
	if v25 then
		v67 = UDim2.fromScale(1, 0)
	else
		v67 = nil
	end
	v64.Size = v67
	v64.testId = ("%*--list"):format(v_u_20.testId)
	v61.TabList = v62(v63, v64, v_u_3.map(v_u_20.tabs, function(p68, p69)
		-- upvalues: (ref) v_u_4, (ref) v_u_9, (copy) v_u_26, (copy) v_u_24, (copy) v_u_20, (ref) v_u_39
		local v70 = v_u_4.createElement
		local v71 = v_u_9
		local v72 = {
			["id"] = p68.id,
			["text"] = p68.text,
			["indicator"] = p68.indicator
		}
		local v73 = p68.id
		v72.key = tostring(v73)
		v72.icon = p68.icon
		v72.isActive = p68.id == v_u_26
		v72.onActivated = v_u_24
		v72.LayoutOrder = p69
		v72.fillBehavior = v_u_20.fillBehavior
		v72.size = v_u_20.size
		v72.isDisabled = p68.isDisabled
		v72.testId = ("%*--item-%*"):format(v_u_20.testId, p68.id)
		v72.ref = v_u_39[p68.id]
		return v70(v71, v72)
	end))
	v57.ScrollContainer = v58(v59, v60, v61)
	v57.Border = v_u_4.createElement(v_u_10, {
		["LayoutOrder"] = 2,
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["backgroundStyle"] = nil,
		["testId"] = nil,
		["AnchorPoint"] = Vector2.new(0, 1),
		["Size"] = UDim2.new(1, 0, 0, v_u_19.Stroke.Thick),
		["Position"] = UDim2.fromScale(0, 1),
		["backgroundStyle"] = v_u_19.Color.Stroke.Default,
		["testId"] = ("%*--border"):format(v_u_20.testId)
	})
	v53.Wrapper = v54(v55, v56, v57)
	local v74
	if v28 and v28.content then
		v74 = v_u_4.createElement(v_u_10, {
			["LayoutOrder"] = 2,
			["tag"] = "auto-y",
			["Size"] = nil,
			["testId"] = nil,
			["Size"] = UDim2.fromScale(1, 0),
			["testId"] = ("%*--content"):format(v_u_20.testId)
		}, v28.content)
	else
		v74 = nil
	end
	v53.Content = v74
	v49.Tabs = v50(v51, v52, v53)
	v49.AnimatedBorder = v_u_4.createElement(v_u_10, {
		["LayoutOrder"] = 0,
		["ZIndex"] = nil,
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["backgroundStyle"] = nil,
		["testId"] = nil,
		["ZIndex"] = v_u_20.ZIndex + 1,
		["Size"] = v42:map(function(p75)
			-- upvalues: (copy) v_u_19
			return UDim2.fromOffset(p75, v_u_19.Stroke.Thick)
		end),
		["AnchorPoint"] = Vector2.new(0, 1),
		["Position"] = v_u_4.joinBindings({ v41, v43 }):map(function(p76)
			local v77 = p76[1]
			local v78 = p76[2]
			return UDim2.fromOffset(v77, v78)
		end),
		["backgroundStyle"] = v_u_19.Color.System.Contrast,
		["testId"] = ("%*--animated-border"):format(v_u_20.testId)
	})
	return v45(v46, v48, v49)
end))