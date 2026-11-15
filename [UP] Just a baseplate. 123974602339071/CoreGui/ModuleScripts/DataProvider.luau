-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DataProvider
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent.Components
local v_u_5 = require(v4.Log.LogData)
local v_u_6 = require(v4.Memory.ClientMemoryData)
local v_u_7 = require(v4.Memory.ServerMemoryData)
local v_u_8 = require(v4.Network.NetworkData)
local v_u_9 = require(v4.Scripts.ServerScriptsData)
local v_u_10 = require(v4.DataStores.DataStoresData)
local v_u_11 = require(v4.ServerStats.ServerStatsData)
local v_u_12 = require(v4.ActionBindings.ActionBindingsData)
local v_u_13 = require(v4.ServerJobs.ServerJobsData)
local v_u_14 = require(v4.DebugVisualizations.DebugVisualizationsData)
local v_u_15 = require(v4.LuauHeap.LuauHeapData)
local v_u_16 = require(v4.VoiceChat.VoiceChatData)
local v_u_17 = require(v4.VoiceDebug.VoiceDebugData)
local v_u_18 = require(v4.VoiceDebug.GetFFlagVoiceDebugConsoleV2)
local v_u_19 = require(v4.DataContext)
local v20 = v_u_2.Component:extend("DataProvider")
local v_u_21 = game:GetEngineFeature("VoiceChatDevConsoleTabEnabled")
local v_u_22 = game:DefineFastFlag("DevConsoleStartDataOnMount", false)
function v20.init(p23) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_21, (copy) v_u_18, (copy) v_u_16, (copy) v_u_17
	local v24 = {}
	local v25 = {
		["ClientLogData"] = v_u_5.new(true),
		["ServerLogData"] = v_u_5.new(false),
		["ClientMemoryData"] = v_u_6.new(),
		["ServerMemoryData"] = v_u_7.new(),
		["ClientNetworkData"] = v_u_8.new(true),
		["ServerNetworkData"] = v_u_8.new(false),
		["ServerScriptsData"] = v_u_9.new(),
		["DataStoresData"] = v_u_10.new(),
		["ServerStatsData"] = v_u_11.new(),
		["ActionBindingsData"] = v_u_12.new(),
		["ServerJobsData"] = v_u_13.new(),
		["DebugVisualizationsData"] = v_u_14.new(),
		["LuauHeapData"] = v_u_15.new()
	}
	local v26
	if v_u_21 and not v_u_18() then
		v26 = v_u_16.new()
	else
		v26 = nil
	end
	v25.VoiceChatData = v26
	local v27
	if v_u_21 and v_u_18() then
		v27 = v_u_17.new()
	else
		v27 = nil
	end
	v25.VoiceDebugData = v27
	v24.DevConsoleData = v25
	p23:setState(v24)
end
function v20.didMount(p28) -- name: didMount
	-- upvalues: (copy) v_u_21, (copy) v_u_18, (copy) v_u_22
	p28.state.DevConsoleData.ClientLogData:start()
	p28.state.DevConsoleData.ClientMemoryData:start()
	if v_u_21 then
		if v_u_18() then
			p28.state.DevConsoleData.VoiceDebugData:start()
		else
			p28.state.DevConsoleData.VoiceChatData:start()
		end
	end
	if v_u_22 and p28.props.isDeveloperView then
		for _, v29 in pairs(p28.state.DevConsoleData) do
			if v29:isRunning() then
				continue
			end
			v29:start()
		end
	end
end
function v20.willUpdate(p30, p31, _) -- name: willUpdate
	if p31.isDeveloperView and not p30.props.isDeveloperView then
		for _, v32 in pairs(p30.state.DevConsoleData) do
			if v32:isRunning() then
				continue
			end
			v32:start()
		end
	end
end
function v20.render(p33) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_19
	return v_u_2.createElement(v_u_19.Provider, {
		["value"] = p33.state.DevConsoleData
	}, v_u_2.oneChild(p33.props[v_u_2.Children]))
end
return v3.UNSTABLE_connect2(function(p34, _) -- name: mapStateToProps
	return {
		["isDeveloperView"] = p34.MainView.isDeveloperView
	}
end, nil)(v20)