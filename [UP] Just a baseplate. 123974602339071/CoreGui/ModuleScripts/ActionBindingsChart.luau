-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ActionBindings.ActionBindingsChart
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v4 = require(v3.DataConsumer)
local v_u_5 = require(v3.HeaderButton)
local v_u_6 = require(v3.CellLabel)
local v_u_7 = require(script.Parent.Parent.Parent.Constants)
local v8 = v_u_7.GeneralFormatting
local v_u_9 = v8.LineWidth
local v_u_10 = v8.LineColor
local v11 = v_u_7.ActionBindingsFormatting
local v_u_12 = v11.ChartHeaderNames
local v13 = v11.ChartCellWidths
local v_u_14 = v11.HeaderFrameHeight
local v_u_15 = v11.EntryFrameHeight
local v16 = v11.CellPadding
local v_u_17 = v11.MinFrameWidth
local v18 = 0
for _, v19 in ipairs(v13) do
	v18 = v18 + v19
end
local v_u_20 = {}
local v_u_21 = {}
local v_u_22 = {}
local v23 = -v18 / 2
local v24 = UDim2.new
table.insert(v_u_20, v24(0, v16, 0, 0))
local v25 = UDim2.new
local v26 = v23 - v16
table.insert(v_u_21, v25(0.5, v26, 0, v_u_14))
local v27 = UDim2.new
local v28 = v23 - v16
table.insert(v_u_22, v27(0.5, v28, 0, v_u_15))
for _, v29 in ipairs(v13) do
	local v30 = UDim2.new
	local v31 = v23 + v16
	table.insert(v_u_20, v30(0.5, v31, 0, 0))
	local v32 = UDim2.new
	local v33 = v29 - v16
	table.insert(v_u_21, v32(0, v33, 0, v_u_14))
	local v34 = UDim2.new
	local v35 = v29 - v16
	table.insert(v_u_22, v34(0, v35, 0, v_u_15))
	v23 = v23 + v29
end
local v36 = UDim2.new
local v37 = v23 + v16
table.insert(v_u_20, v36(0.5, v37, 0, 0))
local v38 = UDim2.new
local v39 = -v18 / 2 - v16
table.insert(v_u_21, v38(0.5, v39, 0, v_u_14))
local v40 = UDim2.new
local v41 = -v18 / 2 - v16
table.insert(v_u_22, v40(0.5, v41, 0, v_u_15))
local v_u_42 = {}
for v43, v44 in ipairs(v_u_20) do
	v_u_42[v43] = UDim2.new(v44.X.Scale, v44.X.Offset - v16, v44.Y.Scale, v44.Y.Offset)
end
local v45 = v_u_2.Component:extend("ActionBindingsChart")
local function v_u_52(p46, p47) -- name: constructHeader
	-- upvalues: (copy) v_u_12, (copy) v_u_2, (copy) v_u_5, (copy) v_u_21, (copy) v_u_20, (copy) v_u_9, (copy) v_u_10, (copy) v_u_42, (copy) v_u_14
	local v48 = {}
	for v49, v50 in ipairs(v_u_12) do
		v48[v50] = v_u_2.createElement(v_u_5, {
			["text"] = v50,
			["size"] = v_u_21[v49],
			["pos"] = v_u_20[v49],
			["sortfunction"] = p46
		})
	end
	v48.upperHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_9),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["BackgroundColor3"] = v_u_10
	})
	v48.lowerHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_9),
		["Position"] = UDim2.new(0, 0, 1, -v_u_9),
		["BackgroundColor3"] = v_u_10
	})
	for v51 = 2, #v_u_42 do
		v48[string.format("VerticalLine_%d", v51)] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_9, 1, 0),
			["Position"] = v_u_42[v51],
			["BackgroundColor3"] = v_u_10
		})
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, p47, 0, v_u_14)
	}, v48)
end
local function v_u_63(p53, p54, p55) -- name: constructEntry
	-- upvalues: (copy) v_u_42, (copy) v_u_2, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6, (copy) v_u_22, (copy) v_u_20, (copy) v_u_15
	local v56 = p53.name
	local v57 = p53.actionInfo
	local v58 = v57.inputTypes[1]
	local v59 = tostring(v58)
	local v60 = v57.isCore and "Core" or "Developer"
	local v61 = {}
	for v62 = 2, #v_u_42 do
		v61[string.format("line_%d", v62)] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_9, 1, 0),
			["Position"] = v_u_42[v62],
			["BackgroundColor3"] = v_u_10
		})
	end
	v61[v56] = v_u_2.createElement(v_u_6, {
		["text"] = v59,
		["size"] = v_u_22[1],
		["pos"] = v_u_20[1]
	})
	v61.priorityLevel = v_u_2.createElement(v_u_6, {
		["text"] = v57.priorityLevel,
		["size"] = v_u_22[2],
		["pos"] = v_u_20[2]
	})
	v61.isCore = v_u_2.createElement(v_u_6, {
		["text"] = v60,
		["size"] = v_u_22[3],
		["pos"] = v_u_20[3]
	})
	v61.actionName = v_u_2.createElement(v_u_6, {
		["text"] = v56,
		["size"] = v_u_22[4],
		["pos"] = v_u_20[4]
	})
	v61.inputTypes = v_u_2.createElement(v_u_6, {
		["text"] = v59,
		["size"] = v_u_22[5],
		["pos"] = v_u_20[5]
	})
	v61.lowerHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_9),
		["Position"] = UDim2.new(0, 0, 1, 0),
		["BackgroundColor3"] = v_u_10
	})
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(0, p54, 0, v_u_15),
		["LayoutOrder"] = p55
	}, v61)
end
function v45.init(p_u_64, p_u_65) -- name: init
	-- upvalues: (copy) v_u_2
	local v66 = p_u_65.ActionBindingsData:getCurrentData()
	function p_u_64.onSortChanged(p67)
		-- upvalues: (copy) p_u_65, (copy) p_u_64
		if p67 == p_u_65.ActionBindingsData:getSortType() then
			p_u_64:setState({
				["reverseSort"] = not p_u_64.state.reverseSort
			})
		else
			p_u_65.ActionBindingsData:setSortType(p67)
			p_u_64:setState({
				["reverseSort"] = false
			})
		end
	end
	function p_u_64.onCanvasPosChanged()
		-- upvalues: (copy) p_u_64
		local v68 = p_u_64.scrollingRef.current.CanvasPosition
		if p_u_64.state.canvasPos ~= v68 then
			p_u_64:setState({
				["canvasPos"] = v68
			})
		end
	end
	p_u_64.scrollingRef = v_u_2.createRef()
	p_u_64.state = {
		["actionBindingEntries"] = nil,
		["reverseSort"] = false,
		["actionBindingEntries"] = v66
	}
end
function v45.willUpdate(p69) -- name: willUpdate
	if p69.canvasPosConnector then
		p69.canvasPosConnector:Disconnect()
	end
end
function v45.didUpdate(p70) -- name: didUpdate
	if p70.scrollingRef.current then
		p70.canvasPosConnector = p70.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p70.onCanvasPosChanged)
		local v71 = p70.scrollingRef.current.AbsoluteSize
		local v72 = p70.state.absScrollSize
		if v71.X ~= v72.X or v71.Y ~= v72.Y then
			p70:setState({
				["absScrollSize"] = v71
			})
		end
	end
end
function v45.didMount(p_u_73) -- name: didMount
	p_u_73.bindingsUpdated = p_u_73.props.ActionBindingsData:Signal():Connect(function(p74)
		-- upvalues: (copy) p_u_73
		p_u_73:setState({
			["actionBindingEntries"] = p74
		})
	end)
	if p_u_73.scrollingRef.current then
		p_u_73.canvasPosConnector = p_u_73.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p_u_73.onCanvasPosChanged)
		p_u_73:setState({
			["absScrollSize"] = p_u_73.scrollingRef.current.AbsoluteSize,
			["canvasPos"] = p_u_73.scrollingRef.current.CanvasPosition
		})
	end
end
function v45.willUnmount(p75) -- name: willUnmount
	p75.bindingsUpdated:Disconnect()
	p75.bindingsUpdated = nil
	p75.canvasPosConnector:Disconnect()
	p75.canvasPosConnector = nil
end
function v45.render(p76) -- name: render
	-- upvalues: (copy) v_u_17, (copy) v_u_2, (copy) v_u_15, (copy) v_u_63, (copy) v_u_10, (copy) v_u_52, (copy) v_u_14, (copy) v_u_7
	local v77 = {}
	local v78 = p76.props.searchTerm
	local v79 = p76.props.size
	local v80 = p76.props.layoutOrder
	local v81 = p76.state.actionBindingEntries
	local v82 = p76.state.reverseSort
	local v83 = p76.state.canvasPos
	local v84 = p76.state.absScrollSize
	local v85, v86, v87, v88, v89, v90, v91
	if not v84 then
		v96 = v_u_17
		v77.UIListLayout = v_u_2.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
		v99 = #v81
		v100 = 0
		if v84 and v83 then
			v85 = -1
			v86 = 0
			v87 = 0
			for v101, v102 in ipairs(v81) do
				if v78 then
					v88 = v102.actionInfo.inputTypes[1]
					v89 = tostring(v88)
					v90 = string.find(v89:lower(), v78:lower()) ~= nil or string.find(v102.name:lower(), v78:lower()) ~= nil
				else
					v90 = false
				end
				if v78 and not v90 then
					continue
				end
				if v100 + v_u_15 >= v83.Y then
					if v86 < v84.Y then
						if v82 then
							v91 = v99 - v101 or v101
						else
							v91 = v101
						end
						v77[v101] = v_u_63(v102, v96, v91 + 1)
					end
					if v85 < 0 then
						v85 = v100
					else
						v86 = v86 + v_u_15
					end
					v87 = v87 + 1
				end
				v100 = v100 + v_u_15
			end
			if v87 == 0 then
				v77.NoneFound = v_u_2.createElement("TextLabel", {
					["Size"] = nil,
					["Text"] = "No ActionBindings Found",
					["TextColor3"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["TextColor3"] = v_u_10
				})
			else
				v77.WindowingPadding = v_u_2.createElement("Frame", {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.new(1, 0, 0, v85)
				})
			end
		end
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["LayoutOrder"] = nil,
			["Size"] = v79,
			["LayoutOrder"] = v80
		}, {
			["Header"] = v_u_52(p76.onSortChanged, v96),
			["MainChart"] = v_u_2.createElement("ScrollingFrame", {
				["Position"] = UDim2.new(0, 0, 0, v_u_14),
				["Size"] = UDim2.new(1, 0, 1, -v_u_14),
				["CanvasSize"] = UDim2.new(0, v96, 0, v100),
				["ScrollBarThickness"] = 6,
				["BackgroundColor3"] = v_u_7.Color.BaseGray,
				["BackgroundTransparency"] = 1,
				[v_u_2.Ref] = p76.scrollingRef
			}, v77)
		})
	end
	local v94 = v84.X
	local v95 = v_u_17
	local v96 = math.max(v94, v95)
	if v96 then
		v77.UIListLayout = v_u_2.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
		v99 = #v81
		v100 = 0
		if v84 and v83 then
			v85 = -1
			v86 = 0
			v87 = 0
			for v101, v102 in ipairs(v81) do
				if v78 then
					v88 = v102.actionInfo.inputTypes[1]
					v89 = tostring(v88)
					v90 = string.find(v89:lower(), v78:lower()) ~= nil or string.find(v102.name:lower(), v78:lower()) ~= nil
				else
					v90 = false
				end
				if v78 and not v90 then
					continue
				end
				if v100 + v_u_15 >= v83.Y then
					if v86 < v84.Y then
						if v82 then
							v91 = v99 - v101 or v101
						else
							v91 = v101
						end
						v77[v101] = v_u_63(v102, v96, v91 + 1)
					end
					if v85 < 0 then
						v85 = v100
					else
						v86 = v86 + v_u_15
					end
					v87 = v87 + 1
				end
				v100 = v100 + v_u_15
			end
			if v87 == 0 then
				v77.NoneFound = v_u_2.createElement("TextLabel", {
					["Size"] = nil,
					["Text"] = "No ActionBindings Found",
					["TextColor3"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["TextColor3"] = v_u_10
				})
			else
				v77.WindowingPadding = v_u_2.createElement("Frame", {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.new(1, 0, 0, v85)
				})
			end
		end
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["LayoutOrder"] = nil,
			["Size"] = v79,
			["LayoutOrder"] = v80
		}, {
			["Header"] = v_u_52(p76.onSortChanged, v96),
			["MainChart"] = v_u_2.createElement("ScrollingFrame", {
				["Position"] = UDim2.new(0, 0, 0, v_u_14),
				["Size"] = UDim2.new(1, 0, 1, -v_u_14),
				["CanvasSize"] = UDim2.new(0, v96, 0, v100),
				["ScrollBarThickness"] = 6,
				["BackgroundColor3"] = v_u_7.Color.BaseGray,
				["BackgroundTransparency"] = 1,
				[v_u_2.Ref] = p76.scrollingRef
			}, v77)
		})
	end
	v96 = v_u_17
	v77.UIListLayout = v_u_2.createElement("UIListLayout", {
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	local v99 = #v81
	local v100 = 0
	if v84 and v83 then
		v85 = -1
		v86 = 0
		v87 = 0
		for v101, v102 in ipairs(v81) do
			if v78 then
				v88 = v102.actionInfo.inputTypes[1]
				v89 = tostring(v88)
				v90 = string.find(v89:lower(), v78:lower()) ~= nil or string.find(v102.name:lower(), v78:lower()) ~= nil
			else
				v90 = false
			end
			if v78 and not v90 then
				continue
			end
			if v100 + v_u_15 >= v83.Y then
				if v86 < v84.Y then
					if v82 then
						v91 = v99 - v101 or v101
					else
						v91 = v101
					end
					v77[v101] = v_u_63(v102, v96, v91 + 1)
				end
				if v85 < 0 then
					v85 = v100
				else
					v86 = v86 + v_u_15
				end
				v87 = v87 + 1
			end
			v100 = v100 + v_u_15
		end
		if v87 == 0 then
			v77.NoneFound = v_u_2.createElement("TextLabel", {
				["Size"] = nil,
				["Text"] = "No ActionBindings Found",
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["TextColor3"] = v_u_10
			})
		else
			v77.WindowingPadding = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, 0, 0, v85)
			})
		end
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["LayoutOrder"] = nil,
		["Size"] = v79,
		["LayoutOrder"] = v80
	}, {
		["Header"] = v_u_52(p76.onSortChanged, v96),
		["MainChart"] = v_u_2.createElement("ScrollingFrame", {
			["Position"] = UDim2.new(0, 0, 0, v_u_14),
			["Size"] = UDim2.new(1, 0, 1, -v_u_14),
			["CanvasSize"] = UDim2.new(0, v96, 0, v100),
			["ScrollBarThickness"] = 6,
			["BackgroundColor3"] = v_u_7.Color.BaseGray,
			["BackgroundTransparency"] = 1,
			[v_u_2.Ref] = p76.scrollingRef
		}, v77)
	})
end
return v4(v45, "ActionBindingsData")