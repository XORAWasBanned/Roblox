-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Scripts.ServerScriptsEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(v3.BannerButton)
local v_u_6 = require(v3.LineGraph)
local v7 = require(script.Parent.Parent.Parent.Constants)
local v_u_8 = v7.GeneralFormatting.LineWidth
local v_u_9 = v7.GeneralFormatting.LineColor
local v_u_10 = v7.ServerScriptsFormatting.ChartHeaderNames
local v_u_11 = v7.ServerScriptsFormatting.EntryFrameHeight
local v_u_12 = v7.ServerScriptsFormatting.ActivityBoxWidth
local v_u_13 = v7.ServerScriptsFormatting.ActivityBoxPadding
local v_u_14 = UDim2.new(0, v_u_13, 0, 0)
local v_u_15 = v7.GeneralFormatting.LineGraphHeight
local v_u_16 = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
return function(p17)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_4, (copy) v_u_14, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_15, (copy) v_u_16, (copy) v_u_10
	local v18 = p17.scriptData
	local v19 = p17.frameHeight
	local v20 = p17.showGraph
	local v21 = p17.layoutOrder
	local v22 = p17.activityBoxColor
	local v23 = p17.entryCellSize
	local v24 = p17.cellOffset
	local v25 = p17.verticalOffsets
	local v26 = p17.onButtonPress
	local v27 = p17.getX
	local v28 = p17.getActivity
	local v29 = p17.getRate
	local v30 = p17.formatScriptsData
	local v31 = v18.dataStats
	local v32 = v31.dataSet:back()
	local v33 = v_u_2.createElement
	local v34 = "Frame"
	local v35 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, v19),
		["LayoutOrder"] = v21
	}
	local v36 = {}
	local v37 = v_u_2.createElement
	local v38 = v_u_5
	local v39 = {
		["size"] = UDim2.new(1, 0, 0, v_u_11),
		["pos"] = UDim2.new(),
		["isExpanded"] = v20,
		["onButtonPress"] = v26
	}
	local v40 = {
		["ActivityBox"] = v_u_2.createElement("Frame", {
			["Size"] = UDim2.new(0, v_u_12, 0, v_u_12),
			["Position"] = UDim2.new(0, v_u_13, 0, (v_u_11 - v_u_12) / 2),
			["BackgroundColor3"] = v22
		}),
		["ScriptName"] = v_u_2.createElement(v_u_4, {
			["text"] = v18.name,
			["size"] = v23[1] - v_u_14,
			["pos"] = v24[1] + v_u_14
		}),
		["ScriptAcitivity"] = v_u_2.createElement(v_u_4, {
			["text"] = v30(v32.data[1]),
			["size"] = v23[2],
			["pos"] = v24[2]
		}),
		["scriptFreqStr"] = v_u_2.createElement(v_u_4, {
			["text"] = v30(v32.data[2]),
			["size"] = v23[3],
			["pos"] = v24[3]
		}),
		["upperHorizontalLine"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_8),
			["BackgroundColor3"] = v_u_9
		}),
		["verticalLine1"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_8, 1, 0),
			["Position"] = v25[2],
			["BackgroundColor3"] = v_u_9
		}),
		["verticalLine2"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_8, 1, 0),
			["Position"] = v25[3],
			["BackgroundColor3"] = v_u_9
		}),
		["lowerHorizontalLine"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_8),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["BackgroundColor3"] = v_u_9
		})
	}
	v36.button = v37(v38, v39, v40)
	local v41
	if v20 then
		v41 = v_u_2.createElement(v_u_6, {
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
			["pos"] = UDim2.new(0, 0, 0, v_u_11),
			["size"] = UDim2.new(1, 0, 0, v_u_15),
			["graphData"] = v31.dataSet,
			["maxY"] = v31.max[1],
			["minY"] = v31.min[1],
			["getX"] = v27,
			["getY"] = v28,
			["stringFormatX"] = v_u_16,
			["stringFormatY"] = v30,
			["axisLabelY"] = v_u_10[2]
		})
	else
		v41 = v20
	end
	v36.ActivityGraph = v41
	if v20 then
		v20 = v_u_2.createElement(v_u_6, {
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
			["pos"] = UDim2.new(0, 0, 0, v_u_11 + v_u_15),
			["size"] = UDim2.new(1, 0, 0, v_u_15),
			["graphData"] = v31.dataSet,
			["maxY"] = v31.max[2],
			["minY"] = v31.min[2],
			["getX"] = v27,
			["getY"] = v29,
			["stringFormatX"] = v_u_16,
			["stringFormatY"] = v30,
			["axisLabelY"] = v_u_10[3]
		})
	end
	v36.RateGraph = v20
	return v33(v34, v35, v36)
end