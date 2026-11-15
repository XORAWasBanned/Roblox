-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.GetAssetIdsFromDescription
local v_u_1 = {
	"ClimbAnimation",
	"Face",
	"FallAnimation",
	"GraphicTShirt",
	"Head",
	"IdleAnimation",
	"JumpAnimation",
	"LeftArm",
	"LeftLeg",
	"Pants",
	"RightArm",
	"RightLeg",
	"RunAnimation",
	"Shirt",
	"SwimAnimation",
	"Torso",
	"WalkAnimation"
}
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = {}
	for _, v4 in ipairs(v_u_1) do
		local v5 = p2[v4]
		if typeof(v5) == "number" and v5 > 0 then
			table.insert(v3, v5)
		else
			if typeof(v5) ~= "string" or v5 == "" then
				continue
			end
			for v6 in v5:gmatch("([%d]+),?") do
				local v7 = tonumber(v6)
				table.insert(v3, v7)
			end
		end
	end
	local v8 = p2:GetAccessories(true)
	for _, v9 in ipairs(v8) do
		local v10 = v9.AssetId
		table.insert(v3, v10)
	end
	for _, v11 in p2:GetChildren() do
		if not v11:IsA("MakeupDescription") or v11.AssetId <= 0 then
			continue
		end
		local v12 = v11.AssetId
		table.insert(v3, v12)
	end
	local v13 = p2:GetEmotes()
	local v14 = p2:GetEquippedEmotes()
	for _, v15 in ipairs(v14) do
		local v16 = v13[v15.Name]
		if not v16 then
			continue
		end
		for _, v17 in ipairs(v16) do
			table.insert(v3, v17)
		end
	end
	return v3
end