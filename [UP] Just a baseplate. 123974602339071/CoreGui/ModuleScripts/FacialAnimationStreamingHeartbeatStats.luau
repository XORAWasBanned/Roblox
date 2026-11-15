-- Path: CoreGui.RobloxGui.Modules.FacialAnimationStreaming.FacialAnimationStreamingHeartbeatStats
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("CorePackages")
local v4 = v1:WaitForChild("RobloxGui")
local v_u_5 = require(v3.Workspace.Packages.LoggingProtocol).default
local v_u_6 = game:GetService("RbxAnalyticsService")
local v_u_7 = game:GetService("FaceAnimatorService")
local v_u_8 = require(v4.Modules.Flags.GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSec)
local v_u_9 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_10 = require(script.Parent.RobloxTelemetryConfigs.AvatarChatHeartbeatStats)
local v11 = {}
local v_u_12 = false
local v_u_13 = {
	["None"] = 0,
	["AudioOnly"] = 1,
	["VideoOnly"] = 2,
	["AudioVideo"] = 3
}
local v_u_14 = v_u_13.None
local v_u_15 = {}
local v_u_16 = nil
local v_u_17 = {}
local function v_u_28() -- name: reportHeartbeat
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_9, (ref) v_u_14, (ref) v_u_16, (copy) v_u_15, (copy) v_u_5, (copy) v_u_10
	local v18 = {}
	local v19 = game.PlaceId
	v18.pid = tostring(v19)
	v18.sessionid = v_u_6:GetSessionId()
	local v20 = v_u_2.LocalPlayer.UserId
	v18.userid = tostring(v20)
	local v21 = game.GameId
	v18.universeid = tostring(v21)
	if v_u_9 then
		v18.playSessionId = v_u_6:GetPlaySessionId()
	end
	v18.trackingMode = v_u_14
	local v22 = os.clock()
	if v_u_16 then
		local v23 = v22 - v_u_16
		local v24 = v_u_15
		local v25 = v_u_14
		v24[v25] = v24[v25] + v23
	end
	v_u_16 = v22
	for v26, v27 in v_u_15 do
		v18[tostring(v26)] = v27
		v_u_15[v26] = 0
	end
	v_u_5:logRobloxTelemetryEvent(v_u_10, nil, v18)
end
function v11.Initialize() -- name: Initialize
	-- upvalues: (copy) v_u_8, (copy) v_u_13, (copy) v_u_15, (copy) v_u_17, (copy) v_u_7, (ref) v_u_16, (ref) v_u_14, (ref) v_u_12, (copy) v_u_28
	if v_u_8() > 0 then
		for _, v29 in v_u_13 do
			v_u_15[v29] = 0
		end
		v_u_17.videoAnimationEnabled = v_u_7:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_15, (ref) v_u_14, (ref) v_u_7, (ref) v_u_13
			local v30 = os.clock()
			if v_u_16 then
				local v31 = v30 - v_u_16
				local v32 = v_u_15
				local v33 = v_u_14
				v32[v33] = v32[v33] + v31
			end
			v_u_16 = v30
			if v_u_7.VideoAnimationEnabled and v_u_7.AudioAnimationEnabled then
				v_u_14 = v_u_13.AudioVideo
				return
			elseif v_u_7.VideoAnimationEnabled then
				v_u_14 = v_u_13.VideoOnly
				return
			elseif v_u_7.AudioAnimationEnabled then
				v_u_14 = v_u_13.AudioOnly
			else
				v_u_14 = v_u_13.None
			end
		end)
		v_u_17.audioAnimationEnabled = v_u_7:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_15, (ref) v_u_14, (ref) v_u_7, (ref) v_u_13
			local v34 = os.clock()
			if v_u_16 then
				local v35 = v34 - v_u_16
				local v36 = v_u_15
				local v37 = v_u_14
				v36[v37] = v36[v37] + v35
			end
			v_u_16 = v34
			if v_u_7.VideoAnimationEnabled and v_u_7.AudioAnimationEnabled then
				v_u_14 = v_u_13.AudioVideo
				return
			elseif v_u_7.VideoAnimationEnabled then
				v_u_14 = v_u_13.VideoOnly
				return
			elseif v_u_7.AudioAnimationEnabled then
				v_u_14 = v_u_13.AudioOnly
			else
				v_u_14 = v_u_13.None
			end
		end)
		local v38 = os.clock()
		if v_u_16 then
			local v39 = v38 - v_u_16
			local v40 = v_u_15
			local v41 = v_u_14
			v40[v41] = v40[v41] + v39
		end
		v_u_16 = v38
		if v_u_7.VideoAnimationEnabled and v_u_7.AudioAnimationEnabled then
			v_u_14 = v_u_13.AudioVideo
		elseif v_u_7.VideoAnimationEnabled then
			v_u_14 = v_u_13.VideoOnly
		elseif v_u_7.AudioAnimationEnabled then
			v_u_14 = v_u_13.AudioOnly
		else
			v_u_14 = v_u_13.None
		end
		local v_u_42 = v_u_8()
		if v_u_42 > 0 and not v_u_12 then
			v_u_12 = true
			task.spawn(function()
				-- upvalues: (ref) v_u_12, (ref) v_u_28, (copy) v_u_42
				while v_u_12 do
					v_u_28()
					task.wait(v_u_42)
				end
				v_u_12 = false
			end)
		end
	end
end
function v11.Cleanup() -- name: Cleanup
	-- upvalues: (copy) v_u_8, (copy) v_u_17, (ref) v_u_12
	if v_u_8() > 0 then
		for _, v43 in pairs(v_u_17) do
			if not v43 then
				continue
			end
			v43:Disconnect()
		end
		table.clear(v_u_17)
		v_u_12 = false
	end
end
return v11