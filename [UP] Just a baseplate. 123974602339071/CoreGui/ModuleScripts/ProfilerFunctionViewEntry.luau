-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScriptProfiler.ProfilerFunctionViewEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.ProfilerUtil)
local _ = v_u_3.getDurations
local _ = v_u_3.getSourceName
local _ = v_u_3.getLine
local v_u_4 = v_u_3.getNativeFlag
local v_u_5 = v_u_3.getPluginFlag
local _ = v_u_3.standardizeChildren
local v6 = script.Parent.Parent.Parent.Components
local v_u_7 = require(v6.CellLabel)
local v_u_8 = require(v6.BannerButton)
local v_u_9 = require(v6.Tooltip)
local v10 = require(script.Parent.Parent.Parent.Constants)
local v_u_11 = v10.GeneralFormatting.LineWidth
local v_u_12 = v10.GeneralFormatting.LineColor
local v_u_13 = v10.GeneralFormatting.EntryFrameHeight
local _ = v10.ScriptProfilerFormatting.DepthIndent
local v_u_14 = v10.ScriptProfilerFormatting.ValueCellWidth
local v_u_15 = v10.ScriptProfilerFormatting.CellPadding
local v_u_16 = v10.ScriptProfilerFormatting.ValuePadding
local v17 = v_u_2.PureComponent:extend("ProfilerFunctionViewEntry")
local function v_u_21(p18) -- name: BorderedCellLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_11, (copy) v_u_16, (copy) v_u_12
	local v19 = v_u_2.createFragment
	local v20 = {
		["Label"] = v_u_2.createElement(v_u_7, {
			["text"] = p18.text,
			["size"] = p18.size,
			["pos"] = p18.pos
		}),
		["LeftBorder"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(UDim.new(0, v_u_11), p18.size.Y),
			["Position"] = UDim2.fromOffset(-v_u_16, 0) + p18.pos,
			["AnchorPoint"] = Vector2.new(0, 0),
			["BackgroundColor3"] = v_u_12
		})
	}
	return v19(v20)
end
function v17.init(p_u_22) -- name: init
	p_u_22.state = {
		["expanded"] = nil,
		["showTooltip"] = false,
		["tooltipPos"] = nil,
		["expanded"] = p_u_22.props.depth == 0,
		["tooltipPos"] = UDim2.fromOffset(0, 0)
	}
	function p_u_22.onButtonPress()
		-- upvalues: (copy) p_u_22
		p_u_22:setState(function(_)
			-- upvalues: (ref) p_u_22
			return {
				["expanded"] = not p_u_22.state.expanded
			}
		end)
	end
	function p_u_22.onMouseEnter(_, p23, p24)
		-- upvalues: (copy) p_u_22
		p_u_22:setState({
			["showTooltip"] = true,
			["tooltipPos"] = nil,
			["tooltipPos"] = UDim2.fromOffset(p23, p24)
		})
	end
	function p_u_22.onMouseMove(_, p25, p26)
		-- upvalues: (copy) p_u_22
		p_u_22:setState({
			["showTooltip"] = true,
			["tooltipPos"] = nil,
			["tooltipPos"] = UDim2.fromOffset(p25, p26)
		})
	end
	function p_u_22.onMouseLeave()
		-- upvalues: (copy) p_u_22
		p_u_22:setState({
			["showTooltip"] = false
		})
	end
end
function v17.renderValues(_, p27) -- name: renderValues
	-- upvalues: (copy) v_u_14, (copy) v_u_16, (copy) v_u_13, (copy) v_u_2, (copy) v_u_21
	local v28 = UDim2.new(v_u_14, -v_u_16, 0, v_u_13)
	local v29 = UDim2.new(1 - v_u_14 * #p27, v_u_16, 0, 0)
	local v30 = {}
	for v31, v32 in ipairs(p27) do
		v30[tostring(v31)] = v_u_2.createElement(v_u_21, {
			["text"] = tostring(v32),
			["size"] = v28,
			["pos"] = v29 + UDim2.fromScale(v_u_14 * (v31 - 1), 0)
		})
	end
	return v30
end
function v17.render(p33) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_14, (copy) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_15
	local v34 = p33.props
	local v35 = v34.size or UDim2.new(1, 0, 0, v_u_13)
	local v36 = v34.layoutOrder or 0
	local v37 = v34.percentageRatio
	local v38 = v34.data
	local v39 = v34.functionId
	local v40 = v38.Functions[v39]
	local v41 = v40.TotalDuration / p33.props.average - (p33.props.gcOffset or 0)
	local v42 = v_u_4(v38, v40)
	local v43 = v_u_5(v38, v40)
	local v44
	if v37 then
		v44 = v37 == 0 and "N/A" or string.format("%.3f%%", v41 / v37)
	else
		v44 = string.format("%.3f", v41 * 1000)
	end
	local v45 = { v44 }
	local v46 = v34.nodeName
	local v47 = (not v46 or #v46 == 0) and "<anonymous>" or v46
	local v48 = v_u_3.getSourceLocationString(v38, v40, v47)
	if v47 == "<anonymous>" then
		v47 = v48
		v48 = ""
	end
	if v43 then
		v47 = v47 .. " <plugin>"
	end
	if v42 then
		v47 = v47 .. " <native>"
	end
	local v49 = UDim.new(1 - v_u_14 * #v45, -0)
	local v50 = v_u_2.createElement
	local v51 = "Frame"
	local v52 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = v35,
		["LayoutOrder"] = v36,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v53 = {}
	local v54
	if p33.state.showTooltip then
		v54 = v_u_2.createElement(v_u_9, {
			["text"] = v48,
			["pos"] = p33.state.tooltipPos
		})
	else
		v54 = nil
	end
	v53.tooltip = v54
	v53.layout = v_u_2.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	v53.button = v_u_2.createElement(v_u_8, {
		["size"] = nil,
		["inset"] = 0,
		["isExpanded"] = nil,
		["isExpandable"] = false,
		["onButtonPress"] = nil,
		["onMouseEnter"] = nil,
		["onMouseLeave"] = nil,
		["onMouseMove"] = nil,
		["layoutOrder"] = -1,
		["size"] = UDim2.new(1, 0, 0, v_u_13),
		["isExpanded"] = p33.state.expanded,
		["onButtonPress"] = p33.onButtonPress,
		["onMouseEnter"] = p33.onMouseEnter,
		["onMouseLeave"] = p33.onMouseLeave,
		["onMouseMove"] = p33.onMouseMove
	}, {
		["name"] = v_u_2.createElement(v_u_7, {
			["text"] = v47,
			["size"] = UDim2.new(v49, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, v_u_15 + 0, 0, 0)
		}),
		["values"] = v_u_2.createFragment(p33:renderValues(v45))
	})
	return v50(v51, v52, v53)
end
return v17