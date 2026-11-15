-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.PlayerKeys
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = script.Parent.Parent.Actions
local v_u_4 = require(v3.AddPlayer)
local v_u_5 = require(v3.RemovePlayer)
local v_u_6 = require(v3.SetPlayerLeaderstat)
local function v_u_12(p7, p8, p9) -- name: createKey
	local v10
	if p8 == nil or (p9 == nil or p9[p7.UserId] == nil) then
		v10 = nil
	else
		v10 = p9[p7.UserId][p8]
	end
	local v11 = {
		["name"] = p7.DisplayName:upper()
	}
	if v10 then
		v10 = tonumber(v10) or v10
	end
	v11.stat = v10
	return v11
end
return function(p13, p14, p15) -- name: PlayerKeys
	-- upvalues: (copy) v_u_12, (copy) v_u_4, (copy) v_u_6, (copy) v_u_2, (copy) v_u_5
	local v16
	if p15.gameStats[1] then
		v16 = p15.gameStats[1].name or nil
	else
		v16 = nil
	end
	if p13 and v16 == p13.primaryStat then
		return (p14.type == v_u_4.name or p14.type == v_u_6.name) and {
			["primaryStat"] = v16,
			["keys"] = v_u_2.Dictionary.join(p13.keys, {
				[p14.player] = v_u_12(p14.player, v16, p15.playerStats)
			})
		} or (p14.type == v_u_5.name and {
			["primaryStat"] = v16,
			["keys"] = v_u_2.Dictionary.join(p13.keys, {
				[p14.player] = v_u_2.None
			})
		} or p13)
	end
	local v17 = {}
	for _, v18 in pairs(p15.players) do
		v17[v18] = v_u_12(v18, v16, p15.playerStats)
	end
	return {
		["primaryStat"] = v16,
		["keys"] = v17
	}
end