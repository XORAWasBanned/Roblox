-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.IceCandidateParser
local v_u_1 = {
	["candidateType"] = nil,
	["protocol"] = nil,
	["priority"] = nil,
	["component"] = nil
}
return function(p2) -- name: parseIceCandidate
	-- upvalues: (copy) v_u_1
	if p2 == nil or p2 == "" then
		return v_u_1
	end
	local v3 = {}
	for v4 in string.gmatch(p2, "%S+") do
		table.insert(v3, v4)
	end
	local v5 = nil
	for v6, v7 in v3 do
		if v7 ~= "typ" then
			continue
		end
		v5 = v3[v6 + 1]
	end
	return v5 ~= nil and {
		["candidateType"] = v5,
		["protocol"] = v3[3],
		["priority"] = v3[4],
		["component"] = v3[2]
	} or v_u_1
end