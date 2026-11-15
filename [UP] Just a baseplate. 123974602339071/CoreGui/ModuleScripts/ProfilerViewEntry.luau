-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScriptProfiler.ProfilerViewEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
require(script.Parent.ProfilerDataFormatV2)
local v_u_4 = require(script.Parent.ProfilerUtil)
local v_u_5 = v_u_4.getDurations
local v_u_6 = v_u_4.getNativeFlag
local v_u_7 = v_u_4.getPluginFlag
local v_u_8 = v_u_4.standardizeChildren
local v9 = script.Parent.Parent.Parent.Components
local v_u_10 = require(v9.CellLabel)
local v_u_11 = require(v9.BannerButton)
local v_u_12 = require(v9.Tooltip)
local v13 = script.Parent.Parent.Parent.Actions
local v_u_14 = require(v13.SetScriptProfilerRoot)
local v15 = require(script.Parent.Parent.Parent.Constants)
local v_u_16 = v15.GeneralFormatting.LineWidth
local v_u_17 = v15.GeneralFormatting.LineColor
local v_u_18 = v15.GeneralFormatting.EntryFrameHeight
local v_u_19 = v15.ScriptProfilerFormatting.DepthIndent
local v_u_20 = v15.ScriptProfilerFormatting.ValueCellWidth
local v_u_21 = v15.ScriptProfilerFormatting.CellPadding
local v_u_22 = v15.ScriptProfilerFormatting.ValuePadding
local v23 = v_u_2.PureComponent:extend("ProfilerViewEntry")
local v_u_28 = v3.UNSTABLE_connect2(nil, function(p_u_24) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_14
	return {
		["dispatchSetScriptProfilerRoot"] = function(p25, p26, p27) -- name: dispatchSetScriptProfilerRoot
			-- upvalues: (copy) p_u_24, (ref) v_u_14
			p_u_24(v_u_14(p25, p26, p27))
		end
	}
end)(v23)
local function v_u_32(p29) -- name: BorderedCellLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_16, (copy) v_u_22, (copy) v_u_17
	local v30 = v_u_2.createFragment
	local v31 = {
		["Label"] = v_u_2.createElement(v_u_10, {
			["text"] = p29.text,
			["size"] = p29.size,
			["pos"] = p29.pos
		}),
		["LeftBorder"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(UDim.new(0, v_u_16), p29.size.Y),
			["Position"] = UDim2.fromOffset(-v_u_22, 0) + p29.pos,
			["AnchorPoint"] = Vector2.new(0, 0),
			["BackgroundColor3"] = v_u_17
		})
	}
	return v30(v31)
end
function v23.init(p_u_33) -- name: init
	p_u_33.state = {
		["expanded"] = nil,
		["showTooltip"] = false,
		["tooltipPos"] = nil,
		["expanded"] = p_u_33.props.depth == 0 and true or p_u_33.props.expandedNodes[p_u_33.props.nodeId],
		["tooltipPos"] = UDim2.fromOffset(0, 0)
	}
	function p_u_33.onButtonPress()
		-- upvalues: (copy) p_u_33
		p_u_33.props.expandedNodes[p_u_33.props.nodeId] = not p_u_33.state.expanded
		p_u_33:setState(function(_)
			-- upvalues: (ref) p_u_33
			return {
				["expanded"] = not p_u_33.state.expanded
			}
		end)
	end
	function p_u_33.onMouseEnter(_, p34, p35)
		-- upvalues: (copy) p_u_33
		p_u_33:setState({
			["showTooltip"] = true,
			["tooltipPos"] = nil,
			["tooltipPos"] = UDim2.fromOffset(p34, p35)
		})
	end
	function p_u_33.onMouseMove(_, p36, p37)
		-- upvalues: (copy) p_u_33
		p_u_33:setState({
			["showTooltip"] = true,
			["tooltipPos"] = nil,
			["tooltipPos"] = UDim2.fromOffset(p36, p37)
		})
	end
	function p_u_33.onMouseLeave()
		-- upvalues: (copy) p_u_33
		p_u_33:setState({
			["showTooltip"] = false
		})
	end
	function p_u_33.onMouse2Click()
		-- upvalues: (copy) p_u_33
		local v38 = p_u_33.props.dispatchSetScriptProfilerRoot
		local v39 = p_u_33.props.nodeId
		local v40 = p_u_33.props.functionId
		local v41 = p_u_33.props
		local v42 = v41.depth
		local v43 = v41.data
		local v44 = v41.functionId
		local _ = v43.Functions[v44]
		local v45 = v42 == 0 and v44 == 0 and "<root>" or "<anonymous>"
		local v46 = v41.nodeName
		if v46 then
			if #v46 ~= 0 then
				v45 = v46
			end
		end
		v38(v39, v40, v45)
	end
end
function v23.renderChildren(p47, p48) -- name: renderChildren
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_2, (copy) v_u_28
	local v49 = {}
	if p47.state.expanded then
		local v50 = p47.props.percentageRatio
		local v51 = v_u_5(p47.props.data, p47.props.nodeId)
		local v52 = p47.props.depth + 1
		local v53 = p47.props.average
		local v54 = p47.props.searchTerm
		local v55 = p47.props.searchFilter
		local v56 = p47.props.showPlugins
		local v57 = p47.props.showGC
		local v58 = p47.props.gcNodeOffsets
		local v59 = p47.props.expandedNodes
		local v60 = p47.props.data
		local v61 = v60.GCFuncId
		if p48 then
			for v62, v63 in pairs(p48) do
				if #v55 > 0 and not v55[v63] or not v57 and v62 == v61 then
					continue
				end
				local _ = v60.Nodes[v63]
				local v64 = v60.Functions[v62]
				if not v56 and v_u_7(v60, v64) then
					continue
				end
				local v65 = v_u_5(v60, v63)
				v49[v62] = v_u_2.createElement(v_u_28, {
					["layoutOrder"] = (v51 - v65) * 1000000,
					["depth"] = v52,
					["data"] = v60,
					["nodeId"] = v63,
					["functionId"] = v62,
					["nodeName"] = v64.Name,
					["average"] = v53,
					["percentageRatio"] = v50,
					["searchTerm"] = v54,
					["searchFilter"] = v55,
					["showPlugins"] = v56,
					["showGC"] = v57,
					["gcNodeOffsets"] = v58,
					["expandedNodes"] = v59
				})
			end
			return v49
		end
		if p47.props.nodeId == 0 then
			local v66 = p48 == nil
			assert(v66)
			for v67, v68 in v60.Categories do
				if #v55 > 0 and not v55[v68.NodeId] then
					continue
				end
				local _ = v60.Nodes[v68.NodeId]
				local v69 = v_u_5(v60, v68.NodeId)
				local v70 = p47.props.pluginOffsets[v67]
				local v71 = p47.props.pluginGCOffsets[v67]
				if not v56 then
					v69 = v69 - v70
					if v57 then
						v69 = v69 - v71
					end
				end
				v49[v67] = v_u_2.createElement(v_u_28, {
					["layoutOrder"] = nil,
					["depth"] = nil,
					["data"] = nil,
					["nodeId"] = nil,
					["functionId"] = nil,
					["nodeName"] = nil,
					["average"] = nil,
					["percentageRatio"] = nil,
					["searchTerm"] = nil,
					["searchFilter"] = nil,
					["showPlugins"] = nil,
					["pluginOffset"] = nil,
					["pluginGCOffset"] = nil,
					["showGC"] = nil,
					["gcNodeOffsets"] = nil,
					["expandedNodes"] = nil,
					["layoutOrder"] = (v51 - v69) * 1000000,
					["depth"] = v52,
					["data"] = v60,
					["nodeId"] = v68.NodeId,
					["nodeName"] = v68.Name,
					["average"] = v53,
					["percentageRatio"] = v50,
					["searchTerm"] = v54,
					["searchFilter"] = v55,
					["showPlugins"] = v56,
					["pluginOffset"] = v70,
					["pluginGCOffset"] = v71,
					["showGC"] = v57,
					["gcNodeOffsets"] = v58,
					["expandedNodes"] = v59
				})
			end
		end
	end
	return v49
end
function v23.renderValues(_, p72) -- name: renderValues
	-- upvalues: (copy) v_u_20, (copy) v_u_22, (copy) v_u_18, (copy) v_u_2, (copy) v_u_32
	local v73 = UDim2.new(v_u_20, -v_u_22, 0, v_u_18)
	local v74 = UDim2.new(1 - v_u_20 * #p72, v_u_22, 0, 0)
	local v75 = {}
	for v76, v77 in ipairs(p72) do
		v75[tostring(v76)] = v_u_2.createElement(v_u_32, {
			["text"] = tostring(v77),
			["size"] = v73,
			["pos"] = v74 + UDim2.fromScale(v_u_20 * (v76 - 1), 0)
		})
	end
	return v75
end
function v23.render(p78) -- name: render
	-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_5, (copy) v_u_8, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_20, (copy) v_u_2, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_21
	local v79 = p78.props
	local v80 = v79.size or UDim2.new(1, 0, 0, v_u_18)
	local v81 = v79.depth
	local v82 = v79.layoutOrder or 0
	local v83 = v81 * v_u_19
	local v84 = v79.percentageRatio
	local v85 = v79.data
	local v86 = v79.showPlugins
	local v87 = v79.showGC
	local v88 = v79.nodeId
	local v89 = v79.functionId
	local v90 = v85.Functions[v89]
	local v91 = v85.Nodes[v88]
	local v92, v93 = v_u_5(v85, v88)
	local v94 = v92 / p78.props.average
	local v95 = v93 / p78.props.average
	local v96 = v_u_8(v85, v91)
	if not v86 then
		if v88 == 0 then
			v94 = v94 - (p78.props.pluginOffsets.Total or 0)
			if v87 then
				v94 = v94 - (p78.props.pluginGCOffsets.Total or 0)
			end
		else
			v94 = v94 - (p78.props.pluginOffset or 0)
			if v87 then
				v94 = v94 - (p78.props.pluginGCOffset or 0)
			end
		end
	end
	if not v87 then
		local v97 = v79.gcNodeOffsets
		if v88 == 0 then
			v94 = v94 - (v97.Total or 0)
		else
			v94 = v94 - (v97[v88] or 0)
		end
	end
	local v98, v99
	if v84 then
		if v84 == 0 then
			v98 = "N/A"
			v99 = "N/A"
		else
			v98 = string.format("%.3f%%", v94 / v84)
			v99 = string.format("%.3f%%", v95 / v84)
		end
	else
		v98 = string.format("%.3f", v94 * 1000)
		v99 = string.format("%.3f", v95 * 1000)
	end
	local v100 = { v98, v99 }
	local v101 = v79.depth
	local v102 = v79.data
	local v103 = v79.functionId
	local _ = v102.Functions[v103]
	local v104 = v101 == 0 and v103 == 0 and "<root>" or "<anonymous>"
	local v105 = v79.nodeName
	if v105 then
		if #v105 ~= 0 then
			v104 = v105
		end
	end
	local v106 = v_u_4.getSourceLocationString(v85, v90, v104)
	local v107 = v_u_6(v85, v90)
	if v_u_7(v85, v90) then
		v104 = v104 .. " <plugin>"
	end
	if v107 then
		v104 = v104 .. " <native>"
	end
	local v108 = UDim.new(1 - v_u_20 * #v100, -v83)
	local v109 = v_u_2.createElement
	local v110 = "Frame"
	local v111 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = v80,
		["LayoutOrder"] = v82,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v112 = {}
	local v113
	if p78.state.showTooltip then
		v113 = v_u_2.createElement(v_u_12, {
			["text"] = v106,
			["pos"] = p78.state.tooltipPos
		})
	else
		v113 = nil
	end
	v112.tooltip = v113
	v112.layout = v_u_2.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	v112.button = v_u_2.createElement(v_u_11, {
		["size"] = nil,
		["inset"] = nil,
		["isExpanded"] = nil,
		["isExpandable"] = nil,
		["onButtonPress"] = nil,
		["onMouseEnter"] = nil,
		["onMouseLeave"] = nil,
		["onMouseMove"] = nil,
		["onMouse2Click"] = nil,
		["layoutOrder"] = -1,
		["size"] = UDim2.new(1, 0, 0, v_u_18),
		["inset"] = v83,
		["isExpanded"] = p78.state.expanded,
		["isExpandable"] = v96 and next(v96) ~= nil and true or v81 == 0,
		["onButtonPress"] = p78.onButtonPress,
		["onMouseEnter"] = p78.onMouseEnter,
		["onMouseLeave"] = p78.onMouseLeave,
		["onMouseMove"] = p78.onMouseMove,
		["onMouse2Click"] = p78.onMouse2Click
	}, {
		["name"] = v_u_2.createElement(v_u_10, {
			["text"] = v104,
			["size"] = UDim2.new(v108, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, v_u_21 + v83, 0, 0)
		}),
		["values"] = v_u_2.createFragment(p78:renderValues(v100))
	})
	v112.children = v_u_2.createFragment(p78:renderChildren(v96))
	return v109(v110, v111, v112)
end
return v_u_28