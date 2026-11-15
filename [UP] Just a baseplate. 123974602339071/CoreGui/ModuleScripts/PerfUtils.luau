-- Path: CoreGui.RobloxGui.Modules.Common.PerfUtils
local v_u_1 = game:GetService("HttpService")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("Stats")
local v4 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v5 = v4.Modules.InGameMenu
local v_u_6 = require(v2.Workspace.Packages.LoggingProtocol).default
local v_u_7 = require(v4.Modules.isNewInGameMenuEnabled)
local v_u_8 = require(v5.Utility.SendAnalytics)
local v_u_9 = require(v2.Workspace.Packages.CoreScriptsCommon).Constants
local v_u_10 = require(v5.Resources.Constants)
local v_u_11 = require(script.Parent.Flags.GetFFlagEnableInGameMenuDurationLogger)()
local v12
if v3 then
	v12 = v3:FindFirstChild("FrameRateManager")
else
	v12 = nil
end
local v_u_13
if v12 then
	v_u_13 = v12:FindFirstChild("RenderAverage")
else
	v_u_13 = nil
end
local v_u_14 = v_u_1:GenerateGUID()
local v_u_15 = os.clock()
local v_u_16 = os.clock()
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = false
local v_u_20 = false
local v_u_21 = 0
local function v_u_25(p22, p23) -- name: sendEvent
	-- upvalues: (copy) v_u_13, (copy) v_u_7, (copy) v_u_11, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9
	local v24
	if v_u_13 then
		v24 = 1000 / v_u_13:GetValue()
	else
		v24 = nil
	end
	p23.fps = v24
	p23.menu_version = v_u_7() and 2 or 1
	if v_u_11 then
		p22 = p22 .. "_v" .. p23.menu_version
	end
	if p23.menu_session then
		if v_u_11 then
			v_u_6:logEvent(p22, p23)
			return
		end
		v_u_8(v_u_9.AnalyticsInGameMenuName, p22, p23)
	end
end
local function v_u_28() -- name: sendMenuOpening
	-- upvalues: (copy) v_u_11, (copy) v_u_9, (ref) v_u_17, (copy) v_u_14, (ref) v_u_21, (ref) v_u_19, (copy) v_u_25
	local v26
	if v_u_11 then
		v26 = v_u_9.AnalyticsGameMenuOpenStart
	else
		v26 = v_u_9.AnalyticsPerfMenuOpening
	end
	local v27 = {
		["menu_session"] = v_u_17,
		["game_session"] = v_u_14,
		["count"] = v_u_21,
		["interrupted_closing"] = v_u_19
	}
	if v_u_11 then
		v_u_25(v_u_9.AnalyticsGameMenuFlowStart, v27)
	end
	v_u_25(v26, v27)
end
local function v_u_33(p29, p30) -- name: sendMenuClosed
	-- upvalues: (copy) v_u_11, (copy) v_u_9, (ref) v_u_18, (copy) v_u_25
	local v31
	if v_u_11 then
		v31 = v_u_9.AnalyticsGameMenuCloseEnd
	else
		v31 = v_u_9.AnalyticsPerfMenuClosed
	end
	local v32 = {
		["menu_session"] = v_u_18,
		["transition_time_total"] = p29,
		["transition_time_normalized"] = p30
	}
	v_u_25(v31, v32)
	if v_u_11 then
		v_u_25(v_u_9.AnalyticsGameMenuFlowEnd, v32)
	end
end
return {
	["menuOpenBegin"] = function() -- name: menuOpenBegin
		-- upvalues: (ref) v_u_17, (ref) v_u_21, (ref) v_u_15, (copy) v_u_1, (copy) v_u_28, (ref) v_u_20, (ref) v_u_19
		if not v_u_17 then
			v_u_21 = v_u_21 + 1
			v_u_15 = os.clock()
			v_u_17 = v_u_1:GenerateGUID()
			v_u_28()
			v_u_20 = true
			v_u_19 = false
		end
	end,
	["menuOpenComplete"] = function() -- name: menuOpenComplete
		-- upvalues: (ref) v_u_15, (copy) v_u_10, (copy) v_u_11, (copy) v_u_9, (copy) v_u_25, (ref) v_u_17, (ref) v_u_20
		local v34 = os.clock() - v_u_15
		local v35 = v34 - v_u_10.ShieldOpenAnimationTweenTime
		local v36
		if v_u_11 then
			v36 = v_u_9.AnalyticsGameMenuOpenEnd
		else
			v36 = v_u_9.AnalyticsPerfMenuStarted
		end
		v_u_25(v36, {
			["menu_session"] = v_u_17,
			["transition_time_total"] = v34,
			["transition_time_normalized"] = v35
		})
		v_u_20 = false
	end,
	["menuClose"] = function() -- name: menuClose
		-- upvalues: (ref) v_u_16, (ref) v_u_15, (copy) v_u_11, (copy) v_u_9, (copy) v_u_25, (ref) v_u_17, (ref) v_u_20, (ref) v_u_18, (ref) v_u_19
		v_u_16 = os.clock()
		local v37 = v_u_16 - v_u_15
		local v38
		if v_u_11 then
			v38 = v_u_9.AnalyticsGameMenuCloseStart
		else
			v38 = v_u_9.AnalyticsPerfMenuEnding
		end
		v_u_25(v38, {
			["menu_session"] = nil,
			["session_time"] = nil,
			["reason"] = "resume",
			["interrupted_opening"] = nil,
			["menu_session"] = v_u_17,
			["session_time"] = v37,
			["interrupted_opening"] = v_u_20
		})
		v_u_18 = v_u_17
		v_u_17 = nil
		v_u_20 = false
		v_u_19 = true
	end,
	["menuCloseComplete"] = function() -- name: menuCloseComplete
		-- upvalues: (ref) v_u_16, (copy) v_u_10, (copy) v_u_33, (ref) v_u_18, (ref) v_u_19
		local v39 = os.clock() - v_u_16
		v_u_33(v39, v39 - v_u_10.ShieldCloseAnimationTweenTime)
		v_u_18 = nil
		v_u_19 = false
	end,
	["leavingGame"] = function() -- name: leavingGame
		-- upvalues: (ref) v_u_15, (copy) v_u_11, (copy) v_u_9, (copy) v_u_25, (ref) v_u_17, (ref) v_u_20
		local v40 = os.clock() - v_u_15
		local v41
		if v_u_11 then
			v41 = v_u_9.AnalyticsGameMenuCloseStart
		else
			v41 = v_u_9.AnalyticsPerfMenuEnding
		end
		v_u_25(v41, {
			["menu_session"] = nil,
			["session_time"] = nil,
			["reason"] = "leaving",
			["interrupted_opening"] = nil,
			["menu_session"] = v_u_17,
			["session_time"] = v40,
			["interrupted_opening"] = v_u_20
		})
		v_u_17 = nil
	end,
	["getFps"] = function() -- name: getFps
		-- upvalues: (copy) v_u_13
		if v_u_13 then
			return 1000 / v_u_13:GetValue()
		else
			return nil
		end
	end
}