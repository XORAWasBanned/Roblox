-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DebugVisualizations.DebugVisualizationsChart
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(v1.Workspace.Packages.LinkingProtocol).LinkingProtocol
local v4 = script.Parent.Parent.Parent.Components
local v_u_5 = require(v4.BannerButton)
local v_u_6 = require(v4.BoxButton)
local v_u_7 = require(v4.CellCheckbox)
local v_u_8 = require(v4.CellLabel)
local v9 = require(v4.DataConsumer)
local v_u_10 = require(v4.DropDown)
local v_u_11 = require(v4.HeaderButton)
local v_u_12 = require(script.Parent.Parent.Parent.Constants)
local v13 = v_u_12.GeneralFormatting
local v_u_14 = v13.LineWidth
local v_u_15 = v13.LineColor
local v16 = v_u_12.DebugVisualizationsFormatting
local v_u_17 = v16.ChartHeaderNames
local v18 = v16.ChartCellWidths
local v_u_19 = v16.HeaderFrameHeight
local v_u_20 = v16.EntryFrameHeight
local v_u_21 = v16.CellPadding
local v_u_22 = v16.MinFrameWidth
local v_u_23 = v16.LearnMoreWidth
local v_u_24 = v_u_12.DefaultFontSize.MainWindow
local v_u_25 = v_u_12.Font.MainWindow
local v_u_26 = game:DefineFastFlag("SlimDevConsole2", false)
local v_u_27 = v_u_26 and game:GetService("TextService") or nil
local v28 = 0
for _, v29 in ipairs(v18) do
	v28 = v28 + v29
end
local v_u_30 = {}
local v_u_31 = {}
local v_u_32 = {}
local v33 = -v28 / 2
local v34 = UDim2.fromOffset
table.insert(v_u_30, v34(v_u_21, 0))
local v35 = UDim2.new
local v36 = v33 - v_u_21
table.insert(v_u_31, v35(0.5, v36, 0, v_u_19))
local v37 = UDim2.new
local v38 = v33 - v_u_21
table.insert(v_u_32, v37(0.5, v38, 0, v_u_20))
for _, v39 in ipairs(v18) do
	local v40 = UDim2.new
	local v41 = v33 + v_u_21
	table.insert(v_u_30, v40(0.5, v41, 0, 0))
	local v42 = UDim2.fromOffset
	local v43 = v39 - v_u_21
	table.insert(v_u_31, v42(v43, v_u_19))
	local v44 = UDim2.fromOffset
	local v45 = v39 - v_u_21
	table.insert(v_u_32, v44(v45, v_u_20))
	v33 = v33 + v39
end
local v46 = UDim2.new
local v47 = v33 + v_u_21
table.insert(v_u_30, v46(0.5, v47, 0, 0))
local v48 = UDim2.new
local v49 = -v28 / 2 - v_u_21
table.insert(v_u_31, v48(0.5, v49, 0, v_u_19))
local v50 = UDim2.new
local v51 = -v28 / 2 - v_u_21
table.insert(v_u_32, v50(0.5, v51, 0, v_u_20))
local v52 = #v18 == 2
assert(v52, "DebugVisualizationsChart expected DebugVisualizationsFormatting CELL_WIDTHS to have a length of 2")
local v53 = #v_u_30 == 4
local v54 = "DebugVisualizationsChart expected cellOffset to have length " .. 4
assert(v53, v54)
local v55 = #v_u_31 == 4
local v56 = "DebugVisualizationsChart expected headerCellSize to have length " .. 4
assert(v55, v56)
local v57 = #v_u_32 == 4
local v58 = "DebugVisualizationsChart expected entryCellSize to have length " .. 4
assert(v57, v58)
local v_u_59 = {}
for v60, v61 in ipairs(v_u_30) do
	v_u_59[v60] = UDim2.new(v61.X.Scale, v61.X.Offset - v_u_21, v61.Y.Scale, v61.Y.Offset)
end
local v62 = v_u_2.Component:extend("DebugVisualizationsChart")
local function v_u_69(p63, p64) -- name: constructHeader
	-- upvalues: (copy) v_u_17, (copy) v_u_2, (copy) v_u_11, (copy) v_u_31, (copy) v_u_30, (copy) v_u_14, (copy) v_u_15, (copy) v_u_59, (copy) v_u_19
	local v65 = {}
	for v66, v67 in ipairs(v_u_17) do
		v65[v67] = v_u_2.createElement(v_u_11, {
			["text"] = v67,
			["size"] = v_u_31[v66],
			["pos"] = v_u_30[v66],
			["sortfunction"] = p63
		})
	end
	v65.upperHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_14),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["BackgroundColor3"] = v_u_15
	})
	v65.lowerHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_14),
		["Position"] = UDim2.new(0, 0, 1, -v_u_14),
		["BackgroundColor3"] = v_u_15
	})
	for v68 = 2, #v_u_59 do
		v65[string.format("VerticalLine_%d", v68)] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_14, 1, 0),
			["Position"] = v_u_59[v68],
			["BackgroundColor3"] = v_u_15
		})
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, p64, 0, v_u_19)
	}, v65)
end
local function v_u_110(p_u_70, p71, p72, p73, p74, p75, p76, p77) -- name: constructEntry
	-- upvalues: (copy) v_u_59, (copy) v_u_2, (copy) v_u_14, (copy) v_u_15, (copy) v_u_8, (copy) v_u_32, (copy) v_u_30, (copy) v_u_26, (copy) v_u_10, (copy) v_u_21, (copy) v_u_20, (copy) v_u_7, (copy) v_u_23, (copy) v_u_5, (copy) v_u_6
	local v78 = p_u_70.name
	local v79 = p_u_70.settingInfo
	local v80 = v79.Name
	local v_u_81 = tostring(v80)
	local v82 = {}
	for v83 = 2, #v_u_59 do
		v82[string.format("line_%d", v83)] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_14, 1, 0),
			["Position"] = v_u_59[v83],
			["BackgroundColor3"] = v_u_15
		})
	end
	v82[v78] = v_u_2.createElement(v_u_8, {
		["text"] = v_u_81,
		["size"] = v_u_32[1],
		["pos"] = v_u_30[1]
	})
	if v_u_26 and v79.Kind == "Dropdown" then
		local v_u_84 = v79.EnumItems
		local v85 = 1
		for v86, v87 in ipairs(v_u_84) do
			if v87 ~= v79.Value then
				continue
			end
			v85 = v86
		end
		v82.checkbox = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = v_u_32[2],
			["Position"] = v_u_30[2]
		}, {
			["DropDown"] = v_u_2.createElement(v_u_10, {
				["buttonSize"] = UDim2.new(1, -v_u_21, 0, v_u_20 - 8),
				["position"] = UDim2.new(0, 0, 0, 4),
				["dropDownList"] = v79.DropDownList,
				["selectedIndex"] = v85,
				["onSelection"] = function(p88) -- name: onSelection
					-- upvalues: (copy) p_u_70, (copy) v_u_81, (copy) v_u_84
					p_u_70.valueChangeCallback(v_u_81, v_u_84[p88])
				end
			})
		})
	else
		v82.checkbox = v_u_2.createElement(v_u_7, {
			["name"] = v_u_81,
			["isSelected"] = v79.Value,
			["size"] = v_u_32[2],
			["pos"] = v_u_30[2],
			["OnCheckboxClicked"] = p_u_70.valueChangeCallback
		})
	end
	v82.visualType = v_u_2.createElement(v_u_8, {
		["text"] = v79.Type,
		["size"] = v_u_32[3],
		["pos"] = v_u_30[3]
	})
	local v89 = v_u_2.createElement
	local v90 = v_u_8
	local v91 = {}
	local v92 = v79.Tagstring
	v91.text = tostring(v92)
	v91.size = v_u_32[4]
	v91.pos = v_u_30[4]
	v82.tags = v89(v90, v91)
	v82.lowerHorizontalLine = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_14),
		["Position"] = UDim2.new(0, 0, 1, 0),
		["BackgroundColor3"] = v_u_15
	})
	local v93 = nil
	local v94, v95
	if v_u_26 then
		v93 = v79.LearnMoreUrl
		v94 = v93 ~= nil
		local v96
		if v93 == nil then
			v96 = p71 - v_u_21 * 2
		else
			v96 = p71 - v_u_23 - v_u_21 * 2
		end
		v95 = UDim2.new(0, v96, 0, p73)
	else
		v95 = UDim2.new(0, p71 - v_u_23 - v_u_21 * 2, 0, v_u_20)
		v94 = true
	end
	local v97 = v_u_2.createElement
	local v98 = "Frame"
	local v99 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(0, p71, 0, p72),
		["LayoutOrder"] = p74
	}
	local v100 = {
		["Button"] = v_u_2.createElement(v_u_5, {
			["size"] = UDim2.new(1, 0, 0, v_u_20),
			["pos"] = UDim2.new(),
			["isExpanded"] = p75,
			["onButtonPress"] = p76(v78)
		}, v82)
	}
	local v101
	if p75 then
		local v102 = v_u_2.createElement
		local v103 = v_u_8
		local v104 = {
			["pos"] = UDim2.new(0, v_u_21, 0, v_u_20 + v_u_21),
			["size"] = v95
		}
		local v105 = v79.Description
		v104.text = tostring(v105)
		v101 = v102(v103, v104)
	else
		v101 = p75
	end
	v100.DescriptionText = v101
	if p75 then
		if v94 then
			local v106 = v_u_2.createElement
			local v107 = v_u_6
			local v108 = {
				["text"] = "Learn More",
				["size"] = nil,
				["pos"] = nil,
				["onClicked"] = nil,
				["size"] = UDim2.new(0, v_u_23, 0, v_u_20),
				["pos"] = UDim2.new(0, p71 - v_u_23 - v_u_21, 0, v_u_20 + v_u_21)
			}
			local v109
			if v_u_26 then
				v109 = p77(v78, v93)
			else
				v109 = p77(v78)
			end
			v108.onClicked = v109
			v94 = v106(v107, v108)
		end
	else
		v94 = p75
	end
	v100.LearnMoreButton = v94
	return v97(v98, v99, v100)
end
function populateEntries(p111, p112, p113, p114, p115, p116, p117, p118, p119, p120) -- name: populateEntries
	-- upvalues: (copy) v_u_2, (copy) v_u_20, (copy) v_u_26, (copy) v_u_23, (copy) v_u_21, (copy) v_u_27, (copy) v_u_24, (copy) v_u_25, (copy) v_u_110, (copy) v_u_15
	local v121 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v122 = {}
	for v123, v124 in pairs(p112) do
		if not v124 then
			continue
		end
		table.insert(v122, v123)
	end
	local v125 = #p113
	local v126 = 0
	if p116 and p115 then
		local v127 = -1
		local v128 = 0
		local v129 = 0
		for v130, v131 in ipairs(p113) do
			local v132
			if p111 then
				local v133 = v131.settingInfo.Name
				local v134 = tostring(v133)
				v132 = string.find(v134:lower(), p111:lower()) ~= nil or string.find(v131.name:lower(), p111:lower()) ~= nil
			else
				v132 = false
			end
			local v135
			if #v122 > 0 then
				v135 = false
				for _, v136 in pairs(v122) do
					if table.find(v131.settingInfo.Tags, v136) == nil then
						continue
					end
					v135 = true
				end
				if p111 then
					v135 = v132 and v135
				else
					p111 = true
				end
			else
				v135 = v132
			end
			if p111 and not v135 then
				continue
			end
			local v137 = p118 == v131.name
			local v138 = v_u_20
			local v139
			if v_u_26 then
				if v137 then
					local v140
					if v131.settingInfo.LearnMoreUrl == nil then
						v140 = p117 - v_u_21 * 2
					else
						v140 = p117 - v_u_23 - v_u_21 * 2
					end
					local v141 = v131.settingInfo.Description
					local v142 = v_u_27:GetTextSize(tostring(v141), v_u_24, v_u_25, Vector2.new(v140, (1 / 0))).Y
					local v143 = v_u_20
					v138 = math.max(v142, v143)
					v139 = v_u_20 + v138 + v_u_21 * 2
				else
					v139 = v_u_20
				end
			else
				v139 = v137 and v_u_20 * 2 + v_u_21 * 2 or v_u_20
			end
			if v126 + v_u_20 >= p115.Y then
				if v129 < p116.Y then
					local v144
					if p114 then
						v144 = v125 - v130 or v130
					else
						v144 = v130
					end
					v121[v130] = v_u_110(v131, p117, v139, v138, v144 + 1, v137, p119, p120)
				end
				if v127 < 0 then
					v127 = v126
				else
					v129 = v129 + v_u_20
				end
				v128 = v128 + 1
			end
			v126 = v126 + v139
		end
		if v128 == 0 then
			v121.NoneFound = v_u_2.createElement("TextLabel", {
				["Size"] = nil,
				["Text"] = "No DebugVisualizations Found",
				["TextColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.fromScale(1, 1),
				["TextColor3"] = v_u_15
			})
		else
			v121.WindowingPadding = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, 0, 0, v127)
			})
		end
	end
	return v121, v126
end
function v62.init(p_u_145, p_u_146) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_26, (copy) v_u_2
	local v147 = p_u_146.DebugVisualizationsData:getCurrentData()
	function p_u_145.getOnButtonPress(p_u_148)
		-- upvalues: (copy) p_u_145
		return function(_, _)
			-- upvalues: (ref) p_u_145, (copy) p_u_148
			local v149 = p_u_145
			local v150 = {}
			local v151
			if p_u_145.state.expandedEntry == p_u_148 then
				v151 = false
			else
				v151 = p_u_148
			end
			v150.expandedEntry = v151
			v149:setState(v150)
		end
	end
	function p_u_145.getLearnMorePress(p_u_152, p_u_153)
		-- upvalues: (ref) v_u_3, (ref) v_u_26
		return function(_, _)
			-- upvalues: (ref) v_u_3, (ref) v_u_26, (copy) p_u_153, (copy) p_u_152
			local v154 = v_u_3.default
			local v155
			if v_u_26 then
				v155 = p_u_153
			else
				v155 = "https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings#" .. p_u_152
			end
			v154:openURL(v155)
		end
	end
	function p_u_145.onSortChanged(p156)
		-- upvalues: (copy) p_u_146, (copy) p_u_145
		if p156 == p_u_146.DebugVisualizationsData:getSortType() then
			p_u_145:setState(function(p157)
				return {
					["reverseSort"] = not p157.reverseSort
				}
			end)
		else
			p_u_146.DebugVisualizationsData:setSortType(p156)
			p_u_145:setState({
				["reverseSort"] = false
			})
		end
	end
	function p_u_145.onCanvasPosChanged()
		-- upvalues: (copy) p_u_145
		p_u_145:setState({
			["canvasPos"] = p_u_145.scrollingRef.current.CanvasPosition
		})
	end
	p_u_145.scrollingRef = v_u_2.createRef()
	p_u_145.state = {
		["visualizationEntries"] = nil,
		["reverseSort"] = false,
		["expandedEntry"] = nil,
		["visualizationEntries"] = v147
	}
end
function v62.didUpdate(p158) -- name: didUpdate
	if p158.scrollingRef.current then
		local v159 = p158.scrollingRef.current.AbsoluteSize
		if v159 ~= p158.state.absScrollSize then
			p158:setState({
				["absScrollSize"] = v159
			})
		end
	end
end
function v62.didMount(p_u_160) -- name: didMount
	p_u_160.visualizationsUpdated = p_u_160.props.DebugVisualizationsData:Signal():Connect(function(p161)
		-- upvalues: (copy) p_u_160
		p_u_160:setState({
			["visualizationEntries"] = p161
		})
	end)
	if p_u_160.scrollingRef.current then
		p_u_160.canvasPosConnector = p_u_160.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p_u_160.onCanvasPosChanged)
		p_u_160:setState({
			["absScrollSize"] = p_u_160.scrollingRef.current.AbsoluteSize,
			["canvasPos"] = p_u_160.scrollingRef.current.CanvasPosition
		})
	end
end
function v62.willUnmount(p162) -- name: willUnmount
	p162.visualizationsUpdated:Disconnect()
	p162.visualizationsUpdated = nil
	p162.canvasPosConnector:Disconnect()
	p162.canvasPosConnector = nil
end
function v62.render(p163) -- name: render
	-- upvalues: (copy) v_u_22, (copy) v_u_2, (copy) v_u_69, (copy) v_u_19, (copy) v_u_12
	local v164 = p163.state.absScrollSize
	if not v164 then
		v167 = v_u_22
		v168, v169 = populateEntries(p163.props.searchTerm, p163.props.typeFilters, p163.state.visualizationEntries, p163.state.reverseSort, p163.state.canvasPos, v164, v167, p163.state.expandedEntry, p163.getOnButtonPress, p163.getLearnMorePress)
		v170 = p163.props.size
		v171 = p163.props.layoutOrder
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["LayoutOrder"] = nil,
			["Size"] = v170,
			["LayoutOrder"] = v171
		}, {
			["Header"] = v_u_69(p163.onSortChanged, v167),
			["MainChart"] = v_u_2.createElement("ScrollingFrame", {
				["Position"] = UDim2.fromOffset(0, v_u_19),
				["Size"] = UDim2.new(1, 0, 1, -v_u_19),
				["CanvasSize"] = UDim2.fromOffset(v167, v169),
				["ScrollBarThickness"] = 6,
				["BackgroundColor3"] = v_u_12.Color.BaseGray,
				["BackgroundTransparency"] = 1,
				[v_u_2.Ref] = p163.scrollingRef
			}, v168)
		})
	end
	local v165 = v164.X
	local v166 = v_u_22
	local v167 = math.max(v165, v166)
	if v167 then
		v168, v169 = populateEntries(p163.props.searchTerm, p163.props.typeFilters, p163.state.visualizationEntries, p163.state.reverseSort, p163.state.canvasPos, v164, v167, p163.state.expandedEntry, p163.getOnButtonPress, p163.getLearnMorePress)
		v170 = p163.props.size
		v171 = p163.props.layoutOrder
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["LayoutOrder"] = nil,
			["Size"] = v170,
			["LayoutOrder"] = v171
		}, {
			["Header"] = v_u_69(p163.onSortChanged, v167),
			["MainChart"] = v_u_2.createElement("ScrollingFrame", {
				["Position"] = UDim2.fromOffset(0, v_u_19),
				["Size"] = UDim2.new(1, 0, 1, -v_u_19),
				["CanvasSize"] = UDim2.fromOffset(v167, v169),
				["ScrollBarThickness"] = 6,
				["BackgroundColor3"] = v_u_12.Color.BaseGray,
				["BackgroundTransparency"] = 1,
				[v_u_2.Ref] = p163.scrollingRef
			}, v168)
		})
	end
	v167 = v_u_22
	local v168, v169 = populateEntries(p163.props.searchTerm, p163.props.typeFilters, p163.state.visualizationEntries, p163.state.reverseSort, p163.state.canvasPos, v164, v167, p163.state.expandedEntry, p163.getOnButtonPress, p163.getLearnMorePress)
	local v170 = p163.props.size
	local v171 = p163.props.layoutOrder
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["LayoutOrder"] = nil,
		["Size"] = v170,
		["LayoutOrder"] = v171
	}, {
		["Header"] = v_u_69(p163.onSortChanged, v167),
		["MainChart"] = v_u_2.createElement("ScrollingFrame", {
			["Position"] = UDim2.fromOffset(0, v_u_19),
			["Size"] = UDim2.new(1, 0, 1, -v_u_19),
			["CanvasSize"] = UDim2.fromOffset(v167, v169),
			["ScrollBarThickness"] = 6,
			["BackgroundColor3"] = v_u_12.Color.BaseGray,
			["BackgroundTransparency"] = 1,
			[v_u_2.Ref] = p163.scrollingRef
		}, v168)
	})
end
return v9(v62, "DebugVisualizationsData")