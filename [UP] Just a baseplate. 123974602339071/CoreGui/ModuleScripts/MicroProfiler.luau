-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.MicroProfiler
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.AppendRecentDumpPath)
local v_u_3 = require(script.Parent.Parent.Actions.SetRCCProfilerState)
return function(p4, p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
	if not p4 then
		p4 = {
			["waitingForRecording"] = false,
			["lastFileOutputLocation"] = "",
			["recentDumpPaths"] = nil,
			["recentDumpPaths"] = {}
		}
	end
	if p5.type == v_u_3.name then
		local v6 = {
			["waitingForRecording"] = p5.waitingForRecording,
			["lastFileOutputLocation"] = p5.lastFileOutputLocation,
			["recentDumpPaths"] = p4.recentDumpPaths
		}
		return v_u_1.JoinDictionaries(p4, v6)
	end
	if p5.type ~= v_u_2.name then
		return p4
	end
	local v7 = {
		["waitingForRecording"] = p4.waitingForRecording,
		["lastFileOutputLocation"] = p4.lastFileOutputLocation,
		["recentDumpPaths"] = v_u_1.Append(p4.recentDumpPaths, p5.dumpPath)
	}
	return v_u_1.JoinDictionaries(p4, v7)
end