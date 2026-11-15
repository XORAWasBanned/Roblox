-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LuauHeap.LuauHeapView
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent.Parent.Components
local v_u_5 = require(v4.HeaderButton)
local v_u_6 = require(v4.BannerButton)
local v_u_7 = require(v4.CellLabel)
local v_u_8 = require(v4.BoxButton)
local v_u_9 = require(script.Parent.LuauHeapViewEntry)
local v_u_10 = require(script.Parent.LuauHeapViewStatEntry)
local v_u_11 = require(script.Parent.LuauHeapViewRefEntry)
require(script.Parent.LuauHeapTypes)
local v12 = script.Parent.Parent.Parent.Actions
local v_u_13 = require(v12.SetLuauHeapActiveSnapshot)
local v_u_14 = require(v12.SetLuauHeapCompareSnapshot)
local v_u_15 = require(script.Parent.Parent.Parent.Constants)
local v_u_16 = v_u_15.GeneralFormatting.LineWidth
local v_u_17 = v_u_15.GeneralFormatting.LineColor
local v_u_18 = v_u_15.GeneralFormatting.HeaderFrameHeight
local v_u_19 = v_u_15.GeneralFormatting.EntryFrameHeight
local v_u_20 = v_u_15.LuauHeapFormatting.ValueCellWidth
local v_u_21 = v_u_15.LuauHeapFormatting.CellPadding
local v_u_22 = v_u_15.LuauHeapFormatting.ValuePadding
local v_u_23 = v_u_15.LuauHeapFormatting.SnapshotWidth
local v_u_24 = v_u_15.LuauHeapFormatting.SnapshotHighlightSize
local v_u_25 = v_u_15.LuauHeapFormatting.TabsHeight
local v_u_26 = v_u_15.LuauHeapFormatting.TabButtonWidth
local v_u_27 = v_u_15.LuauHeapFormatting.TabButtonHeight
local _ = v_u_15.LuauHeapFormatting.TabButtonPad
local v_u_28 = v_u_15.LuauHeapFormatting.TabHighlightHeight
local v_u_29 = v_u_15.LuauHeapFormatting.TableHintHeight
local v_u_35 = {
	["graph"] = {
		["hint"] = "Graph displays the size of the objects in Luau VM aggregated by the shortest path from the root Engine references to them.\n\t\tMost important root references are ModuleScript tables and functions connected to signals or the task scheduler.",
		["headers"] = nil,
		["initFragmentSource"] = nil,
		["headers"] = { "Name", "Size", "Self" },
		["initFragmentSource"] = function(p30) -- name: initFragmentSource
			return p30:renderChildren()
		end
	},
	["tag"] = {
		["hint"] = "This memory breakdown displays how much memory is used by Luau VM types.",
		["headers"] = nil,
		["initFragmentSource"] = nil,
		["headers"] = { "Name", "Size", "Count" },
		["initFragmentSource"] = function(p31) -- name: initFragmentSource
			return p31:renderChildrenStats("TagBreakdown")
		end
	},
	["memcat"] = {
		["hint"] = "Memory separated by the category at the time of allocation.\n\t\tMemory category is assigned to the thread performing the allocation, not the script.\n\t\tDefault value is based on the script name. Custom value can be assigned using \'debug.setmemorycategory\' API.",
		["headers"] = nil,
		["initFragmentSource"] = nil,
		["headers"] = { "Name", "Size", "Count" },
		["initFragmentSource"] = function(p32) -- name: initFragmentSource
			return p32:renderChildrenStats("MemcatBreakdown")
		end
	},
	["userdata"] = {
		["hint"] = "This breakdown shows how much memory inside Luau VM is taken by custom Roblox engine classes.\n\t\tFor DataModel classes like \'Part\' this does not include the memory taken inside the engine itself.",
		["headers"] = nil,
		["initFragmentSource"] = nil,
		["headers"] = { "Name", "Size", "Count" },
		["initFragmentSource"] = function(p33) -- name: initFragmentSource
			return p33:renderChildrenStats("UserdataBreakdown")
		end
	},
	[game:GetEngineFeature("UnparentedInstances") and "UniqueRefs" or "refs"] = {
		["hint"] = "This view shows engine DataModel instances that are only referenced by Luau VM and are not directly parented to the DataModel.\n\t\tFor each instance, it will show the set of paths that make it accessible and prevent garbage collection.\n\t\tMost often, engine Luau references come from ModuleScript tables, active signal connections and active coroutines in the task scheduler.",
		["headers"] = nil,
		["initFragmentSource"] = nil,
		["headers"] = { "Name", "Count", "Total Instances" },
		["initFragmentSource"] = function(p34) -- name: initFragmentSource
			return p34:renderChildrenRefs()
		end
	}
}
if game:GetEngineFeature("UnparentedInstances") then
	v_u_35.UnparentedRefs = {
		["hint"] = "This view shows engine DataModel instances that are not parented to any instance (and are also not unique references).\n\t\tFor each instance, it will show the set of paths that make it accessible and prevent garbage collection.\n\t\t",
		["headers"] = nil,
		["initFragmentSource"] = nil,
		["headers"] = { "Name", "Count", "Total Instances" },
		["initFragmentSource"] = function(p36) -- name: initFragmentSource
			return p36:renderUnparentedRefs()
		end
	}
end
local v37 = v_u_2.PureComponent:extend("LuauHeapView")
function v37.renderSnapshotList(p_u_38) -- name: renderSnapshotList
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_19, (copy) v_u_7, (copy) v_u_21, (copy) v_u_24, (copy) v_u_17, (copy) v_u_8
	local v39 = {}
	for v_u_40, _ in p_u_38.props.data do
		local v41 = v_u_2.createElement
		local v42 = v_u_6
		local v43 = {
			["size"] = nil,
			["inset"] = 0,
			["isExpanded"] = false,
			["isExpandable"] = false,
			["layoutOrder"] = nil,
			["onButtonPress"] = nil,
			["size"] = UDim2.new(1, 0, 0, v_u_19),
			["layoutOrder"] = v_u_40,
			["onButtonPress"] = function() -- name: onButtonPress
				-- upvalues: (copy) p_u_38, (copy) v_u_40
				p_u_38.props.dispatchSetLuauHeapActiveSnapshot(v_u_40)
			end
		}
		local v44 = {
			["name"] = v_u_2.createElement(v_u_7, {
				["text"] = ("Snapshot #%*"):format(v_u_40),
				["size"] = UDim2.new(UDim.new(1, 0), UDim.new(1, 0)),
				["pos"] = UDim2.new(0, v_u_21, 0, 0)
			})
		}
		local v45
		if p_u_38.props.activeSnapshot == v_u_40 then
			v45 = v_u_2.createElement("Frame", {
				["Size"] = UDim2.new(1, 0, 0, v_u_24),
				["BackgroundColor3"] = v_u_17
			})
		else
			v45 = nil
		end
		v44.HorizontalHighlightTop = v45
		local v46
		if p_u_38.props.activeSnapshot == v_u_40 then
			v46 = v_u_2.createElement("Frame", {
				["Size"] = UDim2.new(1, 0, 0, v_u_24),
				["Position"] = UDim2.new(0, 0, 1, -v_u_24),
				["BackgroundColor3"] = v_u_17
			})
		else
			v46 = nil
		end
		v44.HorizontalHighlightBottom = v46
		local v47
		if p_u_38.props.activeSnapshot == v_u_40 then
			v47 = v_u_2.createElement("Frame", {
				["Size"] = UDim2.new(0, v_u_24, 1, 0),
				["BackgroundColor3"] = v_u_17
			})
		else
			v47 = nil
		end
		v44.HorizontalHighlightLeft = v47
		local v48
		if p_u_38.props.activeSnapshot == v_u_40 then
			v48 = v_u_2.createElement("Frame", {
				["Size"] = UDim2.new(0, v_u_24, 1, 0),
				["Position"] = UDim2.new(1, -v_u_24, 0, 0),
				["BackgroundColor3"] = v_u_17
			})
		else
			v48 = nil
		end
		v44.HorizontalHighlightRight = v48
		local v49
		if p_u_38.props.activeSnapshot == v_u_40 then
			v49 = nil
		else
			v49 = v_u_2.createElement(v_u_8, {
				["text"] = "Compare",
				["size"] = nil,
				["pos"] = nil,
				["onClicked"] = nil,
				["size"] = UDim2.new(0.3, -6, 1, -6),
				["pos"] = UDim2.new(0.7, 3, 0, 3),
				["onClicked"] = function() -- name: onClicked
					-- upvalues: (copy) p_u_38, (copy) v_u_40
					p_u_38.props.dispatchSetLuauHeapCompareSnapshot(v_u_40)
				end
			})
		end
		v44.Compare = v49
		v39[v_u_40] = v41(v42, v43, v44)
	end
	return v39
end
function v37.renderChildren(p50) -- name: renderChildren
	-- upvalues: (copy) v_u_2, (copy) v_u_9
	local v51 = p50.props.data[p50.props.activeSnapshot]
	local v52 = p50.props.data[p50.props.compareSnapshot]
	local v53 = v_u_2.createElement
	local v54 = v_u_9
	local v55 = {
		["layoutOrder"] = 0,
		["depth"] = 0,
		["data"] = nil,
		["compare"] = nil
	}
	local v56
	if v51 then
		v56 = v51.Graph
	else
		v56 = nil
	end
	v55.data = v56
	local v57
	if v52 then
		v57 = v52.Graph
	else
		v57 = nil
	end
	v55.compare = v57
	return v53(v54, v55)
end
function v37.renderChildrenStats(p58, p59) -- name: renderChildrenStats
	-- upvalues: (copy) v_u_2, (copy) v_u_10
	local v60 = p58.props.data[p58.props.activeSnapshot]
	local v61 = p58.props.data[p58.props.compareSnapshot]
	local v62 = v60[p59]
	local v63
	if v61 then
		v63 = v61[p59]
	else
		v63 = nil
	end
	local v64 = {}
	for v65, v66 in v62 do
		local v67 = nil
		if v63 then
			for _, v68 in ipairs(v63) do
				if v66.Name ~= v68.Name then
					continue
				end
				v67 = v68
			end
		end
		v64[v65] = v_u_2.createElement(v_u_10, {
			["layoutOrder"] = nil,
			["depth"] = 0,
			["data"] = nil,
			["compare"] = nil,
			["layoutOrder"] = -v66.Size,
			["data"] = v66,
			["compare"] = v67
		})
	end
	return v64
end
function v37.renderUnparentedRefs(p69) -- name: renderUnparentedRefs
	-- upvalues: (copy) v_u_2, (copy) v_u_11
	local v70 = p69.props.data[p69.props.activeSnapshot].Refs
	if not v70 then
		return {}
	end
	local v71 = v70.UnparentedReferences
	if not v71 then
		return {}
	end
	local v72 = {}
	for v73, v74 in v71 do
		v72[v73] = v_u_2.createElement(v_u_11, {
			["layoutOrder"] = nil,
			["depth"] = 0,
			["data"] = nil,
			["layoutOrder"] = -v74.Instances,
			["data"] = v74
		})
	end
	return v72
end
function v37.renderChildrenRefs(p75) -- name: renderChildrenRefs
	-- upvalues: (copy) v_u_2, (copy) v_u_11
	local v76 = p75.props.data[p75.props.activeSnapshot].Refs
	if not v76 then
		return {}
	end
	assert(v76)
	local v77 = {}
	for v78, v79 in v76.Roots do
		v77[v78] = v_u_2.createElement(v_u_11, {
			["layoutOrder"] = nil,
			["depth"] = 0,
			["data"] = nil,
			["layoutOrder"] = -v79.Instances,
			["data"] = v79
		})
	end
	return v77
end
function v37.createTabSelector(p_u_80, p81, p82) -- name: createTabSelector
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_26, (copy) v_u_27, (copy) v_u_28, (copy) v_u_15
	local function v86(p_u_83, p84, p85) -- name: createButton
		-- upvalues: (ref) v_u_2, (ref) v_u_8, (ref) v_u_26, (ref) v_u_27, (copy) p_u_80
		return v_u_2.createElement(v_u_8, {
			["text"] = p84,
			["size"] = UDim2.new(0, v_u_26, 0, v_u_27),
			["pos"] = UDim2.new(0, v_u_26 * p85, 0, 0),
			["onClicked"] = function() -- name: onClicked
				-- upvalues: (copy) p_u_83, (ref) p_u_80
				p_u_80:setState({
					["activeTab"] = p_u_83
				})
			end
		})
	end
	local function v89(p87, p88) -- name: createHighlight
		-- upvalues: (copy) p_u_80, (ref) v_u_2, (ref) v_u_26, (ref) v_u_28, (ref) v_u_27, (ref) v_u_15
		if p_u_80.state.activeTab == p87 then
			return v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BorderSizePixel"] = 0,
				["BackgroundColor3"] = nil,
				["ZIndex"] = 10,
				["Size"] = UDim2.new(0, v_u_26, 0, v_u_28),
				["Position"] = UDim2.new(0, v_u_26 * p88, 0, v_u_27 - v_u_28),
				["BackgroundColor3"] = v_u_15.Color.HighlightBlue
			})
		else
			return nil
		end
	end
	if game:GetEngineFeature("UnparentedInstances") then
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = p81,
			["Position"] = p82
		}, {
			["Graph"] = v86("graph", "Graph", 0),
			["GraphHighlight"] = v89("graph", 0),
			["Tags"] = v86("tag", "Object Tags", 1),
			["TagHighlight"] = v89("tag", 1),
			["Memcat"] = v86("memcat", "Memory Categories", 2),
			["MemcatHighlight"] = v89("memcat", 2),
			["Userdata"] = v86("userdata", "Object Classes", 3),
			["UserdataHighlight"] = v89("userdata", 3),
			["Refs"] = v86("UniqueRefs", "Unique References", 4),
			["RefHighlight"] = v89("UniqueRefs", 4),
			["UnparentedInstances"] = v86("UnparentedRefs", "Unparented Instances", 5),
			["UnparentedHighlight"] = v89("UnparentedRefs", 5)
		})
	else
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = p81,
			["Position"] = p82
		}, {
			["Graph"] = v86("graph", "Graph", 0),
			["GraphHighlight"] = v89("graph", 0),
			["Tags"] = v86("tag", "Object Tags", 1),
			["TagHighlight"] = v89("tag", 1),
			["Memcat"] = v86("memcat", "Memory Categories", 2),
			["MemcatHighlight"] = v89("memcat", 2),
			["Userdata"] = v86("userdata", "Object Classes", 3),
			["UserdataHighlight"] = v89("userdata", 3),
			["Refs"] = v86("refs", "Unique References", 4),
			["RefHighlight"] = v89("refs", 4),
			["UnparentedInstances"] = v86("UnparentedRefs", "Unparented Instances", 5),
			["UnparentedHighlight"] = v89("UnparentedRefs", 5)
		})
	end
end
function v37.createStatsTableHeader(p90, p91, p92, p93) -- name: createStatsTableHeader
	-- upvalues: (copy) v_u_2, (copy) v_u_23, (copy) v_u_18, (copy) v_u_5, (copy) v_u_20, (copy) v_u_22, (copy) v_u_21, (copy) v_u_17, (copy) v_u_16
	local v94 = v_u_2.createElement
	local v95 = "Frame"
	local v96 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1 - v_u_23, 0, 0, v_u_18),
		["Position"] = UDim2.new(v_u_23, 0, p91, p92)
	}
	local v97 = {}
	local v98
	if p93[1] then
		v98 = v_u_2.createElement(v_u_5, {
			["text"] = p93[1],
			["size"] = UDim2.new(1 - v_u_20 * 2, -v_u_22 - v_u_21, 0, v_u_18),
			["pos"] = UDim2.new(0, v_u_21, 0, 0),
			["sortfunction"] = p90.onSortChanged
		})
	else
		v98 = nil
	end
	v97.First = v98
	local v99
	if p93[2] then
		v99 = v_u_2.createElement(v_u_5, {
			["text"] = p93[2],
			["size"] = UDim2.new(v_u_20, -v_u_21, 0, v_u_18),
			["pos"] = UDim2.new(1 - v_u_20 * 2, v_u_22, 0, 0),
			["sortfunction"] = p90.onSortChanged
		})
	else
		v99 = nil
	end
	v97.Second = v99
	local v100
	if p93[3] then
		v100 = v_u_2.createElement(v_u_5, {
			["text"] = p93[3],
			["size"] = UDim2.new(v_u_20, -v_u_21, 0, v_u_18),
			["pos"] = UDim2.new(1 - v_u_20, v_u_22, 0, 0),
			["sortfunction"] = p90.onSortChanged
		})
	else
		v100 = nil
	end
	v97.Third = v100
	v97.TopHorizontal = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, 1),
		["BackgroundColor3"] = v_u_17
	})
	v97.LowerHorizontal = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, v_u_16),
		["Position"] = UDim2.new(0, 0, 1, 0),
		["BackgroundColor3"] = v_u_17
	})
	v97.Vertical1 = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, v_u_16, 1, 0),
		["Position"] = UDim2.new(1 - v_u_20, 0, 0, 0),
		["BackgroundColor3"] = v_u_17
	})
	v97.Vertical2 = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, v_u_16, 1, 0),
		["Position"] = UDim2.new(1 - v_u_20 * 2, 0, 0, 0),
		["BackgroundColor3"] = v_u_17
	})
	return v94(v95, v96, v97)
end
function v37.init(p101) -- name: init
	p101.state = {
		["activeTab"] = "graph"
	}
end
function v37.render(p102) -- name: render
	-- upvalues: (copy) v_u_35, (copy) v_u_2, (copy) v_u_15, (copy) v_u_5, (copy) v_u_23, (copy) v_u_21, (copy) v_u_18, (copy) v_u_25, (copy) v_u_29
	local v103 = p102.props.layoutOrder
	local v104 = p102.props.size
	local v105 = v_u_35[p102.state.activeTab]
	local v106
	if p102.props.data and #p102.props.data ~= 0 then
		v106 = nil
	else
		v106 = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = "Capture a Snapshot to view details",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_15.Color.Text,
			["LayoutOrder"] = v103
		})
	end
	local v107 = v_u_2.createElement
	local v108 = {
		["SnapshotHeader"] = v_u_2.createElement(v_u_5, {
			["text"] = "Snapshots",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_23, -v_u_21, 0, v_u_18),
			["pos"] = UDim2.new(0, v_u_21, 0, 0)
		}),
		["Snapshots"] = v_u_2.createElement("ScrollingFrame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["VerticalScrollBarInset"] = nil,
			["ScrollBarThickness"] = 5,
			["CanvasSize"] = nil,
			["AutomaticCanvasSize"] = nil,
			["Size"] = UDim2.new(v_u_23, -4, 1, -v_u_18),
			["Position"] = UDim2.new(0, 2, 0, v_u_18),
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.None,
			["CanvasSize"] = UDim2.fromScale(0, 0),
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
		}, {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Stroke"] = v_u_2.createElement("UIStroke", {
				["Thickness"] = 2,
				["Color"] = nil,
				["Color"] = Color3.new(0.6, 0.6, 0.6)
			}),
			["Children"] = v_u_2.createFragment(p102:renderSnapshotList())
		}),
		["Tabs"] = p102:createTabSelector(UDim2.new(1 - v_u_23, 0, 0, v_u_25), UDim2.new(v_u_23, 0, 0, 0)),
		["Hint"] = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1 - v_u_23, 0, 0, v_u_29),
			["Position"] = UDim2.new(v_u_23, 0, 0, v_u_25),
			["Text"] = v105.hint,
			["TextColor3"] = v_u_15.Color.Text
		}),
		["Headers"] = p102:createStatsTableHeader(0, v_u_25 + v_u_29, v105.headers),
		["Entries"] = v_u_2.createElement("ScrollingFrame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["VerticalScrollBarInset"] = nil,
			["ScrollBarThickness"] = 5,
			["CanvasSize"] = nil,
			["AutomaticCanvasSize"] = nil,
			["Size"] = UDim2.new(1 - v_u_23, 0, 1, -(v_u_25 + v_u_29 + v_u_18)),
			["Position"] = UDim2.new(v_u_23, 0, 0, v_u_25 + v_u_29 + v_u_18),
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.None,
			["CanvasSize"] = UDim2.fromScale(0, 0),
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
		}, {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Children"] = v106 or v_u_2.createFragment(v105.initFragmentSource(p102))
		})
	}
	return v107("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v104,
		["LayoutOrder"] = v103
	}, v108)
end
return v3.UNSTABLE_connect2(nil, function(p_u_109) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_13, (copy) v_u_14
	return {
		["dispatchSetLuauHeapActiveSnapshot"] = function(p110) -- name: dispatchSetLuauHeapActiveSnapshot
			-- upvalues: (copy) p_u_109, (ref) v_u_13
			p_u_109(v_u_13(p110))
		end,
		["dispatchSetLuauHeapCompareSnapshot"] = function(p111) -- name: dispatchSetLuauHeapCompareSnapshot
			-- upvalues: (copy) p_u_109, (ref) v_u_14
			p_u_109(v_u_14(p111))
		end
	}
end)(v37)