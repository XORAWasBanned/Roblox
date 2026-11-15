-- Path: CoreGui.RobloxGui.Modules.Settings.Models.Game
local v_u_5 = {
	["new"] = function() -- name: new
		return {}
	end,
	["fromGameCache"] = function(p1) -- name: fromGameCache
		-- upvalues: (copy) v_u_5
		local v2 = v_u_5.new()
		v2.universeId = p1.UniverseId
		v2.placeId = p1.PlaceId
		v2.name = p1.Name
		v2.playerCount = p1.PlayerCount
		v2.imageToken = p1.ImageToken
		v2.totalUpVotes = p1.VoteData.UpVotes
		v2.totalDownVotes = p1.VoteData.DownVotes
		return v2
	end,
	["fromJsonData"] = function(p3) -- name: fromJsonData
		-- upvalues: (copy) v_u_5
		local v4 = v_u_5.new()
		v4.universeId = p3.universeId
		v4.placeId = p3.placeId
		v4.name = p3.name
		v4.playerCount = p3.playerCount
		v4.imageToken = p3.imageToken
		v4.totalUpVotes = p3.totalUpVotes
		v4.totalDownVotes = p3.totalDownVotes
		return v4
	end
}
return v_u_5