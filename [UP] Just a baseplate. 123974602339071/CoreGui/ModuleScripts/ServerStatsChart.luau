-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ServerStats.ServerStatsChart
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v4 = require(v3.DataConsumer)
local v_u_5 = require(v3.CellLabel)
local v_u_6 = require(v3.BannerButton)
local v_u_7 = require(v3.LineGraph)
local v_u_8 = require(script.Parent.Parent.Parent.Constants)
local v_u_9 = v_u_8.GeneralFormatting.LineWidth
local v_u_10 = v_u_8.GeneralFormatting.LineColor
local v_u_11 = v_u_8.ServerStatsFormatting.ChartHeaderNames
local v_u_12 = v_u_8.ServerStatsFormatting.ValueCellWidth
local v_u_13 = v_u_8.ServerStatsFormatting.CellPadding
local v_u_14 = v_u_8.ServerStatsFormatting.ExpandArrowPadding
local v_u_15 = v_u_8.ServerStatsFormatting.HeaderFrameHeight
local v_u_16 = v_u_8.ServerStatsFormatting.EntryFrameHeight
local v_u_17 = v_u_8.GeneralFormatting.LineGraphHeight
local v_u_18 = v_u_8.GeneralFormatting.NoResultSearchStr
local v_u_19 = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local v20 = v_u_2.Component:extend("ServerStats")
local function v_u_22(p21) -- name: formatData
	return string.format("%.3f", p21)
end
local function v_u_24(p23) -- name: getX
	return p23.time
end
local function v_u_26(p25) -- name: getY
	return p25.value
end
function v20.init(p_u_27) -- name: init
	local v28 = p_u_27.props.ServerStatsData:getCurrentData()
	function p_u_27.getOnButtonPress(p_u_29)
		-- upvalues: (copy) p_u_27
		return function(_, _)
			-- upvalues: (ref) p_u_27, (copy) p_u_29
			local v30 = p_u_27
			local v31 = {}
			local v32
			if p_u_27.state.expandedEntry == p_u_29 then
				v32 = false
			else
				v32 = p_u_29
			end
			v31.expandedEntry = v32
			v30:setState(v31)
		end
	end
	p_u_27.state = {
		["serverStatsData"] = v28
	}
end
function v20.didMount(p_u_33) -- name: didMount
	p_u_33.statsConnector = p_u_33.props.ServerStatsData:Signal():Connect(function(p34)
		-- upvalues: (copy) p_u_33
		p_u_33:setState({
			["serverStatsData"] = p34
		})
	end)
end
function v20.willUnmount(p35) -- name: willUnmount
	p35.statsConnector:Disconnect()
	p35.statsConnector = nil
end
function v20.render(p36) -- name: render
	-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (copy) v_u_24, (copy) v_u_26, (copy) v_u_19, (copy) v_u_22, (copy) v_u_8, (copy) v_u_18, (copy) v_u_15, (copy) v_u_11
	local v37 = {}
	local v38 = p36.props.searchTerm
	local v39 = p36.props.layoutOrder
	local v40 = p36.props.size
	local v41 = p36.state.expandedEntry
	local v42 = p36.state.serverStatsData
	local v43 = 1
	local v44 = 0
	local v45 = 0
	if v42 then
		for v46, v47 in pairs(v42) do
			v44 = v44 + 1
			if v38 and string.find(v46:lower(), v38:lower()) == nil then
				continue
			end
			v43 = v43 + 1
			local v48 = v41 == v46
			local v49 = v48 and v_u_16 + v_u_17 or v_u_16
			if v48 then
				v45 = v45 + 1 or v45
			end
			local v50 = v_u_2.createElement
			local v51 = "Frame"
			local v52 = {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v49),
				["LayoutOrder"] = v43
			}
			local v53 = {}
			local v54 = v_u_2.createElement
			local v55 = v_u_6
			local v56 = {
				["size"] = UDim2.new(1, 0, 0, v_u_16),
				["pos"] = UDim2.new(),
				["isExpanded"] = v48,
				["onButtonPress"] = p36.getOnButtonPress(v46)
			}
			local v57 = {
				[v46] = v_u_2.createElement(v_u_5, {
					["text"] = v46,
					["size"] = UDim2.new(1 - v_u_12, -v_u_13 - v_u_14, 1, 0),
					["pos"] = UDim2.new(0, v_u_13 + v_u_14, 0, 0)
				})
			}
			local v58 = v_u_2.createElement
			local v59 = v_u_5
			local v60 = {}
			local v61 = v47.dataSet:back().value
			v60.text = string.format("%.3f", v61)
			v60.size = UDim2.new(v_u_12, -v_u_13, 1, 0)
			v60.pos = UDim2.new(1 - v_u_12, v_u_13, 0, 0)
			v57.Data = v58(v59, v60)
			v57.VerticalLine = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_9, 1, 0),
				["Position"] = UDim2.new(1 - v_u_12, 0, 0, 0),
				["BackgroundColor3"] = v_u_10
			})
			v57.HorizontalAlignment = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, v_u_9),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["BackgroundColor3"] = v_u_10
			})
			v53.DataButton = v54(v55, v56, v57)
			if v48 then
				v48 = v_u_2.createElement(v_u_7, {
					["pos"] = nil,
					["size"] = nil,
					["graphData"] = nil,
					["minY"] = nil,
					["maxY"] = nil,
					["getX"] = nil,
					["getY"] = nil,
					["axisLabelX"] = "Timestamp",
					["axisLabelY"] = nil,
					["stringFormatX"] = nil,
					["stringFormatY"] = nil,
					["pos"] = UDim2.new(0, 0, 0, v_u_16),
					["size"] = UDim2.new(1, 0, 1, -v_u_16),
					["graphData"] = v47.dataSet,
					["minY"] = v47.min,
					["maxY"] = v47.max,
					["getX"] = v_u_24,
					["getY"] = v_u_26,
					["axisLabelY"] = v46,
					["stringFormatX"] = v_u_19,
					["stringFormatY"] = v_u_22
				})
			end
			v53.Graph = v48
			v37[v46] = v50(v51, v52, v53)
		end
	end
	if v43 == 1 then
		if v44 == 0 then
			return v_u_2.createElement("TextLabel", {
				["Size"] = nil,
				["Position"] = nil,
				["Text"] = "Awaiting Server Stats",
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = v40,
				["Position"] = UDim2.new(0, 0, 0, 0),
				["TextColor3"] = v_u_8.Color.Text,
				["LayoutOrder"] = v39
			})
		end
		local v62 = string.format(v_u_18, v38)
		v37.emptyResult = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = v40,
			["Text"] = v62,
			["TextColor3"] = v_u_8.Color.Text
		})
	end
	v37.UIListLayout = v_u_2.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	local v63 = v44 * v_u_16 + v45 * v_u_17
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v40,
		["LayoutOrder"] = v39
	}, {
		["Header"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v_u_15)
		}, {
			[v_u_11[1]] = v_u_2.createElement(v_u_5, {
				["text"] = v_u_11[1],
				["size"] = UDim2.new(1 - v_u_12, -v_u_13 - v_u_14, 1, 0),
				["pos"] = UDim2.new(0, v_u_13 + v_u_14, 0, 0)
			}),
			[v_u_11[2]] = v_u_2.createElement(v_u_5, {
				["text"] = v_u_11[2],
				["size"] = UDim2.new(v_u_12, -v_u_13, 1, 0),
				["pos"] = UDim2.new(1 - v_u_12, v_u_13, 0, 0)
			}),
			["upperHorizontalLine"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, v_u_9),
				["BackgroundColor3"] = v_u_10
			}),
			["VerticalLine"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_9, 1, 0),
				["Position"] = UDim2.new(1 - v_u_12, 0, 0, 0),
				["BackgroundColor3"] = v_u_10
			}),
			["lowerHorizontalLine"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, v_u_9),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["BackgroundColor3"] = v_u_10
			})
		}),
		["mainFrame"] = v_u_2.createElement("ScrollingFrame", {
			["Position"] = nil,
			["Size"] = nil,
			["CanvasSize"] = nil,
			["ScrollBarThickness"] = 5,
			["BackgroundTransparency"] = 1,
			["Position"] = UDim2.new(0, 0, 0, v_u_15),
			["Size"] = UDim2.new(1, 0, 1, -v_u_15),
			["CanvasSize"] = UDim2.new(1, 0, 0, v63)
		}, v37)
	})
end
return v4(v20, "ServerStatsData")