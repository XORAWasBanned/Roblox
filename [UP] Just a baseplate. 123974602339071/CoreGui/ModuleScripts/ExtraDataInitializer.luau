-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.ExtraDataInitializer
local v_u_1 = {
	["Groups"] = {
		{
			["GroupId"] = 1200769,
			["ChatColor"] = nil,
			["ChatColor"] = Color3.new(1, 0.8431372549019608, 0)
		}
	},
	["Players"] = {
		{}
	}
}
(function() -- name: ConstructIsInGroups
	-- upvalues: (copy) v_u_1
	if v_u_1.Groups then
		for _, v2 in pairs(v_u_1.Groups) do
			local v_u_3 = v2.GroupId
			local v_u_4 = v2.Rank
			local v5 = type(v_u_4) == "nil" and true or type(v_u_4) == "number"
			assert(v5, "requiredRank must be a number or nil")
			function v2.IsInGroup(p_u_6)
				-- upvalues: (copy) v_u_4, (copy) v_u_3
				if not (p_u_6 and p_u_6.UserId) then
					return false
				end
				local _ = p_u_6.UserId
				local v_u_7 = false
				local function v8()
					-- upvalues: (ref) v_u_4, (ref) v_u_7, (copy) p_u_6, (ref) v_u_3
					if v_u_4 then
						v_u_7 = v_u_4 < p_u_6:GetRankInGroup(v_u_3)
					else
						v_u_7 = p_u_6:IsInGroup(v_u_3)
					end
				end
				local v9, v10 = pcall(v8)
				if not v9 and v10 then
					print("Error checking in group: " .. v10)
				end
				return v_u_7
			end
		end
	end
end)()
local v_u_11 = game:GetService("Players")
local function v_u_16(p12) -- name: GetSpecialChatColor
	-- upvalues: (copy) v_u_1, (copy) v_u_11
	if v_u_1.Players then
		local v13 = v_u_11:FindFirstChild(p12)
		if v13 then
			for _, v14 in pairs(v_u_1.Players) do
				if v13.UserId ~= v14.UserId then
					continue
				end
				return v14.ChatColor
			end
		end
	end
	if v_u_1.Groups then
		for _, v15 in pairs(v_u_1.Groups) do
			if not v15.IsInGroup(v_u_11:FindFirstChild(p12)) then
				continue
			end
			return v15.ChatColor
		end
	end
end
return function(p_u_17) -- name: Run
	-- upvalues: (copy) v_u_16, (copy) v_u_11
	local v_u_18 = {
		Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157),
		Color3.new(0.00392156862745098, 0.6352941176470588, 1),
		Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353),
		BrickColor.new("Bright violet").Color,
		BrickColor.new("Bright orange").Color,
		BrickColor.new("Bright yellow").Color,
		BrickColor.new("Light reddish violet").Color,
		BrickColor.new("Brick yellow").Color
	}
	local function v_u_25(p19) -- name: GetNameValue
		local v20 = 0
		for v21 = 1, #p19 do
			local v22 = string.sub(p19, v21, v21)
			local v23 = string.byte(v22)
			local v24 = #p19 - v21 + 1
			if #p19 % 2 == 1 then
				v24 = v24 - 1
			end
			if v24 % 4 >= 2 then
				v23 = -v23
			end
			v20 = v20 + v23
		end
		return v20
	end
	local function v32(p26) -- name: onNewSpeaker
		-- upvalues: (copy) p_u_17, (copy) v_u_18, (copy) v_u_25, (ref) v_u_16
		local v27 = p_u_17:GetSpeaker(p26)
		if not v27:GetExtraData("NameColor") then
			local v28 = "NameColor"
			local v29 = v27:GetPlayer()
			local v30
			if v29 and v29.Team ~= nil then
				v30 = v29.TeamColor.Color
			else
				v30 = v_u_18[(v_u_25(v27.Name) + 0) % #v_u_18 + 1]
			end
			v27:SetExtraData(v28, v30)
		end
		local v31 = not v27:GetExtraData("ChatColor") and v_u_16(p26)
		if v31 then
			v27:SetExtraData("ChatColor", v31)
		end
		if not v27:GetExtraData("Tags") then
			v27:SetExtraData("Tags", {})
		end
	end
	p_u_17.SpeakerAdded:connect(v32)
	for _, v33 in pairs(p_u_17:GetSpeakerList()) do
		v32(v33)
	end
	local v_u_34 = {}
	v_u_11.PlayerAdded:connect(function(p_u_35)
		-- upvalues: (copy) p_u_17, (copy) v_u_18, (copy) v_u_25, (copy) v_u_34
		v_u_34[p_u_35] = p_u_35.Changed:connect(function(p36)
			-- upvalues: (ref) p_u_17, (copy) p_u_35, (ref) v_u_18, (ref) v_u_25
			local v37 = p_u_17:GetSpeaker(p_u_35.Name)
			if v37 and (p36 == "TeamColor" or (p36 == "Neutral" or p36 == "Team")) then
				local v38 = "NameColor"
				local v39 = v37:GetPlayer()
				local v40
				if v39 and v39.Team ~= nil then
					v40 = v39.TeamColor.Color
				else
					v40 = v_u_18[(v_u_25(v37.Name) + 0) % #v_u_18 + 1]
				end
				v37:SetExtraData(v38, v40)
			end
		end)
	end)
	v_u_11.PlayerRemoving:connect(function(p41)
		-- upvalues: (copy) v_u_34
		local v42 = v_u_34[p41]
		if v42 then
			v42:Disconnect()
		end
		v_u_34[p41] = nil
	end)
end