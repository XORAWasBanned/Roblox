-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ServerJobs.ServerJobsChart
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v4 = require(v3.DataConsumer)
local v_u_5 = require(v3.HeaderButton)
local v_u_6 = require(v3.CellLabel)
local v_u_7 = require(v3.BannerButton)
local v_u_8 = require(v3.LineGraph)
local v_u_9 = require(script.Parent.Parent.Parent.Constants)
local v_u_10 = v_u_9.GeneralFormatting.LineWidth
local v_u_11 = v_u_9.GeneralFormatting.LineColor
local v_u_12 = v_u_9.ServerJobsFormatting.ChartHeaderNames
local v13 = v_u_9.ServerJobsFormatting.ValueCellWidth
local v_u_14 = v_u_9.ServerJobsFormatting.EntryFrameHeight
local v_u_15 = v_u_9.ServerJobsFormatting.HeaderFrameHeight
local v_u_16 = v_u_9.ServerJobsFormatting.CellPadding
local v_u_17 = v_u_9.ServerJobsFormatting.MinFrameWidth
local v_u_18 = v_u_9.GeneralFormatting.LineGraphHeight
local v_u_19 = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local v_u_20 = v_u_9.GeneralFormatting.NoResultSearchStr
local v21 = v_u_14 - v_u_10
local v_u_22 = {}
local v23 = 0
local v_u_24 = {}
local v25 = {}
local v_u_29 = { function(p26)
		return p26 and string.format("%.4f%%", p26) or ""
	end, function(p27)
		return p27 and string.format("%.4f/s", p27) or ""
	end, function(p28)
		return p28 and string.format("%.4fms", p28) or ""
	end }
for _, v30 in ipairs(v13) do
	local v31 = UDim2.new
	table.insert(v_u_22, v31(v23, v_u_16, 0, 0))
	local v32 = UDim2.new
	local v33 = -v_u_16
	table.insert(v_u_24, v32(v30, v33, 0, v_u_15))
	local v34 = UDim2.new
	local v35 = -v_u_16
	table.insert(v25, v34(v30, v35, 0, v21))
	v23 = v23 + v30
end
local v_u_36 = {}
for v37, v38 in ipairs(v_u_22) do
	v_u_36[v37] = UDim2.new(v38.X.Scale, v38.X.Offset - v_u_16, v38.Y.Scale, v38.Y.Offset)
end
local v39 = v_u_2.Component:extend("ServerJobsChart")
local function v_u_41(p40) -- name: getX
	return p40.time
end
local function v_u_43(p42) -- name: getDutyCycle
	return p42.data[1]
end
local function v_u_45(p44) -- name: getStepsPerSec
	return p44.data[2]
end
local function v_u_47(p46) -- name: getStepTime
	return p46.data[3]
end
function v39.init(p_u_48, p_u_49) -- name: init
	-- upvalues: (copy) v_u_2
	local v50 = p_u_49.ServerJobsData:getCurrentData()
	function p_u_48.getOnButtonPress(p_u_51)
		-- upvalues: (copy) p_u_48
		return function(_, _)
			-- upvalues: (ref) p_u_48, (copy) p_u_51
			local v52 = p_u_48
			local v53 = {}
			local v54
			if p_u_48.state.expandIndex == p_u_51 then
				v54 = false
			else
				v54 = p_u_51
			end
			v53.expandIndex = v54
			v52:setState(v53)
		end
	end
	function p_u_48.onSortChanged(p55)
		-- upvalues: (copy) p_u_49, (copy) p_u_48
		if p55 == p_u_49.ServerJobsData:getSortType() then
			p_u_48:setState({
				["reverseSort"] = not p_u_48.state.reverseSort
			})
		else
			p_u_49.ServerJobsData:setSortType(p55)
			p_u_48:setState({
				["reverseSort"] = false
			})
		end
	end
	function p_u_48.onCanvasPosChanged()
		-- upvalues: (copy) p_u_48
		local v56 = p_u_48.scrollingRef.current.CanvasPosition
		if p_u_48.state.canvasPos ~= v56 then
			p_u_48:setState({
				["canvasPos"] = v56
			})
		end
	end
	p_u_48.scrollingRef = v_u_2.createRef()
	p_u_48.state = {
		["serverJobsList"] = nil,
		["reverseSort"] = false,
		["expandIndex"] = nil,
		["serverJobsList"] = v50
	}
end
function v39.willUpdate(p57) -- name: willUpdate
	if p57.canvasPosConnector then
		p57.canvasPosConnector:Disconnect()
	end
end
function v39.didUpdate(p58) -- name: didUpdate
	if p58.scrollingRef.current then
		p58.canvasPosConnector = p58.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p58.onCanvasPosChanged)
		local v59 = p58.scrollingRef.current.AbsoluteSize
		local v60 = p58.state.absScrollSize
		if v59.X ~= v60.X or v59.Y ~= v60.Y then
			p58:setState({
				["absScrollSize"] = v59
			})
		end
	end
end
function v39.didMount(p_u_61) -- name: didMount
	p_u_61.statsConnector = p_u_61.props.ServerJobsData:Signal():Connect(function(p62)
		-- upvalues: (copy) p_u_61
		p_u_61:setState({
			["serverJobsList"] = p62
		})
	end)
	if p_u_61.scrollingRef.current then
		p_u_61.canvasPosConnector = p_u_61.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p_u_61.onCanvasPosChanged)
		p_u_61:setState({
			["absScrollSize"] = p_u_61.scrollingRef.current.AbsoluteSize,
			["canvasPos"] = p_u_61.scrollingRef.current.CanvasPosition
		})
	end
end
function v39.willUnmount(p63) -- name: willUnmount
	p63.statsConnector:Disconnect()
	p63.statsConnector = nil
	if p63.canvasPosConnector then
		p63.canvasPosConnector:Disconnect()
		p63.canvasPosConnector = nil
	end
end
function v39.render(p64) -- name: render
	-- upvalues: (copy) v_u_17, (copy) v_u_2, (copy) v_u_9, (copy) v_u_14, (copy) v_u_18, (copy) v_u_16, (copy) v_u_6, (copy) v_u_24, (copy) v_u_22, (copy) v_u_12, (copy) v_u_29, (copy) v_u_36, (copy) v_u_10, (copy) v_u_11, (copy) v_u_7, (copy) v_u_8, (copy) v_u_41, (copy) v_u_43, (copy) v_u_19, (copy) v_u_45, (copy) v_u_47, (copy) v_u_20, (copy) v_u_5, (copy) v_u_15
	local v65 = {}
	local v66 = p64.props.searchTerm
	local v67 = p64.props.size
	local v68 = p64.props.layoutOrder
	local v69 = p64.state.serverJobsList
	local v70 = p64.state.reverseSort
	local v71 = p64.state.expandIndex
	local v72 = p64.state.canvasPos
	local v73 = p64.state.absScrollSize
	local v74, v75, v76, v77, v78, v79, v80, v109, v82, v83, v84, v85, v86, v87, v88, v89
	if not v73 then
		v99 = v_u_17
		v107 = #v69
		if v107 == 0 then
			return v_u_2.createElement("TextLabel", {
				["Size"] = nil,
				["Position"] = nil,
				["Text"] = "Awaiting Server Jobs Information",
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = v67,
				["Position"] = UDim2.new(0, 0, 0, 0),
				["TextColor3"] = v_u_9.Color.Text,
				["LayoutOrder"] = v68
			})
		end
		v108 = 0
		if v73 then
			v74 = 0
			v75 = -1
			for v109, v110 in pairs(v69) do
				v76 = v110.name
				if v66 and string.find(v76:lower(), v66:lower()) == nil then
					continue
				end
				v77 = v110.dataStats
				v78 = v77.dataSet:back()
				v79 = v71 == v76
				v80 = v79 and v_u_14 + 3 * v_u_18 / 2 + v_u_16 * 4 or v_u_14
				if v108 + v80 >= v72.Y then
					if v74 < v73.Y then
						if v70 then
							v109 = v107 - v109 or v109
						end
						v82 = {
							[v76] = v_u_2.createElement(v_u_6, {
								["text"] = v76,
								["size"] = v_u_24[1],
								["pos"] = v_u_22[1]
							})
						}
						for v111, v112 in pairs(v78.data) do
							v82[v_u_12[v111]] = v_u_2.createElement(v_u_6, {
								["text"] = v_u_29[v111](v112),
								["size"] = v_u_24[v111 + 1],
								["pos"] = v_u_22[v111 + 1]
							})
						end
						for v113 = 2, #v_u_36 do
							v82[string.format("VerticalLine_%d", v113)] = v_u_2.createElement("Frame", {
								["Size"] = nil,
								["Position"] = nil,
								["BackgroundColor3"] = nil,
								["BorderSizePixel"] = 0,
								["Size"] = UDim2.new(0, v_u_10, 1, 0),
								["Position"] = v_u_36[v113],
								["BackgroundColor3"] = v_u_11
							})
						end
						v82.lowerHorizontalLine = v_u_2.createElement("Frame", {
							["Size"] = nil,
							["Position"] = nil,
							["BackgroundColor3"] = nil,
							["BorderSizePixel"] = 0,
							["Size"] = UDim2.new(1, 0, 0, v_u_10),
							["Position"] = UDim2.new(0, 0, 1, 0),
							["BackgroundColor3"] = v_u_11
						})
						v83 = v_u_2.createElement
						v84 = "Frame"
						v85 = {
							["Size"] = nil,
							["BackgroundTransparency"] = 1,
							["LayoutOrder"] = nil,
							["Size"] = UDim2.new(0, v99, 0, v80),
							["LayoutOrder"] = v109 + 1
						}
						v86 = {
							["Button"] = v_u_2.createElement(v_u_7, {
								["size"] = UDim2.new(1, 0, 0, v_u_14),
								["pos"] = UDim2.new(),
								["isExpanded"] = v79,
								["onButtonPress"] = p64.getOnButtonPress(v76)
							}, v82)
						}
						if v79 then
							v87 = v_u_2.createElement(v_u_8, {
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
								["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_16),
								["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
								["graphData"] = v77.dataSet,
								["maxY"] = v77.max[1],
								["minY"] = v77.min[1],
								["getX"] = v_u_41,
								["getY"] = v_u_43,
								["stringFormatX"] = v_u_19,
								["stringFormatY"] = v_u_29[1],
								["axisLabelY"] = v76 .. " " .. v_u_12[2]
							})
						else
							v87 = v79
						end
						v86.DutyCycleGraph = v87
						if v79 then
							v88 = v_u_2.createElement(v_u_8, {
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
								["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_18 / 2 + v_u_16 * 2),
								["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
								["graphData"] = v77.dataSet,
								["maxY"] = v77.max[2],
								["minY"] = v77.min[2],
								["getX"] = v_u_41,
								["getY"] = v_u_45,
								["stringFormatX"] = v_u_19,
								["stringFormatY"] = v_u_29[2],
								["axisLabelY"] = v76 .. " " .. v_u_12[3]
							})
						else
							v88 = v79
						end
						v86.StepsPerSecGraph = v88
						if v79 then
							v79 = v_u_2.createElement(v_u_8, {
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
								["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_18 + v_u_16 * 3),
								["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
								["graphData"] = v77.dataSet,
								["maxY"] = v77.max[3],
								["minY"] = v77.min[3],
								["getX"] = v_u_41,
								["getY"] = v_u_47,
								["stringFormatX"] = v_u_19,
								["stringFormatY"] = v_u_29[3],
								["axisLabelY"] = v76 .. " " .. v_u_12[4]
							})
						end
						v86.StepTimeGraph = v79
						v65[v76] = v83(v84, v85, v86)
					end
					if v75 < 0 then
						v75 = v108
					else
						v74 = v74 + v80
					end
				end
				v108 = v108 + v80
			end
			if v75 == -1 then
				v89 = string.format(v_u_20, v66)
				v65.emptyResult = v_u_2.createElement("TextLabel", {
					["Size"] = nil,
					["Text"] = nil,
					["TextColor3"] = nil,
					["BackgroundTransparency"] = 1,
					["Size"] = v67,
					["Text"] = v89,
					["TextColor3"] = v_u_9.Color.Text
				})
			else
				v65.WindowingPadding = v_u_2.createElement("Frame", {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.new(1, 0, 0, v75)
				})
			end
		end
		v114 = {}
		for v115 = 1, #v_u_12 do
			v114[v_u_12[v115]] = v_u_2.createElement(v_u_5, {
				["text"] = v_u_12[v115],
				["size"] = v_u_24[v115],
				["pos"] = v_u_22[v115],
				["sortfunction"] = p64.onSortChanged
			})
		end
		v114.upperHorizontalLine = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_10),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["BackgroundColor3"] = v_u_11
		})
		v114.lowerHorizontalLine = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_10),
			["Position"] = UDim2.new(0, 0, 1, -v_u_10),
			["BackgroundColor3"] = v_u_11
		})
		for v116 = 2, #v_u_36 do
			v114[string.format("VerticalLine_%d", v116)] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_10, 1, 0),
				["Position"] = v_u_36[v116],
				["BackgroundColor3"] = v_u_11
			})
		end
		v65.UIListLayout = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["LayoutOrder"] = nil,
			["Size"] = v67,
			["LayoutOrder"] = v68
		}, {
			["Header"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(0, v99, 0, v_u_15)
			}, v114),
			["MainChart"] = v_u_2.createElement("ScrollingFrame", {
				["Size"] = UDim2.new(1, 0, 1, -v_u_15),
				["Position"] = UDim2.new(0, 0, 0, v_u_15),
				["BackgroundTransparency"] = 1,
				["VerticalScrollBarInset"] = 1,
				["ScrollBarThickness"] = 5,
				["CanvasSize"] = UDim2.new(0, v99, 0, v108),
				[v_u_2.Ref] = p64.scrollingRef
			}, v65)
		})
	end
	local v97 = v73.X
	local v98 = v_u_17
	local v99 = math.max(v97, v98)
	if v99 then
		v107 = #v69
		if v107 == 0 then
			return v_u_2.createElement("TextLabel", {
				["Size"] = nil,
				["Position"] = nil,
				["Text"] = "Awaiting Server Jobs Information",
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = v67,
				["Position"] = UDim2.new(0, 0, 0, 0),
				["TextColor3"] = v_u_9.Color.Text,
				["LayoutOrder"] = v68
			})
		end
		v108 = 0
		if v73 then
			v74 = 0
			v75 = -1
			for v109, v110 in pairs(v69) do
				v76 = v110.name
				if v66 and string.find(v76:lower(), v66:lower()) == nil then
					continue
				end
				v77 = v110.dataStats
				v78 = v77.dataSet:back()
				v79 = v71 == v76
				v80 = v79 and v_u_14 + 3 * v_u_18 / 2 + v_u_16 * 4 or v_u_14
				if v108 + v80 >= v72.Y then
					if v74 < v73.Y then
						if v70 then
							v109 = v107 - v109 or v109
						end
						v82 = {
							[v76] = v_u_2.createElement(v_u_6, {
								["text"] = v76,
								["size"] = v_u_24[1],
								["pos"] = v_u_22[1]
							})
						}
						for v111, v112 in pairs(v78.data) do
							v82[v_u_12[v111]] = v_u_2.createElement(v_u_6, {
								["text"] = v_u_29[v111](v112),
								["size"] = v_u_24[v111 + 1],
								["pos"] = v_u_22[v111 + 1]
							})
						end
						for v113 = 2, #v_u_36 do
							v82[string.format("VerticalLine_%d", v113)] = v_u_2.createElement("Frame", {
								["Size"] = nil,
								["Position"] = nil,
								["BackgroundColor3"] = nil,
								["BorderSizePixel"] = 0,
								["Size"] = UDim2.new(0, v_u_10, 1, 0),
								["Position"] = v_u_36[v113],
								["BackgroundColor3"] = v_u_11
							})
						end
						v82.lowerHorizontalLine = v_u_2.createElement("Frame", {
							["Size"] = nil,
							["Position"] = nil,
							["BackgroundColor3"] = nil,
							["BorderSizePixel"] = 0,
							["Size"] = UDim2.new(1, 0, 0, v_u_10),
							["Position"] = UDim2.new(0, 0, 1, 0),
							["BackgroundColor3"] = v_u_11
						})
						v83 = v_u_2.createElement
						v84 = "Frame"
						v85 = {
							["Size"] = nil,
							["BackgroundTransparency"] = 1,
							["LayoutOrder"] = nil,
							["Size"] = UDim2.new(0, v99, 0, v80),
							["LayoutOrder"] = v109 + 1
						}
						v86 = {
							["Button"] = v_u_2.createElement(v_u_7, {
								["size"] = UDim2.new(1, 0, 0, v_u_14),
								["pos"] = UDim2.new(),
								["isExpanded"] = v79,
								["onButtonPress"] = p64.getOnButtonPress(v76)
							}, v82)
						}
						if v79 then
							v87 = v_u_2.createElement(v_u_8, {
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
								["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_16),
								["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
								["graphData"] = v77.dataSet,
								["maxY"] = v77.max[1],
								["minY"] = v77.min[1],
								["getX"] = v_u_41,
								["getY"] = v_u_43,
								["stringFormatX"] = v_u_19,
								["stringFormatY"] = v_u_29[1],
								["axisLabelY"] = v76 .. " " .. v_u_12[2]
							})
						else
							v87 = v79
						end
						v86.DutyCycleGraph = v87
						if v79 then
							v88 = v_u_2.createElement(v_u_8, {
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
								["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_18 / 2 + v_u_16 * 2),
								["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
								["graphData"] = v77.dataSet,
								["maxY"] = v77.max[2],
								["minY"] = v77.min[2],
								["getX"] = v_u_41,
								["getY"] = v_u_45,
								["stringFormatX"] = v_u_19,
								["stringFormatY"] = v_u_29[2],
								["axisLabelY"] = v76 .. " " .. v_u_12[3]
							})
						else
							v88 = v79
						end
						v86.StepsPerSecGraph = v88
						if v79 then
							v79 = v_u_2.createElement(v_u_8, {
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
								["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_18 + v_u_16 * 3),
								["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
								["graphData"] = v77.dataSet,
								["maxY"] = v77.max[3],
								["minY"] = v77.min[3],
								["getX"] = v_u_41,
								["getY"] = v_u_47,
								["stringFormatX"] = v_u_19,
								["stringFormatY"] = v_u_29[3],
								["axisLabelY"] = v76 .. " " .. v_u_12[4]
							})
						end
						v86.StepTimeGraph = v79
						v65[v76] = v83(v84, v85, v86)
					end
					if v75 < 0 then
						v75 = v108
					else
						v74 = v74 + v80
					end
				end
				v108 = v108 + v80
			end
			if v75 == -1 then
				v89 = string.format(v_u_20, v66)
				v65.emptyResult = v_u_2.createElement("TextLabel", {
					["Size"] = nil,
					["Text"] = nil,
					["TextColor3"] = nil,
					["BackgroundTransparency"] = 1,
					["Size"] = v67,
					["Text"] = v89,
					["TextColor3"] = v_u_9.Color.Text
				})
			else
				v65.WindowingPadding = v_u_2.createElement("Frame", {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.new(1, 0, 0, v75)
				})
			end
		end
		v114 = {}
		for v115 = 1, #v_u_12 do
			v114[v_u_12[v115]] = v_u_2.createElement(v_u_5, {
				["text"] = v_u_12[v115],
				["size"] = v_u_24[v115],
				["pos"] = v_u_22[v115],
				["sortfunction"] = p64.onSortChanged
			})
		end
		v114.upperHorizontalLine = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_10),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["BackgroundColor3"] = v_u_11
		})
		v114.lowerHorizontalLine = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_10),
			["Position"] = UDim2.new(0, 0, 1, -v_u_10),
			["BackgroundColor3"] = v_u_11
		})
		for v116 = 2, #v_u_36 do
			v114[string.format("VerticalLine_%d", v116)] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_10, 1, 0),
				["Position"] = v_u_36[v116],
				["BackgroundColor3"] = v_u_11
			})
		end
		v65.UIListLayout = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["LayoutOrder"] = nil,
			["Size"] = v67,
			["LayoutOrder"] = v68
		}, {
			["Header"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(0, v99, 0, v_u_15)
			}, v114),
			["MainChart"] = v_u_2.createElement("ScrollingFrame", {
				["Size"] = UDim2.new(1, 0, 1, -v_u_15),
				["Position"] = UDim2.new(0, 0, 0, v_u_15),
				["BackgroundTransparency"] = 1,
				["VerticalScrollBarInset"] = 1,
				["ScrollBarThickness"] = 5,
				["CanvasSize"] = UDim2.new(0, v99, 0, v108),
				[v_u_2.Ref] = p64.scrollingRef
			}, v65)
		})
	end
	v99 = v_u_17
	local v107 = #v69
	if v107 == 0 then
		return v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = "Awaiting Server Jobs Information",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = v67,
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_9.Color.Text,
			["LayoutOrder"] = v68
		})
	end
	local v108 = 0
	if v73 then
		v74 = 0
		v75 = -1
		for v109, v110 in pairs(v69) do
			v76 = v110.name
			if v66 and string.find(v76:lower(), v66:lower()) == nil then
				continue
			end
			v77 = v110.dataStats
			v78 = v77.dataSet:back()
			v79 = v71 == v76
			v80 = v79 and v_u_14 + 3 * v_u_18 / 2 + v_u_16 * 4 or v_u_14
			if v108 + v80 >= v72.Y then
				if v74 < v73.Y then
					if v70 then
						v109 = v107 - v109 or v109
					end
					v82 = {
						[v76] = v_u_2.createElement(v_u_6, {
							["text"] = v76,
							["size"] = v_u_24[1],
							["pos"] = v_u_22[1]
						})
					}
					for v111, v112 in pairs(v78.data) do
						v82[v_u_12[v111]] = v_u_2.createElement(v_u_6, {
							["text"] = v_u_29[v111](v112),
							["size"] = v_u_24[v111 + 1],
							["pos"] = v_u_22[v111 + 1]
						})
					end
					for v113 = 2, #v_u_36 do
						v82[string.format("VerticalLine_%d", v113)] = v_u_2.createElement("Frame", {
							["Size"] = nil,
							["Position"] = nil,
							["BackgroundColor3"] = nil,
							["BorderSizePixel"] = 0,
							["Size"] = UDim2.new(0, v_u_10, 1, 0),
							["Position"] = v_u_36[v113],
							["BackgroundColor3"] = v_u_11
						})
					end
					v82.lowerHorizontalLine = v_u_2.createElement("Frame", {
						["Size"] = nil,
						["Position"] = nil,
						["BackgroundColor3"] = nil,
						["BorderSizePixel"] = 0,
						["Size"] = UDim2.new(1, 0, 0, v_u_10),
						["Position"] = UDim2.new(0, 0, 1, 0),
						["BackgroundColor3"] = v_u_11
					})
					v83 = v_u_2.createElement
					v84 = "Frame"
					v85 = {
						["Size"] = nil,
						["BackgroundTransparency"] = 1,
						["LayoutOrder"] = nil,
						["Size"] = UDim2.new(0, v99, 0, v80),
						["LayoutOrder"] = v109 + 1
					}
					v86 = {
						["Button"] = v_u_2.createElement(v_u_7, {
							["size"] = UDim2.new(1, 0, 0, v_u_14),
							["pos"] = UDim2.new(),
							["isExpanded"] = v79,
							["onButtonPress"] = p64.getOnButtonPress(v76)
						}, v82)
					}
					if v79 then
						v87 = v_u_2.createElement(v_u_8, {
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
							["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_16),
							["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
							["graphData"] = v77.dataSet,
							["maxY"] = v77.max[1],
							["minY"] = v77.min[1],
							["getX"] = v_u_41,
							["getY"] = v_u_43,
							["stringFormatX"] = v_u_19,
							["stringFormatY"] = v_u_29[1],
							["axisLabelY"] = v76 .. " " .. v_u_12[2]
						})
					else
						v87 = v79
					end
					v86.DutyCycleGraph = v87
					if v79 then
						v88 = v_u_2.createElement(v_u_8, {
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
							["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_18 / 2 + v_u_16 * 2),
							["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
							["graphData"] = v77.dataSet,
							["maxY"] = v77.max[2],
							["minY"] = v77.min[2],
							["getX"] = v_u_41,
							["getY"] = v_u_45,
							["stringFormatX"] = v_u_19,
							["stringFormatY"] = v_u_29[2],
							["axisLabelY"] = v76 .. " " .. v_u_12[3]
						})
					else
						v88 = v79
					end
					v86.StepsPerSecGraph = v88
					if v79 then
						v79 = v_u_2.createElement(v_u_8, {
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
							["pos"] = UDim2.new(0, 0, 0, v_u_14 + v_u_18 + v_u_16 * 3),
							["size"] = UDim2.new(0, v99, 0, v_u_18 / 2),
							["graphData"] = v77.dataSet,
							["maxY"] = v77.max[3],
							["minY"] = v77.min[3],
							["getX"] = v_u_41,
							["getY"] = v_u_47,
							["stringFormatX"] = v_u_19,
							["stringFormatY"] = v_u_29[3],
							["axisLabelY"] = v76 .. " " .. v_u_12[4]
						})
					end
					v86.StepTimeGraph = v79
					v65[v76] = v83(v84, v85, v86)
				end
				if v75 < 0 then
					v75 = v108
				else
					v74 = v74 + v80
				end
			end
			v108 = v108 + v80
		end
		if v75 == -1 then
			v89 = string.format(v_u_20, v66)
			v65.emptyResult = v_u_2.createElement("TextLabel", {
				["Size"] = nil,
				["Text"] = nil,
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = v67,
				["Text"] = v89,
				["TextColor3"] = v_u_9.Color.Text
			})
		else
			v65.WindowingPadding = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, 0, 0, v75)
			})
		end
	end
	local v114 = {}
	for v115 = 1, #v_u_12 do
		v114[v_u_12[v115]] = v_u_2.createElement(v_u_5, {
			["text"] = v_u_12[v115],
			["size"] = v_u_24[v115],
			["pos"] = v_u_22[v115],
			["sortfunction"] = p64.onSortChanged
		})
	end
	v114.upperHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_10),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["BackgroundColor3"] = v_u_11
	})
	v114.lowerHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_10),
		["Position"] = UDim2.new(0, 0, 1, -v_u_10),
		["BackgroundColor3"] = v_u_11
	})
	for v116 = 2, #v_u_36 do
		v114[string.format("VerticalLine_%d", v116)] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_10, 1, 0),
			["Position"] = v_u_36[v116],
			["BackgroundColor3"] = v_u_11
		})
	end
	v65.UIListLayout = v_u_2.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["LayoutOrder"] = nil,
		["Size"] = v67,
		["LayoutOrder"] = v68
	}, {
		["Header"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0, v99, 0, v_u_15)
		}, v114),
		["MainChart"] = v_u_2.createElement("ScrollingFrame", {
			["Size"] = UDim2.new(1, 0, 1, -v_u_15),
			["Position"] = UDim2.new(0, 0, 0, v_u_15),
			["BackgroundTransparency"] = 1,
			["VerticalScrollBarInset"] = 1,
			["ScrollBarThickness"] = 5,
			["CanvasSize"] = UDim2.new(0, v99, 0, v108),
			[v_u_2.Ref] = p64.scrollingRef
		}, v65)
	})
end
return v4(v39, "ServerJobsData")