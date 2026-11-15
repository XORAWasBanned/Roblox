-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Network.NetworkView
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Parent.Constants)
local v_u_4 = v_u_3.NetworkFormatting.HeaderFrameHeight
local v_u_5 = v_u_3.NetworkFormatting.EntryFrameHeight
local v_u_6 = v_u_3.NetworkFormatting.SummaryButtonHeight
local v_u_7 = v_u_3.NetworkFormatting.MinFrameWidth
local v_u_8 = v_u_3.DefaultFontSize.MainWindow
local v_u_9 = v_u_3.Font.MainWindowHeader
local v10 = script.Parent.Parent.Parent.Components
local v_u_11 = require(v10.BannerButton)
local v_u_12 = require(v10.Network.NetworkSummary)
local v_u_13 = require(v10.Network.NetworkChart)
local v14 = v_u_2.Component:extend("NetworkView")
function v14.init(p_u_15, p_u_16) -- name: init
	-- upvalues: (copy) v_u_2
	local v17 = p_u_16.targetNetworkData
	assert(v17, "Make sure the NetworkData is assigned for this NetworkView")
	local v18 = p_u_16.targetNetworkData:getCurrentData()
	function p_u_15.onSortChanged(p19)
		-- upvalues: (copy) p_u_16, (copy) p_u_15
		if p19 == p_u_16.targetNetworkData:getSortType() then
			p_u_15:setState({
				["reverseSort"] = not p_u_15.state.reverseSort
			})
		else
			p_u_16.targetNetworkData:setSortType(p19)
			p_u_15:setState({
				["reverseSort"] = false
			})
		end
	end
	function p_u_15.onSummaryButton(_, _)
		-- upvalues: (copy) p_u_15
		p_u_15:setState({
			["summaryExpanded"] = not p_u_15.state.summaryExpanded
		})
	end
	function p_u_15.onDetailButton(_, _)
		-- upvalues: (copy) p_u_15
		p_u_15:setState({
			["entriesExpanded"] = not p_u_15.state.entriesExpanded
		})
	end
	p_u_15.ref = v_u_2.createRef()
	p_u_15.state = {
		["httpSummaryTable"] = nil,
		["httpSummaryCount"] = nil,
		["httpEntryList"] = nil,
		["summaryExpanded"] = true,
		["entriesExpanded"] = true,
		["indexOfEntryExpanded"] = 0,
		["reverseSort"] = false,
		["absWidth"] = 0,
		["httpSummaryTable"] = v18.summaryTable,
		["httpSummaryCount"] = v18.summaryCount,
		["httpEntryList"] = v18.entryList
	}
end
function v14.didUpdate(p20) -- name: didUpdate
	if p20.ref.current and p20.state.absWidth ~= p20.ref.current.AbsoluteSize.X then
		p20:setState({
			["absWidth"] = p20.ref.current.AbsoluteSize.X
		})
	end
end
function v14.didMount(p_u_21) -- name: didMount
	p_u_21.httpEntryAddedConnector = p_u_21.props.targetNetworkData:Signal():Connect(function(p22, p23, p24)
		-- upvalues: (copy) p_u_21
		p_u_21:setState({
			["httpSummaryTable"] = p22,
			["httpSummaryCount"] = p23,
			["httpEntryList"] = p24
		})
	end)
	if p_u_21.ref.current then
		p_u_21:setState({
			["absWidth"] = p_u_21.ref.current.AbsoluteSize.X
		})
	end
end
function v14.willUnmount(p25) -- name: willUnmount
	p25.httpEntryAddedConnector:Disconnect()
	p25.httpEntryAddedConnector = nil
end
function v14.render(p26) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_11, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_12, (copy) v_u_13
	local v27 = p26.props.layoutOrder
	local v28 = p26.props.searchTerm
	local v29 = p26.props.size
	local v30 = p26.state.summaryExpanded
	local v31 = p26.state.entriesExpanded
	local v32 = p26.state.reverseSort
	local v33 = p26.state.httpSummaryTable
	local v34 = p26.state.httpEntryList
	local v35 = p26.state.httpSummaryCount
	local v36 = v_u_7
	local v37 = p26.state.absWidth
	local v38 = math.max(v36, v37)
	local v39 = v_u_6 * 2
	if v30 then
		v39 = v39 + v35 * v_u_5 + v_u_4
	end
	local v40
	if p26.ref.current then
		v40 = p26.ref.current.AbsoluteSize.Y - v39
	else
		v40 = v29.Y.Offset - v39
	end
	local v41 = math.max(0, v40)
	local v42 = v_u_2.createElement
	local v43 = "Frame"
	local v44 = {
		["Size"] = v29,
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["LayoutOrder"] = v27,
		[v_u_2.Ref] = p26.ref
	}
	local v45 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v46 = v_u_2.createElement
	local v47 = v_u_11
	local v48 = {
		["size"] = nil,
		["pos"] = nil,
		["isExpanded"] = nil,
		["onButtonPress"] = nil,
		["layoutOrder"] = 1,
		["size"] = UDim2.new(1, 0, 0, v_u_6),
		["pos"] = UDim2.new(),
		["isExpanded"] = v30,
		["onButtonPress"] = p26.onSummaryButton
	}
	local v49 = {
		["Text"] = v_u_2.createElement("TextLabel", {
			["Text"] = "Summary",
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["TextColor3"] = v_u_3.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextSize"] = v_u_8,
			["Font"] = v_u_9,
			["Size"] = UDim2.new(1, -30, 0, v_u_6),
			["Position"] = UDim2.new(0, 30, 0, 0)
		})
	}
	v45.SummaryButton = v46(v47, v48, v49)
	if v30 then
		v30 = v_u_2.createElement(v_u_12, {
			["width"] = nil,
			["httpSummaryTable"] = nil,
			["layoutOrder"] = 2,
			["width"] = v38,
			["httpSummaryTable"] = v33
		})
	end
	v45.Summary = v30
	local v50 = v_u_2.createElement
	local v51 = v_u_11
	local v52 = {
		["size"] = nil,
		["pos"] = nil,
		["isExpanded"] = nil,
		["onButtonPress"] = nil,
		["layoutOrder"] = 3,
		["size"] = UDim2.new(1, 0, 0, v_u_6),
		["pos"] = UDim2.new(),
		["isExpanded"] = v31,
		["onButtonPress"] = p26.onDetailButton
	}
	local v53 = {
		["Text"] = v_u_2.createElement("TextLabel", {
			["Text"] = "Details",
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["TextColor3"] = v_u_3.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextSize"] = v_u_8,
			["Font"] = v_u_9,
			["Size"] = UDim2.new(1, -30, 0, v_u_6),
			["Position"] = UDim2.new(0, 30, 0, 0)
		})
	}
	v45.DetailsButton = v50(v51, v52, v53)
	if v31 then
		v31 = v_u_2.createElement(v_u_13, {
			["httpEntryList"] = nil,
			["chartHeight"] = nil,
			["width"] = nil,
			["searchTerm"] = nil,
			["reverseSort"] = nil,
			["layoutOrder"] = 4,
			["onSortChanged"] = nil,
			["httpEntryList"] = v34,
			["chartHeight"] = v41,
			["width"] = v38,
			["searchTerm"] = v28,
			["reverseSort"] = v32,
			["onSortChanged"] = p26.onSortChanged
		})
	end
	v45.Entries = v31
	return v42(v43, v44, v45)
end
return v14