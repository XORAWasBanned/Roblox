-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScriptProfiler.ProfilerView
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.ProfilerUtil)
local v_u_4 = v3.getDurations
local v_u_5 = v3.formatSessionLength
require(script.Parent.ProfilerDataFormatV2)
local v6 = script.Parent.Parent.Parent.Components
local v_u_7 = require(v6.HeaderButton)
local v_u_8 = require(script.Parent.ProfilerViewEntry)
local v_u_9 = require(script.Parent.Parent.Parent.Constants)
local v_u_10 = v_u_9.GeneralFormatting.LineWidth
local v_u_11 = v_u_9.GeneralFormatting.LineColor
local v_u_12 = v_u_9.GeneralFormatting.HeaderFrameHeight
local _ = v_u_9.GeneralFormatting.EntryFrameHeight
local _ = v_u_9.GeneralFormatting.NoResultSearchStr
local v_u_13 = v_u_9.ScriptProfilerFormatting.HeaderNames
local v_u_14 = v_u_9.ScriptProfilerFormatting.ValueCellWidth
local v_u_15 = v_u_9.ScriptProfilerFormatting.CellPadding
local v_u_16 = v_u_9.ScriptProfilerFormatting.ValuePadding
local v17 = v_u_2.PureComponent:extend("ProfilerView")
function v17.renderChildren(p18) -- name: renderChildren
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_8
	local v19 = p18.props.data
	local v20 = v19.Version == 2
	assert(v20)
	local v21 = v_u_4(v19, 0)
	local v22 = (p18.props.average <= 0 or not p18.props.sessionLength) and 1 or p18.props.sessionLength / 1000 / p18.props.average
	local v23 = v_u_2.createElement
	local v24 = v_u_8
	local v25 = {
		["layoutOrder"] = 0,
		["depth"] = 0,
		["data"] = nil,
		["nodeId"] = nil,
		["functionId"] = nil,
		["nodeName"] = nil,
		["average"] = nil,
		["searchTerm"] = nil,
		["searchFilter"] = nil,
		["showPlugins"] = nil,
		["pluginOffsets"] = nil,
		["showGC"] = nil,
		["gcNodeOffsets"] = nil,
		["pluginGCOffsets"] = nil,
		["expandedNodes"] = nil,
		["percentageRatio"] = nil,
		["data"] = v19,
		["nodeId"] = p18.props.rootNode,
		["functionId"] = p18.props.rootFunc,
		["nodeName"] = p18.props.rootNodeName,
		["average"] = v22,
		["searchTerm"] = p18.props.searchTerm,
		["searchFilter"] = p18.props.searchFilter,
		["showPlugins"] = p18.props.showPlugins,
		["pluginOffsets"] = p18.props.pluginOffsets,
		["showGC"] = p18.props.showGC,
		["gcNodeOffsets"] = p18.props.gcNodeOffsets,
		["pluginGCOffsets"] = p18.props.pluginGCOffsets,
		["expandedNodes"] = p18.props.expandedNodes
	}
	local v26
	if p18.props.showAsPercentages then
		v26 = v21 / 100
	else
		v26 = nil
	end
	v25.percentageRatio = v26
	return v23(v24, v25)
end
function v17.render(p27) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_5, (copy) v_u_12, (copy) v_u_7, (copy) v_u_14, (copy) v_u_16, (copy) v_u_15, (copy) v_u_11, (copy) v_u_13, (copy) v_u_10
	local v28 = p27.props.layoutOrder
	local v29 = p27.props.size
	local v30 = nil
	if p27.props.profiling and not p27.props.data then
		v30 = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = "Press Stop to Finish Profiling",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_9.Color.Text,
			["LayoutOrder"] = v28
		})
	elseif not p27.props.data then
		v30 = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = "Start Profiling to View Data",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_9.Color.Text,
			["LayoutOrder"] = v28
		})
	end
	local v31 = v_u_5(p27.props.sessionLength)
	if v31 then
		v31 = "Session Duration: " .. v31
	end
	local v32 = v_u_2.createElement
	local v33 = {
		["SessionInfo"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v_u_12)
		}, {
			["Name"] = v_u_2.createElement(v_u_7, {
				["text"] = v31 or "Session Info",
				["size"] = UDim2.new(1 - v_u_14 * 2, -v_u_16 - v_u_15, 0, v_u_12),
				["pos"] = UDim2.new(0, v_u_15, 0, 0)
			}),
			["TopHorizontal"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["BackgroundColor3"] = v_u_11
			})
		}),
		["Header"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v_u_12),
			["Position"] = UDim2.new(0, 0, 0, v_u_12)
		}, {
			["Name"] = v_u_2.createElement(v_u_7, {
				["text"] = v_u_13[1],
				["size"] = UDim2.new(1 - v_u_14 * 2, -v_u_16 - v_u_15, 0, v_u_12),
				["pos"] = UDim2.new(0, v_u_15, 0, 0),
				["sortfunction"] = p27.onSortChanged
			}),
			["Inclusive"] = v_u_2.createElement(v_u_7, {
				["text"] = v_u_13[2],
				["size"] = UDim2.new(v_u_14, -v_u_15, 0, v_u_12),
				["pos"] = UDim2.new(1 - v_u_14 * 2, v_u_16, 0, 0),
				["sortfunction"] = p27.onSortChanged
			}),
			["Self"] = v_u_2.createElement(v_u_7, {
				["text"] = v_u_13[3],
				["size"] = UDim2.new(v_u_14, -v_u_15, 0, v_u_12),
				["pos"] = UDim2.new(1 - v_u_14, v_u_16, 0, 0),
				["sortfunction"] = p27.onSortChanged
			}),
			["TopHorizontal"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["BackgroundColor3"] = v_u_11
			}),
			["LowerHorizontal"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, v_u_10),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["BackgroundColor3"] = v_u_11
			}),
			["Vertical1"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_10, 1, 0),
				["Position"] = UDim2.new(1 - v_u_14, 0, 0, 0),
				["BackgroundColor3"] = v_u_11
			}),
			["Vertical2"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_10, 1, 0),
				["Position"] = UDim2.new(1 - v_u_14 * 2, 0, 0, 0),
				["BackgroundColor3"] = v_u_11
			})
		}),
		["Entries"] = v_u_2.createElement("ScrollingFrame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["VerticalScrollBarInset"] = nil,
			["ScrollBarThickness"] = 5,
			["CanvasSize"] = nil,
			["AutomaticCanvasSize"] = nil,
			["Size"] = UDim2.new(1, 0, 1, -v_u_12 * 2),
			["Position"] = UDim2.new(0, 0, 0, v_u_12 * 2),
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.None,
			["CanvasSize"] = UDim2.fromScale(0, 0),
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
		}, {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical
			}),
			["Children"] = v30 or v_u_2.createFragment(p27:renderChildren())
		})
	}
	return v32("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v29,
		["LayoutOrder"] = v28
	}, v33)
end
return v17