-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Memory.MemoryViewEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(v3.BannerButton)
local v_u_6 = require(v3.LineGraph)
local v7 = require(script.Parent.Parent.Parent.Constants)
local v_u_8 = v7.GeneralFormatting.LineWidth
local v_u_9 = v7.GeneralFormatting.LineColor
local v_u_10 = v7.MemoryFormatting.ValueCellWidth
local v_u_11 = v7.MemoryFormatting.CellPadding
local v_u_12 = v7.MemoryFormatting.ValuePadding
local v_u_13 = v7.GeneralFormatting.EntryFrameHeight
local v_u_14 = v7.MemoryFormatting.DepthIndent
local v_u_15 = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
return function(p16)
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_2, (copy) v_u_5, (copy) v_u_13, (copy) v_u_4, (copy) v_u_11, (copy) v_u_8, (copy) v_u_9, (copy) v_u_12, (copy) v_u_6, (copy) v_u_15
	local v17 = p16.size
	local v18 = p16.depth
	local v19 = p16.showGraph
	local v20 = p16.dataStats
	local v21 = p16.layoutOrder
	local v22 = p16.onButtonPress
	local v23 = p16.formatValueStr
	local v24 = p16.getX
	local v25 = p16.getY
	local v26 = v18 * v_u_14
	local v27 = p16.name
	local v28 = p16.value
	if v20 then
		v28 = v20.dataSet:back().data
	end
	local v29 = UDim.new(1 - v_u_10, -v26)
	local v30 = v_u_2.createElement
	local v31 = "Frame"
	local v32 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v17,
		["LayoutOrder"] = v21
	}
	local v33 = {}
	local v34 = v_u_2.createElement
	local v35 = v_u_5
	local v36 = {
		["size"] = UDim2.new(1, -v26, 0, v_u_13),
		["pos"] = UDim2.new(0, v26, 0, 0),
		["isExpanded"] = v19,
		["onButtonPress"] = v22
	}
	local v37 = {
		["name"] = v_u_2.createElement(v_u_4, {
			["text"] = v27,
			["size"] = UDim2.new(v29, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, v_u_11, 0, 0)
		}),
		["horizonal1"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, -v26, 0, v_u_8),
			["Position"] = UDim2.new(0, v26, 0, 0),
			["BackgroundColor3"] = v_u_9
		}),
		["horizonal2"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, -v26, 0, v_u_8),
			["Position"] = UDim2.new(0, v26, 1, 0),
			["BackgroundColor3"] = v_u_9
		})
	}
	v33.button = v34(v35, v36, v37)
	if v28 then
		v28 = v_u_2.createElement(v_u_4, {
			["text"] = v23(v28),
			["size"] = UDim2.new(v_u_10, -v_u_12, 0, v_u_13),
			["pos"] = UDim2.new(1 - v_u_10, v_u_12, 0, 0)
		})
	end
	v33.value = v28
	v33.vertical = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, 1, 0, v_u_13),
		["Position"] = UDim2.new(1 - v_u_10, 0, 0, 0),
		["BackgroundColor3"] = v_u_9
	})
	if v19 then
		v19 = v_u_2.createElement(v_u_6, {
			["pos"] = nil,
			["size"] = nil,
			["graphData"] = nil,
			["maxY"] = nil,
			["minY"] = nil,
			["getX"] = nil,
			["getY"] = nil,
			["stringFormatX"] = nil,
			["stringFormatY"] = nil,
			["axisLabelX"] = "Timestamp",
			["axisLabelY"] = nil,
			["pos"] = UDim2.new(0, 0, 0, v_u_13),
			["size"] = UDim2.new(1, 0, 1, -v_u_13),
			["graphData"] = v20.dataSet,
			["maxY"] = v20.max,
			["minY"] = v20.min,
			["getX"] = v24,
			["getY"] = v25,
			["stringFormatX"] = v_u_15,
			["stringFormatY"] = v23,
			["axisLabelY"] = v27
		})
	end
	v33.Graph = v19
	return v30(v31, v32, v33)
end