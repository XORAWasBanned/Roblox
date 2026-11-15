-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceChat.VoiceChatData
local v_u_1 = require(script.Parent.Parent.Parent.Signal)
local v_u_2 = game:GetService("VoiceChatService")
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new() -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	local v4 = {}
	local v5 = v_u_3
	setmetatable(v4, v5)
	v4._statsUpdated = v_u_1.new()
	v4._statsData = {}
	v4._isRunning = false
	return v4
end
function v_u_3.Signal(p6) -- name: Signal
	return p6._statsUpdated
end
function v_u_3.getCurrentData(p7) -- name: getCurrentData
	return p7._statsData
end
function v_u_3.isRunning(p8) -- name: isRunning
	return p8._isRunning
end
function v_u_3.start(p_u_9) -- name: start
	-- upvalues: (copy) v_u_2
	if v_u_2 and not p_u_9._statsListenerConnection then
		p_u_9._statsListenerConnection = v_u_2.VoiceChatStatsCollected:Connect(function()
			-- upvalues: (copy) p_u_9, (ref) v_u_2
			p_u_9._statsData = v_u_2:lastVoiceChatStats()
			p_u_9._statsUpdated:Fire(p_u_9._statsData)
		end)
		p_u_9._isRunning = true
	end
end
function v_u_3.stop(p10) -- name: stop
	p10._isRunning = false
	if p10._statsListenerConnection then
		p10._statsListenerConnection:Disconnect()
	end
end
return v_u_3