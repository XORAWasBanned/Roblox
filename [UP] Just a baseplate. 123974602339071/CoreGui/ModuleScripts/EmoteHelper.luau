-- Path: CoreGui.RobloxGui.Modules.Emote.EmoteHelper
local v_u_1 = {}
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
v_u_1.EMOTE_LOOP_TRANSITION_WAIT_TIME = 0.3
v_u_1.EMOTE_LOOP_WAIT_TIMEOUT = 5
v_u_1.LegacyDefaultEmotes = {
	["wave"] = true,
	["point"] = true,
	["dance"] = true,
	["dance2"] = true,
	["dance3"] = true,
	["laugh"] = true,
	["cheer"] = true
}
function v_u_1.getAnyActiveDefaultChatTriggeredEmoteTrack(p4) -- name: getAnyActiveDefaultChatTriggeredEmoteTrack
	-- upvalues: (copy) v_u_1
	if not p4.Character then
		return nil
	end
	local v5 = p4.Character:FindFirstChildOfClass("Humanoid")
	if not v5 then
		return nil
	end
	local v6 = v5:FindFirstChildOfClass("Animator")
	if not v6 then
		return nil
	end
	local v7 = v6:GetPlayingAnimationTracks()
	for _, v8 in pairs(v7) do
		if not (v8.Animation and (v8.Animation.Parent and v8:IsA("AnimationTrack"))) then
			continue
		end
		local v9 = v8.Animation.Parent.Name
		if not (v_u_1.LegacyDefaultEmotes[v9] and v8.IsPlaying) then
			continue
		end
		return v8
	end
	return nil
end
local function v_u_22(p10, p_u_11, p_u_12, p13) -- name: waitForEmoteEventInternal
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_22
	local v_u_14 = Instance.new("BindableEvent")
	local v_u_15 = os.clock()
	local v_u_16 = true
	local v17 = p_u_11.Stopped:Connect(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_16, (copy) v_u_14
		v_u_3:trace("EmoteHelper.waitForEmoteEventInternal: Stopped")
		if v_u_16 and v_u_14 then
			v_u_16 = false
			v_u_14:Fire()
		end
	end)
	local v19 = p_u_11.KeyframeReached:Connect(function(p18)
		-- upvalues: (copy) p_u_11, (copy) p_u_12, (ref) v_u_3, (ref) v_u_16, (copy) v_u_14, (ref) v_u_15
		if p18 == "End" and (not p_u_11.Looped or p_u_12) then
			v_u_3:trace("EmoteHelper.waitForEmoteEventInternal: KeyframeReached")
			if v_u_16 and v_u_14 then
				v_u_16 = false
				v_u_14:Fire()
				return
			end
		else
			v_u_15 = os.clock()
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_1, (ref) v_u_3, (copy) v_u_14
		local v20 = os.clock() - v_u_15
		while v_u_16 and v20 < v_u_1.EMOTE_LOOP_WAIT_TIMEOUT do
			wait(v_u_1.EMOTE_LOOP_WAIT_TIMEOUT - v20)
			v20 = os.clock() - v_u_15
		end
		if v_u_16 then
			v_u_3:trace("EmoteHelper.waitForEmoteEventInternal: Timeout!")
			if v_u_16 and v_u_14 then
				v_u_16 = false
				v_u_14:Fire()
			end
		end
	end)
	v_u_14.Event:Wait()
	v_u_14:Destroy()
	if v17 then
		v17:Disconnect()
	end
	if v19 then
		v19:Disconnect()
	end
	if p_u_12 then
		wait(v_u_1.EMOTE_LOOP_TRANSITION_WAIT_TIME)
		local v21 = v_u_1.getAnyActiveDefaultChatTriggeredEmoteTrack(p10)
		if v21 then
			v_u_22(p10, v21, p_u_12, p13)
		elseif p13 then
			p13()
		end
	elseif p13 then
		p13()
	end
end
function v_u_1.createEmoteFinishEvent(p23, p24, p25) -- name: createEmoteFinishEvent
	-- upvalues: (copy) v_u_22
	local v_u_26 = Instance.new("BindableEvent")
	task.spawn(v_u_22, p23, p24, p25, function()
		-- upvalues: (copy) v_u_26
		v_u_26:Fire()
		v_u_26:Destroy()
	end)
	return v_u_26.Event
end
return v_u_1