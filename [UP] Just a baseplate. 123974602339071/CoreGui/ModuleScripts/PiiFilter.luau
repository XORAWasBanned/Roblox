-- Path: CoreGui.RobloxGui.Modules.ErrorReporting.PiiFilter
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
game:GetService("RunService")
local v3 = require(v1.Packages.t)
local v4 = v3.strictInterface
local v5 = {
	["eraseTimeout"] = v3.number
}
local v6 = v3.optional
local v7 = v3.strictInterface
local v8 = {
	["players"] = v3.union(v3.instanceOf("Players"), v3.interface({
		["GetPlayers"] = v3.callback,
		["GetPlayerByUserId"] = v3.callback,
		["PlayerAdded"] = v3.RBXScriptSignal,
		["PlayerRemoving"] = v3.RBXScriptSignal
	})),
	["wait"] = v3.callback
}
v5.testHarness = v6(v7(v8))
local v_u_9 = v4(v5)
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new(p11) -- name: new
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_10
	local v12 = v_u_9
	assert(v12(p11))
	local v13
	if p11.testHarness == nil then
		v13 = v_u_2
	else
		v13 = p11.testHarness.players
	end
	local v14
	if p11.testHarness == nil then
		v14 = wait
	else
		v14 = p11.testHarness.wait
	end
	local v15 = {
		["_eraseTimeout"] = nil,
		["_trackedPii"] = nil,
		["_playerCounter"] = 1,
		["_disambiguationIdentifiers"] = nil,
		["_waitFn"] = nil,
		["_players"] = nil,
		["_eraseTimeout"] = p11.eraseTimeout,
		["_trackedPii"] = {},
		["_disambiguationIdentifiers"] = {},
		["_waitFn"] = v14,
		["_players"] = v13
	}
	local v16 = v_u_10
	return setmetatable(v15, v16)
end
function v_u_10._addPlayerToEraseMap(p17, p18) -- name: _addPlayerToEraseMap
	local v19 = p17._disambiguationIdentifiers[p18.UserId]
	if v19 == nil then
		v19 = p17._playerCounter
		p17._disambiguationIdentifiers[p18.UserId] = p17._playerCounter
		p17._playerCounter = p17._playerCounter + 1
	end
	local v20 = p17._trackedPii
	local v21 = p18.UserId
	v20[tostring(v21)] = string.format("UserId(%d)", v19)
	local v22 = p17._trackedPii
	local v23 = p18.Name
	v22[tostring(v23)] = string.format("UserName(%d)", v19)
	local v24 = p17._trackedPii
	local v25 = p18.DisplayName
	v24[tostring(v25)] = string.format("DisplayName(%d)", v19)
end
function v_u_10._removePlayerFromEraseMap(p26, p27) -- name: _removePlayerFromEraseMap
	local v28 = p26._trackedPii
	local v29 = p27.UserId
	v28[tostring(v29)] = nil
	local v30 = p26._trackedPii
	local v31 = p27.Name
	v30[tostring(v31)] = nil
	local v32 = p26._trackedPii
	local v33 = p27.DisplayName
	v32[tostring(v33)] = nil
end
function v_u_10.startTracking(p_u_34) -- name: startTracking
	for _, v35 in ipairs(p_u_34._players:GetPlayers()) do
		p_u_34:_addPlayerToEraseMap(v35)
	end
	p_u_34._playerAddedConnection = p_u_34._players.PlayerAdded:Connect(function(p36)
		-- upvalues: (copy) p_u_34
		p_u_34:_addPlayerToEraseMap(p36)
	end)
	p_u_34._playerRemovingConnection = p_u_34._players.PlayerRemoving:Connect(function(p37)
		-- upvalues: (copy) p_u_34
		p_u_34._waitFn(p_u_34._eraseTimeout)
		if p_u_34._players:GetPlayerByUserId(p37.UserId) == nil then
			p_u_34:_removePlayerFromEraseMap(p37)
		end
	end)
end
function v_u_10.stopTracking(p38) -- name: stopTracking
	p38._playerAddedConnection:Disconnect()
	p38._playerRemovingConnection:Disconnect()
end
function v_u_10.cleanPii(p39, p40) -- name: cleanPii
	for v41, v42 in pairs(p39._trackedPii) do
		p40 = string.gsub(p40, v41, v42)
	end
	return p40
end
return v_u_10