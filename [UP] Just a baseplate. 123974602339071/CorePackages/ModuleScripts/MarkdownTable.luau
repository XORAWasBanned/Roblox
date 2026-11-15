-- Path: CorePackages.Packages._Index.Markdown.Markdown.Components.NodeRenderers.MarkdownTable
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
local v3 = require(v2.Foundation)
local v_u_4 = require(v2.React)
local v_u_5 = require(script.getRowContext)
local v_u_6 = require(script.MarkdownTable)
local v_u_7 = require(v1.Components.NodeRenderers.renderInline)
local v_u_8 = require(v1.Utils.shouldUseTopPadding)
local v9 = require(v1.Enums.TableAlignment)
require(v1.Types)
local v_u_10 = v3.View
local v_u_11 = v3.Hooks.useTokens
local v_u_12 = {
	[v9.Left] = Enum.HorizontalAlignment.Left,
	[v9.Center] = Enum.HorizontalAlignment.Center,
	[v9.Right] = Enum.HorizontalAlignment.Right
}
local function v_u_20(p13) -- name: TableDivider
	-- upvalues: (copy) v_u_11, (copy) v_u_4, (copy) v_u_10
	local v14 = v_u_11()
	local v15 = v14.Stroke.Standard
	local v16 = v_u_4.createElement
	local v17 = v_u_10
	local v18 = {
		["tag"] = "self-stretch",
		["Size"] = nil,
		["backgroundStyle"] = nil,
		["LayoutOrder"] = nil
	}
	local v19
	if p13.isVertical then
		v19 = UDim2.fromOffset(v15, 0)
	else
		v19 = UDim2.fromOffset(0, v15)
	end
	v18.Size = v19
	v18.backgroundStyle = v14.Color.Stroke.Default
	v18.LayoutOrder = p13.LayoutOrder
	return v16(v17, v18)
end
local function v_u_30(p21, p22, p23, p24) -- name: renderTableRowCells
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_20, (copy) v_u_10
	local v25 = p22.processChildren(p21, v_u_5(p21, p22))
	for v26 = 2, #p21.children do
		local v27 = v_u_4.createElement
		local v28 = v_u_20
		local v29 = {
			["key"] = nil,
			["isVertical"] = true,
			["LayoutOrder"] = nil,
			["key"] = ("Divider%*"):format(v26),
			["LayoutOrder"] = v26 * 2 - 1
		}
		table.insert(v25, v27(v28, v29))
	end
	return v_u_4.createElement(v_u_10, {
		["tag"] = "auto-xy row items-start",
		["onAbsoluteSizeChanged"] = nil,
		["LayoutOrder"] = 2,
		["ref"] = nil,
		["onAbsoluteSizeChanged"] = p24,
		["ref"] = p23
	}, v25)
end
local function v_u_52(p31) -- name: TableRow
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_20, (copy) v_u_30
	local v32 = p31.node
	local v_u_33 = v32.name == "TABLE_HEADER"
	local v34 = v32.index == p31.context.tableRowCount
	local v_u_35 = v_u_4.useRef(nil)
	local v36, v_u_37 = v_u_4.useState(Vector2.zero)
	local v39 = v_u_4.useCallback(function(p38)
		-- upvalues: (copy) v_u_37
		v_u_37(p38.AbsoluteSize)
	end, {})
	v_u_4.useLayoutEffect(function()
		-- upvalues: (copy) v_u_33, (copy) v_u_35, (copy) v_u_37
		if v_u_33 and v_u_35.current then
			v_u_37(v_u_35.current.AbsoluteSize)
		end
	end, { v_u_33 })
	local v40 = v_u_4.createElement
	local v41 = v_u_10
	local v42 = {
		["tag"] = "auto-xy col items-stretch",
		["LayoutOrder"] = nil,
		["LayoutOrder"] = v32.index
	}
	local v43 = {}
	local v44
	if v32.index > 1 then
		v44 = v_u_4.createElement(v_u_20, {
			["LayoutOrder"] = 1,
			["isVertical"] = false
		})
	else
		v44 = nil
	end
	v43.Divider = v44
	local v45 = v_u_4.createElement
	local v46 = v_u_10
	local v47 = {
		["tag"] = "auto-xy",
		["LayoutOrder"] = 2
	}
	local v48 = {}
	local v49
	if v_u_33 then
		v49 = v_u_4.createElement(v_u_10, {
			["tag"] = nil,
			["Size"] = nil,
			["ZIndex"] = 0,
			["tag"] = {
				["bg-shift-100"] = true,
				["radius-medium"] = v34,
				["radius-top-medium"] = not v34
			},
			["Size"] = UDim2.fromOffset(v36.X, v36.Y)
		})
	else
		v49 = nil
	end
	v48.Background = v49
	local v50 = v_u_30
	local v51 = p31.context
	if not v_u_33 then
		v39 = nil
	end
	v48.Cells = v50(v32, v51, v_u_35, v39)
	v43.Content = v45(v46, v47, v48)
	return v40(v41, v42, v43)
end
return {
	["renderTable"] = function(p53, p54) -- name: renderTable
		-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_8, (copy) v_u_6
		local v55 = v_u_4.createElement
		local v56 = v_u_10
		local v57 = {
			["key"] = nil,
			["tag"] = "size-full-0 auto-y col",
			["LayoutOrder"] = nil
		}
		local v58 = p53.index
		v57.key = tostring(v58)
		v57.LayoutOrder = p53.index
		local v59 = {}
		local v60 = v_u_8(p53)
		if v60 then
			v60 = v_u_4.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 10)
			})
		end
		v59.UIPadding = v60
		v59.Table = v_u_4.createElement(v_u_6, {
			["node"] = p53,
			["context"] = p54
		})
		return v55(v56, v57, v59)
	end,
	["renderTableRow"] = function(p61, p62) -- name: renderTableRow
		-- upvalues: (copy) v_u_4, (copy) v_u_52
		local v63 = v_u_4.createElement
		local v64 = v_u_52
		local v65 = {}
		local v66 = p61.index
		v65.key = tostring(v66)
		v65.node = p61
		v65.context = p62
		return v63(v64, v65)
	end,
	["renderTableCell"] = function(p67, p68) -- name: renderTableCell
		-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_7, (copy) v_u_12
		local v69 = p67.index or 1
		local v70
		if p68.tableColumnWidths then
			v70 = p68.tableColumnWidths[v69]
		else
			v70 = nil
		end
		local v71 = p67.attributes
		if v71 then
			v71 = p67.attributes.alignment
		end
		local v72 = p68.tableCellPadding or {
			["x"] = 0,
			["y"] = 0,
			["text"] = 0
		}
		local v73 = v_u_4.createElement
		local v74 = v_u_10
		local v75 = {
			["key"] = nil,
			["tag"] = "auto-y",
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["key"] = tostring(v69),
			["Size"] = UDim2.fromOffset(v70 or 0, 0),
			["LayoutOrder"] = v69 * 2
		}
		local v76 = {
			["UIPadding"] = v_u_4.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, v72.y),
				["PaddingBottom"] = UDim.new(0, v72.y),
				["PaddingLeft"] = UDim.new(0, v72.x),
				["PaddingRight"] = UDim.new(0, v72.x)
			})
		}
		local v77 = v_u_4.createElement
		local v78 = v_u_10
		local v79 = {
			["tag"] = "size-full-0 auto-y"
		}
		local v80 = {
			["UIPadding"] = v_u_4.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, v72.text),
				["PaddingBottom"] = UDim.new(0, v72.text)
			})
		}
		local v81 = v_u_7
		local v82
		if v71 then
			v82 = v_u_12[v71]
		else
			v82 = nil
		end
		v80.InlineLayout = v81(p67, p68, v82)
		v76.Text = v77(v78, v79, v80)
		return v73(v74, v75, v76)
	end
}