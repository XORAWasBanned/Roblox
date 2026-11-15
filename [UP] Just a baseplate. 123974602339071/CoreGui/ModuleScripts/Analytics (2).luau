-- Path: CoreGui.RobloxGui.Modules.SelfView.Analytics
function debugPrint(_) -- name: debugPrint end
debugPrint("Self View Analytics 10-19-2022__1")
local v_u_1 = game:GetService("RbxAnalyticsService")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = {}
v_u_4.__index = v_u_4
v_u_4.INFO = "info"
v_u_4.WARNING = "warning"
v_u_4.ERROR = "error"
local v_u_5 = "SelfView"
function v_u_4.new(p6) -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	local v7 = p6 or v_u_1
	assert(v7, "Analytics impl must not be nil.")
	local v8 = v_u_4
	return setmetatable({
		["_impl"] = v7
	}, v8)
end
local function v_u_9() -- name: stub end
function v_u_4.stubService() -- name: stubService
	-- upvalues: (copy) v_u_9
	return {
		["SetRBXEvent"] = v_u_9,
		["SetRBXEventStream"] = v_u_9,
		["SendEventDeferred"] = v_u_9,
		["ReportCounter"] = v_u_9,
		["ReportStats"] = v_u_9,
		["ReportInfluxSeries"] = v_u_9,
		["GetSessionId"] = v_u_9
	}
end
function v_u_4.setImpl(p10, p11) -- name: setImpl
	p10._impl = p11
end
function v_u_4._report(p12, p13, p14, _, p15) -- name: _report
	-- upvalues: (copy) v_u_3
	local v16 = v_u_3:IsStudio() and "studio" or "client"
	p12._impl:SendEventDeferred(v16, p13, p14, p15)
end
function v_u_4.reportMicState(p17, p18) -- name: reportMicState
	-- upvalues: (copy) v_u_2, (ref) v_u_5
	local v19 = debugPrint
	local v20 = tostring(p18)
	local v21 = game.GameId
	local v22 = tostring(v21)
	local v23 = game.PlaceId
	local v24 = tostring(v23)
	local v25 = v_u_2.LocalPlayer.UserId
	local v26 = tostring(v25)
	local v27 = p17._impl
	v19("Self View: Analytics:reportMicState, newState: " .. v20 .. ",universeid: " .. v22 .. ",pid: " .. v24 .. ",uid: " .. v26 .. ",sessionid: " .. tostring(v27:GetSessionId()))
	local v28 = v_u_5
	local v29 = tostring(p18)
	local v30 = {
		["state"] = p18
	}
	local v31 = game.GameId
	v30.universeid = tostring(v31)
	local v32 = game.PlaceId
	v30.pid = tostring(v32)
	local v33 = v_u_2.LocalPlayer.UserId
	v30.uid = tostring(v33)
	local v34 = p17._impl
	v30.sessionid = tostring(v34:GetPlaySessionId())
	p17:_report(v28, "inExperienceMicState", v29, v30)
end
function v_u_4.reportCamState(p35, p36) -- name: reportCamState
	-- upvalues: (copy) v_u_2, (ref) v_u_5
	local v37 = debugPrint
	local v38 = tostring(p36)
	local v39 = game.GameId
	local v40 = tostring(v39)
	local v41 = game.PlaceId
	local v42 = tostring(v41)
	local v43 = v_u_2.LocalPlayer.UserId
	local v44 = tostring(v43)
	local v45 = p35._impl
	v37("Self View: Analytics:reporCamState, newState: " .. v38 .. ",universeid: " .. v40 .. ",pid: " .. v42 .. ",uid: " .. v44 .. ",sessionid: " .. tostring(v45:GetSessionId()))
	local v46 = v_u_5
	local v47 = tostring(p36)
	local v48 = {
		["state"] = p36
	}
	local v49 = game.GameId
	v48.universeid = tostring(v49)
	local v50 = game.PlaceId
	v48.pid = tostring(v50)
	local v51 = v_u_2.LocalPlayer.UserId
	v48.uid = tostring(v51)
	local v52 = p35._impl
	v48.sessionid = tostring(v52:GetPlaySessionId())
	p35:_report(v46, "inExperienceCamState", v47, v48)
end
function v_u_4.reportSelfViewEnabledInCoreGuiState(p53, p54) -- name: reportSelfViewEnabledInCoreGuiState
	local v55 = debugPrint
	local v56 = tostring(p54)
	local v57 = game.GameId
	local v58 = tostring(v57)
	local v59 = game.PlaceId
	local v60 = tostring(v59)
	local v61 = p53._impl
	v55("Self View: Analytics:reportSelfViewEnabledInCoreGuiState, newState: " .. v56 .. ",universeid: " .. v58 .. ",pid: " .. v60 .. ",sessionid: " .. tostring(v61:GetSessionId()))
	local v62 = tostring(p54)
	local v63 = {
		["state"] = p54
	}
	local v64 = game.GameId
	v63.universeid = tostring(v64)
	local v65 = game.PlaceId
	v63.pid = tostring(v65)
	local v66 = p53._impl
	v63.sessionid = tostring(v66:GetPlaySessionId())
	p53:_report("SelfView", "enabledinCoreGuiState", v62, v63)
end
function v_u_4.reportSelfViewSessionStarted(p67, p68, p69, p70, p71, p72, p73, p74, p75) -- name: reportSelfViewSessionStarted
	-- upvalues: (copy) v_u_1
	local v76 = debugPrint
	local v77 = game.GameId
	local v78 = tostring(v77)
	local v79 = game.PlaceId
	local v80 = tostring(v79)
	local v81 = p67._impl
	v76("Self View: Analytics:reportSelfViewSessionStarted,universeid: " .. v78 .. ",pid: " .. v80 .. ",sessionid: " .. tostring(v81:GetSessionId()) .. ",x: " .. tostring(p68) .. ",y: " .. tostring(p69) .. ",width: " .. tostring(p70) .. ",height: " .. tostring(p71) .. ",x_relative: " .. tostring(p72) .. ",y_relative: " .. tostring(p73) .. ",width_relative: " .. tostring(p74) .. ",height_relative: " .. tostring(p75))
	local v82 = {}
	local v83 = game.GameId
	v82.universeid = tostring(v83)
	local v84 = game.PlaceId
	v82.pid = tostring(v84)
	local v85 = p67._impl
	v82.sessionid = tostring(v85:GetPlaySessionId())
	v82.x = tostring(p68)
	v82.y = tostring(p69)
	v82.width = tostring(p70)
	v82.height = tostring(p71)
	v82.x_relative = tostring(p72)
	v82.y_relative = tostring(p73)
	v82.width_relative = tostring(p74)
	v82.height_relative = tostring(p75)
	p67:_report("SelfView", "sessionStarted", "true", v82)
	v_u_1:AddGlobalPointsField("feature/avatarChat/selfViewOn", 1)
end
function v_u_4.reportSelfViewSessionStopped(p86) -- name: reportSelfViewSessionStopped
	-- upvalues: (copy) v_u_1
	local v87 = debugPrint
	local v88 = game.GameId
	local v89 = tostring(v88)
	local v90 = game.PlaceId
	local v91 = tostring(v90)
	local v92 = p86._impl
	v87("Self View: Analytics:reportSelfViewSessionStopped,universeid: " .. v89 .. ",pid: " .. v91 .. ",sessionid: " .. tostring(v92:GetSessionId()))
	local v93 = {}
	local v94 = game.GameId
	v93.universeid = tostring(v94)
	local v95 = game.PlaceId
	v93.pid = tostring(v95)
	local v96 = p86._impl
	v93.sessionid = tostring(v96:GetPlaySessionId())
	p86:_report("SelfView", "sessionStopped", "true", v93)
	v_u_1:AddGlobalPointsField("feature/avatarChat/selfViewOn", 0)
end
function v_u_4.reportUserAccountSettings(p97, p98, p99) -- name: reportUserAccountSettings
	local v100 = debugPrint
	local v101 = game.GameId
	local v102 = tostring(v101)
	local v103 = game.PlaceId
	local v104 = tostring(v103)
	local v105 = p97._impl
	v100("Self View: Analytics:reportUserAccountSettings,universeid: " .. v102 .. ",pid: " .. v104 .. ",sessionid: " .. tostring(v105:GetSessionId()) .. ",userAccount_videoEnabled: " .. tostring(p98) .. ",userAccount_audioEnabled: " .. tostring(p99))
	local v106 = {}
	local v107 = game.GameId
	v106.universeid = tostring(v107)
	local v108 = game.PlaceId
	v106.pid = tostring(v108)
	local v109 = p97._impl
	v106.sessionid = tostring(v109:GetPlaySessionId())
	v106.videoenabled = tostring(p98)
	v106.audioenabled = tostring(p99)
	p97:_report("SelfView", "userAccountSettings", "true", v106)
end
function v_u_4.reportExperienceSettings(p110, p111, p112, p113) -- name: reportExperienceSettings
	local v114 = debugPrint
	local v115 = game.GameId
	local v116 = tostring(v115)
	local v117 = game.PlaceId
	local v118 = tostring(v117)
	local v119 = p110._impl
	v114("Self View: Analytics:reportExperienceSettings,universeid: " .. v116 .. ",pid: " .. v118 .. ",sessionid: " .. tostring(v119:GetSessionId()) .. ",experienceSettings_placeEnabled: " .. tostring(p111) .. ",experienceSettings_videoEnabled: " .. tostring(p112) .. ",experienceSettings_audioEnabled: " .. tostring(p113))
	local v120 = {}
	local v121 = game.GameId
	v120.universeid = tostring(v121)
	local v122 = game.PlaceId
	v120.pid = tostring(v122)
	local v123 = p110._impl
	v120.sessionid = tostring(v123:GetPlaySessionId())
	v120.placeenabled = tostring(p111)
	v120.videoenabled = tostring(p112)
	v120.audioenabled = tostring(p113)
	p110:_report("SelfView", "experienceSettings", "true", v120)
end
function v_u_4.setLastCtx(_, p124) -- name: setLastCtx
	-- upvalues: (ref) v_u_5
	v_u_5 = p124
end
return v_u_4