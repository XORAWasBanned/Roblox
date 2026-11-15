-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LuauHeap.LuauHeapData
game:GetService("ScriptContext")
local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(script.Parent.Parent.Parent.Signal)
local v_u_3 = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new() -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	local v5 = {}
	local v6 = v_u_4
	setmetatable(v5, v6)
	v5._serverStatsUpdated = v_u_2.new()
	v5._serverStatsData = {}
	v5._isRunning = false
	return v5
end
function v_u_4.Signal(p7) -- name: Signal
	return p7._serverStatsUpdated
end
function v_u_4.getCurrentData(p8) -- name: getCurrentData
	return p8._serverStatsData
end
function v_u_4.isRunning(p9) -- name: isRunning
	return p9._isRunning
end
function v_u_4.start(p_u_10) -- name: start
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	local v11 = v_u_3()
	if v11 and not p_u_10._statsListenerConnection then
		p_u_10._statsListenerConnection = v11.StatsReceived:connect(function(p12)
			-- upvalues: (copy) p_u_10, (ref) v_u_1
			if p12 and (p12.ServerLuauHeapData and #p12.ServerLuauHeapData > 0) then
				p_u_10._serverStatsData = v_u_1:JSONDecode(p12.ServerLuauHeapData)
				p_u_10._serverStatsUpdated:Fire(p_u_10._serverStatsData)
			end
		end)
		v11:RequestServerStats(true)
		p_u_10._isRunning = true
	end
end
function v_u_4.stop(p13) -- name: stop
	if p13._statsListenerConnection then
		p13._statsListenerConnection:Disconnect()
		p13._statsListenerConnection = nil
	end
	p13._isRunning = false
end
return v_u_4