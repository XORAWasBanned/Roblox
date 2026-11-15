-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Utility.GetHumanoidDescription
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v_u_2 = require(v1.Flags.GetFFlagGetHumanoidDescriptionUpdates)
local v_u_3 = game:DefineFastFlag("GetHumanoidDescriptionUpdatesV2A", false)
local v4 = game:GetService("CorePackages")
local v_u_5 = require(v4.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local v_u_6 = game:GetService("Players")
local function v_u_11(p7)
	local v8 = {}
	for _, v9 in ipairs(p7) do
		local v10 = {
			["AccessoryType"] = v9.AccessoryType.Value,
			["AssetId"] = v9.AssetId,
			["IsLayered"] = v9.IsLayered,
			["Order"] = v9.Order,
			["Puffiness"] = v9.Puffiness
		}
		table.insert(v8, v10)
	end
	return v8
end
local function v_u_20(p12, p13)
	local v14 = {}
	for _, v15 in ipairs(p13) do
		local v16 = p12[v15.Name]
		if not v16 then
			continue
		end
		local v17 = #v16
		for v18 = 1, math.min(8, v17) do
			local v19 = v16[v18]
			table.insert(v14, v19)
		end
	end
	return v14
end
local function v_u_25(p21)
	local v22 = {}
	for _, v23 in p21:GetPlayingAnimationTracks() do
		local v24 = string.match(v23.Animation.AnimationId, "(%d+)$")
		if v24 then
			table.insert(v22, v24)
		end
		if #v22 < 8 then
			continue
		end
	end
	return v22
end
return {
	["getHumanoidDescription"] = function(p26)
		-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_11, (copy) v_u_3, (copy) v_u_20, (copy) v_u_5, (copy) v_u_25
		local v27 = v_u_6:GetPlayerByUserId(p26)
		local v_u_28 = {
			["BackAccessory"] = "",
			["BodyTypeScale"] = 0,
			["ClimbAnimation"] = 0,
			["DepthScale"] = 0,
			["Face"] = 0,
			["FaceAccessory"] = "",
			["FallAnimation"] = 0,
			["FrontAccessory"] = "",
			["GraphicTShirt"] = 0,
			["HairAccessory"] = "",
			["HatAccessory"] = "",
			["Head"] = 0,
			["HeadColor"] = { 0, 0, 0 },
			["HeadScale"] = 0,
			["HeightScale"] = 0,
			["IdleAnimation"] = 0,
			["JumpAnimation"] = 0,
			["LeftArm"] = 0,
			["LeftArmColor"] = { 0, 0, 0 },
			["LeftLeg"] = 0,
			["LeftLegColor"] = { 0, 0, 0 },
			["MoodAnimation"] = 0,
			["NeckAccessory"] = "",
			["Pants"] = 0,
			["ProportionScale"] = 0,
			["RightArm"] = 0,
			["RightArmColor"] = { 0, 0, 0 },
			["RightLeg"] = 0,
			["RightLegColor"] = { 0, 0, 0 },
			["RunAnimation"] = 0,
			["Shirt"] = 0,
			["ShouldersAccessory"] = "",
			["SwimAnimation"] = 0,
			["Torso"] = 0,
			["TorsoColor"] = { 0, 0, 0 },
			["WaistAccessory"] = "",
			["WalkAnimation"] = 0,
			["WidthScale"] = 0
		}
		if not v27 then
			return v_u_28, "ERR_RA_HUMPLAYER"
		end
		local v29 = v27.Character
		if not v29 then
			return v_u_28, "ERR_RA_CHARACTER"
		end
		local v_u_30 = v29:WaitForChild("Humanoid", 1)
		if not v_u_30 then
			return v_u_28, "ERR_RA_HUMOBJ"
		end
		local v_u_31
		if v_u_2() then
			local v32
			v32, v_u_31 = pcall(function()
				-- upvalues: (copy) v_u_30
				return v_u_30:GetAppliedDescription()
			end)
			if not v32 then
				return v_u_28, "ERR_RA_HUMOBJ"
			end
		else
			v_u_31 = v_u_30:GetAppliedDescription()
		end
		if not v_u_31 then
			return v_u_28, "ERR_RA_HUMDESC"
		end
		local v33 = 0
		if v_u_2() then
			local function v36(p34)
				-- upvalues: (ref) v_u_31, (copy) v_u_28
				local v35 = v_u_31[p34]
				if typeof(v35) == "Color3" then
					v_u_28[p34] = { v_u_31[p34].R, v_u_31[p34].G, v_u_31[p34].B }
				else
					v_u_28[p34] = v_u_31[p34]
				end
			end
			for v37, _ in pairs(v_u_28) do
				if pcall(v36, v37) then
					continue
				end
				v33 = v33 + 1
			end
			local v38 = v_u_31.GetAccessories
			local v39, v40 = pcall(v38, v_u_31, false)
			if v39 then
				local v41 = v_u_11
				local v42, v43 = pcall(v41, v40)
				if v42 then
					v_u_28.AccessoryBlob = v43
				else
					v33 = v33 + 1
				end
			else
				v33 = v33 + 1
			end
			if v_u_3 then
				local v44 = v_u_31.GetEmotes
				local v45, v46 = pcall(v44, v_u_31)
				if v45 then
					v_u_28.Emotes = v46
				else
					v33 = v33 + 1
				end
			end
			local v47 = v_u_31.GetEquippedEmotes
			local v48, v49 = pcall(v47, v_u_31)
			local v50 = v_u_31.GetEmotes
			local v51, v52 = pcall(v50, v_u_31)
			if v48 and v51 then
				local v53 = v_u_20
				local v54, v55 = pcall(v53, v52, v49)
				if v54 then
					v_u_28.Emotes = v55
					if v_u_5() then
						local v56 = v_u_25
						local v57, v58 = pcall(v56, v_u_30)
						if v57 then
							v_u_28.CurrentlyPlayingAnimationIds = v58
						else
							v33 = v33 + 1
						end
					end
				end
			else
				v33 = v33 + 1
			end
			v_u_28.FieldErrorCount = v33
		else
			pcall(function()
				-- upvalues: (copy) v_u_28, (ref) v_u_31
				for v59, _ in pairs(v_u_28) do
					local v60 = v_u_31[v59]
					if typeof(v60) == "Color3" then
						v_u_28[v59] = { v_u_31[v59].R, v_u_31[v59].G, v_u_31[v59].B }
					else
						v_u_28[v59] = v_u_31[v59]
					end
				end
			end)
		end
		return v_u_28, "OK"
	end
}