-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Tooltip.Tooltip
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Wrappers).Services.UserInputService
local v_u_5 = require(v1.Utility.Flags)
local v_u_6 = require(v1.Constants)
local v_u_7 = require(v1.Utility.Logger)
local v8 = require(v1.Enums.PopoverAlign)
local v_u_9 = require(v1.Components.Popover.PopoverContext)
local v10 = require(v1.Enums.PopoverSide)
local v_u_11 = require(v1.Enums.Radius)
local v_u_12 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_13 = require(v1.Components.View)
local v_u_14 = require(v1.Utility.useScaledValue)
local v_u_15 = require(v1.Providers.Style.useTokens)
local v_u_16 = require(v1.Utility.withCommonProps)
local v_u_17 = require(v1.Utility.withDefaults)
local v_u_18 = require(v1.Components.Popover)
local v_u_19 = {
	["align"] = nil,
	["side"] = nil,
	["hasArrow"] = true,
	["testId"] = "--foundation-tooltip",
	["align"] = v8.Start,
	["side"] = v10.Right
}
local function v_u_24(p_u_20) -- name: AnchorWrapper
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_7, (copy) v_u_18, (copy) v_u_16
	local v_u_21 = v_u_3.useContext(v_u_9)
	local v_u_22 = v_u_3.useRef(nil)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_21, (ref) v_u_7, (copy) v_u_22, (copy) p_u_20
		if v_u_21.anchor ~= nil then
			local v23 = v_u_21.anchor
			if typeof(v23) ~= "Instance" then
				v_u_7:warning("MeasurableRef cannot be an anchor for the tooltip")
				return
			end
			v_u_22.current = v_u_21.anchor:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: (ref) p_u_20, (ref) v_u_21
				p_u_20.onHover(v_u_21.anchor.GuiState == Enum.GuiState.Hover)
			end)
		end
		return function()
			-- upvalues: (ref) v_u_22
			if v_u_22.current ~= nil then
				v_u_22.current:Disconnect()
			end
		end
	end, { v_u_21.anchor, p_u_20.onHover })
	return v_u_3.createElement(v_u_18.Anchor, v_u_16(p_u_20, {}), p_u_20.children)
end
return v_u_3.memo(function(p25) -- name: Tooltip
	-- upvalues: (copy) v_u_17, (copy) v_u_19, (copy) v_u_3, (copy) v_u_15, (copy) v_u_14, (copy) v_u_6, (copy) v_u_4, (copy) v_u_18, (copy) v_u_24, (copy) v_u_16, (copy) v_u_11, (copy) v_u_5, (copy) v_u_13, (copy) v_u_12
	local v_u_26 = v_u_17(p25, v_u_19)
	local v27, v_u_28 = v_u_3.useState(false)
	local v29 = v_u_15()
	local v30
	if v_u_26.text == nil then
		v30 = false
	else
		v30 = v_u_26.text ~= ""
	end
	local v31 = v_u_14(v_u_6.TOOLTIP_MAX_WIDTH)
	local v32
	if v30 then
		v32 = {
			["top"] = UDim.new(0, v29.Size.Size_150),
			["bottom"] = UDim.new(0, v29.Size.Size_200),
			["left"] = UDim.new(0, v29.Size.Size_200),
			["right"] = UDim.new(0, v29.Size.Size_200)
		}
	else
		v32 = {
			["top"] = UDim.new(0, v29.Size.Size_100),
			["bottom"] = UDim.new(0, v29.Size.Size_150),
			["left"] = UDim.new(0, v29.Size.Size_150),
			["right"] = UDim.new(0, v29.Size.Size_150)
		}
	end
	local v37 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_26, (ref) v_u_4
		if v_u_26.shortcut == nil then
			return nil
		end
		local v33 = ""
		for v34, v35 in v_u_26.shortcut do
			local v36 = v_u_4:GetStringForKeyCode(v35)
			if v36 == nil or v36 == "" then
				v36 = v35.Name
			end
			if v34 > 1 then
				v33 = v33 .. " + "
			end
			v33 = v33 .. v36
		end
		return v33
	end, { v_u_26.shortcut })
	local v38 = v_u_3.createElement
	local v39 = v_u_18.Root
	local v40 = {
		["isOpen"] = v27,
		["testId"] = v_u_26.testId
	}
	local v41 = {
		["Anchor"] = v_u_3.createElement(v_u_24, v_u_16(v_u_26, {
			["onHover"] = v_u_28
		}), v_u_26.children)
	}
	local v42 = v_u_3.createElement
	local v43 = v_u_18.Content
	local v44 = {
		["hasArrow"] = nil,
		["align"] = nil,
		["side"] = nil,
		["radius"] = nil,
		["backgroundStyle"] = nil,
		["selectionGroup"] = false,
		["onPressedOutside"] = nil,
		["hasArrow"] = v_u_26.hasArrow,
		["align"] = v_u_26.align,
		["side"] = {
			["position"] = v_u_26.side,
			["offset"] = v29.Size.Size_200
		},
		["radius"] = v_u_11.Small,
		["backgroundStyle"] = v29.Inverse.Surface.Surface_0,
		["onPressedOutside"] = v_u_5.FoundationTooltipPressedOutside and function()
			-- upvalues: (copy) v_u_28
			v_u_28(false)
		end or nil
	}
	local v45 = v_u_3.createElement
	local v46 = v_u_13
	local v47 = {
		["tag"] = {
			["col gap-xsmall auto-xy"] = true
		},
		["padding"] = v32,
		["sizeConstraint"] = {
			["MaxSize"] = Vector2.new(v31, (1 / 0))
		}
	}
	local v48 = {}
	local v49
	if v_u_26.title == "" and not v_u_26.shortcut then
		v49 = nil
	else
		local v50 = v_u_3.createElement
		local v51 = v_u_13
		local v52 = {
			["LayoutOrder"] = 1,
			["tag"] = "row flex-between gap-small size-full-0 auto-y"
		}
		local v53 = {}
		local v54
		if v_u_26.title == "" then
			v54 = nil
		else
			v54 = v_u_3.createElement(v_u_12, {
				["LayoutOrder"] = 1,
				["Text"] = nil,
				["tag"] = nil,
				["testId"] = nil,
				["Text"] = v_u_26.title,
				["tag"] = {
					["shrink auto-xy text-truncate-end content-inverse-emphasis"] = true,
					["text-caption-medium"] = v30,
					["text-body-small"] = not v30
				},
				["testId"] = ("%*--title"):format(v_u_26.testId)
			})
		end
		v53.Title = v54
		local v55
		if v_u_26.shortcut then
			v55 = v_u_3.createElement(v_u_12, {
				["LayoutOrder"] = 2,
				["Text"] = nil,
				["tag"] = "auto-xy text-body-small content-inverse-muted",
				["testId"] = nil,
				["Text"] = v37,
				["testId"] = ("%*--shortcut"):format(v_u_26.testId)
			})
		else
			v55 = nil
		end
		v53.Shortcut = v55
		v49 = v50(v51, v52, v53)
	end
	v48.Header = v49
	local v56
	if v_u_26.text and v_u_26.text ~= "" then
		v56 = v_u_3.createElement(v_u_12, {
			["LayoutOrder"] = 2,
			["Text"] = nil,
			["tag"] = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
			["testId"] = nil,
			["Text"] = v_u_26.text,
			["testId"] = ("%*--text"):format(v_u_26.testId)
		})
	else
		v56 = nil
	end
	v48.Text = v56
	v41.Content = v42(v43, v44, v45(v46, v47, v48))
	return v38(v39, v40, v41)
end)