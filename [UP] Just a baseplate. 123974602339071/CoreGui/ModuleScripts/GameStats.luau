-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.GameStats
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = script.Parent.Parent
local v4 = v3.Actions
local v_u_5 = require(v4.AddGameStat)
local v_u_6 = require(v4.RemoveGameStat)
local v_u_7 = require(v4.SetGameStatText)
local v_u_8 = require(v4.SetGameStatAddId)
local v_u_9 = require(v3.Flags.FFlagLeaderstatsWithASideOfClient)
local v_u_10 = require(v3.FormatStatString)
local function v_u_15(p11, p12) -- name: gameStatsComp
	-- upvalues: (copy) v_u_9
	if p11.isPrimary ~= p12.isPrimary then
		return p11.isPrimary
	end
	if p11.priority ~= p12.priority then
		return p11.priority > p12.priority
	end
	if v_u_9 then
		local v13 = p11.serverAddId
		local v14 = p12.serverAddId
		if v13 and v14 then
			return v13 < v14
		end
	end
	return p11.addId < p12.addId
end
local v_u_16 = 0
return function(p17, p_u_18) -- name: GameStats
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_9, (ref) v_u_16, (copy) v_u_2, (copy) v_u_15, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
	local v19 = p17 or {}
	if p_u_18.type ~= v_u_5.name then
		if p_u_18.type == v_u_6.name then
			return v_u_2.List.filter(v19, function(p20)
				-- upvalues: (copy) p_u_18
				return p20.name ~= p_u_18.statName
			end)
		end
		if p_u_18.type == v_u_7.name then
			return v_u_2.List.map(v19, function(p21)
				-- upvalues: (copy) p_u_18, (ref) v_u_2
				if p21.name == p_u_18.statName then
					p21 = v_u_2.Dictionary.join(p21, {
						["text"] = p_u_18.text
					}) or p21
				end
				return p21
			end)
		end
		if not v_u_9 or p_u_18.type ~= v_u_8.name then
			return v19
		end
		local v23 = v_u_2.List.map(v19, function(p22)
			-- upvalues: (copy) p_u_18, (ref) v_u_2
			if p22.name == p_u_18.statName then
				p22 = v_u_2.Dictionary.join(p22, {
					["serverAddId"] = p_u_18.serverAddId
				}) or p22
			end
			return p22
		end)
		table.sort(v23, v_u_15)
		return v23
	end
	local v24 = v_u_10(nil)
	local v25 = {}
	local v26 = nil
	local v27 = nil
	for _, v28 in ipairs(v19) do
		if v28.name == p_u_18.statName then
			v26 = v28.addId
			v24 = v28.text
			if not v_u_9 then
				continue
			end
			v27 = v28.serverAddId
		else
			table.insert(v25, v28)
		end
	end
	v_u_16 = v_u_16 + 1
	local v29 = v_u_2.List.join(v25, {
		{
			["name"] = p_u_18.statName,
			["text"] = v24,
			["addId"] = v26 or v_u_16,
			["isPrimary"] = p_u_18.isPrimary,
			["priority"] = p_u_18.priority,
			["serverAddId"] = v27
		}
	})
	table.sort(v29, v_u_15)
	return v29
end