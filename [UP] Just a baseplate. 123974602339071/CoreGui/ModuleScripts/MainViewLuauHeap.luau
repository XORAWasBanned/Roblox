-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LuauHeap.MainViewLuauHeap
local v1 = game:GetService("CorePackages")
game:GetService("ScriptContext")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("HeapProfilerService")
local v_u_4 = game:GetService("Players")
local v5 = require(v1.Workspace.Packages.AppCommonLib)
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.RoactRodux)
local v_u_8 = v5.memoize
local v9 = script.Parent.Parent.Parent.Components
local v10 = require(v9.DataConsumer)
local v_u_11 = require(v9.UtilAndTab)
local v_u_12 = require(v9.BoxButton)
local v_u_13 = require(script.Parent.LuauHeapView)
require(script.Parent.LuauHeapTypes)
local v14 = script.Parent.Parent.Parent.Actions
local v_u_15 = require(v14.SetLuauHeapState)
local v_u_16 = require(v14.SetLuauHeapProfileTarget)
local v_u_17 = require(script.Parent.Parent.Parent.Constants)
local v_u_18 = v_u_17.GeneralFormatting.MainRowPadding
local v19 = v_u_6.PureComponent:extend("MainViewLuauHeap")
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local function v_u_35(p20, p21) -- name: filterNode
	-- upvalues: (copy) v_u_35
	if p21 == nil then
		return false
	else
		local v22 = table.clone(p20)
		local v23
		if v22.Name == nil then
			v23 = false
		else
			v23 = string.find(string.lower(v22.Name), string.lower(p21), 1, true) ~= nil
		end
		if v22.Source ~= nil then
			local v24 = string.find(string.lower(v22.Source), string.lower(p21), 1, true) ~= nil
			v23 = v23 or v24
		end
		if v22.Paths ~= nil then
			for _, v25 in v22.Paths do
				for _, v26 in v25 do
					local v27 = string.find(string.lower(v26), string.lower(p21), 1, true) ~= nil
					v23 = v23 or v27
				end
			end
		end
		if v22.Roots ~= nil then
			local v28 = {}
			for _, v29 in v22.Roots do
				local v30 = table.clone(v29)
				local v31 = v_u_35(v30, p21)
				if v31 then
					table.insert(v28, v30)
				end
				v23 = v23 or v31
			end
			v22.Roots = v28
		end
		if v22.Children ~= nil then
			local v32 = {}
			for _, v33 in v22.Children do
				local v34 = v_u_35(table.clone(v33), p21)
				if v34 then
					table.insert(v32, v33)
				end
				v23 = v23 or v34
			end
			v22.Children = v32
		end
		if v23 then
			return v22
		else
			return nil
		end
	end
end
local function v_u_41(p36, p37) -- name: filterHeapReportsStatEntryList
	if p37 == nil then
		return p36
	end
	local v38 = {}
	for _, v39 in p36 do
		if string.find(string.lower(v39.Name), string.lower(p37), 1, true) == nil then
			continue
		end
		local v40 = table.clone(v39)
		table.insert(v38, v40)
	end
	return v38
end
local function v_u_50(p42, p43, p44) -- name: filterHeapReportGraph
	-- upvalues: (copy) v_u_50
	if p43 == nil then
		return p42
	else
		local v45 = table.clone(p42)
		local v46 = {}
		for _, v47 in v45.Children do
			local v48 = v_u_50(v47, p43, p44 + 1)
			if not v48 then
				continue
			end
			table.insert(v46, v48)
		end
		v45.Children = v46
		if p44 == 0 then
			return v45
		else
			local v49 = #v46 > 0
			if string.find(string.lower(v45.Name), string.lower(p43), 1, true) ~= nil and true or v49 then
				return v45
			else
				return nil
			end
		end
	end
end
local function v_u_55(p51, p52) -- name: filterUniqueRefEntryPath
	if p52 == nil then
		return p51
	else
		local v53 = {}
		for _, v54 in p51 do
			if string.find(string.lower(v54), string.lower(p52), 1, true) == nil then
				continue
			end
			table.insert(v53, v54)
		end
		if #v53 > 0 then
			return v53
		else
			return nil
		end
	end
end
local function v_u_61(p56, p57) -- name: filterUniqueRefEntryPathList
	-- upvalues: (copy) v_u_55
	if p57 == nil then
		return p56
	end
	local v58 = {}
	for _, v59 in p56 do
		local v60 = v_u_55(v59, p57)
		if not v60 then
			continue
		end
		table.insert(v58, v60)
	end
	return v58
end
local function v_u_67(p62, p63) -- name: filterUniqueRefEntry
	-- upvalues: (copy) v_u_61
	if p63 == nil then
		return p62
	else
		local v64 = table.clone(p62)
		local v65 = string.find(string.lower(v64.Name), string.lower(p63), 1, true) ~= nil
		local v66 = v_u_61(v64.Paths, p63)
		v64.Paths = v66
		if #v66 > 0 and true or v65 then
			return v64
		else
			return nil
		end
	end
end
local function v_u_74(p68, p69) -- name: filterUniqueRefReport
	-- upvalues: (copy) v_u_67
	if p69 == nil or p68 == nil then
		return p68
	end
	local v70 = table.clone(p68)
	local v71 = {}
	for _, v72 in v70.Roots do
		local v73 = v_u_67(v72, p69)
		if not v73 then
			continue
		end
		table.insert(v71, v73)
	end
	v70.Roots = v71
	return v70
end
local function v_u_80(p75, p76, _) -- name: filterSnapshots
	-- upvalues: (copy) v_u_41, (copy) v_u_50, (copy) v_u_74
	if p76 == nil then
		return p75
	end
	local v77 = {}
	for _, v78 in p75 do
		local v79 = table.clone(v78)
		v79.TagBreakdown = v_u_41(v79.TagBreakdown, p76)
		v79.MemcatBreakdown = v_u_41(v79.MemcatBreakdown, p76)
		v79.UserdataBreakdown = v_u_41(v79.UserdataBreakdown, p76)
		v79.Graph = v_u_50(v79.Graph, p76, 0)
		if v79.Refs then
			v79.Refs = v_u_74(v79.Refs, p76)
		end
		table.insert(v77, v79)
	end
	return v77
end
function v19.getState(p81, p82) -- name: getState
	if p82 then
		return p81.props.client
	else
		return p81.props.server
	end
end
function v19.getActiveState(p83) -- name: getActiveState
	return p83.props.isClientView, p83:getState(p83.props.isClientView)
end
function v19.init(p_u_84) -- name: init
	-- upvalues: (copy) v_u_8, (copy) v_u_80, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2, (copy) v_u_6
	function p_u_84.onUtilTabHeightChanged(p85)
		-- upvalues: (copy) p_u_84
		p_u_84:setState({
			["utilTabHeight"] = p85
		})
	end
	p_u_84.version = 0
	function p_u_84.dispatchSetLuauHeapState(p86, p87)
		-- upvalues: (copy) p_u_84
		p_u_84.version = p_u_84.version + 1
		p_u_84.props.dispatchSetLuauHeapState(p86, p87)
	end
	function p_u_84.onClientButton()
		-- upvalues: (copy) p_u_84
		p_u_84.props.dispatchSetLuauHeapProfileTarget(true)
	end
	function p_u_84.onServerButton()
		-- upvalues: (copy) p_u_84
		p_u_84.props.dispatchSetLuauHeapProfileTarget(false)
	end
	p_u_84.filterSnapshots = v_u_8(v_u_80)
	function p_u_84.onCreateSnapshot()
		-- upvalues: (copy) p_u_84, (ref) v_u_3, (ref) v_u_4, (ref) v_u_2
		local v88, v89 = p_u_84:getActiveState()
		local v90, v91
		if v88 then
			local v92 = v_u_3.ClientRequestDataAsync
			local v93 = v_u_3
			local v94 = v_u_4.LocalPlayer
			v90, v91 = pcall(v92, v93, v94)
		else
			local v95 = v_u_3.ServerRequestDataAsync
			local v96 = v_u_3
			v90, v91 = pcall(v95, v96)
		end
		if v90 then
			local v97 = v_u_2:JSONDecode(v91)
			local v98 = v97.Report
			v98.Refs = v97.Refs
			local v99 = table.clone(v89)
			local v100 = v99.snapshots
			table.insert(v100, v98)
			v99.active = #v99.snapshots
			p_u_84.dispatchSetLuauHeapState(v88, v99)
		else
			warn(v91)
		end
	end
	function p_u_84.onClearSnapshots()
		-- upvalues: (copy) p_u_84
		local v101, v102 = p_u_84:getActiveState()
		local v103 = table.clone(v102)
		table.clear(v103.snapshots)
		v103.active = 0
		p_u_84.dispatchSetLuauHeapState(v101, v103)
	end
	p_u_84.utilRef = v_u_6.createRef()
	p_u_84.state = {
		["searchTerm"] = nil,
		["utilTabHeight"] = 0
	}
	function p_u_84.onSearchTermChanged(p104)
		-- upvalues: (copy) p_u_84, (ref) v_u_6
		if p104 == nil or p104 == "" then
			p_u_84:setState({
				["searchTerm"] = v_u_6.None
			})
		else
			p_u_84:setState({
				["searchTerm"] = p104
			})
		end
	end
end
function v19.didMount(p105) -- name: didMount
	p105:setState({
		["utilTabHeight"] = p105.utilRef.current.Size.Y.Offset
	})
end
function v19.willUnmount(_) -- name: willUnmount end
function v19.didUpdate(p106) -- name: didUpdate
	local v107 = p106.utilRef.current.Size
	if v107.Y.Offset ~= p106.state.utilTabHeight then
		p106:setState({
			["utilTabHeight"] = v107.Y.Offset
		})
	end
end
function v19.render(p108) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_17, (copy) v_u_18, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13
	local v109 = p108.props.size
	local v110 = p108.props.formFactor
	local v111 = p108.props.tabList
	local v112 = p108.state.utilTabHeight
	local v113, v114 = p108:getActiveState()
	local v115 = v_u_6.createElement
	local v116 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v109,
		["BackgroundColor3"] = v_u_17.Color.BaseGray
	}
	local v117 = {
		["UIListLayout"] = v_u_6.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_18),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UtilAndTab"] = v_u_6.createElement(v_u_11, {
			["windowWidth"] = nil,
			["formFactor"] = nil,
			["tabList"] = nil,
			["layoutOrder"] = 1,
			["isClientView"] = nil,
			["onClientButton"] = nil,
			["onServerButton"] = nil,
			["refForParent"] = nil,
			["onHeightChanged"] = nil,
			["onSearchTermChanged"] = nil,
			["windowWidth"] = v109.X.Offset,
			["formFactor"] = v110,
			["tabList"] = v111,
			["isClientView"] = v113,
			["onClientButton"] = p108.onClientButton,
			["onServerButton"] = p108.onServerButton,
			["refForParent"] = p108.utilRef,
			["onHeightChanged"] = p108.onUtilTabHeightChanged,
			["onSearchTermChanged"] = p108.onSearchTermChanged
		}, { v_u_6.createElement(v_u_12, {
				["text"] = "Create Snapshot",
				["onClicked"] = nil,
				["onClicked"] = p108.onCreateSnapshot
			}), v_u_6.createElement(v_u_12, {
				["text"] = "Clear Snapshots",
				["onClicked"] = nil,
				["onClicked"] = p108.onClearSnapshots
			}) }),
		["LuauHeapView"] = v_u_6.createElement(v_u_13, {
			["size"] = nil,
			["layoutOrder"] = 2,
			["data"] = nil,
			["activeSnapshot"] = nil,
			["compareSnapshot"] = nil,
			["size"] = UDim2.new(1, 0, 1, -v112),
			["data"] = p108.filterSnapshots(v114.snapshots, p108.state.searchTerm, p108.version),
			["activeSnapshot"] = v114.active,
			["compareSnapshot"] = v114.compare
		})
	}
	return v115("Frame", v116, v117)
end
return v7.UNSTABLE_connect2(function(p118, _) -- name: mapStateToProps
	return {
		["isClientView"] = p118.LuauHeap.isClientView,
		["client"] = p118.LuauHeap.client,
		["server"] = p118.LuauHeap.server
	}
end, function(p_u_119) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_15, (copy) v_u_16
	return {
		["dispatchSetLuauHeapState"] = function(p120, p121) -- name: dispatchSetLuauHeapState
			-- upvalues: (copy) p_u_119, (ref) v_u_15
			p_u_119(v_u_15(p120, p121))
		end,
		["dispatchSetLuauHeapProfileTarget"] = function(p122) -- name: dispatchSetLuauHeapProfileTarget
			-- upvalues: (copy) p_u_119, (ref) v_u_16
			p_u_119(v_u_16(p122))
		end
	}
end)(v10(v19, "LuauHeapData"))