-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Scripts.ServerScripts
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v4 = require(script.Parent.Parent.Parent.Components.DataConsumer)
local v_u_5 = require(v3.HeaderButton)
local v_u_6 = require(script.Parent.ServerScriptsEntry)
local v_u_7 = require(script.Parent.Parent.Parent.Constants)
local v_u_8 = v_u_7.GeneralFormatting.LineWidth
local v_u_9 = v_u_7.GeneralFormatting.LineColor
local v10 = v_u_7.ServerScriptsFormatting.ChartCellWidths
local v_u_11 = v_u_7.ServerScriptsFormatting.ChartHeaderNames
local v_u_12 = v_u_7.ServerScriptsFormatting.HeaderFrameHeight
local v_u_13 = v_u_7.ServerScriptsFormatting.EntryFrameHeight
local v14 = v_u_7.ServerScriptsFormatting.CellPadding
local v_u_15 = v_u_7.GeneralFormatting.LineGraphHeight
local v_u_16 = v_u_7.GeneralFormatting.NoResultSearchStr
local v_u_17 = {}
local v18 = 0
local v_u_19 = {}
local v_u_20 = {}
for _, v21 in ipairs(v10) do
	local v22 = UDim2.new
	table.insert(v_u_17, v22(v18, v14, 0, 0))
	local v23 = UDim2.new
	local v24 = -v14
	table.insert(v_u_19, v23(v21, v24, 0, v_u_12))
	local v25 = UDim2.new
	local v26 = -v14
	table.insert(v_u_20, v25(v21, v26, 0, v_u_13))
	v18 = v18 + v21
end
local v_u_27 = {}
for v28, v29 in ipairs(v_u_17) do
	v_u_27[v28] = UDim2.new(v29.X.Scale, v29.X.Offset - v14, v29.Y.Scale, v29.Y.Offset)
end
local v30 = v_u_2.Component:extend("ServerScripts")
local function v_u_34(p31) -- name: constructHeader
	-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_5, (copy) v_u_19, (copy) v_u_17, (copy) v_u_8, (copy) v_u_9, (copy) v_u_27, (copy) v_u_12
	local v32 = {}
	for v33 = 1, #v_u_11 do
		v32[v_u_11[v33]] = v_u_2.createElement(v_u_5, {
			["text"] = v_u_11[v33],
			["size"] = v_u_19[v33],
			["pos"] = v_u_17[v33],
			["sortfunction"] = p31
		})
	end
	v32.upperHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_8),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["BackgroundColor3"] = v_u_9
	})
	v32.verticalLine1 = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, v_u_8, 1, 0),
		["Position"] = v_u_27[2],
		["BackgroundColor3"] = v_u_9
	})
	v32.verticalLine2 = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, v_u_8, 1, 0),
		["Position"] = v_u_27[3],
		["BackgroundColor3"] = v_u_9
	})
	v32.lowerHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_8),
		["Position"] = UDim2.new(0, 0, 1, 0),
		["BackgroundColor3"] = v_u_9
	})
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, v_u_12)
	}, v32)
end
local function v_u_36(p35) -- name: getX
	return p35.time
end
local function v_u_38(p37) -- name: getActivity
	return p37.data[1]
end
local function v_u_40(p39) -- name: getRate
	return p39.data[2]
end
local function v_u_42(p41) -- name: formatScriptsData
	return string.format("%.3f", p41)
end
function v30.init(p_u_43, p_u_44) -- name: init
	-- upvalues: (copy) v_u_2
	local v45 = p_u_44.ServerScriptsData:getCurrentData()
	function p_u_43.onSortChanged(p46)
		-- upvalues: (copy) p_u_44, (copy) p_u_43
		if p46 == p_u_44.ServerScriptsData:getSortType() then
			p_u_43:setState({
				["reverseSort"] = not p_u_43.state.reverseSort
			})
		else
			p_u_44.ServerScriptsData:setSortType(p46)
			p_u_43:setState({
				["reverseSort"] = false
			})
		end
	end
	function p_u_43.getOnButtonPress(p_u_47)
		-- upvalues: (copy) p_u_43
		return function(_, _)
			-- upvalues: (ref) p_u_43, (copy) p_u_47
			local v48 = p_u_43
			local v49 = {}
			local v50
			if p_u_43.state.expandIndex == p_u_47 then
				v50 = false
			else
				v50 = p_u_47
			end
			v49.expandIndex = v50
			v48:setState(v49)
		end
	end
	function p_u_43.onCanvasPosChanged()
		-- upvalues: (copy) p_u_43
		local v51 = p_u_43.scrollingRef.current.CanvasPosition
		if p_u_43.state.canvasPos ~= v51 then
			p_u_43:setState({
				["absScrollSize"] = p_u_43.scrollingRef.current.AbsoluteSize,
				["canvasPos"] = v51
			})
		end
	end
	p_u_43.scrollingRef = v_u_2.createRef()
	p_u_43.state = {
		["serverScriptsData"] = nil,
		["expandIndex"] = nil,
		["serverScriptsData"] = v45
	}
end
function v30.willUpdate(p52) -- name: willUpdate
	if p52.canvasPosConnector then
		p52.canvasPosConnector:Disconnect()
	end
end
function v30.didUpdate(p53) -- name: didUpdate
	if p53.scrollingRef.current then
		p53.canvasPosConnector = p53.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p53.onCanvasPosChanged)
	end
end
function v30.didMount(p_u_54) -- name: didMount
	p_u_54.statsConnector = p_u_54.props.ServerScriptsData:Signal():Connect(function(p55)
		-- upvalues: (copy) p_u_54
		p_u_54:setState({
			["serverScriptsData"] = p55
		})
	end)
	if p_u_54.scrollingRef.current then
		p_u_54.canvasPosConnector = p_u_54.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p_u_54.onCanvasPosChanged)
		p_u_54:setState({
			["absScrollSize"] = p_u_54.scrollingRef.current.AbsoluteSize,
			["canvasPos"] = p_u_54.scrollingRef.current.CanvasPosition
		})
	end
end
function v30.willUnmount(p56) -- name: willUnmount
	p56.statsConnector:Disconnect()
	p56.statsConnector = nil
end
function v30.render(p57) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_13, (copy) v_u_15, (copy) v_u_6, (copy) v_u_20, (copy) v_u_17, (copy) v_u_27, (copy) v_u_42, (copy) v_u_36, (copy) v_u_38, (copy) v_u_40, (copy) v_u_16, (copy) v_u_34, (copy) v_u_12
	local v58 = p57.props.searchTerm
	local v59 = p57.props.scriptFilters
	local v60 = p57.props.layoutOrder
	local v61 = p57.props.size
	local v62 = p57.state.serverScriptsData
	local v63 = p57.state.reverseSort
	local v64 = p57.state.absScrollSize
	local v65 = p57.state.canvasPos
	local v66 = {}
	local v67 = #v62
	if v67 == 0 then
		return v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = "Awaiting Server Scripts Information.",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = v61,
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_7.Color.Text,
			["LayoutOrder"] = v60
		})
	end
	local v68 = 0
	local v69 = -1
	local v70 = 0
	local v71 = 0
	if v65 and v64 then
		for v72, v73 in pairs(v62) do
			if v58 and string.find(v73.name:lower(), v58:lower()) == nil then
				continue
			end
			v71 = v71 + 1
			local v74 = true
			local v75 = v59.Active
			local v76 = v59.Inactive
			local v77 = v73.dataStats.dataSet:back()
			if v75 ~= v76 then
				if v77.data[1] > 0 and v76 then
					v74 = false
				elseif v77.data[1] == 0 and v75 then
					v74 = false
				end
			end
			if not v74 then
				continue
			end
			local v78 = p57.state.expandIndex == v73.name
			local v79 = v78 and v_u_13 + 2 * v_u_15 or v_u_13
			if v68 + v79 >= v65.Y then
				if v70 < v64.Y then
					local v80 = v77.data[1] > 0 and v_u_7.Color.ActiveBox or v_u_7.Color.InactiveBox
					local v81
					if v63 then
						v81 = v67 - v72 or v72
					else
						v81 = v72
					end
					v66[v72] = v_u_2.createElement(v_u_6, {
						["scriptData"] = v73,
						["frameHeight"] = v79,
						["showGraph"] = v78,
						["layoutOrder"] = v81,
						["activityBoxColor"] = v80,
						["entryCellSize"] = v_u_20,
						["cellOffset"] = v_u_17,
						["verticalOffsets"] = v_u_27,
						["onButtonPress"] = p57.getOnButtonPress(v73.name),
						["formatScriptsData"] = v_u_42,
						["getX"] = v_u_36,
						["getActivity"] = v_u_38,
						["getRate"] = v_u_40,
						["stringFormatY"] = v_u_42
					})
				end
				if v69 < 0 then
					v69 = v68
				else
					v70 = v70 + v79
				end
			end
			v68 = v68 + v79
		end
		if v71 > 0 then
			v66.WindowingPadding = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, 0, 0, v69)
			})
		else
			local v82 = string.format(v_u_16, v58)
			v66.emptySearch = v_u_2.createElement("TextLabel", {
				["Size"] = nil,
				["Text"] = nil,
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = v61,
				["Text"] = v82,
				["TextColor3"] = v_u_7.Color.Text
			})
		end
	end
	v66.UIListLayout = v_u_2.createElement("UIListLayout", {
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v61,
		["LayoutOrder"] = v60
	}, {
		["Header"] = v_u_34(p57.onSortChanged),
		["Entries"] = v_u_2.createElement("ScrollingFrame", {
			["Position"] = UDim2.new(0, 0, 0, v_u_12),
			["Size"] = UDim2.new(1, 0, 1, -v_u_12),
			["BackgroundTransparency"] = 1,
			["VerticalScrollBarInset"] = 1,
			["ScrollBarThickness"] = 5,
			["CanvasSize"] = UDim2.new(1, 0, 0, v68),
			[v_u_2.Ref] = p57.scrollingRef
		}, v66)
	})
end
return v4(v30, "ServerScriptsData")