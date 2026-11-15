-- Path: CorePackages.Packages._Index.Markdown.Markdown.Components.NodeRenderers.MarkdownTable.MarkdownTable
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.Foundation)
local v_u_5 = require(v2.React)
local v_u_6 = require(script.Parent.columnWidths)
local v_u_7 = require(v1.Utils.mergeContexts)
require(v1.Types)
local v_u_8 = v_u_4.ScrollView
local v_u_9 = v_u_4.View
local v_u_10 = v_u_4.Hooks.useTokens
local function v_u_12(p11) -- name: getTableContext
	-- upvalues: (copy) v_u_7
	return v_u_7(p11, {
		["textStyles"] = {
			["textTags"] = "text-body-medium content-default"
		}
	})
end
local function v_u_20(p13, p14) -- name: getCellPadding
	local v15 = (p13.textStyles.textSize or p14.Typography.BodyMedium.FontSize) / p14.Typography.BodyMedium.FontSize
	local v16 = {}
	local v17 = p14.Padding.XLarge * v15
	v16.x = math.round(v17)
	local v18 = p14.Padding.Medium * v15
	v16.y = math.round(v18)
	local v19 = p14.Padding.XXSmall * v15
	v16.text = math.round(v19)
	return v16
end
return function(p_u_21) -- name: MarkdownTable
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_12, (copy) v_u_6, (copy) v_u_3, (copy) v_u_20, (copy) v_u_4, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7
	local v22 = v_u_10()
	local v23, v_u_24 = v_u_5.useState(0)
	local v25, v_u_26 = v_u_5.useState(nil)
	local v_u_27 = v_u_5.useRef(nil)
	local v_u_28 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_12, (copy) p_u_21
		return v_u_12(p_u_21.context)
	end, { p_u_21.context })
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_27, (ref) v_u_6, (copy) p_u_21, (copy) v_u_28, (copy) v_u_26, (ref) v_u_3
		local v29 = v_u_27.current or v_u_6.createWidthCache()
		v_u_27.current = v29
		local v_u_30 = v_u_6.measureColumnContentWidths(p_u_21.node, v_u_28, v29)
		v_u_26(function(p31)
			-- upvalues: (ref) v_u_3, (copy) v_u_30
			if p31 and v_u_3.shallowEqual(p31, v_u_30) then
				return p31
			else
				return v_u_30
			end
		end)
	end, { p_u_21.node, v_u_28 })
	local v33 = v_u_5.useCallback(function(p32)
		-- upvalues: (copy) v_u_24
		v_u_24(p32.AbsoluteSize.X)
	end, {})
	local v34 = v_u_20(v_u_28, v22)
	local v35 = p_u_21.node.children[1]
	local v36 = v35 and #v35.children or 0
	local v37 = v22.Stroke.Standard
	local v38 = math.ceil(v37)
	local v39 = v36 - 1
	local v40 = math.max(v39, 0) * v22.Stroke.Standard
	local v41
	if v25 and v23 > 0 then
		v41 = v_u_6.computeColumnWidths(v_u_6.fillUnmeasuredColumns(v25, v36), v23 - v38 * 2 - v40, v34.x * 2)
	else
		v41 = nil
	end
	local v_u_42 = not v41 and 0 or v_u_3.sum(v41) + v40 + v38 * 2
	local v43 = v23 >= v_u_42 and 0 or v22.Size.Size_150 + v22.Gap.XSmall
	local v44 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_42, (ref) v_u_4
		return {
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["CanvasSize"] = UDim2.fromOffset(v_u_42, 0),
			["ScrollingDirection"] = Enum.ScrollingDirection.X,
			["scrollBarVisibility"] = v_u_4.Enums.Visibility.Always
		}
	end, { v_u_42 })
	local v45 = v_u_5.createElement
	local v46 = v_u_9
	local v47 = {
		["tag"] = "size-full-0 auto-y",
		["onAbsoluteSizeChanged"] = nil,
		["onAbsoluteSizeChanged"] = v33
	}
	local v48 = {}
	local v49 = v_u_5.createElement
	local v50 = v_u_8
	local v51 = {
		["tag"] = "size-full-0 auto-y",
		["scroll"] = nil,
		["scroll"] = v44
	}
	local v52 = {}
	local v53 = v_u_5.createElement
	local v54 = v_u_9
	local v55 = {
		["tag"] = "auto-xy"
	}
	local v56 = {
		["UIPadding"] = v_u_5.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, v38),
			["PaddingBottom"] = UDim.new(0, v38 + v43),
			["PaddingLeft"] = UDim.new(0, v38),
			["PaddingRight"] = UDim.new(0, v38)
		})
	}
	if v41 then
		v41 = v_u_5.createElement(v_u_9, {
			["tag"] = "auto-xy col gap-none radius-medium stroke-standard stroke-default"
		}, v_u_28.processChildren(p_u_21.node, v_u_7(v_u_28, {
			["tableColumnWidths"] = v41,
			["tableCellPadding"] = v34,
			["tableRowCount"] = #p_u_21.node.children
		})))
	end
	v56.Table = v41
	v52.BorderInset = v53(v54, v55, v56)
	v48.ScrollView = v49(v50, v51, v52)
	return v45(v46, v47, v48)
end