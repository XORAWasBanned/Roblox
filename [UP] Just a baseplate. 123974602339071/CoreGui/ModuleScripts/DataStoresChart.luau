-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DataStores.DataStoresChart
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
local v_u_11 = v_u_8.DataStoresFormatting.ChartHeaderNames
local v_u_12 = v_u_8.DataStoresFormatting.ValueCellWidth
local v_u_13 = v_u_8.DataStoresFormatting.CellPadding
local v_u_14 = v_u_8.DataStoresFormatting.ExpandArrowPadding
local v_u_15 = v_u_8.DataStoresFormatting.HeaderFrameHeight
local v_u_16 = v_u_8.DataStoresFormatting.EntryFrameHeight
local v_u_17 = v_u_8.GeneralFormatting.LineGraphHeight
local v_u_18 = v_u_8.GeneralFormatting.NoResultSearchStr
local v_u_19 = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local v20 = v_u_2.Component:extend("DataStoresChart")
local function v_u_22(p21) -- name: getX
	return p21.time
end
local function v_u_24(p23) -- name: getY
	return p23.value
end
local function v_u_26(p25) -- name: stringFormatY
	return math.ceil(p25)
end
function v20.init(p_u_27, p28) -- name: init
	local v29, v30 = p28.DataStoresData:getCurrentData()
	function p_u_27.getOnButtonPress(p_u_31)
		-- upvalues: (copy) p_u_27
		return function(_, _)
			-- upvalues: (ref) p_u_27, (copy) p_u_31
			local v32 = p_u_27
			local v33 = {}
			local v34
			if p_u_27.state.expandedEntry == p_u_31 then
				v34 = false
			else
				v34 = p_u_31
			end
			v33.expandedEntry = v34
			v32:setState(v33)
		end
	end
	p_u_27.state = {
		["dataStoresData"] = nil,
		["dataStoresDataCount"] = nil,
		["expandedEntry"] = nil,
		["dataStoresData"] = v29,
		["dataStoresDataCount"] = v30
	}
end
function v20.didMount(p_u_35) -- name: didMount
	p_u_35.statsConnector = p_u_35.props.DataStoresData:Signal():Connect(function(p36, p37)
		-- upvalues: (copy) p_u_35
		p_u_35:setState({
			["dataStoresData"] = p36,
			["dataStoresDataCount"] = p37
		})
	end)
end
function v20.willUnmount(p38) -- name: willUnmount
	p38.statsConnector:Disconnect()
	p38.statsConnector = nil
end
function v20.render(p39) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_6, (copy) v_u_5, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (copy) v_u_22, (copy) v_u_24, (copy) v_u_19, (copy) v_u_26, (copy) v_u_8, (copy) v_u_18, (copy) v_u_11
	local v40 = {}
	local v41 = p39.props.searchTerm
	local v42 = p39.props.size
	local v43 = p39.props.layoutOrder
	local v44 = p39.state.expandedEntry
	v40.UIListLayout = v_u_2.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	local v45 = v_u_15
	local v46 = p39.state.dataStoresData
	local v47 = 0
	local v48 = 1
	if v46 then
		for v49, v50 in pairs(v46) do
			v47 = v47 + 1
			if v41 and string.find(v49:lower(), v41:lower()) == nil then
				continue
			end
			v48 = v48 + 1
			local v51 = v44 == v49
			local v52 = v51 and v_u_16 + v_u_17 or v_u_16
			local v53 = v_u_2.createElement
			local v54 = "Frame"
			local v55 = {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v52),
				["LayoutOrder"] = v48
			}
			local v56 = {
				["DataButton"] = v_u_2.createElement(v_u_6, {
					["size"] = UDim2.new(1, 0, 0, v_u_16),
					["pos"] = UDim2.new(),
					["isExpanded"] = v51,
					["onButtonPress"] = p39.getOnButtonPress(v49)
				}, {
					[v49] = v_u_2.createElement(v_u_5, {
						["text"] = v49,
						["size"] = UDim2.new(1 - v_u_12, -v_u_13 - v_u_14, 1, 0),
						["pos"] = UDim2.new(0, v_u_13 + v_u_14, 0, 0)
					}),
					["Data"] = v_u_2.createElement(v_u_5, {
						["text"] = v50.dataSet:back().value,
						["size"] = UDim2.new(v_u_12, -v_u_13, 1, 0),
						["pos"] = UDim2.new(1 - v_u_12, v_u_13, 0, 0)
					}),
					["VerticalLine"] = v_u_2.createElement("Frame", {
						["Size"] = nil,
						["Position"] = nil,
						["BackgroundColor3"] = nil,
						["BorderSizePixel"] = 0,
						["Size"] = UDim2.new(0, v_u_9, 0, v_u_16),
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
				})
			}
			if v51 then
				v51 = v_u_2.createElement(v_u_7, {
					["pos"] = nil,
					["size"] = nil,
					["graphData"] = nil,
					["maxY"] = nil,
					["minY"] = nil,
					["getX"] = nil,
					["getY"] = nil,
					["axisLabelX"] = "Timestamp",
					["axisLabelY"] = nil,
					["stringFormatX"] = nil,
					["stringFormatY"] = nil,
					["pos"] = UDim2.new(0, 0, 0, v_u_16),
					["size"] = UDim2.new(1, 0, 1, -v_u_16),
					["graphData"] = v50.dataSet,
					["maxY"] = v50.max,
					["minY"] = v50.min,
					["getX"] = v_u_22,
					["getY"] = v_u_24,
					["axisLabelY"] = v49,
					["stringFormatX"] = v_u_19,
					["stringFormatY"] = v_u_26
				})
			end
			v56.Graph = v51
			v40[v49] = v53(v54, v55, v56)
			v45 = v45 + v_u_16
		end
	end
	if v48 == 1 then
		if v47 == 0 then
			return v_u_2.createElement("TextLabel", {
				["Size"] = nil,
				["Text"] = "Initialize DataStoresService to view DataStore Budget.",
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = v42,
				["TextColor3"] = v_u_8.Color.Text,
				["LayoutOrder"] = v43
			})
		end
		local v57 = string.format(v_u_18, v41)
		v40.emptyResult = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = v42,
			["Text"] = v57,
			["TextColor3"] = v_u_8.Color.Text
		})
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v42,
		["LayoutOrder"] = v43
	}, {
		["Header"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 1,
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
			["vertical"] = v_u_2.createElement("Frame", {
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
			["ScrollBarThickness"] = 5,
			["CanvasSize"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = UDim2.new(0, 0, 0, v_u_15),
			["Size"] = UDim2.new(1, 0, 1, -v_u_15),
			["CanvasSize"] = UDim2.new(1, 0, 0, v45)
		}, v40)
	})
end
return v4(v20, "DataStoresData")