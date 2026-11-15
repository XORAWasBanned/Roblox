-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScriptProfiler.MainViewScriptProfiler
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v_u_4 = game:GetService("ScriptProfilerService")
local v_u_5 = game:GetService("Players")
local v_u_6 = require(script.Parent.Parent.Parent.Immutable)
local v7 = script.Parent.Parent.Parent.Components
local v_u_8 = require(v7.UtilAndTab)
local v_u_9 = require(v7.BoxButton)
local v_u_10 = require(v7.DropDown)
local v_u_11 = require(script.Parent.ProfilerView)
local v_u_12 = require(script.Parent.ProfilerFunctionsView)
require(script.Parent.ProfilerDataFormatV2)
local v_u_13 = require(script.Parent.ProfilerExportView)
local v_u_14 = require(script.Parent.MobileSettingsView)
local v_u_15 = require(script.Parent.ProfilerUtil)
local v_u_16 = v_u_15.getPluginFlag
local v_u_17 = v_u_15.getDurations
local v_u_18 = v_u_15.formatFrequency
local v19 = script.Parent.Parent.Parent.Actions
local v_u_20 = require(v19.SetScriptProfilerState)
local v_u_21 = require(script.Parent.Actions.SetIsProfiling)
local v_u_22 = require(script.Parent.Actions.SetData)
local v_u_23 = require(script.Parent.Actions.SetThreads)
local v_u_24 = require(script.Parent.Actions.SetTimerState)
local v_u_25 = require(script.Parent.Actions.ClearStateForNewProfilingSession)
local v_u_26 = require(script.Parent.Actions.SetAverage)
local v_u_27 = require(script.Parent.Actions.SetFrequency)
local v_u_28 = require(script.Parent.Actions.SetDataView)
local v_u_29 = require(script.Parent.Actions.SetLiveUpdate)
local v_u_30 = require(script.Parent.Actions.SetShowPlugins)
local v_u_31 = require(script.Parent.Actions.SetShowGC)
local v_u_32 = require(script.Parent.Actions.SetSearchData)
local v_u_33 = require(script.Parent.Parent.Parent.Constants)
local v_u_34 = v_u_33.GeneralFormatting.MainRowPadding
local v_u_35 = v_u_33.UtilityBarFormatting.SmallFrameHeight
local v_u_36 = v_u_33.Font.MainWindowHeader
local v_u_37 = v_u_33.DefaultFontSize.MainWindowHeader
local v_u_38 = v_u_33.Color.Text
local v_u_39 = v_u_33.Color.UnselectedGray
local v40 = v_u_2.PureComponent:extend("MainViewScriptProfiler")
local v_u_41 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false)
local v_u_42 = game:DefineFastInt("ScriptProfilerLiveUpdateIntervalMS", 1000)
local v_u_43 = { "Callgraph", "Functions" }
local function v_u_59(p44, p45, p46, p47, p48, p49) -- name: annotateSearchFilterNodes
	-- upvalues: (copy) v_u_59
	local v50 = p44.Nodes[p48]
	if not v50.Children then
		if p47 > 0 then
			p49 = p45[p47] or p49
		end
		p46[p48] = p49
		local v51
		if p47 > 0 then
			v51 = p45[p47]
		else
			v51 = false
		end
		return v51
	end
	local v52 = v50.Children
	local v53 = false
	if p47 <= 0 or not p45[p47] then
		for v54, v55 in pairs(v52) do
			v53 = v53 or v_u_59(p44, p45, p46, v54, v55, p49)
		end
		if v53 or p49 then
			p46[p48] = true
		end
		return v53
	end
	p46[p48] = true
	local v56 = true
	for v57, v58 in pairs(v52) do
		p46[v58] = true
		v_u_59(p44, p45, p46, v57, v58, true)
	end
	return v56
end
local function v_u_78(p60, p61) -- name: generateSearchFilters
	-- upvalues: (copy) v_u_15, (copy) v_u_59
	if p61 == "" then
		return nil, nil
	end
	local v62 = p60.data
	if not v62 then
		return nil, nil
	end
	local v63 = table.create(#v62.Functions, false)
	for v64, v65 in v62.Functions do
		local v66 = v_u_15.getName(v62, v65)
		if not (v66 and string.find(v66, p61, 1, true)) then
			continue
		end
		v63[v64] = true
	end
	local v67 = table.create(#v62.Nodes, false)
	for _, v68 in v62.Categories do
		local v69 = v68.NodeId
		local v70 = v62.Nodes[v69]
		if v70.Children then
			local v71 = v70.Children
			local v72 = false
			for v73, v74 in pairs(v71) do
				v72 = v72 or v_u_59(v62, v63, v67, v73, v74, false)
			end
			if not v72 then
				break
			end
			v67[v69] = true
		else
			v67[v69] = false
		end
	end
	for v75, v76 in v62.Functions do
		if v63[v75] == true or v_u_15.getName(v62, v76) then
			continue
		end
		local v77 = v_u_15.getSourceName(v62, v76)
		if not (v77 and string.find(v77, p61, 1, true)) then
			continue
		end
		v63[v75] = true
	end
	return v63, v67
end
local function v_u_93(p79, p80) -- name: generatePluginDurationOffsets
	-- upvalues: (copy) v_u_16, (copy) v_u_17
	if not p80 then
		return {}, {}
	end
	local v81 = p80.Version == 2
	assert(v81)
	local v82 = table.create(#p80.Categories, 0)
	local v83 = table.create(#p80.Categories, 0)
	local v84 = 0
	local v85 = 0
	for v86, v87 in p80.Categories do
		local v88 = 0
		local v89 = 0
		local v90 = p80.Nodes[v87.NodeId].Children
		if v90 then
			for v91, v92 in pairs(v90) do
				local _ = p80.Functions[v91]
				if not v_u_16(p80, p80.Functions[v91]) then
					continue
				end
				v88 = v88 + v_u_17(p80, v92)
				if #p79 <= 0 then
					continue
				end
				v89 = v89 + p79[v92]
			end
		end
		v82[v86] = v88
		v83[v86] = v89
		v84 = v84 + v88
		v85 = v85 + v89
	end
	v82.Total = v84
	v83.Total = v84
	return v82, v83
end
local function v_u_104(p94, p95, p96, p97, p98) -- name: getGCOverhead
	-- upvalues: (copy) v_u_104
	local v99 = p96.Nodes[p97]
	local v100 = 0
	if v99.Children then
		for v101, v102 in pairs(v99.Children) do
			local v103
			if v101 == p98 then
				v103 = p96.Nodes[v102].TotalDuration
			else
				v103 = v_u_104(p94, p95, p96, v102, p98)
			end
			p94[v101] = p94[v101] + v103
			p95[v102] = v103
			v100 = v100 + v103
		end
	end
	return v100
end
local function v_u_113(p105) -- name: generateGCOverheadOffsets
	-- upvalues: (copy) v_u_104
	if not (p105 and p105.GCFuncId) then
		return {}, {}
	end
	local v106 = p105.GCFuncId
	local v107 = table.create(#p105.Functions, 0)
	local v108 = table.create(#p105.Nodes, 0)
	local v109 = 0
	for _, v110 in p105.Categories do
		local v111 = v110.NodeId
		local v112 = v_u_104(v107, v108, p105, v111, v106)
		v109 = v109 + v112
		v108[v111] = v112
	end
	v108.Total = v109
	return v107, v108
end
function v40.getActiveState(p114) -- name: getActiveState
	local v115 = p114.props.isClientView
	if p114.props.isClientView then
		return v115, p114.props.client
	else
		return v115, p114.props.server
	end
end
function v40.getState(p116, p117) -- name: getState
	if p117 then
		return p116.props.client
	else
		return p116.props.server
	end
end
function v40.UpdateState(p118, p119, p120) -- name: UpdateState
	if p119 then
		p118.props.dispatchSetScriptProfilerState(nil, nil, p120, nil)
	else
		p118.props.dispatchSetScriptProfilerState(nil, nil, nil, p120)
	end
end
local function v_u_132(p121, p122, p123) -- name: OnNewProfilingData
	-- upvalues: (copy) v_u_4, (copy) v_u_113, (copy) v_u_41, (copy) v_u_93
	p121.serializedData = p123
	p121.data = v_u_4:DeserializeJSON(p123)
	local v124, v125 = v_u_113(p121.data)
	p121.gcFunctionOffsets = v124
	p121.gcNodeOffsets = v125
	if v_u_41 then
		local v126, v127 = v_u_93(p121.gcNodeOffsets, p121.data)
		p121.pluginOffsets = v126
		p121.pluginGCOffsets = v127
	end
	local v128 = p121.data and #p121.data.Nodes or 0
	local v129 = p122.data and #p122.data.Nodes or 0
	local v130 = table.create(v128, false)
	local v131 = p122.expandedNodes
	table.move(v131, 1, v129, 1, v130)
	p121.expandedNodes = v130
end
function v40.init(p_u_133) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_42, (copy) v_u_78, (copy) v_u_2
	function p_u_133.onUtilTabHeightChanged(p134)
		-- upvalues: (copy) p_u_133
		p_u_133:setState({
			["utilTabHeight"] = p134
		})
	end
	local function v_u_139(p135) -- name: UpdateTimedProfilingTimer
		-- upvalues: (copy) p_u_133
		while task.wait(0.5) do
			local v136 = p_u_133:getState(p135).timedProfilingCountdown
			if v136 <= 0 then
				break
			end
			local v137 = p_u_133.props.dispatchSetTimer
			local v138 = {
				["timedProfilingCountdown"] = v136 - 0.5
			}
			v137(p135, v138)
		end
	end
	local function v_u_141(p140) -- name: LiveUpdate
		-- upvalues: (ref) v_u_42, (copy) p_u_133, (ref) v_u_4, (ref) v_u_5
		while task.wait(v_u_42 / 1000) do
			if not p_u_133:getState(p140).liveUpdate then
				continue
			end
			if p140 then
				v_u_4:ClientRequestData(v_u_5.LocalPlayer)
			else
				v_u_4:ServerRequestData()
			end
		end
	end
	function p_u_133.onBeginProfile()
		-- upvalues: (copy) p_u_133, (ref) v_u_4, (ref) v_u_5, (copy) v_u_139, (copy) v_u_141
		local v_u_142, v143 = p_u_133:getActiveState()
		if v_u_142 then
			v_u_4:ClientStart(v_u_5.LocalPlayer, v143.frequency)
		else
			v_u_4:ServerStart(v143.frequency)
		end
		p_u_133.props.dispatchSetIsProfiling(v_u_142, true)
		p_u_133.props.dispatchClearStateForNewSession(v_u_142)
		local v144 = {}
		if v143.timedProfilingDuration > 0 then
			p_u_133.props.dispatchSetTimer(v_u_142, {
				["timedProfilingCountdown"] = v143.timedProfilingDuration
			})
			v144.timedProfilingThread = task.delay(v143.timedProfilingDuration, function()
				-- upvalues: (copy) v_u_142, (ref) p_u_133, (ref) v_u_4, (ref) v_u_5
				local v145 = v_u_142
				if p_u_133:getState(v145).isProfiling then
					if v145 then
						v_u_4:ClientStop(v_u_5.LocalPlayer)
					else
						v_u_4:ServerStop()
					end
					p_u_133.props.dispatchSetIsProfiling(v145, false)
					if v145 then
						v_u_4:ClientRequestData(v_u_5.LocalPlayer)
						return
					end
					v_u_4:ServerRequestData()
				end
			end)
			v144.timedProfilingTimerThread = task.spawn(function()
				-- upvalues: (ref) v_u_139, (copy) v_u_142
				v_u_139(v_u_142)
			end)
		end
		v144.liveUpdateThread = task.spawn(v_u_141, v_u_142)
		p_u_133.props.dispatchSetThreads(v_u_142, v144)
	end
	function p_u_133.onEndProfile()
		-- upvalues: (copy) p_u_133, (ref) v_u_4, (ref) v_u_5
		local v146, v147 = p_u_133:getActiveState()
		if v146 then
			v_u_4:ClientStop(v_u_5.LocalPlayer)
		else
			v_u_4:ServerStop()
		end
		local v148 = {}
		if v147.timedProfilingThread then
			task.cancel(v147.timedProfilingThread)
			v148.timedProfilingThread = nil
		end
		if v147.timedProfilingTimerThread then
			task.cancel(v147.timedProfilingTimerThread)
			v148.timedProfilingTimerThread = nil
		end
		if v147.liveUpdateThread then
			task.cancel(v147.liveUpdateThread)
			v148.liveUpdateThread = nil
		end
		p_u_133.props.dispatchSetThreads(v146, {})
		p_u_133.props.dispatchSetIsProfiling(v146, false)
		if v146 then
			v_u_4:ClientRequestData(v_u_5.LocalPlayer)
		else
			v_u_4:ServerRequestData()
		end
	end
	function p_u_133.toggleTimedProfiling()
		-- upvalues: (copy) p_u_133
		local v149, v150 = p_u_133:getActiveState()
		local v151 = v150.timedProfilingDuration
		local v152 = v151 == 0 and 60 or (v151 == 60 and 300 or (v151 == 300 and 600 or 0))
		p_u_133.props.dispatchSetTimer(v149, {
			["timedProfilingDuration"] = v152
		})
	end
	function p_u_133.toggleAverage()
		-- upvalues: (copy) p_u_133
		local v153, v154 = p_u_133:getActiveState()
		local v155 = v154.average
		local v156 = v155 == 0 and 1 or (v155 == 1 and 60 or (v155 == 60 and 300 or (v155 == 300 and 600 or 0)))
		p_u_133.props.dispatchSetAverage(v153, v156)
	end
	function p_u_133.toggleUnits()
		-- upvalues: (copy) p_u_133
		p_u_133.props.dispatchSetScriptProfilerState(nil, not p_u_133.props.usePercentages, nil, nil)
	end
	function p_u_133.toggleFrequency()
		-- upvalues: (copy) p_u_133
		local v157, v158 = p_u_133:getActiveState()
		local v159 = v158.frequency == 1000 and 10000 or 1000
		p_u_133.props.dispatchSetFrequency(v157, v159)
	end
	function p_u_133.onClientButton()
		-- upvalues: (copy) p_u_133
		p_u_133.props.dispatchSetScriptProfilerState(true)
	end
	function p_u_133.onServerButton()
		-- upvalues: (copy) p_u_133
		p_u_133.props.dispatchSetScriptProfilerState(false)
	end
	function p_u_133.dataViewDropDownCallback(p160)
		-- upvalues: (copy) p_u_133
		local v161, v162 = p_u_133:getActiveState()
		local v163 = v162.isFunctionsView
		local v164
		if p160 == 1 then
			v164 = false
		else
			v164 = p160 == 2 and true or v163
		end
		p_u_133.props.dispatchSetDataView(v161, v164)
	end
	function p_u_133.onCheckboxChanged(p165, p166)
		-- upvalues: (copy) p_u_133
		local v167 = p_u_133.props.isClientView
		if p165 == "Live" then
			p_u_133.props.dispatchSetLiveUpdate(v167, p166)
			return
		elseif p165 == "Plugins" then
			p_u_133.props.dispatchSetShowPlugins(v167, p166)
		elseif p165 == "GC" then
			p_u_133.props.dispatchSetShowGC(v167, p166)
		end
	end
	function p_u_133.onSearchTermChanged(p168)
		-- upvalues: (copy) p_u_133, (ref) v_u_78
		local v169, v170 = p_u_133:getActiveState()
		local v171, v172 = v_u_78(v170, p168)
		p_u_133.props.dispatchSetSearchData(v169, {
			["searchTerm"] = p168,
			["searchFilterFlat"] = v171 or {},
			["searchFilterGraph"] = v172 or {}
		})
	end
	p_u_133.utilRef = v_u_2.createRef()
	p_u_133.state = {
		["utilTabHeight"] = 0
	}
end
function v40.didMount(p_u_173) -- name: didMount
	-- upvalues: (copy) v_u_4, (copy) v_u_132
	p_u_173:setState({
		["utilTabHeight"] = p_u_173.utilRef.current.Size.Y.Offset
	})
	p_u_173.scriptProfilerConnection = v_u_4.OnNewData:Connect(function(p174, p175)
		-- upvalues: (copy) p_u_173, (ref) v_u_132
		local v176 = p174 ~= nil
		local v177 = {}
		v_u_132(v177, p_u_173:getState(v176), p175)
		p_u_173.props.dispatchSetData(v176, v177)
	end)
end
function v40.willUnmount(p178) -- name: willUnmount
	p178.scriptProfilerConnection:Disconnect()
	p178.scriptProfilerConnection = nil
end
function v40.didUpdate(p179) -- name: didUpdate
	local v180 = p179.utilRef.current.Size
	if v180.Y.Offset ~= p179.state.utilTabHeight then
		p179:setState({
			["utilTabHeight"] = v180.Y.Offset
		})
	end
end
function v40.renderUtilButtons(p_u_181, p182, p183, p184) -- name: renderUtilButtons
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_18, (copy) v_u_37, (copy) v_u_38, (copy) v_u_36, (copy) v_u_33, (copy) v_u_39, (copy) v_u_15, (copy) v_u_10, (copy) v_u_35, (copy) v_u_43
	local v_u_185 = p182.isProfiling
	local v186 = {}
	local v187 = v_u_2.createElement
	local v188 = v_u_9
	local v189 = {
		["text"] = v_u_185 and "Stop" or "Start",
		["onClicked"] = v_u_185 and p_u_181.onEndProfile or p_u_181.onBeginProfile
	}
	table.insert(v186, v187(v188, v189))
	if not p184 then
		local v190 = v_u_2.createElement
		local v191 = v_u_9
		local v192 = {
			["text"] = p_u_181.props.usePercentages and "Unit: %" or "Unit: ms",
			["onClicked"] = p_u_181.toggleUnits
		}
		table.insert(v186, v190(v191, v192))
	end
	if not p184 then
		local v193 = v_u_2.createElement
		local v194 = "TextButton"
		local v195 = {
			["Text"] = "Freq: " .. v_u_18(p182.frequency),
			["TextSize"] = v_u_37,
			["TextColor3"] = v_u_38,
			["Font"] = v_u_36,
			["AutoButtonColor"] = true
		}
		local v196
		if v_u_185 then
			v196 = v_u_33.Color.InactiveBox
		else
			v196 = v_u_39
		end
		v195.BackgroundColor3 = v196
		v195.BackgroundTransparency = 0
		v195[v_u_2.Event.Activated] = function()
			-- upvalues: (copy) v_u_185, (copy) p_u_181
			if not v_u_185 then
				p_u_181.toggleFrequency()
			end
		end
		table.insert(v186, v193(v194, v195))
	end
	if not p184 then
		local v197 = v_u_2.createElement
		local v198 = "TextButton"
		local v199 = {}
		local v200 = "Time"
		local v201
		if v_u_185 then
			v201 = p182.timedProfilingCountdown
		else
			v201 = p182.timedProfilingDuration
		end
		local v202 = v_u_15.formatTimer(v201)
		if v202 ~= "" then
			v202 = ": " .. v202
		end
		v199.Text = v200 .. v202
		v199.TextSize = v_u_37
		v199.TextColor3 = v_u_38
		v199.Font = v_u_36
		v199.AutoButtonColor = true
		local v203
		if v_u_185 then
			v203 = v_u_33.Color.InactiveBox
		else
			v203 = v_u_39
		end
		v199.BackgroundColor3 = v203
		v199.BackgroundTransparency = 0
		v199[v_u_2.Event.Activated] = function()
			-- upvalues: (copy) v_u_185, (copy) p_u_181
			if not v_u_185 then
				p_u_181.toggleTimedProfiling()
			end
		end
		table.insert(v186, v197(v198, v199))
	end
	if not p184 then
		local v204 = v_u_2.createElement
		local v205 = "TextButton"
		local v206 = {}
		local v207 = "Average"
		local v208 = p182.average
		local v209 = v_u_15.formatTimer(v208)
		if v209 ~= "" then
			v209 = ": " .. v209
		end
		v206.Text = v207 .. v209
		v206.TextSize = v_u_37
		v206.TextColor3 = v_u_38
		v206.Font = v_u_36
		v206.AutoButtonColor = true
		local v210
		if v_u_185 then
			v210 = v_u_33.Color.InactiveBox
		else
			v210 = v_u_39
		end
		v206.BackgroundColor3 = v210
		v206.BackgroundTransparency = 0
		v206[v_u_2.Event.Activated] = function()
			-- upvalues: (copy) v_u_185, (copy) p_u_181
			if not v_u_185 then
				p_u_181.toggleAverage()
			end
		end
		table.insert(v186, v204(v205, v206))
	end
	if not p184 then
		local v211 = v_u_2.createElement
		local v212 = v_u_9
		local v213 = {
			["text"] = "Export",
			["onClicked"] = nil,
			["onClicked"] = p_u_181.props.dispatchStartExport
		}
		table.insert(v186, v211(v212, v213))
	end
	if not p184 then
		local v214 = v_u_2.createElement
		local v215 = v_u_10
		local v216 = {
			["buttonSize"] = UDim2.new(0, 100, 0, v_u_35),
			["dropDownList"] = v_u_43,
			["selectedIndex"] = p182.isFunctionsView and 2 or 1,
			["onSelection"] = p_u_181.dataViewDropDownCallback
		}
		table.insert(v186, v214(v215, v216))
	end
	if p183 then
		local v217 = v_u_2.createElement
		local v218 = v_u_9
		table.insert(v186, v217(v218, {
			["text"] = "More...",
			["onClicked"] = nil,
			["onClicked"] = function() -- name: onClicked
				-- upvalues: (copy) p_u_181
				p_u_181.props.dispatchShowMobileSettings()
			end
		}))
	end
	return v186
end
function v40.renderUtilAndTab(p219, p220, p221) -- name: renderUtilAndTab
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_6
	local v222 = p219.props.size
	local v223 = p219.props.formFactor
	local v224 = p219.props.tabList
	return v_u_2.createElement(v_u_8, v_u_6.JoinDictionaries({
		["windowWidth"] = nil,
		["formFactor"] = nil,
		["tabList"] = nil,
		["layoutOrder"] = 1,
		["refForParent"] = nil,
		["onHeightChanged"] = nil,
		["windowWidth"] = v222.X.Offset,
		["formFactor"] = v223,
		["tabList"] = v224,
		["refForParent"] = p219.utilRef,
		["onHeightChanged"] = p219.onUtilTabHeightChanged
	}, p220), p221)
end
function v40.renderExportView(p225) -- name: renderExportView
	-- upvalues: (copy) v_u_2, (copy) v_u_33, (copy) v_u_34, (copy) v_u_9, (copy) v_u_13
	local v226 = p225.props.size
	local v227 = p225.state.utilTabHeight
	local v228 = v_u_2.createElement
	local v229 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v226,
		["BackgroundColor3"] = v_u_33.Color.BaseGray
	}
	local v230 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_34),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UtilAndTab"] = p225:renderUtilAndTab({}, { v_u_2.createElement(v_u_9, {
				["text"] = "Exit",
				["onClicked"] = nil,
				["onClicked"] = p225.props.dispatchFinishedExporting
			}) }),
		["ExportView"] = v_u_2.createElement(v_u_13, {
			["size"] = UDim2.new(1, 0, 1, -v227)
		})
	}
	return v228("Frame", v229, v230)
end
function v40.renderMobileSettingsUI(p231) -- name: renderMobileSettingsUI
	-- upvalues: (copy) v_u_2, (copy) v_u_33, (copy) v_u_34, (copy) v_u_9, (copy) v_u_14
	local v232 = p231.props.size
	local v233 = p231.state.utilTabHeight
	local v234 = v_u_2.createElement
	local v235 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v232,
		["BackgroundColor3"] = v_u_33.Color.BaseGray
	}
	local v236 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_34),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UtilAndTab"] = p231:renderUtilAndTab({}, { v_u_2.createElement(v_u_9, {
				["text"] = "Export",
				["onClicked"] = nil,
				["onClicked"] = p231.props.dispatchStartExport
			}), v_u_2.createElement(v_u_9, {
				["text"] = "Exit",
				["onClicked"] = nil,
				["onClicked"] = p231.props.dispatchHideMobileSettings
			}) }),
		["MobileSettingsView"] = v_u_2.createElement(v_u_14, {
			["size"] = UDim2.new(1, 0, 1, -v233)
		})
	}
	return v234("Frame", v235, v236)
end
function v40.renderProfilerView(p237, p238, p239, p240, p241) -- name: renderProfilerView
	-- upvalues: (copy) v_u_2, (copy) v_u_33, (copy) v_u_34, (copy) v_u_12, (copy) v_u_11, (copy) v_u_41
	local v242 = p239.isProfiling
	local v243 = p239.data
	local v244 = p237.props.usePercentages
	local v245 = p239.isFunctionsView
	local v246 = p239.rootNode
	local v247 = p239.rootNodeName
	local v248 = p239.rootFunc
	local v249 = p237.props.size
	local v250 = p237.state.utilTabHeight
	local v251
	if v243 and (v243.SessionStartTime and v243.SessionEndTime) then
		v251 = v243.SessionEndTime - v243.SessionStartTime
	else
		v251 = nil
	end
	local v252 = v_u_2.createElement
	local v253 = "Frame"
	local v254 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v249,
		["BackgroundColor3"] = v_u_33.Color.BaseGray
	}
	local v255 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_34),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UtilAndTab"] = p237:renderUtilAndTab({
			["isClientView"] = p238,
			["onClientButton"] = p237.onClientButton,
			["onServerButton"] = p237.onServerButton,
			["orderedCheckboxState"] = p241,
			["onCheckboxChanged"] = p237.onCheckboxChanged,
			["onSearchTermChanged"] = p237.onSearchTermChanged,
			["searchTerm"] = p239.searchTerm
		}, p240)
	}
	local v256 = v_u_2.createElement
	local v257
	if v245 then
		v257 = v_u_12
	else
		v257 = v_u_11
	end
	local v258 = {
		["size"] = nil,
		["searchFilter"] = nil,
		["layoutOrder"] = 2,
		["data"] = nil,
		["profiling"] = nil,
		["showAsPercentages"] = nil,
		["sessionLength"] = nil,
		["rootNode"] = nil,
		["rootFunc"] = nil,
		["rootNodeName"] = nil,
		["average"] = nil,
		["showPlugins"] = nil,
		["pluginOffsets"] = nil,
		["showGC"] = nil,
		["gcFunctionOffsets"] = nil,
		["gcNodeOffsets"] = nil,
		["pluginGCOffsets"] = nil,
		["expandedNodes"] = nil,
		["size"] = UDim2.new(1, 0, 1, -v250)
	}
	local v259
	if v245 then
		v259 = p239.searchFilterFlat
	else
		v259 = p239.searchFilterGraph
	end
	v258.searchFilter = v259
	v258.data = v243
	v258.profiling = v242
	v258.showAsPercentages = v244
	v258.sessionLength = v251
	v258.rootNode = v246
	v258.rootFunc = v248
	v258.rootNodeName = v247
	v258.average = p239.average
	v258.showPlugins = p239.showPlugins or not v_u_41
	v258.pluginOffsets = p239.pluginOffsets
	v258.showGC = p239.showGC
	v258.gcFunctionOffsets = p239.gcFunctionOffsets
	v258.gcNodeOffsets = p239.gcNodeOffsets
	v258.pluginGCOffsets = p239.pluginGCOffsets
	local v260
	if v245 then
		v260 = nil
	else
		v260 = p239.expandedNodes
	end
	v258.expandedNodes = v260
	v255.ProfilerView = v256(v257, v258)
	return v252(v253, v254, v255)
end
function v40.render(p261) -- name: render
	-- upvalues: (copy) v_u_33, (copy) v_u_41
	if p261.props.isExporting then
		return p261:renderExportView()
	end
	if p261.props.isShowingMobileSettings then
		return p261:renderMobileSettingsUI()
	end
	local v262 = p261.props.formFactor
	local v263, v264 = p261:getActiveState()
	local v265 = {}
	local v266 = 1
	local v267 = v262 == v_u_33.FormFactor.Small
	if not v267 then
		v265[1] = {
			["name"] = "Live",
			["state"] = nil,
			["state"] = v264.liveUpdate
		}
		if v_u_41 then
			v266 = v266 + 1
			v265[v266] = {
				["name"] = "Plugins",
				["state"] = nil,
				["state"] = v264.showPlugins
			}
		end
		v265[v266 + 1] = {
			["name"] = "GC",
			["state"] = nil,
			["state"] = v264.showGC
		}
	end
	return p261:renderProfilerView(v263, v264, p261:renderUtilButtons(v264, v267, v267), v265)
end
return v3.UNSTABLE_connect2(function(p268, _) -- name: mapStateToProps
	return {
		["isClientView"] = p268.ScriptProfiler.isClientView,
		["usePercentages"] = p268.ScriptProfiler.usePercentages,
		["isExporting"] = p268.ScriptProfiler.isExporting,
		["isShowingMobileSettings"] = p268.ScriptProfiler.isShowingMobileSettings,
		["client"] = p268.ScriptProfiler.client,
		["server"] = p268.ScriptProfiler.server
	}
end, function(p_u_269) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_20, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_24, (copy) v_u_25, (copy) v_u_26, (copy) v_u_27, (copy) v_u_28, (copy) v_u_29, (copy) v_u_30, (copy) v_u_31, (copy) v_u_32
	return {
		["dispatchSetScriptProfilerState"] = function(p270, p271, p272, p273) -- name: dispatchSetScriptProfilerState
			-- upvalues: (copy) p_u_269, (ref) v_u_20
			p_u_269(v_u_20(p270, p271, p272, p273))
		end,
		["dispatchSetIsProfiling"] = function(p274, p275) -- name: dispatchSetIsProfiling
			-- upvalues: (copy) p_u_269, (ref) v_u_21
			p_u_269(v_u_21(p274, p275))
		end,
		["dispatchSetData"] = function(p276, p277) -- name: dispatchSetData
			-- upvalues: (copy) p_u_269, (ref) v_u_22
			p_u_269(v_u_22(p276, p277))
		end,
		["dispatchSetThreads"] = function(p278, p279) -- name: dispatchSetThreads
			-- upvalues: (copy) p_u_269, (ref) v_u_23
			p_u_269(v_u_23(p278, p279))
		end,
		["dispatchSetTimer"] = function(p280, p281) -- name: dispatchSetTimer
			-- upvalues: (copy) p_u_269, (ref) v_u_24
			p_u_269(v_u_24(p280, p281))
		end,
		["dispatchClearStateForNewSession"] = function(p282) -- name: dispatchClearStateForNewSession
			-- upvalues: (copy) p_u_269, (ref) v_u_25
			p_u_269(v_u_25(p282))
		end,
		["dispatchSetAverage"] = function(p283, p284) -- name: dispatchSetAverage
			-- upvalues: (copy) p_u_269, (ref) v_u_26
			p_u_269(v_u_26(p283, p284))
		end,
		["dispatchSetFrequency"] = function(p285, p286) -- name: dispatchSetFrequency
			-- upvalues: (copy) p_u_269, (ref) v_u_27
			p_u_269(v_u_27(p285, p286))
		end,
		["dispatchSetDataView"] = function(p287, p288) -- name: dispatchSetDataView
			-- upvalues: (copy) p_u_269, (ref) v_u_28
			p_u_269(v_u_28(p287, p288))
		end,
		["dispatchSetLiveUpdate"] = function(p289, p290) -- name: dispatchSetLiveUpdate
			-- upvalues: (copy) p_u_269, (ref) v_u_29
			p_u_269(v_u_29(p289, p290))
		end,
		["dispatchSetShowPlugins"] = function(p291, p292) -- name: dispatchSetShowPlugins
			-- upvalues: (copy) p_u_269, (ref) v_u_30
			p_u_269(v_u_30(p291, p292))
		end,
		["dispatchSetShowGC"] = function(p293, p294) -- name: dispatchSetShowGC
			-- upvalues: (copy) p_u_269, (ref) v_u_31
			p_u_269(v_u_31(p293, p294))
		end,
		["dispatchSetSearchData"] = function(p295, p296) -- name: dispatchSetSearchData
			-- upvalues: (copy) p_u_269, (ref) v_u_32
			p_u_269(v_u_32(p295, p296))
		end,
		["dispatchStartExport"] = function() -- name: dispatchStartExport
			-- upvalues: (copy) p_u_269, (ref) v_u_20
			p_u_269(v_u_20(nil, nil, nil, nil, true))
		end,
		["dispatchFinishedExporting"] = function() -- name: dispatchFinishedExporting
			-- upvalues: (copy) p_u_269, (ref) v_u_20
			p_u_269(v_u_20(nil, nil, nil, nil, false))
		end,
		["dispatchShowMobileSettings"] = function() -- name: dispatchShowMobileSettings
			-- upvalues: (copy) p_u_269, (ref) v_u_20
			p_u_269(v_u_20(nil, nil, nil, nil, nil, true))
		end,
		["dispatchHideMobileSettings"] = function() -- name: dispatchHideMobileSettings
			-- upvalues: (copy) p_u_269, (ref) v_u_20
			p_u_269(v_u_20(nil, nil, nil, nil, nil, false))
		end
	}
end)(v40)