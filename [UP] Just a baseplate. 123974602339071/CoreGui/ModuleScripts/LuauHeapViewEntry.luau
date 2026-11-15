-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LuauHeap.LuauHeapViewEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(v3.BannerButton)
local v_u_6 = require(v3.Tooltip)
require(script.Parent.LuauHeapTypes)
local v7 = require(script.Parent.Parent.Parent.Constants)
local v_u_8 = v7.GeneralFormatting.LineWidth
local v_u_9 = v7.GeneralFormatting.LineColor
local v_u_10 = v7.LuauHeapFormatting.GraphEntryFrameHeight
local v_u_11 = v7.LuauHeapFormatting.DepthIndent
local v_u_12 = v7.LuauHeapFormatting.ValueCellWidth
local v_u_13 = v7.LuauHeapFormatting.CellPadding
local v_u_14 = v7.LuauHeapFormatting.ValuePadding
local v_u_15 = v_u_2.PureComponent:extend("LuauHeapViewEntry")
local function v_u_19(p16) -- name: BorderedCellLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_8, (copy) v_u_14, (copy) v_u_9
	local v17 = v_u_2.createFragment
	local v18 = {
		["Label"] = v_u_2.createElement(v_u_4, {
			["text"] = nil,
			["size"] = nil,
			["pos"] = nil,
			["richText"] = true,
			["text"] = p16.text,
			["size"] = p16.size,
			["pos"] = p16.pos
		}),
		["LeftBorder"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(UDim.new(0, v_u_8), p16.size.Y),
			["Position"] = UDim2.fromOffset(-v_u_14, 0) + p16.pos,
			["AnchorPoint"] = Vector2.new(0, 0),
			["BackgroundColor3"] = v_u_9
		})
	}
	return v17(v18)
end
function v_u_15.init(p_u_20) -- name: init
	p_u_20.state = {
		["expanded"] = nil,
		["expandedEllipsis"] = false,
		["showTooltip"] = false,
		["tooltipPos"] = nil,
		["expanded"] = p_u_20.props.depth == 0,
		["tooltipPos"] = UDim2.fromOffset(0, 0)
	}
	function p_u_20.onButtonPress()
		-- upvalues: (copy) p_u_20
		p_u_20:setState(function(p21)
			return {
				["expanded"] = not p21.expanded
			}
		end)
	end
	function p_u_20.onExpandEllipsis()
		-- upvalues: (copy) p_u_20
		p_u_20:setState({
			["expandedEllipsis"] = true
		})
	end
	function p_u_20.onMouseEnter(_, p22, p23)
		-- upvalues: (copy) p_u_20
		p_u_20:setState({
			["showTooltip"] = true,
			["tooltipPos"] = nil,
			["tooltipPos"] = UDim2.fromOffset(p22, p23)
		})
	end
	function p_u_20.onMouseMove(_, p24, p25)
		-- upvalues: (copy) p_u_20
		p_u_20:setState({
			["showTooltip"] = true,
			["tooltipPos"] = nil,
			["tooltipPos"] = UDim2.fromOffset(p24, p25)
		})
	end
	function p_u_20.onMouseLeave()
		-- upvalues: (copy) p_u_20
		p_u_20:setState({
			["showTooltip"] = false
		})
	end
end
function v_u_15.renderChildren(p26, p27, p28) -- name: renderChildren
	-- upvalues: (copy) v_u_2, (copy) v_u_15
	if not p26.state.expanded then
		return {}
	end
	local v29
	if #p27 == 0 then
		if p28 == nil then
			v29 = false
		else
			v29 = #p28 ~= 0
		end
	else
		v29 = true
	end
	if not v29 then
		return {}
	end
	local v30 = p26.props.data.TotalSize
	local v31 = p26.props.depth + 1
	local v32 = 0
	local v33 = 0
	local v34 = 0
	local v35 = {}
	for _, v36 in ipairs(p27) do
		if p28 then
			for _, v38 in ipairs(p28) do
				if v36.Name ~= v38.Name then
					continue
				end
			end
		end
		local v38 = nil
		if v36.TotalSize <= 128 and (#p27 > 4 and not p26.state.expandedEllipsis) then
			v32 = v32 + v36.TotalSize
			if not v38 then
				continue
			end
			v33 = v33 + v38.TotalSize
		else
			v34 = v34 + 1
			v35[v34] = v_u_2.createElement(v_u_15, {
				["layoutOrder"] = v30 - v36.TotalSize,
				["depth"] = v31,
				["data"] = v36,
				["compare"] = v38
			})
		end
	end
	if v32 > 0 then
		v34 = v34 + 1
		v35[v34] = v_u_2.createElement(v_u_15, {
			["layoutOrder"] = v30,
			["depth"] = v31,
			["data"] = {
				["Size"] = nil,
				["TotalSize"] = nil,
				["Name"] = "...",
				["Children"] = nil,
				["Size"] = v32,
				["TotalSize"] = v32,
				["Children"] = {}
			},
			["compare"] = p28 and {
				["Size"] = nil,
				["TotalSize"] = nil,
				["Name"] = "...",
				["Children"] = nil,
				["Size"] = v33,
				["TotalSize"] = v33,
				["Children"] = {}
			} or nil,
			["customButtonPress"] = p26.onExpandEllipsis
		})
	end
	if p28 then
		for _, v39 in ipairs(p28) do
			local v40 = false
			for _, v41 in ipairs(p27) do
				if v41.Name ~= v39.Name then
					continue
				end
				v40 = true
			end
			if v40 then
				break
			end
			local v42 = {
				["Size"] = 0,
				["TotalSize"] = 0,
				["Name"] = v39.Name,
				["Source"] = v39.Source,
				["Children"] = {}
			}
			v34 = v34 + 1
			v35[v34] = v_u_2.createElement(v_u_15, {
				["layoutOrder"] = v30,
				["depth"] = v31,
				["data"] = v42,
				["compare"] = v39
			})
		end
	end
	return v35
end
function v_u_15.renderValues(_, p43) -- name: renderValues
	-- upvalues: (copy) v_u_12, (copy) v_u_14, (copy) v_u_10, (copy) v_u_2, (copy) v_u_19
	local v44 = UDim2.new(v_u_12, -v_u_14, 0, v_u_10)
	local v45 = UDim2.new(1 - v_u_12 * #p43, v_u_14, 0, 0)
	local v46 = {}
	for v47, v48 in ipairs(p43) do
		v46[tostring(v47)] = v_u_2.createElement(v_u_19, {
			["text"] = tostring(v48),
			["size"] = v44,
			["pos"] = v45 + UDim2.fromScale(v_u_12 * (v47 - 1), 0)
		})
	end
	return v46
end
function v_u_15.render(p49) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	local v50 = p49.props
	local v51 = v50.size or UDim2.new(1, 0, 0, v_u_10)
	local v52 = v50.depth
	local v53 = v50.layoutOrder or 0
	local v54 = v52 * v_u_11
	local v55 = v50.data
	local v56 = v50.compare
	local v57
	if v56 and v56.TotalSize ~= v55.TotalSize then
		v57 = string.format("%d <font color=\"#%s\">(%s%d)</font>", v55.TotalSize, v56.TotalSize > v55.TotalSize and "0f0" or "f00", v56.TotalSize > v55.TotalSize and "" or "+", v55.TotalSize - v56.TotalSize)
	else
		v57 = string.format("%.0f", v55.TotalSize)
	end
	local v58
	if v56 and v56.Size ~= v55.Size then
		v58 = string.format("%d <font color=\"#%s\">(%s%d)</font>", v55.Size, v56.Size > v55.Size and "0f0" or "f00", v56.Size > v55.Size and "" or "+", v55.Size - v56.Size)
	else
		v58 = string.format("%.0f", v55.Size)
	end
	local v59 = { v57, v58 }
	local v60 = v52 == 0 and "<root>" or "<anonymous>"
	if v55.Name and #v55.Name ~= 0 then
		v60 = v55.Name
	end
	local v61
	if v55.Source and #v55.Source ~= 0 then
		v61 = v55.Source
	else
		v61 = v60
	end
	local v62 = UDim.new(1 - v_u_12 * #v59, -(v_u_13 + v54))
	local v63 = (#v55.Children ~= 0 or v56 ~= nil and #v56.Children ~= 0) and true or v50.customButtonPress ~= nil
	local v64
	if v50.customButtonPress then
		v64 = v50.customButtonPress
	else
		v64 = p49.onButtonPress
	end
	local v65 = v_u_2.createElement
	local v66 = "Frame"
	local v67 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = v51,
		["LayoutOrder"] = v53,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v68 = {}
	local v69
	if p49.state.showTooltip then
		v69 = v_u_2.createElement(v_u_6, {
			["text"] = v61,
			["pos"] = p49.state.tooltipPos
		})
	else
		v69 = nil
	end
	v68.tooltip = v69
	v68.layout = v_u_2.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	v68.button = v_u_2.createElement(v_u_5, {
		["size"] = nil,
		["inset"] = nil,
		["isExpanded"] = nil,
		["isExpandable"] = nil,
		["onButtonPress"] = nil,
		["onMouseEnter"] = nil,
		["onMouseLeave"] = nil,
		["onMouseMove"] = nil,
		["layoutOrder"] = -1,
		["size"] = UDim2.new(1, 0, 0, v_u_10),
		["inset"] = v54,
		["isExpanded"] = p49.state.expanded,
		["isExpandable"] = v63,
		["onButtonPress"] = v64,
		["onMouseEnter"] = p49.onMouseEnter,
		["onMouseLeave"] = p49.onMouseLeave,
		["onMouseMove"] = p49.onMouseMove
	}, {
		["name"] = v_u_2.createElement(v_u_4, {
			["text"] = nil,
			["size"] = nil,
			["pos"] = nil,
			["textTruncate"] = nil,
			["textWrapped"] = false,
			["text"] = v60,
			["size"] = UDim2.new(v62, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, v_u_13 + v54, 0, 0),
			["textTruncate"] = Enum.TextTruncate.SplitWord
		}),
		["values"] = v_u_2.createFragment(p49:renderValues(v59))
	})
	local v70 = v_u_2.createFragment
	local v71 = v55.Children
	local v72
	if v56 then
		v72 = v56.Children
	else
		v72 = nil
	end
	v68.children = v70(p49:renderChildren(v71, v72))
	return v65(v66, v67, v68)
end
return v_u_15