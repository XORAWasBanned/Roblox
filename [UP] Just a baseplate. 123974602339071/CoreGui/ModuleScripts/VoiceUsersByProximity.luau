-- Path: CoreGui.RobloxGui.Modules.VoiceChat.VoiceUsersByProximity
require(script.Parent.VoiceChatServiceManager)
return {
	["getComparator"] = function(p_u_1) -- name: getComparator
		return function(p2, p3)
			-- upvalues: (copy) p_u_1
			local v4 = p2 and p2.Character
			if v4 then
				v4 = p2.Character.PrimaryPart
			end
			local v5 = p3 and p3.Character
			if v5 then
				v5 = p3.Character.PrimaryPart
			end
			if not (v4 or v5) then
				return p2.Name:lower() < p3.Name:lower()
			end
			if v4 and not v5 then
				return true
			end
			if not v4 and v5 then
				return false
			end
			local v6 = p_u_1
			local v7 = p2 and p2.Character
			if v7 then
				v7 = p2.Character.PrimaryPart
			end
			local v8
			if v7 then
				v8 = (v7.Position - v6).Magnitude
			else
				v8 = nil
			end
			local v9 = p_u_1
			local v10 = p3 and p3.Character
			if v10 then
				v10 = p3.Character.PrimaryPart
			end
			local v11
			if v10 then
				v11 = (v10.Position - v9).Magnitude
			else
				v11 = nil
			end
			return v8 < v11
		end
	end,
	["getSortedPlayers"] = function(p12, p13, p_u_14, p15, p16, p17, p18) -- name: getSortedPlayers
		local v19 = {}
		local function v30(p20, p21)
			-- upvalues: (copy) p_u_14
			local v22 = p20 and p20.Character
			if v22 then
				v22 = p20.Character.PrimaryPart
			end
			local v23 = p21 and p21.Character
			if v23 then
				v23 = p21.Character.PrimaryPart
			end
			if not (v22 or v23) then
				return p20.Name:lower() < p21.Name:lower()
			end
			if v22 and not v23 then
				return true
			end
			if not v22 and v23 then
				return false
			end
			local v24 = p_u_14
			local v25 = p20 and p20.Character
			if v25 then
				v25 = p20.Character.PrimaryPart
			end
			local v26
			if v25 then
				v26 = (v25.Position - v24).Magnitude
			else
				v26 = nil
			end
			local v27 = p_u_14
			local v28 = p21 and p21.Character
			if v28 then
				v28 = p21.Character.PrimaryPart
			end
			local v29
			if v28 then
				v29 = (v28.Position - v27).Magnitude
			else
				v29 = nil
			end
			return v26 < v29
		end
		for v31, _ in pairs(p13.participants) do
			local v32 = p12:GetPlayerByUserId(v31)
			if not v32 or p17 == v32 then
				continue
			end
			if not p18 then
				local v33 = v32 and v32.Character
				if v33 then
					v33 = v32.Character.PrimaryPart
				end
				if not v33 then
					continue
				end
			end
			if p15 and v32 then
				local v34 = v32 and v32.Character
				if v34 then
					v34 = v32.Character.PrimaryPart
				end
				local v35
				if v34 then
					v35 = (v34.Position - p_u_14).Magnitude
				else
					v35 = nil
				end
				if p15 < v35 then
					continue
				end
			end
			if p16 then
				local v36 = p13:getRecentUsersInteractionData()
				local v37 = v32.UserId
				if not v36[tostring(v37)] then
					continue
				end
			end
			table.insert(v19, v32)
		end
		table.sort(v19, v30)
		return v19
	end
}