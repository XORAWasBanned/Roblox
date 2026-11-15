-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Memory.MemoryView
local v_u_1 = require(script.Parent.Flags.FFlagDevConsoleKeyCollisionFix)
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(v2.Packages.Roact)
local v5 = script.Parent.Parent.Parent.Components
local v_u_6 = require(v5.HeaderButton)
local v_u_7 = require(script.Parent.MemoryViewEntry)
local v_u_8 = require(script.Parent.Parent.Parent.Constants)
local v_u_9 = v_u_8.GeneralFormatting.LineWidth
local v_u_10 = v_u_8.GeneralFormatting.LineColor
local v_u_11 = v_u_8.MemoryFormatting.ChartHeaderNames
local v_u_12 = v_u_8.GeneralFormatting.HeaderFrameHeight
local v_u_13 = v_u_8.MemoryFormatting.ValueCellWidth
local v_u_14 = v_u_8.MemoryFormatting.CellPadding
local v_u_15 = v_u_8.MemoryFormatting.ValuePadding
local v_u_16 = v_u_8.GeneralFormatting.EntryFrameHeight
local v_u_17 = v_u_8.GeneralFormatting.LineGraphHeight
local v_u_18 = v_u_8.GeneralFormatting.NoResultSearchStr
local v_u_19 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0)
local v20 = v_u_4.Component:extend("MemoryView")
local function v_u_22(p21) -- name: getX
	return p21.time
end
local function v_u_24(p23) -- name: getY
	return p23.data
end
local function v_u_26(p25) -- name: formatValueStr
	return string.format("%.3f", p25)
end
function v20.init(p_u_27, p_u_28) -- name: init
	-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_19, (copy) v_u_4
	function p_u_27.getOnButtonPress(p_u_29, p_u_30)
		-- upvalues: (copy) p_u_27, (ref) v_u_16, (ref) v_u_3, (ref) v_u_19
		return function(_, _)
			-- upvalues: (ref) p_u_27, (copy) p_u_29, (copy) p_u_30, (ref) v_u_16, (ref) v_u_3, (ref) v_u_19
			local v31 = p_u_27.state.expandIndex ~= p_u_29 and (p_u_29 and p_u_27.scrollingRef.current)
			if v31 then
				local v32 = (p_u_30 - 2.4) * v_u_16
				v_u_3:Create(v31, v_u_19, {
					["CanvasPosition"] = Vector2.new(0, v32)
				}):Play()
			end
			local v33 = p_u_27
			local v34 = {}
			local v35
			if p_u_27.state.expandIndex == p_u_29 then
				v35 = false
			else
				v35 = p_u_29
			end
			v34.expandIndex = v35
			v33:setState(v34)
		end
	end
	function p_u_27.onSortChanged(p36)
		-- upvalues: (copy) p_u_28, (copy) p_u_27
		if p36 == p_u_28.targetMemoryData:getSortType() then
			p_u_28.targetMemoryData:setSortType(p36)
			p_u_27:setState({
				["reverseSort"] = not p_u_27.state.reverseSort
			})
		else
			p_u_28.targetMemoryData:setSortType(p36)
			p_u_27:setState({
				["reverseSort"] = false
			})
		end
	end
	function p_u_27.onCanvasPosChanged()
		-- upvalues: (copy) p_u_27
		local v37 = p_u_27.scrollingRef.current.CanvasPosition
		if p_u_27.state.canvasPos ~= v37 then
			p_u_27:setState({
				["absScrollSize"] = p_u_27.scrollingRef.current.AbsoluteSize,
				["canvasPos"] = v37
			})
		end
	end
	p_u_27.scrollingRef = v_u_4.createRef()
	p_u_27.state = {
		["memoryData"] = nil,
		["reverseSort"] = false,
		["expandIndex"] = false,
		["memoryData"] = p_u_28.targetMemoryData:getMemoryData()
	}
end
function v20.willUpdate(p38) -- name: willUpdate
	if p38.canvasPosConnector then
		p38.canvasPosConnector:Disconnect()
	end
end
function v20.didUpdate(p39) -- name: didUpdate
	if p39.scrollingRef.current then
		p39.canvasPosConnector = p39.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p39.onCanvasPosChanged)
	end
end
function v20.didMount(p_u_40) -- name: didMount
	p_u_40.treeViewItemConnector = p_u_40.props.targetMemoryData:treeUpdatedSignal():Connect(function(p41)
		-- upvalues: (copy) p_u_40
		p_u_40:setState({
			["memoryData"] = p41
		})
	end)
	if p_u_40.scrollingRef.current then
		p_u_40.canvasPosConnector = p_u_40.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p_u_40.onCanvasPosChanged)
		p_u_40:setState({
			["absScrollSize"] = p_u_40.scrollingRef.current.AbsoluteSize,
			["canvasPos"] = p_u_40.scrollingRef.current.CanvasPosition
		})
	end
end
function v20.willUnmount(p42) -- name: willUnmount
	p42.treeViewItemConnector:Disconnect()
end
function v20.appendAdditionTabInformation(p43, p44, p45, p46, p47, p48) -- name: appendAdditionTabInformation
	-- upvalues: (copy) v_u_1, (copy) v_u_16, (copy) v_u_4, (copy) v_u_7, (copy) v_u_26
	local v49 = p43.scrollingRef.current.CanvasPosition
	local v50 = p43.scrollingRef.current.AbsoluteSize
	for v51, v52 in ipairs(p45) do
		local v53 = v52.name
		local v54 = v52.value
		local v55 = p46 .. v53
		if v_u_1 then
			if v52.id then
				v55 = ("%*_%*"):format(p46, v52.id)
			else
				v55 = ("%*_%*_%*"):format(p46, v53, v51)
			end
		end
		p48.layoutOrder = p48.layoutOrder + 1
		if p48.scrollingFrameHeight + v_u_16 >= v49.Y and p48.usedFrameSpace < v50.Y then
			if not v_u_1 then
				v55 = p46 .. v53
			end
			p44[v55] = v_u_4.createElement(v_u_7, {
				["size"] = nil,
				["depth"] = nil,
				["name"] = nil,
				["showGraph"] = false,
				["value"] = nil,
				["formatValueStr"] = nil,
				["layoutOrder"] = nil,
				["size"] = UDim2.new(1, 0, 0, v_u_16),
				["depth"] = p47,
				["name"] = v53,
				["value"] = v54,
				["formatValueStr"] = v_u_26,
				["layoutOrder"] = p48.layoutOrder
			})
			if p48.paddingHeight < 0 then
				p48.paddingHeight = p48.scrollingFrameHeight
			else
				p48.usedFrameSpace = p48.usedFrameSpace + v_u_16
			end
		end
		p48.scrollingFrameHeight = p48.scrollingFrameHeight + v_u_16
		if not v52.moreInfo then
			continue
		end
		local v56 = v52.moreInfo
		if type(v56) ~= "table" then
			continue
		end
		p43:appendAdditionTabInformation(p44, v52.moreInfo, v55, p47 + 1, p48)
	end
end
function v20.recursiveConstructEntries(p57, p58, p59, p60, p61, p62) -- name: recursiveConstructEntries
	-- upvalues: (copy) v_u_1, (copy) v_u_16, (copy) v_u_17, (copy) v_u_4, (copy) v_u_7, (copy) v_u_26, (copy) v_u_22, (copy) v_u_24
	local v63 = p57.scrollingRef.current
	assert(v63, "ScrollingFrame not initialized yet")
	local v64 = p57.state.expandIndex
	local v65 = p57.props.searchTerm or ""
	local v66 = p57.state.reverseSort
	local v67 = p57.scrollingRef.current.CanvasPosition
	local v68 = p57.scrollingRef.current.AbsoluteSize
	local v69 = p59.name
	local v70
	if p62 then
		v70 = ("%*/%*"):format(p62, v69)
	else
		v70 = v69
	end
	if string.find(v69:lower(), v65:lower()) then
		if v_u_1 then
			v69 = v70
		end
		local v71 = v64 == v69
		local v72 = v71 and v_u_16 + v_u_17 or v_u_16
		p61.layoutOrder = p61.layoutOrder + 1
		if p61.scrollingFrameHeight + v72 >= v67.Y and p61.usedFrameSpace < v68.Y then
			p58[v69] = v_u_4.createElement(v_u_7, {
				["size"] = UDim2.new(1, 0, 0, v72),
				["depth"] = p60,
				["name"] = p59.name,
				["showGraph"] = v71,
				["dataStats"] = p59.dataStats,
				["onButtonPress"] = p57.getOnButtonPress(v69, p61.layoutOrder),
				["formatValueStr"] = v_u_26,
				["getX"] = v_u_22,
				["getY"] = v_u_24,
				["layoutOrder"] = p61.layoutOrder
			})
			if p61.paddingHeight < 0 then
				p61.paddingHeight = p61.scrollingFrameHeight
			else
				p61.usedFrameSpace = p61.usedFrameSpace + v72
			end
		end
		p61.scrollingFrameHeight = p61.scrollingFrameHeight + v72
		if v71 and p59.dataStats.additionalInfoFunc then
			p57:appendAdditionTabInformation(p58, p59.dataStats.additionalInfoFunc(), v69, p60 + 1, p61)
		end
	end
	local v73 = p59.dataStats.sortedChildren
	if v73 then
		if v66 then
			local v74 = #v73
			for v75 = 1, v74 do
				p57:recursiveConstructEntries(p58, v73[v74 - v75 + 1], p60 + 1, p61, v70)
			end
			return
		end
		for _, v76 in ipairs(v73) do
			p57:recursiveConstructEntries(p58, v76, p60 + 1, p61, v70)
		end
	end
end
function v20.render(p77) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_18, (copy) v_u_12, (copy) v_u_6, (copy) v_u_11, (copy) v_u_13, (copy) v_u_15, (copy) v_u_14, (copy) v_u_10, (copy) v_u_9
	local v78 = {}
	local v79 = p77.props.layoutOrder
	local v80 = p77.props.size
	local v81 = p77.props.searchTerm or ""
	local v82 = {
		["scrollingFrameHeight"] = 0,
		["paddingHeight"] = -1,
		["usedFrameSpace"] = 0,
		["layoutOrder"] = 1
	}
	if p77.scrollingRef.current then
		for _, v83 in ipairs(p77.state.memoryData) do
			p77:recursiveConstructEntries(v78, v83, 0, v82)
		end
		v78.UIListLayout = v_u_4.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
		v78.WindowingPadding = v_u_4.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v82.paddingHeight)
		})
	end
	if v82.layoutOrder == 1 then
		if v81 == "" then
			v78.noDataMessage = v_u_4.createElement("TextLabel", {
				["Size"] = nil,
				["Position"] = nil,
				["Text"] = "Awaiting Memory Stats",
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["TextColor3"] = v_u_8.Color.Text,
				["LayoutOrder"] = v79
			})
		else
			local v84 = string.format(v_u_18, v81)
			v78.noDataMessage = v_u_4.createElement("TextLabel", {
				["Size"] = nil,
				["Position"] = nil,
				["Text"] = nil,
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["Text"] = v84,
				["TextColor3"] = v_u_8.Color.Text,
				["LayoutOrder"] = v79
			})
		end
	end
	local v85 = v_u_4.createElement
	local v86 = {}
	local v87 = v_u_4.createElement
	local v88 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, v_u_12)
	}
	local v89 = {
		["Name"] = v_u_4.createElement(v_u_6, {
			["text"] = v_u_11[1],
			["size"] = UDim2.new(1 - v_u_13, -v_u_15 - v_u_14, 0, v_u_12),
			["pos"] = UDim2.new(0, v_u_14, 0, 0),
			["sortfunction"] = p77.onSortChanged
		}),
		["ValueMB"] = v_u_4.createElement(v_u_6, {
			["text"] = v_u_11[2],
			["size"] = UDim2.new(v_u_13, -v_u_14, 0, v_u_12),
			["pos"] = UDim2.new(1 - v_u_13, v_u_15, 0, 0),
			["sortfunction"] = p77.onSortChanged
		}),
		["TopHorizontal"] = v_u_4.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, 1),
			["BackgroundColor3"] = v_u_10
		}),
		["LowerHorizontal"] = v_u_4.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_9),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["BackgroundColor3"] = v_u_10
		}),
		["vertical"] = v_u_4.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_9, 1, 0),
			["Position"] = UDim2.new(1 - v_u_13, 0, 0, 0),
			["BackgroundColor3"] = v_u_10
		})
	}
	v86.Header = v87("Frame", v88, v89)
	v86.Entries = v_u_4.createElement("ScrollingFrame", {
		["Size"] = UDim2.new(1, 0, 1, -v_u_12),
		["Position"] = UDim2.new(0, 0, 0, v_u_12),
		["BackgroundTransparency"] = 1,
		["VerticalScrollBarInset"] = 1,
		["ScrollBarThickness"] = 5,
		["CanvasSize"] = UDim2.new(1, 0, 0, v82.scrollingFrameHeight),
		[v_u_4.Ref] = p77.scrollingRef
	}, v78)
	return v85("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v80,
		["LayoutOrder"] = v79
	}, v86)
end
return v20