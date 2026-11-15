-- Path: CoreGui.RobloxGui.Modules.DevConsoleMaster
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("StarterGui")
local v_u_3 = game:GetService("UserInputService")
local v4 = game:GetService("CorePackages")
local v_u_5 = game:GetService("Players")
local v_u_6 = require(v4.Packages.Roact)
local v_u_7 = require(v4.Packages.Rodux)
local v_u_8 = require(v4.Packages.RoactRodux)
local v9 = script.Parent.DevConsole
local v_u_10 = require(v9.Constants)
local v11 = v9.Components
local v_u_12 = require(v11.DevConsoleWindow)
local v_u_13 = require(v11.DataProvider)
local v14 = require(v11.Log.MainViewLog)
local v15 = require(v11.Memory.MainViewMemory)
local v16 = require(v11.Network.MainViewNetwork)
local v17 = require(v11.Scripts.MainViewScripts)
local v18 = require(v11.DataStores.MainViewDataStores)
local v19 = require(v11.ServerStats.MainViewServerStats)
local v20 = require(v11.ActionBindings.MainViewActionBindings)
local v21 = require(v11.ServerJobs.MainViewServerJobs)
local v22 = require(v11.MicroProfiler.MainViewMicroProfiler)
local v23 = require(v11.ScriptProfiler.MainViewScriptProfiler)
local v24 = require(v11.DebugVisualizations.MainViewDebugVisualizations)
local v25 = require(v11.LuauHeap.MainViewLuauHeap)
local v26 = require(v11.VoiceChat.MainViewVoiceChat)
local v27 = require(v11.VoiceDebug.MainViewVoiceDebug)
local v_u_28 = require(v11.VoiceDebug.GetFFlagVoiceDebugConsoleV2)
local v29 = require(v11.RequestOrchestrator.MainViewRequestOrchestrator)
local v_u_30 = require(v11.MicroProfiler.RCCProfilerDataCompleteListener)
local v_u_31 = require(v9.Util.getClientReplicator)
local v_u_32 = require(v9.Reducers.MainView)
local v_u_33 = require(v9.Reducers.DevConsoleReducer)
local v34 = v9.Actions
local v_u_35 = require(v34.SetDevConsoleVisibility)
local v_u_36 = require(v34.SetTabList)
local v37 = v9.MiddleWare
local v_u_38 = require(v37.DevConsoleAnalytics)
local v_u_39 = require(v_u_1.RobloxGui.Modules.PlayerPermissionsModule)
local v40 = game:GetEngineFeature("ScriptProfiler")
local v_u_41 = game:DefineFastFlag("DevConsoleRequestOrchestratorTab2", false)
local v_u_42 = game:DefineFastFlag("DevConsoleAdminSeesDevTabs", false)
local v_u_43 = require(v_u_1.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_44 = false
local v_u_45 = {
	["Log"] = {
		["tab"] = nil,
		["layoutOrder"] = 1,
		["hasClientServer"] = true,
		["tab"] = v14
	},
	["Memory"] = {
		["tab"] = nil,
		["layoutOrder"] = 2,
		["hasClientServer"] = true,
		["tab"] = v15
	},
	["Network"] = {
		["tab"] = nil,
		["layoutOrder"] = 3,
		["hasClientServer"] = true,
		["tab"] = v16
	},
	["Scripts"] = {
		["tab"] = nil,
		["layoutOrder"] = 4,
		["tab"] = v17
	},
	["DataStores"] = {
		["tab"] = nil,
		["layoutOrder"] = 5,
		["tab"] = v18
	},
	["ServerStats"] = {
		["tab"] = nil,
		["layoutOrder"] = 6,
		["tab"] = v19
	},
	["ActionBindings"] = {
		["tab"] = nil,
		["layoutOrder"] = 7,
		["tab"] = v20
	},
	["ServerJobs"] = {
		["tab"] = nil,
		["layoutOrder"] = 8,
		["tab"] = v21
	},
	["MicroProfiler"] = {
		["tab"] = nil,
		["layoutOrder"] = 9,
		["tab"] = v22
	},
	["DebugVisualizations"] = {
		["tab"] = nil,
		["layoutOrder"] = 10,
		["tab"] = v24
	},
	["ScriptProfiler"] = v40 and {
		["tab"] = nil,
		["layoutOrder"] = 11,
		["tab"] = v23
	} or nil,
	["LuauHeap"] = {
		["tab"] = nil,
		["layoutOrder"] = 12,
		["tab"] = v25
	}
}
local v_u_46 = {
	["Log"] = {
		["tab"] = nil,
		["layoutOrder"] = 1,
		["tab"] = v14
	},
	["Memory"] = {
		["tab"] = nil,
		["layoutOrder"] = 2,
		["tab"] = v15
	},
	["ScriptProfiler"] = v40 and {
		["tab"] = nil,
		["layoutOrder"] = 3,
		["tab"] = v23
	} or nil,
	["LuauHeap"] = {
		["tab"] = nil,
		["layoutOrder"] = 4,
		["tab"] = v25
	},
	["VoiceChat"] = not v_u_28() and (game:GetEngineFeature("VoiceChatDevConsoleTabEnabled") and (v_u_43 and v_u_43:canUseService())) and {
		["tab"] = nil,
		["layoutOrder"] = 5,
		["tab"] = v26
	} or nil
}
local v_u_47 = {
	["Log"] = {
		["tab"] = nil,
		["layoutOrder"] = 1,
		["tab"] = v14
	},
	["Memory"] = {
		["tab"] = nil,
		["layoutOrder"] = 2,
		["tab"] = v15
	}
}
local v_u_49 = {
	["VoiceChat"] = {
		["tab"] = nil,
		["layoutOrder"] = 13,
		["isEnabled"] = nil,
		["tab"] = v26,
		["isEnabled"] = function() -- name: isEnabled
			-- upvalues: (copy) v_u_28, (copy) v_u_43
			local v48 = not v_u_28() and game:GetEngineFeature("VoiceChatDevConsoleTabEnabled")
			if v48 then
				if v_u_43 == nil then
					v48 = false
				else
					v48 = v_u_43:canUseService()
				end
			end
			return v48
		end
	},
	["VoiceDebug"] = {
		["tab"] = nil,
		["layoutOrder"] = 14,
		["isEnabled"] = nil,
		["tab"] = v27,
		["isEnabled"] = function() -- name: isEnabled
			-- upvalues: (ref) v_u_44
			return v_u_44
		end
	},
	["RequestOrchestrator"] = {
		["tab"] = nil,
		["layoutOrder"] = 100,
		["isEnabled"] = nil,
		["tab"] = v29,
		["isEnabled"] = function() -- name: isEnabled
			-- upvalues: (copy) v_u_41
			return v_u_41
		end
	}
}
local v_u_50 = {}
v_u_50.__index = v_u_50
local v_u_51 = {
	[Enum.Platform.Windows] = v_u_10.FormFactor.Large,
	[Enum.Platform.OSX] = v_u_10.FormFactor.Large,
	[Enum.Platform.IOS] = v_u_10.FormFactor.Small,
	[Enum.Platform.Android] = v_u_10.FormFactor.Small,
	[Enum.Platform.XBoxOne] = v_u_10.FormFactor.Console,
	[Enum.Platform.PS4] = v_u_10.FormFactor.Console,
	[Enum.Platform.PS3] = v_u_10.FormFactor.Console,
	[Enum.Platform.XBox360] = v_u_10.FormFactor.Console,
	[Enum.Platform.WiiU] = v_u_10.FormFactor.Console,
	[Enum.Platform.NX] = v_u_10.FormFactor.Console,
	[Enum.Platform.Ouya] = v_u_10.FormFactor.Console,
	[Enum.Platform.AndroidTV] = v_u_10.FormFactor.Console,
	[Enum.Platform.Chromecast] = v_u_10.FormFactor.Console,
	[Enum.Platform.Linux] = v_u_10.FormFactor.Large,
	[Enum.Platform.SteamOS] = v_u_10.FormFactor.Console,
	[Enum.Platform.WebOS] = v_u_10.FormFactor.Large,
	[Enum.Platform.DOS] = v_u_10.FormFactor.Large,
	[Enum.Platform.BeOS] = v_u_10.FormFactor.Large,
	[Enum.Platform.UWP] = v_u_10.FormFactor.Large,
	[Enum.Platform.None] = v_u_10.FormFactor.Large
}
local function v_u_55() -- name: getAdminTabList
	-- upvalues: (copy) v_u_45, (copy) v_u_49
	local v52 = table.clone(v_u_45)
	for v53, v54 in pairs(v_u_49) do
		if v54.isEnabled ~= nil and not v54.isEnabled() then
			continue
		end
		v52[v53] = {
			["tab"] = v54.tab,
			["layoutOrder"] = v54.layoutOrder
		}
	end
	return v52
end
function v_u_50.new() -- name: new
	-- upvalues: (copy) v_u_50
	local v_u_56 = {}
	local v57 = v_u_50
	setmetatable(v_u_56, v57)
	v_u_56.init = false
	v_u_56.isDeveloperTabListActive = false
	v_u_56.isEmployee = false
	v_u_56.waitForStart = true
	v_u_56.waitForStartBindable = Instance.new("BindableEvent")
	coroutine.wrap(function()
		-- upvalues: (copy) v_u_56
		v_u_56:SetupDevConsole()
	end)()
	return v_u_56
end
function v_u_50.SetupDevConsole(p_u_58) -- name: SetupDevConsole
	-- upvalues: (copy) v_u_3, (copy) v_u_51, (copy) v_u_32, (copy) v_u_36, (copy) v_u_47, (copy) v_u_38, (copy) v_u_7, (copy) v_u_33, (copy) v_u_6, (copy) v_u_8, (copy) v_u_13, (copy) v_u_12, (copy) v_u_10, (copy) v_u_30
	local v59 = v_u_51[v_u_3:GetPlatform()]
	local v60 = {
		["MainView"] = v_u_32(nil, v_u_36(v_u_47, "Log"))
	}
	local v61 = { v_u_38 }
	p_u_58.store = v_u_7.Store.new(v_u_33, v60, v61)
	local v62 = p_u_58.store:getState().DisplayOptions.isVisible
	local v63 = v_u_6.createElement
	local v64 = v_u_8.StoreProvider
	local v65 = {
		["store"] = p_u_58.store
	}
	local v66 = {}
	local v67 = v_u_6.createElement
	local v68 = v_u_13
	local v69 = {}
	local v70 = v_u_6.createElement
	local v72 = {
		["DevConsoleWindow"] = v_u_6.createElement(v_u_12, {
			["formFactor"] = nil,
			["isDeveloperView"] = false,
			["isVisible"] = nil,
			["isMinimized"] = false,
			["position"] = nil,
			["size"] = nil,
			["tabList"] = nil,
			["onCloseCallback"] = nil,
			["formFactor"] = v59,
			["isVisible"] = v62,
			["position"] = v_u_10.MainWindowInit.Position,
			["size"] = v_u_10.MainWindowInit.Size,
			["tabList"] = v_u_47,
			["onCloseCallback"] = function(p71) -- name: onCloseCallback
				-- upvalues: (copy) p_u_58
				p_u_58:SetServerStatsConnection(p71)
			end
		}),
		["RCCProfilerDataCompleteListener"] = v_u_6.createElement(v_u_30)
	}
	v69.App = v70("ScreenGui", {
		["OnTopOfCoreBlur"] = true,
		["DisplayOrder"] = 10
	}, v72)
	v66.DataProvider = v67(v68, {
		["isDeveloperView"] = false
	}, v69)
	p_u_58.root = v63(v64, v65, v66)
	p_u_58.waitForStart = false
	p_u_58.waitForStartBindable:Fire()
end
local v_u_73 = v_u_50.new()
function v_u_50.refreshTabList(p74) -- name: refreshTabList
	-- upvalues: (copy) v_u_36, (copy) v_u_55, (copy) v_u_45
	if p74.isEmployee then
		p74.store:dispatch(v_u_36(v_u_55(), "Log", true))
	elseif p74.isDeveloperTabListActive then
		p74.store:dispatch(v_u_36(v_u_45, "Log", true))
	end
end
function v_u_50.refreshVoiceDevConsoleAvailability(p_u_75) -- name: refreshVoiceDevConsoleAvailability
	-- upvalues: (copy) v_u_28, (copy) v_u_43, (ref) v_u_44
	if v_u_28() then
		if game:GetEngineFeature("VoiceChatDevConsoleTabEnabled") and v_u_43 then
			local function v77() -- name: apply
				-- upvalues: (ref) v_u_43, (ref) v_u_44, (copy) p_u_75
				local v76 = v_u_43:VoiceChatAvailable()
				if v76 ~= v_u_44 then
					v_u_44 = v76
					p_u_75:refreshTabList()
				end
			end
			v_u_43:asyncInit():andThen(v77):catch(v77)
		end
	else
		return
	end
end
function v_u_50.Start(p_u_78) -- name: Start
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_31, (copy) v_u_42, (copy) v_u_39, (copy) v_u_5, (copy) v_u_36, (copy) v_u_46, (copy) v_u_45
	if not p_u_78.init then
		if p_u_78.waitForStart then
			p_u_78.waitForStartBindable.Event:Wait()
		end
		p_u_78.init = true
		p_u_78.element = v_u_6.mount(p_u_78.root, v_u_1, "DevConsoleMaster")
		local v79 = v_u_31()
		task.spawn(function()
			-- upvalues: (ref) v_u_42, (ref) v_u_39, (ref) v_u_5, (copy) p_u_78, (ref) v_u_36, (ref) v_u_46
			if v_u_42 then
				if v_u_39.IsPlayerAdminAsync(v_u_5.LocalPlayer) then
					p_u_78.isEmployee = true
					p_u_78:refreshTabList()
					return
				end
			elseif v_u_39.IsPlayerAdminAsync(v_u_5.LocalPlayer) and not p_u_78.isDeveloperTabListActive then
				p_u_78.store:dispatch(v_u_36(v_u_46, "Log", false))
			end
		end)
		task.spawn(function()
			-- upvalues: (copy) p_u_78
			p_u_78:refreshVoiceDevConsoleAvailability()
		end)
		if v79 then
			p_u_78._statsConnector = v79.StatsReceived:connect(function(_)
				-- upvalues: (copy) p_u_78, (ref) v_u_42, (ref) v_u_36, (ref) v_u_45
				if p_u_78._statsConnector then
					p_u_78._statsConnector:Disconnect()
					p_u_78._statsConnector = nil
					p_u_78.isDeveloperTabListActive = true
					if v_u_42 then
						p_u_78:refreshTabList()
					else
						p_u_78.store:dispatch(v_u_36(v_u_45, "Log", true))
					end
				else
					return
				end
			end)
			p_u_78:SetServerStatsConnection(true)
		end
	end
end
function v_u_50.ToggleVisibility(p80) -- name: ToggleVisibility
	-- upvalues: (copy) v_u_28, (copy) v_u_73
	if not p80.init then
		if v_u_28() then
			p80:Start()
		else
			v_u_73:Start()
		end
	end
	p80:SetVisibility(not p80.store:getState().DisplayOptions.isVisible)
end
function v_u_50.GetVisibility(p81) -- name: GetVisibility
	if not p81.init then
		return false
	end
	local v82 = p81.store:getState()
	if not (v82 and v82.DisplayOptions) then
		return false
	end
	local v83 = v82.DisplayOptions.isVisible
	if v83 then
		v83 = not v82.DisplayOptions.isMinimized
	end
	return v83
end
function v_u_50.SetServerStatsConnection(_, p84) -- name: SetServerStatsConnection
	-- upvalues: (copy) v_u_31
	local v85 = v_u_31()
	if v85 then
		v85:RequestServerStats(p84)
	end
end
function v_u_50.SetVisibility(p86, p87) -- name: SetVisibility
	-- upvalues: (copy) v_u_28, (copy) v_u_73, (copy) v_u_35
	if type(p87) == "boolean" then
		if p86.init or not p87 then
			if v_u_28() and p87 then
				p86:refreshVoiceDevConsoleAvailability()
			end
		elseif v_u_28() then
			p86:Start()
		else
			v_u_73:Start()
		end
		p86:SetServerStatsConnection(p87)
		p86.store:dispatch(v_u_35(p87))
	end
end
v2:RegisterGetCore("DevConsoleVisible", function()
	-- upvalues: (copy) v_u_73
	return v_u_73:GetVisibility()
end)
v2:RegisterSetCore("DevConsoleVisible", function(p88)
	-- upvalues: (copy) v_u_73
	if type(p88) ~= "boolean" then
		error("DevConsoleVisible must be given a boolean value.")
	end
	v_u_73:SetVisibility(p88)
end)
if v_u_28() then
	v_u_73.Klass = v_u_50
end
return v_u_73