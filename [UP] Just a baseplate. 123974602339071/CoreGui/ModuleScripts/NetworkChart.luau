-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Network.NetworkChart
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(script.Parent.Parent.Parent.Constants)
local v_u_5 = v_u_4.NetworkFormatting.ChartHeaderNames
local v6 = v_u_4.NetworkFormatting.ChartCellWidths
local v7 = v_u_4.NetworkFormatting.CellPadding
local v_u_8 = v_u_4.NetworkFormatting.HeaderFrameHeight
local v_u_9 = v_u_4.NetworkFormatting.EntryFrameHeight
local v_u_10 = v_u_4.GeneralFormatting.LineWidth
local v_u_11 = v_u_4.GeneralFormatting.LineColor
local v_u_12 = v_u_4.DefaultFontSize.MainWindow
local v_u_13 = v_u_4.Font.MainWindow
local v_u_14 = v_u_4.NetworkFormatting.ResponseStrHeight
local v_u_15 = v_u_4.NetworkFormatting.ResponseWidthRatio
local v16 = script.Parent.Parent.Parent.Components
local v_u_17 = require(v16.HeaderButton)
local v_u_18 = require(script.Parent.NetworkChartEntry)
local v19 = 0
for _, v20 in pairs(v6) do
	v19 = v19 + v20
end
local v_u_21 = {}
local v22 = 0
local v_u_23 = {}
local v_u_24 = {}
for _, v25 in ipairs(v6) do
	local v26 = UDim2.new
	local v27 = v22 + v7
	table.insert(v_u_21, v26(0, v27, 0, 0))
	local v28 = UDim2.new
	local v29 = v25 - v7
	table.insert(v_u_23, v28(0, v29, 0, v_u_8))
	local v30 = UDim2.new
	local v31 = v25 - v7
	table.insert(v_u_24, v30(0, v31, 0, v_u_9))
	v22 = v22 + v25
end
local v32 = UDim2.new
local v33 = v22 + v7
table.insert(v_u_21, v32(0, v33, 0, 0))
local v34 = UDim2.new
local v35 = -v19 - v7
table.insert(v_u_23, v34(1, v35, 0, v_u_8))
local v36 = UDim2.new
local v37 = -v19 - v7
table.insert(v_u_24, v36(1, v37, 0, v_u_9))
local v_u_38 = {}
for v39, v40 in ipairs(v_u_21) do
	v_u_38[v39] = UDim2.new(v40.X.Scale, v40.X.Offset - v7, v40.Y.Scale, v40.Y.Offset)
end
local v41 = v_u_3.Component:extend("NetworkChart")
function v41.init(p_u_42) -- name: init
	-- upvalues: (copy) v_u_3
	function p_u_42.getOnExpandEntry(p_u_43)
		-- upvalues: (copy) p_u_42
		return function(_, _)
			-- upvalues: (ref) p_u_42, (copy) p_u_43
			local v44 = p_u_42
			local v45 = {}
			local v46
			if p_u_42.state.expandIndex == p_u_43 then
				v46 = false
			else
				v46 = p_u_43
			end
			v45.expandIndex = v46
			v44:setState(v45)
		end
	end
	function p_u_42.onCanvasPosChanged()
		-- upvalues: (copy) p_u_42
		local v47 = p_u_42.scrollingRef.current.CanvasPosition
		if p_u_42.state.canvasPos ~= v47 then
			p_u_42:setState({
				["absScrollSize"] = p_u_42.scrollingRef.current.AbsoluteSize,
				["canvasPos"] = v47
			})
		end
	end
	p_u_42.ref = v_u_3.createRef()
	p_u_42.scrollingRef = v_u_3.createRef()
	p_u_42.state = {
		["expandIndex"] = false
	}
end
function v41.willUpdate(p48) -- name: willUpdate
	if p48.canvasPosConnector then
		p48.canvasPosConnector:Disconnect()
	end
end
function v41.didUpdate(p49) -- name: didUpdate
	if p49.scrollingRef.current then
		p49.canvasPosConnector = p49.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p49.onCanvasPosChanged)
		local v50 = p49.scrollingRef.current.AbsoluteSize
		if p49.state.absScrollSize ~= v50 then
			p49:setState({
				["absScrollSize"] = v50
			})
		end
	end
end
function v41.didMount(p51) -- name: didMount
	if p51.scrollingRef.current then
		p51.canvasPosConnector = p51.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p51.onCanvasPosChanged)
		p51:setState({
			["absScrollSize"] = p51.scrollingRef.current.AbsoluteSize,
			["canvasPos"] = p51.scrollingRef.current.CanvasPosition
		})
	end
end
function v41.render(p52) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_17, (copy) v_u_23, (copy) v_u_21, (copy) v_u_38, (copy) v_u_10, (copy) v_u_8, (copy) v_u_11, (copy) v_u_9, (copy) v_u_14, (copy) v_u_15, (copy) v_u_2, (copy) v_u_12, (copy) v_u_13, (copy) v_u_18, (copy) v_u_24, (copy) v_u_4
	local v53 = p52.props.httpEntryList or {}
	local v54 = p52.props.chartHeight
	local v55 = p52.props.width
	local v56 = p52.props.searchTerm
	local v57 = p52.props.layoutOrder
	local v58 = p52.props.reverseSort
	local v59 = p52.props.onSortChanged
	local v60 = p52.state.expandIndex
	local v61 = p52.state.absScrollSize
	local v62 = p52.state.canvasPos
	local v63 = {}
	for v64, v65 in ipairs(v_u_5) do
		v63[v65] = v_u_3.createElement(v_u_17, {
			["text"] = v65,
			["size"] = v_u_23[v64],
			["pos"] = v_u_21[v64],
			["sortfunction"] = v59
		})
	end
	for v66 = 2, #v_u_38 do
		v63[string.format("VerticalLine_%d", v66)] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_10, 0, v_u_8),
			["Position"] = v_u_38[v66],
			["BackgroundColor3"] = v_u_11
		})
	end
	local v67 = {}
	local v68 = 0
	local v69 = -1
	local v70 = 0
	local v71 = #v53
	local v72 = 0
	v67.UIListLayout = v_u_3.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	})
	if v62 and v61 then
		for v73, v74 in ipairs(v53) do
			local v75 = v56 == "" and true or (string.find(v74.RequestType:lower(), v56:lower()) ~= nil and true or string.find(v74.Url:lower(), v56:lower()) ~= nil)
			if v74.RequestType == "Default" or not v75 then
				continue
			end
			v72 = v72 + 1
			local v76 = v60 == v74.Num
			local v77 = v_u_9
			local v78 = 0
			if v76 then
				v77 = v77 + v_u_14
				if p52.ref.current then
					local v79 = Vector2.new(p52.ref.current.AbsoluteSize.X * v_u_15, 100000000)
					v78 = v_u_14 + v_u_2:GetTextSize(v74.Response, v_u_12, v_u_13, v79).Y
					v77 = v77 + v78
				end
			end
			if v68 + v77 >= v62.Y then
				if v70 < v61.Y then
					local v80
					if v58 then
						v80 = v71 - v73 or v73
					else
						v80 = v73
					end
					v67[v73] = v_u_3.createElement(v_u_18, {
						["size"] = UDim2.new(1, 0, 0, v77),
						["entry"] = v74,
						["entryCellSize"] = v_u_24,
						["cellOffset"] = v_u_21,
						["verticalOffsets"] = v_u_38,
						["showResponse"] = v76,
						["responseBodyHeight"] = v78,
						["layoutOrder"] = v80 + 1,
						["onButtonPress"] = p52.getOnExpandEntry(v74.Num)
					})
				end
				if v69 < 0 then
					v69 = v68
				else
					v70 = v70 + v77
				end
			end
			v68 = v68 + v77
		end
		if v72 > 0 then
			v67.WindowingPadding = v_u_3.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, 0, 0, v69)
			})
		end
	end
	if v71 == 0 or v72 == 0 then
		v67["NONE FOUND"] = v_u_3.createElement("TextLabel", {
			["Size"] = nil,
			["Text"] = "No Network Entries Found",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v54),
			["TextColor3"] = v_u_4.Color.Text
		})
	end
	return v_u_3.createElement("Frame", {
		["Size"] = UDim2.new(1, 0, 0, v54),
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["LayoutOrder"] = v57,
		[v_u_3.Ref] = p52.ref
	}, {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Header"] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v_u_8)
		}, v63),
		["HorizontalLine_1"] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 0,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, 0, 0, v_u_10),
			["BackgroundColor3"] = v_u_11
		}),
		["scrollingFrameEntries"] = v_u_3.createElement("ScrollingFrame", {
			["Size"] = UDim2.new(1, 0, 1, -v_u_8),
			["CanvasSize"] = UDim2.new(0, v55, 0, v68),
			["ScrollBarThickness"] = 6,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 3,
			[v_u_3.Ref] = p52.scrollingRef
		}, v67)
	})
end
return v41