-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders.AvatarMoment.resolveOutfit
local v_u_1 = game:GetService("Players")
local v_u_2 = Enum.HumanoidRigType.R15
local function v_u_7(p_u_3) -- name: resolveRigType
	-- upvalues: (copy) v_u_2
	local v4, v5 = pcall(function()
		-- upvalues: (copy) p_u_3
		return game:GetService("AvatarEditorService"):GetOutfitDetailsAsync(p_u_3)
	end)
	if v4 and typeof(v5) == "table" then
		local v6 = v5.PlayerAvatarType
		if v6 ~= "R6" and v6 ~= "R15" then
			warn((("resolveOutfit: unrecognized PlayerAvatarType %*, assuming R15"):format(v6)))
		end
		if v6 == "R6" then
			return Enum.HumanoidRigType.R6
		else
			return v_u_2
		end
	else
		warn((("resolveOutfit: outfit %* details unavailable, assuming R15 (%*)"):format(p_u_3, v5)))
		return v_u_2
	end
end
local function v_u_13(p_u_8) -- name: resolveUserRigType
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local function v9()
		-- upvalues: (ref) v_u_1, (copy) p_u_8
		return v_u_1:GetCharacterAppearanceInfoAsync(p_u_8)
	end
	local v10, v11 = pcall(v9)
	if v10 and typeof(v11) == "table" then
		local v12 = v11.playerAvatarType
		if v12 ~= "R6" and v12 ~= "R15" then
			warn((("resolveOutfit: unrecognized PlayerAvatarType %*, assuming R15"):format(v12)))
		end
		if v12 == "R6" then
			return Enum.HumanoidRigType.R6
		else
			return v_u_2
		end
	else
		warn((("resolveOutfit: user %* appearance info unavailable, assuming R15 (%*)"):format(p_u_8, v11)))
		return v_u_2
	end
end
return {
	["resolve"] = function(p_u_14) -- name: resolve
		-- upvalues: (copy) v_u_1, (copy) v_u_7
		local function v15()
			-- upvalues: (ref) v_u_1, (copy) p_u_14
			return v_u_1:GetHumanoidDescriptionFromOutfitIdAsync(p_u_14)
		end
		local v16, v17 = pcall(v15)
		if not v16 or typeof(v17) ~= "Instance" then
			error((("resolveOutfit: outfit %* did not resolve (%*)"):format(p_u_14, v17)))
		end
		return {
			["rigType"] = v_u_7(p_u_14),
			["humanoidDescription"] = v17
		}
	end,
	["resolveUser"] = function(p_u_18) -- name: resolveUser
		-- upvalues: (copy) v_u_1, (copy) v_u_13
		local function v19()
			-- upvalues: (ref) v_u_1, (copy) p_u_18
			return v_u_1:GetHumanoidDescriptionFromUserIdAsync(p_u_18)
		end
		local v20, v21 = pcall(v19)
		if not v20 or typeof(v21) ~= "Instance" then
			error((("resolveOutfit: user %* did not resolve (%*)"):format(p_u_18, v21)))
		end
		return {
			["rigType"] = v_u_13(p_u_18),
			["humanoidDescription"] = v21
		}
	end,
	["rigTypeFromName"] = function(p22) -- name: rigTypeFromName
		-- upvalues: (copy) v_u_2
		if p22 ~= "R6" and p22 ~= "R15" then
			warn((("resolveOutfit: unrecognized PlayerAvatarType %*, assuming R15"):format(p22)))
		end
		if p22 == "R6" then
			return Enum.HumanoidRigType.R6
		else
			return v_u_2
		end
	end,
	["isKnownAvatarType"] = function(p23) -- name: isKnownAvatarType
		return p23 == "R6" and true or p23 == "R15"
	end
}