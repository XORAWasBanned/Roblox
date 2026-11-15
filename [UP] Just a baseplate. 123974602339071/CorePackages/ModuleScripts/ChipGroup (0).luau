-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ChipGroup.ChipGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.ChipGroupVariant)
local v_u_5 = require(v1.Utility.Flags)
local v6 = require(v1.Enums.ChipSize)
require(v1.Enums.ChipVariant)
require(v1.Components.Chip.Accessory)
local v_u_7 = require(v1.Enums.Visibility)
local v_u_8 = require(v1.Providers.Style.BackgroundStyleContext).useBackgroundStyle
local v_u_9 = require(v1.Components.Chip)
local v_u_10 = require(v1.Components.OverflowScrollContainer)
local v_u_11 = require(v1.Components.ScrollView)
require(v1.Components.Types)
local v_u_12 = require(v1.Components.View)
local v_u_13 = require(v1.Components.ChipGroup.useChipGroupVariants)
local v_u_14 = require(v1.Components.ChipGroup.useClippingRect)
local v_u_15 = require(v1.Providers.Style.useTokens)
local v_u_16 = require(v1.Utility.withCommonProps)
local v_u_17 = require(v1.Utility.withDefaults)
local v_u_18 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) })
local v_u_19 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 0) })
local v_u_20 = {
	["size"] = nil,
	["variant"] = nil,
	["testId"] = "--foundation-chip-group",
	["size"] = v6.Medium,
	["variant"] = v4.Row
}
local function v_u_27(p21) -- name: Scrim
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_12
	local v22 = v_u_8()
	local v23 = v_u_3.createElement
	local v24 = v_u_12
	local v25 = {
		["LayoutOrder"] = p21.LayoutOrder,
		["Size"] = UDim2.new(0, p21.width, 1, 0),
		["backgroundStyle"] = v22,
		["testId"] = p21.testId
	}
	local v26 = {
		["UIGradient"] = v_u_3.createElement("UIGradient", {
			["Transparency"] = p21.gradient
		})
	}
	return v23(v24, v25, v26)
end
return v_u_3.memo(v_u_3.forwardRef(function(p28, p29) -- name: ChipGroup
	-- upvalues: (copy) v_u_17, (copy) v_u_20, (copy) v_u_15, (copy) v_u_13, (copy) v_u_5, (copy) v_u_3, (copy) v_u_9, (copy) v_u_12, (copy) v_u_16, (copy) v_u_10, (copy) v_u_14, (copy) v_u_11, (copy) v_u_7, (copy) v_u_27, (copy) v_u_18, (copy) v_u_19
	local v30 = v_u_17(p28, v_u_20)
	local v_u_31 = v_u_13(v_u_15(), v30.variant, v30.size)
	if v_u_5.FoundationUnifiedScrimScrolling then
		local v32 = v30.size
		local v33 = {}
		for v34, v35 in v30.chips do
			v33[("Chip%*"):format(v34)] = v_u_3.createElement(v_u_9, {
				["text"] = v35.text,
				["leading"] = v35.leading,
				["trailing"] = v35.trailing,
				["onActivated"] = v35.onActivated,
				["isChecked"] = v35.isChecked,
				["variant"] = v35.variant,
				["size"] = v32,
				["LayoutOrder"] = v34,
				["testId"] = ("%*--chip-%*"):format(v30.testId, v34)
			})
		end
		local v36 = v_u_3.createElement(v_u_12, {
			["tag"] = "auto-xy",
			["layout"] = nil,
			["layout"] = {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["Padding"] = UDim.new(0, v_u_31.gap),
				["Wraps"] = v_u_31.isWrapped
			}
		}, v33)
		if v_u_31.isWrapped then
			return v_u_3.createElement(v_u_12, v_u_16(v30, {
				["tag"] = "size-full-0 auto-y",
				["ref"] = nil,
				["ref"] = p29
			}), {
				["ChipContainer"] = v36
			})
		else
			return v_u_3.createElement(v_u_10, v_u_16(v30, {
				["size"] = v30.size,
				["ref"] = p29
			}), {
				["ChipContainer"] = v36
			})
		end
	else
		local v37, v_u_38 = v_u_3.useBinding(false)
		local v39, v_u_40 = v_u_3.useBinding(false)
		local v_u_41 = v_u_3.useRef(nil)
		local v42 = v_u_14(v_u_41)
		local v_u_44 = v_u_3.useCallback(function(p43)
			-- upvalues: (copy) v_u_31, (copy) v_u_38, (copy) v_u_40
			if v_u_31.hasScrim and p43.AbsoluteWindowSize.X ~= 0 then
				v_u_38(p43.CanvasPosition.X ~= 0)
				v_u_40(p43.AbsoluteWindowSize.X + p43.CanvasPosition.X < p43.AbsoluteCanvasSize.X - 1)
			end
		end, { v_u_31.hasScrim })
		local v45 = v_u_3.useCallback(function()
			-- upvalues: (copy) v_u_41, (copy) v_u_44
			if v_u_41.current then
				v_u_44(v_u_41.current)
			end
		end, { v30.onAbsoluteSizeChanged, v_u_44 })
		local v46 = v_u_3.useCallback(function()
			-- upvalues: (copy) v_u_41, (copy) v_u_44
			if v_u_41.current then
				v_u_44(v_u_41.current)
			end
		end, { v30.onAbsolutePositionChanged, v_u_44 })
		local v47 = v30.size
		local v_u_48 = v_u_31.scrimWidth
		local v49 = {}
		for v50, v51 in v30.chips do
			v49[("Chip%*"):format(v50)] = v_u_3.createElement(v_u_9, {
				["text"] = v51.text,
				["leading"] = v51.leading,
				["trailing"] = v51.trailing,
				["onActivated"] = v51.onActivated,
				["isChecked"] = v51.isChecked,
				["variant"] = v51.variant,
				["size"] = v47,
				["LayoutOrder"] = v50,
				["testId"] = ("%*--chip-%*"):format(v30.testId, v50)
			})
		end
		local v52 = v_u_16(v30, {
			["ref"] = nil,
			["tag"] = "size-full-0 auto-y",
			["ref"] = p29
		})
		v52.onAbsoluteSizeChanged = v45
		v52.onAbsolutePositionChanged = v46
		local v53 = v_u_3.createElement
		local v54 = v_u_12
		local v55 = {}
		local v56 = v_u_3.createElement
		local v57 = v_u_11
		local v58 = {
			["tag"] = "size-full-0 auto-y",
			["scroll"] = nil,
			["layout"] = nil,
			["ClipsDescendants"] = nil,
			["scrollingFrameRef"] = nil,
			["onCanvasPositionChanged"] = nil,
			["onAbsoluteCanvasSizeChanged"] = nil,
			["onAbsoluteWindowSizeChanged"] = nil,
			["scroll"] = {
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["AutomaticCanvasSize"] = Enum.AutomaticSize.X,
				["CanvasSize"] = UDim2.fromScale(0, 1),
				["ScrollingDirection"] = Enum.ScrollingDirection.X,
				["ScrollingEnabled"] = not v_u_31.isWrapped,
				["scrollBarVisibility"] = v_u_7.None
			},
			["layout"] = {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["Padding"] = UDim.new(0, v_u_31.gap),
				["Wraps"] = v_u_31.isWrapped
			},
			["ClipsDescendants"] = v_u_31.isWrapped,
			["scrollingFrameRef"] = v_u_41
		}
		local v59
		if v_u_31.hasScrim then
			v59 = v_u_44
		else
			v59 = nil
		end
		v58.onCanvasPositionChanged = v59
		local v60
		if v_u_31.hasScrim then
			v60 = v_u_44
		else
			v60 = nil
		end
		v58.onAbsoluteCanvasSizeChanged = v60
		if not v_u_31.hasScrim then
			v_u_44 = nil
		end
		v58.onAbsoluteWindowSizeChanged = v_u_44
		v55.ScrollView = v56(v57, v58, v49)
		local v61
		if v_u_31.hasScrim then
			local v62 = v_u_3.createElement
			local v63 = v_u_12
			local v65 = {
				["tag"] = "row flex-between",
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["ZIndex"] = 2,
				["Size"] = v42:map(function(p64)
					-- upvalues: (copy) v_u_48
					return UDim2.fromOffset(p64.Max.X - p64.Min.X, v_u_48)
				end),
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Position"] = UDim2.fromScale(0.5, 0)
			}
			local v66 = {}
			if v37 then
				v37 = v_u_3.createElement(v_u_27, {
					["LayoutOrder"] = 1,
					["gradient"] = nil,
					["width"] = nil,
					["testId"] = nil,
					["gradient"] = v_u_18,
					["width"] = v_u_48,
					["testId"] = ("%*--scrim-start"):format(v30.testId)
				})
			end
			v66.ScrimStart = v37
			if v39 then
				v39 = v_u_3.createElement(v_u_27, {
					["LayoutOrder"] = 2,
					["gradient"] = nil,
					["width"] = nil,
					["testId"] = nil,
					["gradient"] = v_u_19,
					["width"] = v_u_48,
					["testId"] = ("%*--scrim-end"):format(v30.testId)
				})
			end
			v66.ScrimEnd = v39
			v61 = v62(v63, v65, v66)
		else
			v61 = nil
		end
		v55.ScrimWrapper = v61
		return v53(v54, v52, v55)
	end
end))